
_echo:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	b8 01 00 00 00       	mov    $0x1,%eax
  1e:	eb 1a                	jmp    3a <main+0x3a>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  20:	ba e2 05 00 00       	mov    $0x5e2,%edx
  25:	52                   	push   %edx
  26:	ff 34 87             	pushl  (%edi,%eax,4)
  29:	68 e4 05 00 00       	push   $0x5e4
  2e:	6a 01                	push   $0x1
  30:	e8 f3 02 00 00       	call   328 <printf>
  for(i = 1; i < argc; i++)
  35:	83 c4 10             	add    $0x10,%esp
  38:	89 d8                	mov    %ebx,%eax
  3a:	39 f0                	cmp    %esi,%eax
  3c:	7d 0e                	jge    4c <main+0x4c>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  3e:	8d 58 01             	lea    0x1(%eax),%ebx
  41:	39 f3                	cmp    %esi,%ebx
  43:	7d db                	jge    20 <main+0x20>
  45:	ba e0 05 00 00       	mov    $0x5e0,%edx
  4a:	eb d9                	jmp    25 <main+0x25>
  exit();
  4c:	e8 8d 01 00 00       	call   1de <exit>

00000051 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  51:	55                   	push   %ebp
  52:	89 e5                	mov    %esp,%ebp
  54:	53                   	push   %ebx
  55:	8b 45 08             	mov    0x8(%ebp),%eax
  58:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  5b:	89 c2                	mov    %eax,%edx
  5d:	0f b6 19             	movzbl (%ecx),%ebx
  60:	88 1a                	mov    %bl,(%edx)
  62:	8d 52 01             	lea    0x1(%edx),%edx
  65:	8d 49 01             	lea    0x1(%ecx),%ecx
  68:	84 db                	test   %bl,%bl
  6a:	75 f1                	jne    5d <strcpy+0xc>
    ;
  return os;
}
  6c:	5b                   	pop    %ebx
  6d:	5d                   	pop    %ebp
  6e:	c3                   	ret    

0000006f <strcmp>:

int
strcmp(const char *p, const char *q)
{
  6f:	55                   	push   %ebp
  70:	89 e5                	mov    %esp,%ebp
  72:	8b 4d 08             	mov    0x8(%ebp),%ecx
  75:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  78:	eb 06                	jmp    80 <strcmp+0x11>
    p++, q++;
  7a:	83 c1 01             	add    $0x1,%ecx
  7d:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  80:	0f b6 01             	movzbl (%ecx),%eax
  83:	84 c0                	test   %al,%al
  85:	74 04                	je     8b <strcmp+0x1c>
  87:	3a 02                	cmp    (%edx),%al
  89:	74 ef                	je     7a <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  8b:	0f b6 c0             	movzbl %al,%eax
  8e:	0f b6 12             	movzbl (%edx),%edx
  91:	29 d0                	sub    %edx,%eax
}
  93:	5d                   	pop    %ebp
  94:	c3                   	ret    

00000095 <strlen>:

uint
strlen(const char *s)
{
  95:	55                   	push   %ebp
  96:	89 e5                	mov    %esp,%ebp
  98:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  9b:	ba 00 00 00 00       	mov    $0x0,%edx
  a0:	eb 03                	jmp    a5 <strlen+0x10>
  a2:	83 c2 01             	add    $0x1,%edx
  a5:	89 d0                	mov    %edx,%eax
  a7:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  ab:	75 f5                	jne    a2 <strlen+0xd>
    ;
  return n;
}
  ad:	5d                   	pop    %ebp
  ae:	c3                   	ret    

000000af <memset>:

void*
memset(void *dst, int c, uint n)
{
  af:	55                   	push   %ebp
  b0:	89 e5                	mov    %esp,%ebp
  b2:	57                   	push   %edi
  b3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  b6:	89 d7                	mov    %edx,%edi
  b8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  be:	fc                   	cld    
  bf:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  c1:	89 d0                	mov    %edx,%eax
  c3:	5f                   	pop    %edi
  c4:	5d                   	pop    %ebp
  c5:	c3                   	ret    

000000c6 <strchr>:

char*
strchr(const char *s, char c)
{
  c6:	55                   	push   %ebp
  c7:	89 e5                	mov    %esp,%ebp
  c9:	8b 45 08             	mov    0x8(%ebp),%eax
  cc:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  d0:	0f b6 10             	movzbl (%eax),%edx
  d3:	84 d2                	test   %dl,%dl
  d5:	74 09                	je     e0 <strchr+0x1a>
    if(*s == c)
  d7:	38 ca                	cmp    %cl,%dl
  d9:	74 0a                	je     e5 <strchr+0x1f>
  for(; *s; s++)
  db:	83 c0 01             	add    $0x1,%eax
  de:	eb f0                	jmp    d0 <strchr+0xa>
      return (char*)s;
  return 0;
  e0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  e5:	5d                   	pop    %ebp
  e6:	c3                   	ret    

000000e7 <gets>:

char*
gets(char *buf, int max)
{
  e7:	55                   	push   %ebp
  e8:	89 e5                	mov    %esp,%ebp
  ea:	57                   	push   %edi
  eb:	56                   	push   %esi
  ec:	53                   	push   %ebx
  ed:	83 ec 1c             	sub    $0x1c,%esp
  f0:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
  f3:	bb 00 00 00 00       	mov    $0x0,%ebx
  f8:	8d 73 01             	lea    0x1(%ebx),%esi
  fb:	3b 75 0c             	cmp    0xc(%ebp),%esi
  fe:	7d 2e                	jge    12e <gets+0x47>
    cc = read(0, &c, 1);
 100:	83 ec 04             	sub    $0x4,%esp
 103:	6a 01                	push   $0x1
 105:	8d 45 e7             	lea    -0x19(%ebp),%eax
 108:	50                   	push   %eax
 109:	6a 00                	push   $0x0
 10b:	e8 e6 00 00 00       	call   1f6 <read>
    if(cc < 1)
 110:	83 c4 10             	add    $0x10,%esp
 113:	85 c0                	test   %eax,%eax
 115:	7e 17                	jle    12e <gets+0x47>
      break;
    buf[i++] = c;
 117:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 11b:	88 04 1f             	mov    %al,(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 11e:	3c 0a                	cmp    $0xa,%al
 120:	0f 94 c2             	sete   %dl
 123:	3c 0d                	cmp    $0xd,%al
 125:	0f 94 c0             	sete   %al
    buf[i++] = c;
 128:	89 f3                	mov    %esi,%ebx
    if(c == '\n' || c == '\r')
 12a:	08 c2                	or     %al,%dl
 12c:	74 ca                	je     f8 <gets+0x11>
      break;
  }
  buf[i] = '\0';
 12e:	c6 04 1f 00          	movb   $0x0,(%edi,%ebx,1)
  return buf;
}
 132:	89 f8                	mov    %edi,%eax
 134:	8d 65 f4             	lea    -0xc(%ebp),%esp
 137:	5b                   	pop    %ebx
 138:	5e                   	pop    %esi
 139:	5f                   	pop    %edi
 13a:	5d                   	pop    %ebp
 13b:	c3                   	ret    

0000013c <stat>:

int
stat(const char *n, struct stat *st)
{
 13c:	55                   	push   %ebp
 13d:	89 e5                	mov    %esp,%ebp
 13f:	56                   	push   %esi
 140:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 141:	83 ec 08             	sub    $0x8,%esp
 144:	6a 00                	push   $0x0
 146:	ff 75 08             	pushl  0x8(%ebp)
 149:	e8 d0 00 00 00       	call   21e <open>
  if(fd < 0)
 14e:	83 c4 10             	add    $0x10,%esp
 151:	85 c0                	test   %eax,%eax
 153:	78 24                	js     179 <stat+0x3d>
 155:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 157:	83 ec 08             	sub    $0x8,%esp
 15a:	ff 75 0c             	pushl  0xc(%ebp)
 15d:	50                   	push   %eax
 15e:	e8 d3 00 00 00       	call   236 <fstat>
 163:	89 c6                	mov    %eax,%esi
  close(fd);
 165:	89 1c 24             	mov    %ebx,(%esp)
 168:	e8 99 00 00 00       	call   206 <close>
  return r;
 16d:	83 c4 10             	add    $0x10,%esp
}
 170:	89 f0                	mov    %esi,%eax
 172:	8d 65 f8             	lea    -0x8(%ebp),%esp
 175:	5b                   	pop    %ebx
 176:	5e                   	pop    %esi
 177:	5d                   	pop    %ebp
 178:	c3                   	ret    
    return -1;
 179:	be ff ff ff ff       	mov    $0xffffffff,%esi
 17e:	eb f0                	jmp    170 <stat+0x34>

00000180 <atoi>:

int
atoi(const char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	53                   	push   %ebx
 184:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 187:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 18c:	eb 10                	jmp    19e <atoi+0x1e>
    n = n*10 + *s++ - '0';
 18e:	8d 1c 80             	lea    (%eax,%eax,4),%ebx
 191:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
 194:	83 c1 01             	add    $0x1,%ecx
 197:	0f be d2             	movsbl %dl,%edx
 19a:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
  while('0' <= *s && *s <= '9')
 19e:	0f b6 11             	movzbl (%ecx),%edx
 1a1:	8d 5a d0             	lea    -0x30(%edx),%ebx
 1a4:	80 fb 09             	cmp    $0x9,%bl
 1a7:	76 e5                	jbe    18e <atoi+0xe>
  return n;
}
 1a9:	5b                   	pop    %ebx
 1aa:	5d                   	pop    %ebp
 1ab:	c3                   	ret    

000001ac <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	56                   	push   %esi
 1b0:	53                   	push   %ebx
 1b1:	8b 45 08             	mov    0x8(%ebp),%eax
 1b4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1b7:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
 1ba:	89 c1                	mov    %eax,%ecx
  src = vsrc;
  while(n-- > 0)
 1bc:	eb 0d                	jmp    1cb <memmove+0x1f>
    *dst++ = *src++;
 1be:	0f b6 13             	movzbl (%ebx),%edx
 1c1:	88 11                	mov    %dl,(%ecx)
 1c3:	8d 5b 01             	lea    0x1(%ebx),%ebx
 1c6:	8d 49 01             	lea    0x1(%ecx),%ecx
  while(n-- > 0)
 1c9:	89 f2                	mov    %esi,%edx
 1cb:	8d 72 ff             	lea    -0x1(%edx),%esi
 1ce:	85 d2                	test   %edx,%edx
 1d0:	7f ec                	jg     1be <memmove+0x12>
  return vdst;
}
 1d2:	5b                   	pop    %ebx
 1d3:	5e                   	pop    %esi
 1d4:	5d                   	pop    %ebp
 1d5:	c3                   	ret    

000001d6 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 1d6:	b8 01 00 00 00       	mov    $0x1,%eax
 1db:	cd 40                	int    $0x40
 1dd:	c3                   	ret    

000001de <exit>:
SYSCALL(exit)
 1de:	b8 02 00 00 00       	mov    $0x2,%eax
 1e3:	cd 40                	int    $0x40
 1e5:	c3                   	ret    

000001e6 <wait>:
SYSCALL(wait)
 1e6:	b8 03 00 00 00       	mov    $0x3,%eax
 1eb:	cd 40                	int    $0x40
 1ed:	c3                   	ret    

000001ee <pipe>:
SYSCALL(pipe)
 1ee:	b8 04 00 00 00       	mov    $0x4,%eax
 1f3:	cd 40                	int    $0x40
 1f5:	c3                   	ret    

000001f6 <read>:
SYSCALL(read)
 1f6:	b8 05 00 00 00       	mov    $0x5,%eax
 1fb:	cd 40                	int    $0x40
 1fd:	c3                   	ret    

000001fe <write>:
SYSCALL(write)
 1fe:	b8 10 00 00 00       	mov    $0x10,%eax
 203:	cd 40                	int    $0x40
 205:	c3                   	ret    

00000206 <close>:
SYSCALL(close)
 206:	b8 15 00 00 00       	mov    $0x15,%eax
 20b:	cd 40                	int    $0x40
 20d:	c3                   	ret    

0000020e <kill>:
SYSCALL(kill)
 20e:	b8 06 00 00 00       	mov    $0x6,%eax
 213:	cd 40                	int    $0x40
 215:	c3                   	ret    

00000216 <exec>:
SYSCALL(exec)
 216:	b8 07 00 00 00       	mov    $0x7,%eax
 21b:	cd 40                	int    $0x40
 21d:	c3                   	ret    

0000021e <open>:
SYSCALL(open)
 21e:	b8 0f 00 00 00       	mov    $0xf,%eax
 223:	cd 40                	int    $0x40
 225:	c3                   	ret    

00000226 <mknod>:
SYSCALL(mknod)
 226:	b8 11 00 00 00       	mov    $0x11,%eax
 22b:	cd 40                	int    $0x40
 22d:	c3                   	ret    

0000022e <unlink>:
SYSCALL(unlink)
 22e:	b8 12 00 00 00       	mov    $0x12,%eax
 233:	cd 40                	int    $0x40
 235:	c3                   	ret    

00000236 <fstat>:
SYSCALL(fstat)
 236:	b8 08 00 00 00       	mov    $0x8,%eax
 23b:	cd 40                	int    $0x40
 23d:	c3                   	ret    

0000023e <link>:
SYSCALL(link)
 23e:	b8 13 00 00 00       	mov    $0x13,%eax
 243:	cd 40                	int    $0x40
 245:	c3                   	ret    

00000246 <mkdir>:
SYSCALL(mkdir)
 246:	b8 14 00 00 00       	mov    $0x14,%eax
 24b:	cd 40                	int    $0x40
 24d:	c3                   	ret    

0000024e <chdir>:
SYSCALL(chdir)
 24e:	b8 09 00 00 00       	mov    $0x9,%eax
 253:	cd 40                	int    $0x40
 255:	c3                   	ret    

00000256 <dup>:
SYSCALL(dup)
 256:	b8 0a 00 00 00       	mov    $0xa,%eax
 25b:	cd 40                	int    $0x40
 25d:	c3                   	ret    

0000025e <dup2>:
SYSCALL(dup2)
 25e:	b8 17 00 00 00       	mov    $0x17,%eax
 263:	cd 40                	int    $0x40
 265:	c3                   	ret    

00000266 <getpid>:
SYSCALL(getpid)
 266:	b8 0b 00 00 00       	mov    $0xb,%eax
 26b:	cd 40                	int    $0x40
 26d:	c3                   	ret    

0000026e <sbrk>:
SYSCALL(sbrk)
 26e:	b8 0c 00 00 00       	mov    $0xc,%eax
 273:	cd 40                	int    $0x40
 275:	c3                   	ret    

00000276 <sleep>:
SYSCALL(sleep)
 276:	b8 0d 00 00 00       	mov    $0xd,%eax
 27b:	cd 40                	int    $0x40
 27d:	c3                   	ret    

0000027e <uptime>:
SYSCALL(uptime)
 27e:	b8 0e 00 00 00       	mov    $0xe,%eax
 283:	cd 40                	int    $0x40
 285:	c3                   	ret    

00000286 <date>:
SYSCALL(date)
 286:	b8 16 00 00 00       	mov    $0x16,%eax
 28b:	cd 40                	int    $0x40
 28d:	c3                   	ret    

0000028e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 28e:	55                   	push   %ebp
 28f:	89 e5                	mov    %esp,%ebp
 291:	83 ec 1c             	sub    $0x1c,%esp
 294:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 297:	6a 01                	push   $0x1
 299:	8d 55 f4             	lea    -0xc(%ebp),%edx
 29c:	52                   	push   %edx
 29d:	50                   	push   %eax
 29e:	e8 5b ff ff ff       	call   1fe <write>
}
 2a3:	83 c4 10             	add    $0x10,%esp
 2a6:	c9                   	leave  
 2a7:	c3                   	ret    

