#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if (n >= 0){
    myproc()->sz+=n;
  }
  else if(growproc(n) < 0) //"Sbrk is the system call for a process to shrink or grow its memory, implemented by the function growproc (2558). If n is postive, growproc allocates one or more physical pages and maps them at the top of the process’s address space. If n
                          //is negative, growproc unmaps one or more pages from the process’s address space and
                          //frees the corresponding physical pages." -> xv6-book
      return -1;
  /*if(growproc(n) < 0)
    return -1;*/
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

// return the date of the moment at the structure
int 
sys_date(void)
{
  acquire(&tickslock);
  struct rtcdate *r;
  if(argptr(0, (char **)&r, 20) < 0)
      return -1;
  cmostime(r);
  release(&tickslock);
  return 0;
}
