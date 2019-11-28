
_zombie:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 9d 01 00 00       	call   1b3 <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7f 05                	jg     1f <main+0x1f>
    sleep(5);  // Let child exit before parent.
  exit();
  1a:	e8 9c 01 00 00       	call   1bb <exit>
    sleep(5);  // Let child exit before parent.
  1f:	83 ec 0c             	sub    $0xc,%esp
  22:	6a 05                	push   $0x5
  24:	e8 2a 02 00 00       	call   253 <sleep>
  29:	83 c4 10             	add    $0x10,%esp
  2c:	eb ec                	jmp    1a <main+0x1a>

0000002e <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  2e:	55                   	push   %ebp
  2f:	89 e5                	mov    %esp,%ebp
  31:	53                   	push   %ebx
  32:	8b 45 08             	mov    0x8(%ebp),%eax
  35:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  38:	89 c2                	mov    %eax,%edx
  3a:	0f b6 19             	movzbl (%ecx),%ebx
  3d:	88 1a                	mov    %bl,(%edx)
  3f:	8d 52 01             	lea    0x1(%edx),%edx
  42:	8d 49 01             	lea    0x1(%ecx),%ecx
  45:	84 db                	test   %bl,%bl
  47:	75 f1                	jne    3a <strcpy+0xc>
    ;
  return os;
}
  49:	5b                   	pop    %ebx
  4a:	5d                   	pop    %ebp
  4b:	c3                   	ret    

0000004c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  4c:	55                   	push   %ebp
  4d:	89 e5                	mov    %esp,%ebp
  4f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  52:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  55:	eb 06                	jmp    5d <strcmp+0x11>
    p++, q++;
  57:	83 c1 01             	add    $0x1,%ecx
  5a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  5d:	0f b6 01             	movzbl (%ecx),%eax
  60:	84 c0                	test   %al,%al
  62:	74 04                	je     68 <strcmp+0x1c>
  64:	3a 02                	cmp    (%edx),%al
  66:	74 ef                	je     57 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  68:	0f b6 c0             	movzbl %al,%eax
  6b:	0f b6 12             	movzbl (%edx),%edx
  6e:	29 d0                	sub    %edx,%eax
}
  70:	5d                   	pop    %ebp
  71:	c3                   	ret    

00000072 <strlen>:

uint
strlen(const char *s)
{
  72:	55                   	push   %ebp
  73:	89 e5                	mov    %esp,%ebp
  75:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  78:	ba 00 00 00 00       	mov    $0x0,%edx
  7d:	eb 03                	jmp    82 <strlen+0x10>
  7f:	83 c2 01             	add    $0x1,%edx
  82:	89 d0                	mov    %edx,%eax
  84:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  88:	75 f5                	jne    7f <strlen+0xd>
    ;
  return n;
}
  8a:	5d                   	pop    %ebp
  8b:	c3                   	ret    

0000008c <memset>:

void*
memset(void *dst, int c, uint n)
{
  8c:	55                   	push   %ebp
  8d:	89 e5                	mov    %esp,%ebp
  8f:	57                   	push   %edi
  90:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  93:	89 d7                	mov    %edx,%edi
  95:	8b 4d 10             	mov    0x10(%ebp),%ecx
  98:	8b 45 0c             	mov    0xc(%ebp),%eax
  9b:	fc                   	cld    
  9c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  9e:	89 d0                	mov    %edx,%eax
  a0:	5f                   	pop    %edi
  a1:	5d                   	pop    %ebp
  a2:	c3                   	ret    

000000a3 <strchr>:

char*
strchr(const char *s, char c)
{
  a3:	55                   	push   %ebp
  a4:	89 e5                	mov    %esp,%ebp
  a6:	8b 45 08             	mov    0x8(%ebp),%eax
  a9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  ad:	0f b6 10             	movzbl (%eax),%edx
  b0:	84 d2                	test   %dl,%dl
  b2:	74 09                	je     bd <strchr+0x1a>
    if(*s == c)
  b4:	38 ca                	cmp    %cl,%dl
  b6:	74 0a                	je     c2 <strchr+0x1f>
  for(; *s; s++)
  b8:	83 c0 01             	add    $0x1,%eax
  bb:	eb f0                	jmp    ad <strchr+0xa>
      return (char*)s;
  return 0;
  bd:	b8 00 00 00 00       	mov    $0x0,%eax
}
  c2:	5d                   	pop    %ebp
  c3:	c3                   	ret    

000000c4 <gets>:

char*
gets(char *buf, int max)
{
  c4:	55                   	push   %ebp
  c5:	89 e5                	mov    %esp,%ebp
  c7:	57                   	push   %edi
  c8:	56                   	push   %esi
  c9:	53                   	push   %ebx
  ca:	83 ec 1c             	sub    $0x1c,%esp
  cd:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
  d0:	bb 00 00 00 00       	mov    $0x0,%ebx
  d5:	8d 73 01             	lea    0x1(%ebx),%esi
  d8:	3b 75 0c             	cmp    0xc(%ebp),%esi
  db:	7d 2e                	jge    10b <gets+0x47>
    cc = read(0, &c, 1);
  dd:	83 ec 04             	sub    $0x4,%esp
  e0:	6a 01                	push   $0x1
  e2:	8d 45 e7             	lea    -0x19(%ebp),%eax
  e5:	50                   	push   %eax
  e6:	6a 00                	push   $0x0
  e8:	e8 e6 00 00 00       	call   1d3 <read>
    if(cc < 1)
  ed:	83 c4 10             	add    $0x10,%esp
  f0:	85 c0                	test   %eax,%eax
  f2:	7e 17                	jle    10b <gets+0x47>
      break;
    buf[i++] = c;
  f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  f8:	88 04 1f             	mov    %al,(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
  fb:	3c 0a                	cmp    $0xa,%al
  fd:	0f 94 c2             	sete   %dl
 100:	3c 0d                	cmp    $0xd,%al
 102:	0f 94 c0             	sete   %al
    buf[i++] = c;
 105:	89 f3                	mov    %esi,%ebx
    if(c == '\n' || c == '\r')
 107:	08 c2                	or     %al,%dl
 109:	74 ca                	je     d5 <gets+0x11>
      break;
  }
  buf[i] = '\0';
 10b:	c6 04 1f 00          	movb   $0x0,(%edi,%ebx,1)
  return buf;
}
 10f:	89 f8                	mov    %edi,%eax
 111:	8d 65 f4             	lea    -0xc(%ebp),%esp
 114:	5b                   	pop    %ebx
 115:	5e                   	pop    %esi
 116:	5f                   	pop    %edi
 117:	5d                   	pop    %ebp
 118:	c3                   	ret    

00000119 <stat>:

int
stat(const char *n, struct stat *st)
{
 119:	55                   	push   %ebp
 11a:	89 e5                	mov    %esp,%ebp
 11c:	56                   	push   %esi
 11d:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 11e:	83 ec 08             	sub    $0x8,%esp
 121:	6a 00                	push   $0x0
 123:	ff 75 08             	pushl  0x8(%ebp)
 126:	e8 d0 00 00 00       	call   1fb <open>
  if(fd < 0)
 12b:	83 c4 10             	add    $0x10,%esp
 12e:	85 c0                	test   %eax,%eax
 130:	78 24                	js     156 <stat+0x3d>
 132:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 134:	83 ec 08             	sub    $0x8,%esp
 137:	ff 75 0c             	pushl  0xc(%ebp)
 13a:	50                   	push   %eax
 13b:	e8 d3 00 00 00       	call   213 <fstat>
 140:	89 c6                	mov    %eax,%esi
  close(fd);
 142:	89 1c 24             	mov    %ebx,(%esp)
 145:	e8 99 00 00 00       	call   1e3 <close>
  return r;
 14a:	83 c4 10             	add    $0x10,%esp
}
 14d:	89 f0                	mov    %esi,%eax
 14f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 152:	5b                   	pop    %ebx
 153:	5e                   	pop    %esi
 154:	5d                   	pop    %ebp
 155:	c3                   	ret    
    return -1;
 156:	be ff ff ff ff       	mov    $0xffffffff,%esi
 15b:	eb f0                	jmp    14d <stat+0x34>

0000015d <atoi>:

int
atoi(const char *s)
{
 15d:	55                   	push   %ebp
 15e:	89 e5                	mov    %esp,%ebp
 160:	53                   	push   %ebx
 161:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 164:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 169:	eb 10                	jmp    17b <atoi+0x1e>
    n = n*10 + *s++ - '0';
 16b:	8d 1c 80             	lea    (%eax,%eax,4),%ebx
 16e:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
 171:	83 c1 01             	add    $0x1,%ecx
 174:	0f be d2             	movsbl %dl,%edx
 177:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
  while('0' <= *s && *s <= '9')
 17b:	0f b6 11             	movzbl (%ecx),%edx
 17e:	8d 5a d0             	lea    -0x30(%edx),%ebx
 181:	80 fb 09             	cmp    $0x9,%bl
 184:	76 e5                	jbe    16b <atoi+0xe>
  return n;
}
 186:	5b                   	pop    %ebx
 187:	5d                   	pop    %ebp
 188:	c3                   	ret    

00000189 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 189:	55                   	push   %ebp
 18a:	89 e5                	mov    %esp,%ebp
 18c:	56                   	push   %esi
 18d:	53                   	push   %ebx
 18e:	8b 45 08             	mov    0x8(%ebp),%eax
 191:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 194:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
 197:	89 c1                	mov    %eax,%ecx
  src = vsrc;
  while(n-- > 0)
 199:	eb 0d                	jmp    1a8 <memmove+0x1f>
    *dst++ = *src++;
 19b:	0f b6 13             	movzbl (%ebx),%edx
 19e:	88 11                	mov    %dl,(%ecx)
 1a0:	8d 5b 01             	lea    0x1(%ebx),%ebx
 1a3:	8d 49 01             	lea    0x1(%ecx),%ecx
  while(n-- > 0)
 1a6:	89 f2                	mov    %esi,%edx
 1a8:	8d 72 ff             	lea    -0x1(%edx),%esi
 1ab:	85 d2                	test   %edx,%edx
 1ad:	7f ec                	jg     19b <memmove+0x12>
  return vdst;
}
 1af:	5b                   	pop    %ebx
 1b0:	5e                   	pop    %esi
 1b1:	5d                   	pop    %ebp
 1b2:	c3                   	ret    