000002a8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 2a8:	55                   	push   %ebp
 2a9:	89 e5                	mov    %esp,%ebp
 2ab:	57                   	push   %edi
 2ac:	56                   	push   %esi
 2ad:	53                   	push   %ebx
 2ae:	83 ec 2c             	sub    $0x2c,%esp
 2b1:	89 c7                	mov    %eax,%edi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 2b3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 2b7:	0f 95 c3             	setne  %bl
 2ba:	89 d0                	mov    %edx,%eax
 2bc:	c1 e8 1f             	shr    $0x1f,%eax
 2bf:	84 c3                	test   %al,%bl
 2c1:	74 10                	je     2d3 <printint+0x2b>
    neg = 1;
    x = -xx;
 2c3:	f7 da                	neg    %edx
    neg = 1;
 2c5:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 2cc:	be 00 00 00 00       	mov    $0x0,%esi
 2d1:	eb 0b                	jmp    2de <printint+0x36>
  neg = 0;
 2d3:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 2da:	eb f0                	jmp    2cc <printint+0x24>
  do{
    buf[i++] = digits[x % base];
 2dc:	89 c6                	mov    %eax,%esi
 2de:	89 d0                	mov    %edx,%eax
 2e0:	ba 00 00 00 00       	mov    $0x0,%edx
 2e5:	f7 f1                	div    %ecx
 2e7:	89 c3                	mov    %eax,%ebx
 2e9:	8d 46 01             	lea    0x1(%esi),%eax
 2ec:	0f b6 92 f0 05 00 00 	movzbl 0x5f0(%edx),%edx
 2f3:	88 54 35 d8          	mov    %dl,-0x28(%ebp,%esi,1)
  }while((x /= base) != 0);
 2f7:	89 da                	mov    %ebx,%edx
 2f9:	85 db                	test   %ebx,%ebx
 2fb:	75 df                	jne    2dc <printint+0x34>
 2fd:	89 c3                	mov    %eax,%ebx
  if(neg)
 2ff:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 303:	74 16                	je     31b <printint+0x73>
    buf[i++] = '-';
 305:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
 30a:	8d 5e 02             	lea    0x2(%esi),%ebx
 30d:	eb 0c                	jmp    31b <printint+0x73>

  while(--i >= 0)
    putc(fd, buf[i]);
 30f:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 314:	89 f8                	mov    %edi,%eax
 316:	e8 73 ff ff ff       	call   28e <putc>
  while(--i >= 0)
 31b:	83 eb 01             	sub    $0x1,%ebx
 31e:	79 ef                	jns    30f <printint+0x67>
}
 320:	83 c4 2c             	add    $0x2c,%esp
 323:	5b                   	pop    %ebx
 324:	5e                   	pop    %esi
 325:	5f                   	pop    %edi
 326:	5d                   	pop    %ebp
 327:	c3                   	ret    

