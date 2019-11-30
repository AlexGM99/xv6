#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"
#include "traps.h"
#include "spinlock.h"


extern int mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm);
// Interrupt descriptor table (shared by all CPUs).
struct gatedesc idt[256];
extern uint vectors[];  // in vectors.S: array of 256 entry pointers
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);

  initlock(&tickslock, "time");
}

void
idtinit(void)
{
  lidt(idt, sizeof(idt));
}

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
      exit();
    myproc()->tf = tf;
    syscall();
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
      ticks++;
      wakeup(&ticks);
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
            cpuid(), tf->cs, tf->eip);
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
  if(tf->trapno == T_PGFLT){ //page fault treatment
    if (rcr2() < myproc()->sz){ // check that we are on range
      char *mem;//page
      if((mem = kalloc()) == 0){ // error on memory == death
        myproc()->killed = 1;
        return;
      }
      memset(mem, 0, PGSIZE); // put every bit on the page to 0
      if(mappages(myproc()->pgdir,(void *) PGROUNDDOWN(rcr2()) , PGSIZE, V2P(mem) , PTE_W|PTE_U) < 0){
        cprintf("trap: out of memory (2)\n");
        kfree(mem);
        myproc()->killed = 1;
        return;
      }
    }else{
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
            tf->err, cpuid(), tf->eip, rcr2());
        myproc()->killed = 1;
    }
  }
}

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
}


/*if(tf->trapno == T_PGFLT){ //page fault treatment
      if (rcr2()< myproc()->sz){ // check that we are on range
        char *mem = kalloc();
        if(mem == 0){ // error on memory == death
          myproc()->killed = 1;
          return;
        }
        memset(mem, 0, PGSIZE); // put every bit on the page to 0
        if(mappages(myproc()->pgdir, PGROUNDUP(rcr2()), PGSIZE, (uint)mem, PTE_W | PTE_U) < 0){ // error on memory 2 == death
          cprintf("trap: out of memory (2)\n");
          kfree(mem);
          myproc()->killed = 1;
          return;
        }
      }else
      {
        cprintf("out of range page at virtual addres 0x%s\n", rcr2);
        myproc()->killed = 1;
        return;
      }
    }else */


    /*if ( tf->trapno == T_PGFLT )
    {
      if ( rcr2 () >= myproc () -> sz )
      {
        cprintf ( " La pagina que ha fallado esta fuera del rango \n " ) ;
        myproc () -> killed = 1;
        break ;
      }
      char * marco = kalloc () ;
      if ( marco == 0) {
        cprintf ( " Fallo de asignacion de memoria trap \n " ) ;
        myproc () -> killed = 1;
        return ;
      }
      memset ( marco , 0 , PGSIZE ) ;
      if ( mappages ( myproc () -> pgdir ,( void *) PGROUNDDOWN ( rcr2
      () ) , PGSIZE , V2P ( marco ) , PTE_W | PTE_U ) < 0)
      { 
        cprintf ( " Fallo en la asignacion con mappages \n " ) ;
        kfree ( marco ) ;
        myproc () -> killed = 1;
        return ;
      }
   }else { */