000001b3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 1b3:	b8 01 00 00 00       	mov    $0x1,%eax
 1b8:	cd 40                	int    $0x40
 1ba:	c3                   	ret    

000001bb <exit>:
SYSCALL(exit)
 1bb:	b8 02 00 00 00       	mov    $0x2,%eax
 1c0:	cd 40                	int    $0x40
 1c2:	c3                   	ret    

000001c3 <wait>:
SYSCALL(wait)
 1c3:	b8 03 00 00 00       	mov    $0x3,%eax
 1c8:	cd 40                	int    $0x40
 1ca:	c3                   	ret    

000001cb <pipe>:
SYSCALL(pipe)
 1cb:	b8 04 00 00 00       	mov    $0x4,%eax
 1d0:	cd 40                	int    $0x40
 1d2:	c3                   	ret    

000001d3 <read>:
SYSCALL(read)
 1d3:	b8 05 00 00 00       	mov    $0x5,%eax
 1d8:	cd 40                	int    $0x40
 1da:	c3                   	ret    

000001db <write>:
SYSCALL(write)
 1db:	b8 10 00 00 00       	mov    $0x10,%eax
 1e0:	cd 40                	int    $0x40
 1e2:	c3                   	ret    

000001e3 <close>:
SYSCALL(close)
 1e3:	b8 15 00 00 00       	mov    $0x15,%eax
 1e8:	cd 40                	int    $0x40
 1ea:	c3                   	ret    

000001eb <kill>:
SYSCALL(kill)
 1eb:	b8 06 00 00 00       	mov    $0x6,%eax
 1f0:	cd 40                	int    $0x40
 1f2:	c3                   	ret    