00000328 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 328:	55                   	push   %ebp
 329:	89 e5                	mov    %esp,%ebp
 32b:	57                   	push   %edi
 32c:	56                   	push   %esi
 32d:	53                   	push   %ebx
 32e:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 331:	8d 45 10             	lea    0x10(%ebp),%eax
 334:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 337:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 33c:	bb 00 00 00 00       	mov    $0x0,%ebx
 341:	eb 14                	jmp    357 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 343:	89 fa                	mov    %edi,%edx
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	e8 41 ff ff ff       	call   28e <putc>
 34d:	eb 05                	jmp    354 <printf+0x2c>
      }
    } else if(state == '%'){
 34f:	83 fe 25             	cmp    $0x25,%esi
 352:	74 25                	je     379 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 354:	83 c3 01             	add    $0x1,%ebx
 357:	8b 45 0c             	mov    0xc(%ebp),%eax
 35a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 35e:	84 c0                	test   %al,%al
 360:	0f 84 23 01 00 00    	je     489 <printf+0x161>
    c = fmt[i] & 0xff;
 366:	0f be f8             	movsbl %al,%edi
 369:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 36c:	85 f6                	test   %esi,%esi
 36e:	75 df                	jne    34f <printf+0x27>
      if(c == '%'){
 370:	83 f8 25             	cmp    $0x25,%eax
 373:	75 ce                	jne    343 <printf+0x1b>
        state = '%';
 375:	89 c6                	mov    %eax,%esi
 377:	eb db                	jmp    354 <printf+0x2c>
      if(c == 'd'){
 379:	83 f8 64             	cmp    $0x64,%eax
 37c:	74 49                	je     3c7 <printf+0x9f>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 37e:	83 f8 78             	cmp    $0x78,%eax
 381:	0f 94 c1             	sete   %cl
 384:	83 f8 70             	cmp    $0x70,%eax
 387:	0f 94 c2             	sete   %dl
 38a:	08 d1                	or     %dl,%cl
 38c:	75 63                	jne    3f1 <printf+0xc9>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 38e:	83 f8 73             	cmp    $0x73,%eax
 391:	0f 84 84 00 00 00    	je     41b <printf+0xf3>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 397:	83 f8 63             	cmp    $0x63,%eax
 39a:	0f 84 b7 00 00 00    	je     457 <printf+0x12f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 3a0:	83 f8 25             	cmp    $0x25,%eax
 3a3:	0f 84 cc 00 00 00    	je     475 <printf+0x14d>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 3a9:	ba 25 00 00 00       	mov    $0x25,%edx
 3ae:	8b 45 08             	mov    0x8(%ebp),%eax
 3b1:	e8 d8 fe ff ff       	call   28e <putc>
        putc(fd, c);
 3b6:	89 fa                	mov    %edi,%edx
 3b8:	8b 45 08             	mov    0x8(%ebp),%eax
 3bb:	e8 ce fe ff ff       	call   28e <putc>
      }
      state = 0;
 3c0:	be 00 00 00 00       	mov    $0x0,%esi
 3c5:	eb 8d                	jmp    354 <printf+0x2c>
        printint(fd, *ap, 10, 1);
 3c7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3ca:	8b 17                	mov    (%edi),%edx
 3cc:	83 ec 0c             	sub    $0xc,%esp
 3cf:	6a 01                	push   $0x1
 3d1:	b9 0a 00 00 00       	mov    $0xa,%ecx
 3d6:	8b 45 08             	mov    0x8(%ebp),%eax
 3d9:	e8 ca fe ff ff       	call   2a8 <printint>
        ap++;
 3de:	83 c7 04             	add    $0x4,%edi
 3e1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 3e4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 3e7:	be 00 00 00 00       	mov    $0x0,%esi
 3ec:	e9 63 ff ff ff       	jmp    354 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 3f1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 3f4:	8b 17                	mov    (%edi),%edx
 3f6:	83 ec 0c             	sub    $0xc,%esp
 3f9:	6a 00                	push   $0x0
 3fb:	b9 10 00 00 00       	mov    $0x10,%ecx
 400:	8b 45 08             	mov    0x8(%ebp),%eax
 403:	e8 a0 fe ff ff       	call   2a8 <printint>
        ap++;
 408:	83 c7 04             	add    $0x4,%edi
 40b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 40e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 411:	be 00 00 00 00       	mov    $0x0,%esi
 416:	e9 39 ff ff ff       	jmp    354 <printf+0x2c>
        s = (char*)*ap;
 41b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 41e:	8b 30                	mov    (%eax),%esi
        ap++;
 420:	83 c0 04             	add    $0x4,%eax
 423:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 426:	85 f6                	test   %esi,%esi
 428:	75 28                	jne    452 <printf+0x12a>
          s = "(null)";
 42a:	be e9 05 00 00       	mov    $0x5e9,%esi
 42f:	8b 7d 08             	mov    0x8(%ebp),%edi
 432:	eb 0d                	jmp    441 <printf+0x119>
          putc(fd, *s);
 434:	0f be d2             	movsbl %dl,%edx
 437:	89 f8                	mov    %edi,%eax
 439:	e8 50 fe ff ff       	call   28e <putc>
          s++;
 43e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 441:	0f b6 16             	movzbl (%esi),%edx
 444:	84 d2                	test   %dl,%dl
 446:	75 ec                	jne    434 <printf+0x10c>
      state = 0;
 448:	be 00 00 00 00       	mov    $0x0,%esi
 44d:	e9 02 ff ff ff       	jmp    354 <printf+0x2c>
 452:	8b 7d 08             	mov    0x8(%ebp),%edi
 455:	eb ea                	jmp    441 <printf+0x119>
        putc(fd, *ap);
 457:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 45a:	0f be 17             	movsbl (%edi),%edx
 45d:	8b 45 08             	mov    0x8(%ebp),%eax
 460:	e8 29 fe ff ff       	call   28e <putc>
        ap++;
 465:	83 c7 04             	add    $0x4,%edi
 468:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 46b:	be 00 00 00 00       	mov    $0x0,%esi
 470:	e9 df fe ff ff       	jmp    354 <printf+0x2c>
        putc(fd, c);
 475:	89 fa                	mov    %edi,%edx
 477:	8b 45 08             	mov    0x8(%ebp),%eax
 47a:	e8 0f fe ff ff       	call   28e <putc>
      state = 0;
 47f:	be 00 00 00 00       	mov    $0x0,%esi
 484:	e9 cb fe ff ff       	jmp    354 <printf+0x2c>
    }
  }
}
 489:	8d 65 f4             	lea    -0xc(%ebp),%esp
 48c:	5b                   	pop    %ebx
 48d:	5e                   	pop    %esi
 48e:	5f                   	pop    %edi
 48f:	5d                   	pop    %ebp
 490:	c3                   	ret    

00000491 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 491:	55                   	push   %ebp
 492:	89 e5                	mov    %esp,%ebp
 494:	57                   	push   %edi
 495:	56                   	push   %esi
 496:	53                   	push   %ebx
 497:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 49a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 49d:	a1 94 08 00 00       	mov    0x894,%eax
 4a2:	eb 02                	jmp    4a6 <free+0x15>
 4a4:	89 d0                	mov    %edx,%eax
 4a6:	39 c8                	cmp    %ecx,%eax
 4a8:	73 04                	jae    4ae <free+0x1d>
 4aa:	39 08                	cmp    %ecx,(%eax)
 4ac:	77 12                	ja     4c0 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 4ae:	8b 10                	mov    (%eax),%edx
 4b0:	39 c2                	cmp    %eax,%edx
 4b2:	77 f0                	ja     4a4 <free+0x13>
 4b4:	39 c8                	cmp    %ecx,%eax
 4b6:	72 08                	jb     4c0 <free+0x2f>
 4b8:	39 ca                	cmp    %ecx,%edx
 4ba:	77 04                	ja     4c0 <free+0x2f>
 4bc:	89 d0                	mov    %edx,%eax
 4be:	eb e6                	jmp    4a6 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 4c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 4c3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 4c6:	8b 10                	mov    (%eax),%edx
 4c8:	39 d7                	cmp    %edx,%edi
 4ca:	74 19                	je     4e5 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 4cc:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 4cf:	8b 50 04             	mov    0x4(%eax),%edx
 4d2:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 4d5:	39 ce                	cmp    %ecx,%esi
 4d7:	74 1b                	je     4f4 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 4d9:	89 08                	mov    %ecx,(%eax)
  freep = p;
 4db:	a3 94 08 00 00       	mov    %eax,0x894
}
 4e0:	5b                   	pop    %ebx
 4e1:	5e                   	pop    %esi
 4e2:	5f                   	pop    %edi
 4e3:	5d                   	pop    %ebp
 4e4:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 4e5:	03 72 04             	add    0x4(%edx),%esi
 4e8:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 4eb:	8b 10                	mov    (%eax),%edx
 4ed:	8b 12                	mov    (%edx),%edx
 4ef:	89 53 f8             	mov    %edx,-0x8(%ebx)
 4f2:	eb db                	jmp    4cf <free+0x3e>
    p->s.size += bp->s.size;
 4f4:	03 53 fc             	add    -0x4(%ebx),%edx
 4f7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 4fa:	8b 53 f8             	mov    -0x8(%ebx),%edx
 4fd:	89 10                	mov    %edx,(%eax)
 4ff:	eb da                	jmp    4db <free+0x4a>