000001f3 <exec>:
SYSCALL(exec)
 1f3:	b8 07 00 00 00       	mov    $0x7,%eax
 1f8:	cd 40                	int    $0x40
 1fa:	c3                   	ret    

000001fb <open>:
SYSCALL(open)
 1fb:	b8 0f 00 00 00       	mov    $0xf,%eax
 200:	cd 40                	int    $0x40
 202:	c3                   	ret    

00000203 <mknod>:
SYSCALL(mknod)
 203:	b8 11 00 00 00       	mov    $0x11,%eax
 208:	cd 40                	int    $0x40
 20a:	c3                   	ret    

0000020b <unlink>:
SYSCALL(unlink)
 20b:	b8 12 00 00 00       	mov    $0x12,%eax
 210:	cd 40                	int    $0x40
 212:	c3                   	ret    

00000213 <fstat>:
SYSCALL(fstat)
 213:	b8 08 00 00 00       	mov    $0x8,%eax
 218:	cd 40                	int    $0x40
 21a:	c3                   	ret    

0000021b <link>:
SYSCALL(link)
 21b:	b8 13 00 00 00       	mov    $0x13,%eax
 220:	cd 40                	int    $0x40
 222:	c3                   	ret    

00000223 <mkdir>:
SYSCALL(mkdir)
 223:	b8 14 00 00 00       	mov    $0x14,%eax
 228:	cd 40                	int    $0x40
 22a:	c3                   	ret    

0000022b <chdir>:
SYSCALL(chdir)
 22b:	b8 09 00 00 00       	mov    $0x9,%eax
 230:	cd 40                	int    $0x40
 232:	c3                   	ret    

00000233 <dup>:
SYSCALL(dup)
 233:	b8 0a 00 00 00       	mov    $0xa,%eax
 238:	cd 40                	int    $0x40
 23a:	c3                   	ret    

0000023b <dup2>:
SYSCALL(dup2)
 23b:	b8 17 00 00 00       	mov    $0x17,%eax
 240:	cd 40                	int    $0x40
 242:	c3                   	ret    

00000243 <getpid>:
SYSCALL(getpid)
 243:	b8 0b 00 00 00       	mov    $0xb,%eax
 248:	cd 40                	int    $0x40
 24a:	c3                   	ret    

0000024b <sbrk>:
SYSCALL(sbrk)
 24b:	b8 0c 00 00 00       	mov    $0xc,%eax
 250:	cd 40                	int    $0x40
 252:	c3                   	ret    

00000253 <sleep>:
SYSCALL(sleep)
 253:	b8 0d 00 00 00       	mov    $0xd,%eax
 258:	cd 40                	int    $0x40
 25a:	c3                   	ret    

0000025b <uptime>:
SYSCALL(uptime)
 25b:	b8 0e 00 00 00       	mov    $0xe,%eax
 260:	cd 40                	int    $0x40
 262:	c3                   	ret    

00000263 <date>:
SYSCALL(date)
 263:	b8 16 00 00 00       	mov    $0x16,%eax
 268:	cd 40                	int    $0x40
 26a:	c3                   	ret    

0000026b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 26b:	55                   	push   %ebp
 26c:	89 e5                	mov    %esp,%ebp
 26e:	83 ec 1c             	sub    $0x1c,%esp
 271:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 274:	6a 01                	push   $0x1
 276:	8d 55 f4             	lea    -0xc(%ebp),%edx
 279:	52                   	push   %edx
 27a:	50                   	push   %eax
 27b:	e8 5b ff ff ff       	call   1db <write>
}
 280:	83 c4 10             	add    $0x10,%esp
 283:	c9                   	leave  
 284:	c3                   	ret    