00000501 <morecore>:

static Header*
morecore(uint nu)
{
 501:	55                   	push   %ebp
 502:	89 e5                	mov    %esp,%ebp
 504:	53                   	push   %ebx
 505:	83 ec 04             	sub    $0x4,%esp
 508:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 50a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 50f:	77 05                	ja     516 <morecore+0x15>
    nu = 4096;
 511:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 516:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 51d:	83 ec 0c             	sub    $0xc,%esp
 520:	50                   	push   %eax
 521:	e8 48 fd ff ff       	call   26e <sbrk>
  if(p == (char*)-1)
 526:	83 c4 10             	add    $0x10,%esp
 529:	83 f8 ff             	cmp    $0xffffffff,%eax
 52c:	74 1c                	je     54a <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 52e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 531:	83 c0 08             	add    $0x8,%eax
 534:	83 ec 0c             	sub    $0xc,%esp
 537:	50                   	push   %eax
 538:	e8 54 ff ff ff       	call   491 <free>
  return freep;
 53d:	a1 94 08 00 00       	mov    0x894,%eax
 542:	83 c4 10             	add    $0x10,%esp
}
 545:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 548:	c9                   	leave  
 549:	c3                   	ret    
    return 0;
 54a:	b8 00 00 00 00       	mov    $0x0,%eax
 54f:	eb f4                	jmp    545 <morecore+0x44>