00000285 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 285:	55                   	push   %ebp
 286:	89 e5                	mov    %esp,%ebp
 288:	57                   	push   %edi
 289:	56                   	push   %esi
 28a:	53                   	push   %ebx
 28b:	83 ec 2c             	sub    $0x2c,%esp
 28e:	89 c7                	mov    %eax,%edi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 290:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 294:	0f 95 c3             	setne  %bl
 297:	89 d0                	mov    %edx,%eax
 299:	c1 e8 1f             	shr    $0x1f,%eax
 29c:	84 c3                	test   %al,%bl
 29e:	74 10                	je     2b0 <printint+0x2b>
    neg = 1;
    x = -xx;
 2a0:	f7 da                	neg    %edx
    neg = 1;
 2a2:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 2a9:	be 00 00 00 00       	mov    $0x0,%esi
 2ae:	eb 0b                	jmp    2bb <printint+0x36>
  neg = 0;
 2b0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 2b7:	eb f0                	jmp    2a9 <printint+0x24>
  do{
    buf[i++] = digits[x % base];
 2b9:	89 c6                	mov    %eax,%esi
 2bb:	89 d0                	mov    %edx,%eax
 2bd:	ba 00 00 00 00       	mov    $0x0,%edx
 2c2:	f7 f1                	div    %ecx
 2c4:	89 c3                	mov    %eax,%ebx
 2c6:	8d 46 01             	lea    0x1(%esi),%eax
 2c9:	0f b6 92 c8 05 00 00 	movzbl 0x5c8(%edx),%edx
 2d0:	88 54 35 d8          	mov    %dl,-0x28(%ebp,%esi,1)
  }while((x /= base) != 0);
 2d4:	89 da                	mov    %ebx,%edx
 2d6:	85 db                	test   %ebx,%ebx
 2d8:	75 df                	jne    2b9 <printint+0x34>
 2da:	89 c3                	mov    %eax,%ebx
  if(neg)
 2dc:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 2e0:	74 16                	je     2f8 <printint+0x73>
    buf[i++] = '-';
 2e2:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
 2e7:	8d 5e 02             	lea    0x2(%esi),%ebx
 2ea:	eb 0c                	jmp    2f8 <printint+0x73>

  while(--i >= 0)
    putc(fd, buf[i]);
 2ec:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 2f1:	89 f8                	mov    %edi,%eax
 2f3:	e8 73 ff ff ff       	call   26b <putc>
  while(--i >= 0)
 2f8:	83 eb 01             	sub    $0x1,%ebx
 2fb:	79 ef                	jns    2ec <printint+0x67>
}
 2fd:	83 c4 2c             	add    $0x2c,%esp
 300:	5b                   	pop    %ebx
 301:	5e                   	pop    %esi
 302:	5f                   	pop    %edi
 303:	5d                   	pop    %ebp
 304:	c3                   	ret    

00000305 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 305:	55                   	push   %ebp
 306:	89 e5                	mov    %esp,%ebp
 308:	57                   	push   %edi
 309:	56                   	push   %esi
 30a:	53                   	push   %ebx
 30b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 30e:	8d 45 10             	lea    0x10(%ebp),%eax
 311:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 314:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 319:	bb 00 00 00 00       	mov    $0x0,%ebx
 31e:	eb 14                	jmp    334 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 320:	89 fa                	mov    %edi,%edx
 322:	8b 45 08             	mov    0x8(%ebp),%eax
 325:	e8 41 ff ff ff       	call   26b <putc>
 32a:	eb 05                	jmp    331 <printf+0x2c>
      }
    } else if(state == '%'){
 32c:	83 fe 25             	cmp    $0x25,%esi
 32f:	74 25                	je     356 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 331:	83 c3 01             	add    $0x1,%ebx
 334:	8b 45 0c             	mov    0xc(%ebp),%eax
 337:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 33b:	84 c0                	test   %al,%al
 33d:	0f 84 23 01 00 00    	je     466 <printf+0x161>
    c = fmt[i] & 0xff;
 343:	0f be f8             	movsbl %al,%edi
 346:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 349:	85 f6                	test   %esi,%esi
 34b:	75 df                	jne    32c <printf+0x27>
      if(c == '%'){
 34d:	83 f8 25             	cmp    $0x25,%eax
 350:	75 ce                	jne    320 <printf+0x1b>
        state = '%';
 352:	89 c6                	mov    %eax,%esi
 354:	eb db                	jmp    331 <printf+0x2c>
      if(c == 'd'){
 356:	83 f8 64             	cmp    $0x64,%eax
 359:	74 49                	je     3a4 <printf+0x9f>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 35b:	83 f8 78             	cmp    $0x78,%eax
 35e:	0f 94 c1             	sete   %cl
 361:	83 f8 70             	cmp    $0x70,%eax
 364:	0f 94 c2             	sete   %dl
 367:	08 d1                	or     %dl,%cl
 369:	75 63                	jne    3ce <printf+0xc9>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 36b:	83 f8 73             	cmp    $0x73,%eax
 36e:	0f 84 84 00 00 00    	je     3f8 <printf+0xf3>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 374:	83 f8 63             	cmp    $0x63,%eax
 377:	0f 84 b7 00 00 00    	je     434 <printf+0x12f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 37d:	83 f8 25             	cmp    $0x25,%eax
 380:	0f 84 cc 00 00 00    	je     452 <printf+0x14d>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 386:	ba 25 00 00 00       	mov    $0x25,%edx
 38b:	8b 45 08             	mov    0x8(%ebp),%eax
 38e:	e8 d8 fe ff ff       	call   26b <putc>
        putc(fd, c);
 393:	89 fa                	mov    %edi,%edx
 395:	8b 45 08             	mov    0x8(%ebp),%eax
 398:	e8 ce fe ff ff       	call   26b <putc>
      }
      state = 0;
 39d:	be 00 00 00 00       	mov    $0x0,%esi
 3a2:	eb 8d                	jmp    331 <printf+0x2c>
        printint(fd, *ap, 10, 1);
 3a4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3a7:	8b 17                	mov    (%edi),%edx
 3a9:	83 ec 0c             	sub    $0xc,%esp
 3ac:	6a 01                	push   $0x1
 3ae:	b9 0a 00 00 00       	mov    $0xa,%ecx
 3b3:	8b 45 08             	mov    0x8(%ebp),%eax
 3b6:	e8 ca fe ff ff       	call   285 <printint>
        ap++;
 3bb:	83 c7 04             	add    $0x4,%edi
 3be:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 3c1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 3c4:	be 00 00 00 00       	mov    $0x0,%esi
 3c9:	e9 63 ff ff ff       	jmp    331 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 3ce:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3d1:	8b 17                	mov    (%edi),%edx
 3d3:	83 ec 0c             	sub    $0xc,%esp
 3d6:	6a 00                	push   $0x0
 3d8:	b9 10 00 00 00       	mov    $0x10,%ecx
 3dd:	8b 45 08             	mov    0x8(%ebp),%eax
 3e0:	e8 a0 fe ff ff       	call   285 <printint>
        ap++;
 3e5:	83 c7 04             	add    $0x4,%edi
 3e8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 3eb:	83 c4 10             	add    $0x10,%esp
      state = 0;
 3ee:	be 00 00 00 00       	mov    $0x0,%esi
 3f3:	e9 39 ff ff ff       	jmp    331 <printf+0x2c>
        s = (char*)*ap;
 3f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 3fb:	8b 30                	mov    (%eax),%esi
        ap++;
 3fd:	83 c0 04             	add    $0x4,%eax
 400:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 403:	85 f6                	test   %esi,%esi
 405:	75 28                	jne    42f <printf+0x12a>
          s = "(null)";
 407:	be c0 05 00 00       	mov    $0x5c0,%esi
 40c:	8b 7d 08             	mov    0x8(%ebp),%edi
 40f:	eb 0d                	jmp    41e <printf+0x119>
          putc(fd, *s);
 411:	0f be d2             	movsbl %dl,%edx
 414:	89 f8                	mov    %edi,%eax
 416:	e8 50 fe ff ff       	call   26b <putc>
          s++;
 41b:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 41e:	0f b6 16             	movzbl (%esi),%edx
 421:	84 d2                	test   %dl,%dl
 423:	75 ec                	jne    411 <printf+0x10c>
      state = 0;
 425:	be 00 00 00 00       	mov    $0x0,%esi
 42a:	e9 02 ff ff ff       	jmp    331 <printf+0x2c>
 42f:	8b 7d 08             	mov    0x8(%ebp),%edi
 432:	eb ea                	jmp    41e <printf+0x119>
        putc(fd, *ap);
 434:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 437:	0f be 17             	movsbl (%edi),%edx
 43a:	8b 45 08             	mov    0x8(%ebp),%eax
 43d:	e8 29 fe ff ff       	call   26b <putc>
        ap++;
 442:	83 c7 04             	add    $0x4,%edi
 445:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 448:	be 00 00 00 00       	mov    $0x0,%esi
 44d:	e9 df fe ff ff       	jmp    331 <printf+0x2c>
        putc(fd, c);
 452:	89 fa                	mov    %edi,%edx
 454:	8b 45 08             	mov    0x8(%ebp),%eax
 457:	e8 0f fe ff ff       	call   26b <putc>
      state = 0;
 45c:	be 00 00 00 00       	mov    $0x0,%esi
 461:	e9 cb fe ff ff       	jmp    331 <printf+0x2c>
    }
  }
}
 466:	8d 65 f4             	lea    -0xc(%ebp),%esp
 469:	5b                   	pop    %ebx
 46a:	5e                   	pop    %esi
 46b:	5f                   	pop    %edi
 46c:	5d                   	pop    %ebp
 46d:	c3                   	ret    