00000551 <malloc>:

void*
malloc(uint nbytes)
{
 551:	55                   	push   %ebp
 552:	89 e5                	mov    %esp,%ebp
 554:	53                   	push   %ebx
 555:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	8d 58 07             	lea    0x7(%eax),%ebx
 55e:	c1 eb 03             	shr    $0x3,%ebx
 561:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 564:	8b 0d 94 08 00 00    	mov    0x894,%ecx
 56a:	85 c9                	test   %ecx,%ecx
 56c:	74 04                	je     572 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 56e:	8b 01                	mov    (%ecx),%eax
 570:	eb 4d                	jmp    5bf <malloc+0x6e>
    base.s.ptr = freep = prevp = &base;
 572:	c7 05 94 08 00 00 98 	movl   $0x898,0x894
 579:	08 00 00 
 57c:	c7 05 98 08 00 00 98 	movl   $0x898,0x898
 583:	08 00 00 
    base.s.size = 0;
 586:	c7 05 9c 08 00 00 00 	movl   $0x0,0x89c
 58d:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 590:	b9 98 08 00 00       	mov    $0x898,%ecx
 595:	eb d7                	jmp    56e <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 597:	39 da                	cmp    %ebx,%edx
 599:	74 1a                	je     5b5 <malloc+0x64>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 59b:	29 da                	sub    %ebx,%edx
 59d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 5a0:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 5a3:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 5a6:	89 0d 94 08 00 00    	mov    %ecx,0x894
      return (void*)(p + 1);
 5ac:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 5af:	83 c4 04             	add    $0x4,%esp
 5b2:	5b                   	pop    %ebx
 5b3:	5d                   	pop    %ebp
 5b4:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 5b5:	8b 10                	mov    (%eax),%edx
 5b7:	89 11                	mov    %edx,(%ecx)
 5b9:	eb eb                	jmp    5a6 <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5bb:	89 c1                	mov    %eax,%ecx
 5bd:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 5bf:	8b 50 04             	mov    0x4(%eax),%edx
 5c2:	39 da                	cmp    %ebx,%edx
 5c4:	73 d1                	jae    597 <malloc+0x46>
    if(p == freep)
 5c6:	39 05 94 08 00 00    	cmp    %eax,0x894
 5cc:	75 ed                	jne    5bb <malloc+0x6a>
      if((p = morecore(nunits)) == 0)
 5ce:	89 d8                	mov    %ebx,%eax
 5d0:	e8 2c ff ff ff       	call   501 <morecore>
 5d5:	85 c0                	test   %eax,%eax
 5d7:	75 e2                	jne    5bb <malloc+0x6a>
        return 0;
 5d9:	b8 00 00 00 00       	mov    $0x0,%eax
 5de:	eb cf                	jmp    5af <malloc+0x5e>