0000046e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 46e:	55                   	push   %ebp
 46f:	89 e5                	mov    %esp,%ebp
 471:	57                   	push   %edi
 472:	56                   	push   %esi
 473:	53                   	push   %ebx
 474:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 477:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 47a:	a1 60 08 00 00       	mov    0x860,%eax
 47f:	eb 02                	jmp    483 <free+0x15>
 481:	89 d0                	mov    %edx,%eax
 483:	39 c8                	cmp    %ecx,%eax
 485:	73 04                	jae    48b <free+0x1d>
 487:	39 08                	cmp    %ecx,(%eax)
 489:	77 12                	ja     49d <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 48b:	8b 10                	mov    (%eax),%edx
 48d:	39 c2                	cmp    %eax,%edx
 48f:	77 f0                	ja     481 <free+0x13>
 491:	39 c8                	cmp    %ecx,%eax
 493:	72 08                	jb     49d <free+0x2f>
 495:	39 ca                	cmp    %ecx,%edx
 497:	77 04                	ja     49d <free+0x2f>
 499:	89 d0                	mov    %edx,%eax
 49b:	eb e6                	jmp    483 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 49d:	8b 73 fc             	mov    -0x4(%ebx),%esi
 4a0:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 4a3:	8b 10                	mov    (%eax),%edx
 4a5:	39 d7                	cmp    %edx,%edi
 4a7:	74 19                	je     4c2 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 4a9:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 4ac:	8b 50 04             	mov    0x4(%eax),%edx
 4af:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 4b2:	39 ce                	cmp    %ecx,%esi
 4b4:	74 1b                	je     4d1 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 4b6:	89 08                	mov    %ecx,(%eax)
  freep = p;
 4b8:	a3 60 08 00 00       	mov    %eax,0x860
}
 4bd:	5b                   	pop    %ebx
 4be:	5e                   	pop    %esi
 4bf:	5f                   	pop    %edi
 4c0:	5d                   	pop    %ebp
 4c1:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 4c2:	03 72 04             	add    0x4(%edx),%esi
 4c5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 4c8:	8b 10                	mov    (%eax),%edx
 4ca:	8b 12                	mov    (%edx),%edx
 4cc:	89 53 f8             	mov    %edx,-0x8(%ebx)
 4cf:	eb db                	jmp    4ac <free+0x3e>
    p->s.size += bp->s.size;
 4d1:	03 53 fc             	add    -0x4(%ebx),%edx
 4d4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 4d7:	8b 53 f8             	mov    -0x8(%ebx),%edx
 4da:	89 10                	mov    %edx,(%eax)
 4dc:	eb da                	jmp    4b8 <free+0x4a>

000004de <morecore>:

static Header*
morecore(uint nu)
{
 4de:	55                   	push   %ebp
 4df:	89 e5                	mov    %esp,%ebp
 4e1:	53                   	push   %ebx
 4e2:	83 ec 04             	sub    $0x4,%esp
 4e5:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 4e7:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 4ec:	77 05                	ja     4f3 <morecore+0x15>
    nu = 4096;
 4ee:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 4f3:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 4fa:	83 ec 0c             	sub    $0xc,%esp
 4fd:	50                   	push   %eax
 4fe:	e8 48 fd ff ff       	call   24b <sbrk>
  if(p == (char*)-1)
 503:	83 c4 10             	add    $0x10,%esp
 506:	83 f8 ff             	cmp    $0xffffffff,%eax
 509:	74 1c                	je     527 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 50b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 50e:	83 c0 08             	add    $0x8,%eax
 511:	83 ec 0c             	sub    $0xc,%esp
 514:	50                   	push   %eax
 515:	e8 54 ff ff ff       	call   46e <free>
  return freep;
 51a:	a1 60 08 00 00       	mov    0x860,%eax
 51f:	83 c4 10             	add    $0x10,%esp
}
 522:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 525:	c9                   	leave  
 526:	c3                   	ret    
    return 0;
 527:	b8 00 00 00 00       	mov    $0x0,%eax
 52c:	eb f4                	jmp    522 <morecore+0x44>

0000052e <malloc>:

void*
malloc(uint nbytes)
{
 52e:	55                   	push   %ebp
 52f:	89 e5                	mov    %esp,%ebp
 531:	53                   	push   %ebx
 532:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 535:	8b 45 08             	mov    0x8(%ebp),%eax
 538:	8d 58 07             	lea    0x7(%eax),%ebx
 53b:	c1 eb 03             	shr    $0x3,%ebx
 53e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 541:	8b 0d 60 08 00 00    	mov    0x860,%ecx
 547:	85 c9                	test   %ecx,%ecx
 549:	74 04                	je     54f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 54b:	8b 01                	mov    (%ecx),%eax
 54d:	eb 4d                	jmp    59c <malloc+0x6e>
    base.s.ptr = freep = prevp = &base;
 54f:	c7 05 60 08 00 00 64 	movl   $0x864,0x860
 556:	08 00 00 
 559:	c7 05 64 08 00 00 64 	movl   $0x864,0x864
 560:	08 00 00 
    base.s.size = 0;
 563:	c7 05 68 08 00 00 00 	movl   $0x0,0x868
 56a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 56d:	b9 64 08 00 00       	mov    $0x864,%ecx
 572:	eb d7                	jmp    54b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 574:	39 da                	cmp    %ebx,%edx
 576:	74 1a                	je     592 <malloc+0x64>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 578:	29 da                	sub    %ebx,%edx
 57a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 57d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 580:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 583:	89 0d 60 08 00 00    	mov    %ecx,0x860
      return (void*)(p + 1);
 589:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 58c:	83 c4 04             	add    $0x4,%esp
 58f:	5b                   	pop    %ebx
 590:	5d                   	pop    %ebp
 591:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 592:	8b 10                	mov    (%eax),%edx
 594:	89 11                	mov    %edx,(%ecx)
 596:	eb eb                	jmp    583 <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 598:	89 c1                	mov    %eax,%ecx
 59a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 59c:	8b 50 04             	mov    0x4(%eax),%edx
 59f:	39 da                	cmp    %ebx,%edx
 5a1:	73 d1                	jae    574 <malloc+0x46>
    if(p == freep)
 5a3:	39 05 60 08 00 00    	cmp    %eax,0x860
 5a9:	75 ed                	jne    598 <malloc+0x6a>
      if((p = morecore(nunits)) == 0)
 5ab:	89 d8                	mov    %ebx,%eax
 5ad:	e8 2c ff ff ff       	call   4de <morecore>
 5b2:	85 c0                	test   %eax,%eax
 5b4:	75 e2                	jne    598 <malloc+0x6a>
        return 0;
 5b6:	b8 00 00 00 00       	mov    $0x0,%eax
 5bb:	eb cf                	jmp    58c <malloc+0x5e>
