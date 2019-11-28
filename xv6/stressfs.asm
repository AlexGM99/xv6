
_stressfs:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  16:	c7 45 de 73 74 72 65 	movl   $0x65727473,-0x22(%ebp)
  1d:	c7 45 e2 73 73 66 73 	movl   $0x73667373,-0x1e(%ebp)
  24:	66 c7 45 e6 30 00    	movw   $0x30,-0x1a(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  2a:	68 ac 06 00 00       	push   $0x6ac
  2f:	6a 01                	push   $0x1
  31:	e8 bd 03 00 00       	call   3f3 <printf>
  memset(data, 'a', sizeof(data));
  36:	83 c4 0c             	add    $0xc,%esp
  39:	68 00 02 00 00       	push   $0x200
  3e:	6a 61                	push   $0x61
  40:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  46:	50                   	push   %eax
  47:	e8 2e 01 00 00       	call   17a <memset>

  for(i = 0; i < 4; i++)
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	bb 00 00 00 00       	mov    $0x0,%ebx
  54:	83 fb 03             	cmp    $0x3,%ebx
  57:	7f 0e                	jg     67 <main+0x67>
    if(fork() > 0)
  59:	e8 43 02 00 00       	call   2a1 <fork>
  5e:	85 c0                	test   %eax,%eax
  60:	7f 05                	jg     67 <main+0x67>
  for(i = 0; i < 4; i++)
  62:	83 c3 01             	add    $0x1,%ebx
  65:	eb ed                	jmp    54 <main+0x54>
      break;

  printf(1, "write %d\n", i);
  67:	83 ec 04             	sub    $0x4,%esp
  6a:	53                   	push   %ebx
  6b:	68 bf 06 00 00       	push   $0x6bf
  70:	6a 01                	push   $0x1
  72:	e8 7c 03 00 00       	call   3f3 <printf>

  path[8] += i;
  77:	00 5d e6             	add    %bl,-0x1a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7a:	83 c4 08             	add    $0x8,%esp
  7d:	68 02 02 00 00       	push   $0x202
  82:	8d 45 de             	lea    -0x22(%ebp),%eax
  85:	50                   	push   %eax
  86:	e8 5e 02 00 00       	call   2e9 <open>
  8b:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++)
  8d:	83 c4 10             	add    $0x10,%esp
  90:	bb 00 00 00 00       	mov    $0x0,%ebx
  95:	eb 1b                	jmp    b2 <main+0xb2>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  97:	83 ec 04             	sub    $0x4,%esp
  9a:	68 00 02 00 00       	push   $0x200
  9f:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a5:	50                   	push   %eax
  a6:	56                   	push   %esi
  a7:	e8 1d 02 00 00       	call   2c9 <write>
  for(i = 0; i < 20; i++)
  ac:	83 c3 01             	add    $0x1,%ebx
  af:	83 c4 10             	add    $0x10,%esp
  b2:	83 fb 13             	cmp    $0x13,%ebx
  b5:	7e e0                	jle    97 <main+0x97>
  close(fd);
  b7:	83 ec 0c             	sub    $0xc,%esp
  ba:	56                   	push   %esi
  bb:	e8 11 02 00 00       	call   2d1 <close>

  printf(1, "read\n");
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 c9 06 00 00       	push   $0x6c9
  c8:	6a 01                	push   $0x1
  ca:	e8 24 03 00 00       	call   3f3 <printf>

  fd = open(path, O_RDONLY);
  cf:	83 c4 08             	add    $0x8,%esp
  d2:	6a 00                	push   $0x0
  d4:	8d 45 de             	lea    -0x22(%ebp),%eax
  d7:	50                   	push   %eax
  d8:	e8 0c 02 00 00       	call   2e9 <open>
  dd:	89 c6                	mov    %eax,%esi
  for (i = 0; i < 20; i++)
  df:	83 c4 10             	add    $0x10,%esp
  e2:	bb 00 00 00 00       	mov    $0x0,%ebx
  e7:	eb 1b                	jmp    104 <main+0x104>
    read(fd, data, sizeof(data));
  e9:	83 ec 04             	sub    $0x4,%esp
  ec:	68 00 02 00 00       	push   $0x200
  f1:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  f7:	50                   	push   %eax
  f8:	56                   	push   %esi
  f9:	e8 c3 01 00 00       	call   2c1 <read>
  for (i = 0; i < 20; i++)
  fe:	83 c3 01             	add    $0x1,%ebx
 101:	83 c4 10             	add    $0x10,%esp
 104:	83 fb 13             	cmp    $0x13,%ebx
 107:	7e e0                	jle    e9 <main+0xe9>
  close(fd);
 109:	83 ec 0c             	sub    $0xc,%esp
 10c:	56                   	push   %esi
 10d:	e8 bf 01 00 00       	call   2d1 <close>

  wait();
 112:	e8 9a 01 00 00       	call   2b1 <wait>

  exit();
 117:	e8 8d 01 00 00       	call   2a9 <exit>

0000011c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	53                   	push   %ebx
 120:	8b 45 08             	mov    0x8(%ebp),%eax
 123:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 126:	89 c2                	mov    %eax,%edx
 128:	0f b6 19             	movzbl (%ecx),%ebx
 12b:	88 1a                	mov    %bl,(%edx)
 12d:	8d 52 01             	lea    0x1(%edx),%edx
 130:	8d 49 01             	lea    0x1(%ecx),%ecx
 133:	84 db                	test   %bl,%bl
 135:	75 f1                	jne    128 <strcpy+0xc>
    ;
  return os;
}
 137:	5b                   	pop    %ebx
 138:	5d                   	pop    %ebp
 139:	c3                   	ret    

0000013a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 13a:	55                   	push   %ebp
 13b:	89 e5                	mov    %esp,%ebp
 13d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 140:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 143:	eb 06                	jmp    14b <strcmp+0x11>
    p++, q++;
 145:	83 c1 01             	add    $0x1,%ecx
 148:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 14b:	0f b6 01             	movzbl (%ecx),%eax
 14e:	84 c0                	test   %al,%al
 150:	74 04                	je     156 <strcmp+0x1c>
 152:	3a 02                	cmp    (%edx),%al
 154:	74 ef                	je     145 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 156:	0f b6 c0             	movzbl %al,%eax
 159:	0f b6 12             	movzbl (%edx),%edx
 15c:	29 d0                	sub    %edx,%eax
}
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <strlen>:

uint
strlen(const char *s)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 166:	ba 00 00 00 00       	mov    $0x0,%edx
 16b:	eb 03                	jmp    170 <strlen+0x10>
 16d:	83 c2 01             	add    $0x1,%edx
 170:	89 d0                	mov    %edx,%eax
 172:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 176:	75 f5                	jne    16d <strlen+0xd>
    ;
  return n;
}
 178:	5d                   	pop    %ebp
 179:	c3                   	ret    

0000017a <memset>:

void*
memset(void *dst, int c, uint n)
{
 17a:	55                   	push   %ebp
 17b:	89 e5                	mov    %esp,%ebp
 17d:	57                   	push   %edi
 17e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 181:	89 d7                	mov    %edx,%edi
 183:	8b 4d 10             	mov    0x10(%ebp),%ecx
 186:	8b 45 0c             	mov    0xc(%ebp),%eax
 189:	fc                   	cld    
 18a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 18c:	89 d0                	mov    %edx,%eax
 18e:	5f                   	pop    %edi
 18f:	5d                   	pop    %ebp
 190:	c3                   	ret    

00000191 <strchr>:

char*
strchr(const char *s, char c)
{
 191:	55                   	push   %ebp
 192:	89 e5                	mov    %esp,%ebp
 194:	8b 45 08             	mov    0x8(%ebp),%eax
 197:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 19b:	0f b6 10             	movzbl (%eax),%edx
 19e:	84 d2                	test   %dl,%dl
 1a0:	74 09                	je     1ab <strchr+0x1a>
    if(*s == c)
 1a2:	38 ca                	cmp    %cl,%dl
 1a4:	74 0a                	je     1b0 <strchr+0x1f>
  for(; *s; s++)
 1a6:	83 c0 01             	add    $0x1,%eax
 1a9:	eb f0                	jmp    19b <strchr+0xa>
      return (char*)s;
  return 0;
 1ab:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1b0:	5d                   	pop    %ebp
 1b1:	c3                   	ret    

000001b2 <gets>:

char*
gets(char *buf, int max)
{
 1b2:	55                   	push   %ebp
 1b3:	89 e5                	mov    %esp,%ebp
 1b5:	57                   	push   %edi
 1b6:	56                   	push   %esi
 1b7:	53                   	push   %ebx
 1b8:	83 ec 1c             	sub    $0x1c,%esp
 1bb:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1be:	bb 00 00 00 00       	mov    $0x0,%ebx
 1c3:	8d 73 01             	lea    0x1(%ebx),%esi
 1c6:	3b 75 0c             	cmp    0xc(%ebp),%esi
 1c9:	7d 2e                	jge    1f9 <gets+0x47>
    cc = read(0, &c, 1);
 1cb:	83 ec 04             	sub    $0x4,%esp
 1ce:	6a 01                	push   $0x1
 1d0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1d3:	50                   	push   %eax
 1d4:	6a 00                	push   $0x0
 1d6:	e8 e6 00 00 00       	call   2c1 <read>
    if(cc < 1)
 1db:	83 c4 10             	add    $0x10,%esp
 1de:	85 c0                	test   %eax,%eax
 1e0:	7e 17                	jle    1f9 <gets+0x47>
      break;
    buf[i++] = c;
 1e2:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1e6:	88 04 1f             	mov    %al,(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 1e9:	3c 0a                	cmp    $0xa,%al
 1eb:	0f 94 c2             	sete   %dl
 1ee:	3c 0d                	cmp    $0xd,%al
 1f0:	0f 94 c0             	sete   %al
    buf[i++] = c;
 1f3:	89 f3                	mov    %esi,%ebx
    if(c == '\n' || c == '\r')
 1f5:	08 c2                	or     %al,%dl
 1f7:	74 ca                	je     1c3 <gets+0x11>
      break;
  }
  buf[i] = '\0';
 1f9:	c6 04 1f 00          	movb   $0x0,(%edi,%ebx,1)
  return buf;
}
 1fd:	89 f8                	mov    %edi,%eax
 1ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
 202:	5b                   	pop    %ebx
 203:	5e                   	pop    %esi
 204:	5f                   	pop    %edi
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    

00000207 <stat>:

int
stat(const char *n, struct stat *st)
{
 207:	55                   	push   %ebp
 208:	89 e5                	mov    %esp,%ebp
 20a:	56                   	push   %esi
 20b:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 20c:	83 ec 08             	sub    $0x8,%esp
 20f:	6a 00                	push   $0x0
 211:	ff 75 08             	pushl  0x8(%ebp)
 214:	e8 d0 00 00 00       	call   2e9 <open>
  if(fd < 0)
 219:	83 c4 10             	add    $0x10,%esp
 21c:	85 c0                	test   %eax,%eax
 21e:	78 24                	js     244 <stat+0x3d>
 220:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 222:	83 ec 08             	sub    $0x8,%esp
 225:	ff 75 0c             	pushl  0xc(%ebp)
 228:	50                   	push   %eax
 229:	e8 d3 00 00 00       	call   301 <fstat>
 22e:	89 c6                	mov    %eax,%esi
  close(fd);
 230:	89 1c 24             	mov    %ebx,(%esp)
 233:	e8 99 00 00 00       	call   2d1 <close>
  return r;
 238:	83 c4 10             	add    $0x10,%esp
}
 23b:	89 f0                	mov    %esi,%eax
 23d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 240:	5b                   	pop    %ebx
 241:	5e                   	pop    %esi
 242:	5d                   	pop    %ebp
 243:	c3                   	ret    
    return -1;
 244:	be ff ff ff ff       	mov    $0xffffffff,%esi
 249:	eb f0                	jmp    23b <stat+0x34>

0000024b <atoi>:

int
atoi(const char *s)
{
 24b:	55                   	push   %ebp
 24c:	89 e5                	mov    %esp,%ebp
 24e:	53                   	push   %ebx
 24f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 252:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 257:	eb 10                	jmp    269 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 259:	8d 1c 80             	lea    (%eax,%eax,4),%ebx
 25c:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
 25f:	83 c1 01             	add    $0x1,%ecx
 262:	0f be d2             	movsbl %dl,%edx
 265:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
  while('0' <= *s && *s <= '9')
 269:	0f b6 11             	movzbl (%ecx),%edx
 26c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 26f:	80 fb 09             	cmp    $0x9,%bl
 272:	76 e5                	jbe    259 <atoi+0xe>
  return n;
}
 274:	5b                   	pop    %ebx
 275:	5d                   	pop    %ebp
 276:	c3                   	ret    

00000277 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 277:	55                   	push   %ebp
 278:	89 e5                	mov    %esp,%ebp
 27a:	56                   	push   %esi
 27b:	53                   	push   %ebx
 27c:	8b 45 08             	mov    0x8(%ebp),%eax
 27f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 282:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
 285:	89 c1                	mov    %eax,%ecx
  src = vsrc;
  while(n-- > 0)
 287:	eb 0d                	jmp    296 <memmove+0x1f>
    *dst++ = *src++;
 289:	0f b6 13             	movzbl (%ebx),%edx
 28c:	88 11                	mov    %dl,(%ecx)
 28e:	8d 5b 01             	lea    0x1(%ebx),%ebx
 291:	8d 49 01             	lea    0x1(%ecx),%ecx
  while(n-- > 0)
 294:	89 f2                	mov    %esi,%edx
 296:	8d 72 ff             	lea    -0x1(%edx),%esi
 299:	85 d2                	test   %edx,%edx
 29b:	7f ec                	jg     289 <memmove+0x12>
  return vdst;
}
 29d:	5b                   	pop    %ebx
 29e:	5e                   	pop    %esi
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret    

000002a1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2a1:	b8 01 00 00 00       	mov    $0x1,%eax
 2a6:	cd 40                	int    $0x40
 2a8:	c3                   	ret    

000002a9 <exit>:
SYSCALL(exit)
 2a9:	b8 02 00 00 00       	mov    $0x2,%eax
 2ae:	cd 40                	int    $0x40
 2b0:	c3                   	ret    

000002b1 <wait>:
SYSCALL(wait)
 2b1:	b8 03 00 00 00       	mov    $0x3,%eax
 2b6:	cd 40                	int    $0x40
 2b8:	c3                   	ret    

000002b9 <pipe>:
SYSCALL(pipe)
 2b9:	b8 04 00 00 00       	mov    $0x4,%eax
 2be:	cd 40                	int    $0x40
 2c0:	c3                   	ret    

000002c1 <read>:
SYSCALL(read)
 2c1:	b8 05 00 00 00       	mov    $0x5,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    

000002c9 <write>:
SYSCALL(write)
 2c9:	b8 10 00 00 00       	mov    $0x10,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <close>:
SYSCALL(close)
 2d1:	b8 15 00 00 00       	mov    $0x15,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <kill>:
SYSCALL(kill)
 2d9:	b8 06 00 00 00       	mov    $0x6,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <exec>:
SYSCALL(exec)
 2e1:	b8 07 00 00 00       	mov    $0x7,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <open>:
SYSCALL(open)
 2e9:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <mknod>:
SYSCALL(mknod)
 2f1:	b8 11 00 00 00       	mov    $0x11,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <unlink>:
SYSCALL(unlink)
 2f9:	b8 12 00 00 00       	mov    $0x12,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <fstat>:
SYSCALL(fstat)
 301:	b8 08 00 00 00       	mov    $0x8,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <link>:
SYSCALL(link)
 309:	b8 13 00 00 00       	mov    $0x13,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <mkdir>:
SYSCALL(mkdir)
 311:	b8 14 00 00 00       	mov    $0x14,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <chdir>:
SYSCALL(chdir)
 319:	b8 09 00 00 00       	mov    $0x9,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <dup>:
SYSCALL(dup)
 321:	b8 0a 00 00 00       	mov    $0xa,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <dup2>:
SYSCALL(dup2)
 329:	b8 17 00 00 00       	mov    $0x17,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <getpid>:
SYSCALL(getpid)
 331:	b8 0b 00 00 00       	mov    $0xb,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <sbrk>:
SYSCALL(sbrk)
 339:	b8 0c 00 00 00       	mov    $0xc,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <sleep>:
SYSCALL(sleep)
 341:	b8 0d 00 00 00       	mov    $0xd,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <uptime>:
SYSCALL(uptime)
 349:	b8 0e 00 00 00       	mov    $0xe,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <date>:
SYSCALL(date)
 351:	b8 16 00 00 00       	mov    $0x16,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 359:	55                   	push   %ebp
 35a:	89 e5                	mov    %esp,%ebp
 35c:	83 ec 1c             	sub    $0x1c,%esp
 35f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 362:	6a 01                	push   $0x1
 364:	8d 55 f4             	lea    -0xc(%ebp),%edx
 367:	52                   	push   %edx
 368:	50                   	push   %eax
 369:	e8 5b ff ff ff       	call   2c9 <write>
}
 36e:	83 c4 10             	add    $0x10,%esp
 371:	c9                   	leave  
 372:	c3                   	ret    

00000373 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 373:	55                   	push   %ebp
 374:	89 e5                	mov    %esp,%ebp
 376:	57                   	push   %edi
 377:	56                   	push   %esi
 378:	53                   	push   %ebx
 379:	83 ec 2c             	sub    $0x2c,%esp
 37c:	89 c7                	mov    %eax,%edi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 37e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 382:	0f 95 c3             	setne  %bl
 385:	89 d0                	mov    %edx,%eax
 387:	c1 e8 1f             	shr    $0x1f,%eax
 38a:	84 c3                	test   %al,%bl
 38c:	74 10                	je     39e <printint+0x2b>
    neg = 1;
    x = -xx;
 38e:	f7 da                	neg    %edx
    neg = 1;
 390:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 397:	be 00 00 00 00       	mov    $0x0,%esi
 39c:	eb 0b                	jmp    3a9 <printint+0x36>
  neg = 0;
 39e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3a5:	eb f0                	jmp    397 <printint+0x24>
  do{
    buf[i++] = digits[x % base];
 3a7:	89 c6                	mov    %eax,%esi
 3a9:	89 d0                	mov    %edx,%eax
 3ab:	ba 00 00 00 00       	mov    $0x0,%edx
 3b0:	f7 f1                	div    %ecx
 3b2:	89 c3                	mov    %eax,%ebx
 3b4:	8d 46 01             	lea    0x1(%esi),%eax
 3b7:	0f b6 92 d8 06 00 00 	movzbl 0x6d8(%edx),%edx
 3be:	88 54 35 d8          	mov    %dl,-0x28(%ebp,%esi,1)
  }while((x /= base) != 0);
 3c2:	89 da                	mov    %ebx,%edx
 3c4:	85 db                	test   %ebx,%ebx
 3c6:	75 df                	jne    3a7 <printint+0x34>
 3c8:	89 c3                	mov    %eax,%ebx
  if(neg)
 3ca:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3ce:	74 16                	je     3e6 <printint+0x73>
    buf[i++] = '-';
 3d0:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
 3d5:	8d 5e 02             	lea    0x2(%esi),%ebx
 3d8:	eb 0c                	jmp    3e6 <printint+0x73>

  while(--i >= 0)
    putc(fd, buf[i]);
 3da:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3df:	89 f8                	mov    %edi,%eax
 3e1:	e8 73 ff ff ff       	call   359 <putc>
  while(--i >= 0)
 3e6:	83 eb 01             	sub    $0x1,%ebx
 3e9:	79 ef                	jns    3da <printint+0x67>
}
 3eb:	83 c4 2c             	add    $0x2c,%esp
 3ee:	5b                   	pop    %ebx
 3ef:	5e                   	pop    %esi
 3f0:	5f                   	pop    %edi
 3f1:	5d                   	pop    %ebp
 3f2:	c3                   	ret    

000003f3 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3f3:	55                   	push   %ebp
 3f4:	89 e5                	mov    %esp,%ebp
 3f6:	57                   	push   %edi
 3f7:	56                   	push   %esi
 3f8:	53                   	push   %ebx
 3f9:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3fc:	8d 45 10             	lea    0x10(%ebp),%eax
 3ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 402:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 407:	bb 00 00 00 00       	mov    $0x0,%ebx
 40c:	eb 14                	jmp    422 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 40e:	89 fa                	mov    %edi,%edx
 410:	8b 45 08             	mov    0x8(%ebp),%eax
 413:	e8 41 ff ff ff       	call   359 <putc>
 418:	eb 05                	jmp    41f <printf+0x2c>
      }
    } else if(state == '%'){
 41a:	83 fe 25             	cmp    $0x25,%esi
 41d:	74 25                	je     444 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 41f:	83 c3 01             	add    $0x1,%ebx
 422:	8b 45 0c             	mov    0xc(%ebp),%eax
 425:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 429:	84 c0                	test   %al,%al
 42b:	0f 84 23 01 00 00    	je     554 <printf+0x161>
    c = fmt[i] & 0xff;
 431:	0f be f8             	movsbl %al,%edi
 434:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 437:	85 f6                	test   %esi,%esi
 439:	75 df                	jne    41a <printf+0x27>
      if(c == '%'){
 43b:	83 f8 25             	cmp    $0x25,%eax
 43e:	75 ce                	jne    40e <printf+0x1b>
        state = '%';
 440:	89 c6                	mov    %eax,%esi
 442:	eb db                	jmp    41f <printf+0x2c>
      if(c == 'd'){
 444:	83 f8 64             	cmp    $0x64,%eax
 447:	74 49                	je     492 <printf+0x9f>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 449:	83 f8 78             	cmp    $0x78,%eax
 44c:	0f 94 c1             	sete   %cl
 44f:	83 f8 70             	cmp    $0x70,%eax
 452:	0f 94 c2             	sete   %dl
 455:	08 d1                	or     %dl,%cl
 457:	75 63                	jne    4bc <printf+0xc9>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 459:	83 f8 73             	cmp    $0x73,%eax
 45c:	0f 84 84 00 00 00    	je     4e6 <printf+0xf3>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 462:	83 f8 63             	cmp    $0x63,%eax
 465:	0f 84 b7 00 00 00    	je     522 <printf+0x12f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 46b:	83 f8 25             	cmp    $0x25,%eax
 46e:	0f 84 cc 00 00 00    	je     540 <printf+0x14d>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 474:	ba 25 00 00 00       	mov    $0x25,%edx
 479:	8b 45 08             	mov    0x8(%ebp),%eax
 47c:	e8 d8 fe ff ff       	call   359 <putc>
        putc(fd, c);
 481:	89 fa                	mov    %edi,%edx
 483:	8b 45 08             	mov    0x8(%ebp),%eax
 486:	e8 ce fe ff ff       	call   359 <putc>
      }
      state = 0;
 48b:	be 00 00 00 00       	mov    $0x0,%esi
 490:	eb 8d                	jmp    41f <printf+0x2c>
        printint(fd, *ap, 10, 1);
 492:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 495:	8b 17                	mov    (%edi),%edx
 497:	83 ec 0c             	sub    $0xc,%esp
 49a:	6a 01                	push   $0x1
 49c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4a1:	8b 45 08             	mov    0x8(%ebp),%eax
 4a4:	e8 ca fe ff ff       	call   373 <printint>
        ap++;
 4a9:	83 c7 04             	add    $0x4,%edi
 4ac:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4af:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4b2:	be 00 00 00 00       	mov    $0x0,%esi
 4b7:	e9 63 ff ff ff       	jmp    41f <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4bc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4bf:	8b 17                	mov    (%edi),%edx
 4c1:	83 ec 0c             	sub    $0xc,%esp
 4c4:	6a 00                	push   $0x0
 4c6:	b9 10 00 00 00       	mov    $0x10,%ecx
 4cb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ce:	e8 a0 fe ff ff       	call   373 <printint>
        ap++;
 4d3:	83 c7 04             	add    $0x4,%edi
 4d6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4dc:	be 00 00 00 00       	mov    $0x0,%esi
 4e1:	e9 39 ff ff ff       	jmp    41f <printf+0x2c>
        s = (char*)*ap;
 4e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4e9:	8b 30                	mov    (%eax),%esi
        ap++;
 4eb:	83 c0 04             	add    $0x4,%eax
 4ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4f1:	85 f6                	test   %esi,%esi
 4f3:	75 28                	jne    51d <printf+0x12a>
          s = "(null)";
 4f5:	be cf 06 00 00       	mov    $0x6cf,%esi
 4fa:	8b 7d 08             	mov    0x8(%ebp),%edi
 4fd:	eb 0d                	jmp    50c <printf+0x119>
          putc(fd, *s);
 4ff:	0f be d2             	movsbl %dl,%edx
 502:	89 f8                	mov    %edi,%eax
 504:	e8 50 fe ff ff       	call   359 <putc>
          s++;
 509:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 50c:	0f b6 16             	movzbl (%esi),%edx
 50f:	84 d2                	test   %dl,%dl
 511:	75 ec                	jne    4ff <printf+0x10c>
      state = 0;
 513:	be 00 00 00 00       	mov    $0x0,%esi
 518:	e9 02 ff ff ff       	jmp    41f <printf+0x2c>
 51d:	8b 7d 08             	mov    0x8(%ebp),%edi
 520:	eb ea                	jmp    50c <printf+0x119>
        putc(fd, *ap);
 522:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 525:	0f be 17             	movsbl (%edi),%edx
 528:	8b 45 08             	mov    0x8(%ebp),%eax
 52b:	e8 29 fe ff ff       	call   359 <putc>
        ap++;
 530:	83 c7 04             	add    $0x4,%edi
 533:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 536:	be 00 00 00 00       	mov    $0x0,%esi
 53b:	e9 df fe ff ff       	jmp    41f <printf+0x2c>
        putc(fd, c);
 540:	89 fa                	mov    %edi,%edx
 542:	8b 45 08             	mov    0x8(%ebp),%eax
 545:	e8 0f fe ff ff       	call   359 <putc>
      state = 0;
 54a:	be 00 00 00 00       	mov    $0x0,%esi
 54f:	e9 cb fe ff ff       	jmp    41f <printf+0x2c>
    }
  }
}
 554:	8d 65 f4             	lea    -0xc(%ebp),%esp
 557:	5b                   	pop    %ebx
 558:	5e                   	pop    %esi
 559:	5f                   	pop    %edi
 55a:	5d                   	pop    %ebp
 55b:	c3                   	ret    

0000055c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 55c:	55                   	push   %ebp
 55d:	89 e5                	mov    %esp,%ebp
 55f:	57                   	push   %edi
 560:	56                   	push   %esi
 561:	53                   	push   %ebx
 562:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 565:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 568:	a1 78 09 00 00       	mov    0x978,%eax
 56d:	eb 02                	jmp    571 <free+0x15>
 56f:	89 d0                	mov    %edx,%eax
 571:	39 c8                	cmp    %ecx,%eax
 573:	73 04                	jae    579 <free+0x1d>
 575:	39 08                	cmp    %ecx,(%eax)
 577:	77 12                	ja     58b <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 579:	8b 10                	mov    (%eax),%edx
 57b:	39 c2                	cmp    %eax,%edx
 57d:	77 f0                	ja     56f <free+0x13>
 57f:	39 c8                	cmp    %ecx,%eax
 581:	72 08                	jb     58b <free+0x2f>
 583:	39 ca                	cmp    %ecx,%edx
 585:	77 04                	ja     58b <free+0x2f>
 587:	89 d0                	mov    %edx,%eax
 589:	eb e6                	jmp    571 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 58b:	8b 73 fc             	mov    -0x4(%ebx),%esi
 58e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 591:	8b 10                	mov    (%eax),%edx
 593:	39 d7                	cmp    %edx,%edi
 595:	74 19                	je     5b0 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 597:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 59a:	8b 50 04             	mov    0x4(%eax),%edx
 59d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5a0:	39 ce                	cmp    %ecx,%esi
 5a2:	74 1b                	je     5bf <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5a4:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5a6:	a3 78 09 00 00       	mov    %eax,0x978
}
 5ab:	5b                   	pop    %ebx
 5ac:	5e                   	pop    %esi
 5ad:	5f                   	pop    %edi
 5ae:	5d                   	pop    %ebp
 5af:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5b0:	03 72 04             	add    0x4(%edx),%esi
 5b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5b6:	8b 10                	mov    (%eax),%edx
 5b8:	8b 12                	mov    (%edx),%edx
 5ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5bd:	eb db                	jmp    59a <free+0x3e>
    p->s.size += bp->s.size;
 5bf:	03 53 fc             	add    -0x4(%ebx),%edx
 5c2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5c5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5c8:	89 10                	mov    %edx,(%eax)
 5ca:	eb da                	jmp    5a6 <free+0x4a>

000005cc <morecore>:

static Header*
morecore(uint nu)
{
 5cc:	55                   	push   %ebp
 5cd:	89 e5                	mov    %esp,%ebp
 5cf:	53                   	push   %ebx
 5d0:	83 ec 04             	sub    $0x4,%esp
 5d3:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5d5:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5da:	77 05                	ja     5e1 <morecore+0x15>
    nu = 4096;
 5dc:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5e1:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5e8:	83 ec 0c             	sub    $0xc,%esp
 5eb:	50                   	push   %eax
 5ec:	e8 48 fd ff ff       	call   339 <sbrk>
  if(p == (char*)-1)
 5f1:	83 c4 10             	add    $0x10,%esp
 5f4:	83 f8 ff             	cmp    $0xffffffff,%eax
 5f7:	74 1c                	je     615 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5f9:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5fc:	83 c0 08             	add    $0x8,%eax
 5ff:	83 ec 0c             	sub    $0xc,%esp
 602:	50                   	push   %eax
 603:	e8 54 ff ff ff       	call   55c <free>
  return freep;
 608:	a1 78 09 00 00       	mov    0x978,%eax
 60d:	83 c4 10             	add    $0x10,%esp
}
 610:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 613:	c9                   	leave  
 614:	c3                   	ret    
    return 0;
 615:	b8 00 00 00 00       	mov    $0x0,%eax
 61a:	eb f4                	jmp    610 <morecore+0x44>

0000061c <malloc>:

void*
malloc(uint nbytes)
{
 61c:	55                   	push   %ebp
 61d:	89 e5                	mov    %esp,%ebp
 61f:	53                   	push   %ebx
 620:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 623:	8b 45 08             	mov    0x8(%ebp),%eax
 626:	8d 58 07             	lea    0x7(%eax),%ebx
 629:	c1 eb 03             	shr    $0x3,%ebx
 62c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 62f:	8b 0d 78 09 00 00    	mov    0x978,%ecx
 635:	85 c9                	test   %ecx,%ecx
 637:	74 04                	je     63d <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 639:	8b 01                	mov    (%ecx),%eax
 63b:	eb 4d                	jmp    68a <malloc+0x6e>
    base.s.ptr = freep = prevp = &base;
 63d:	c7 05 78 09 00 00 7c 	movl   $0x97c,0x978
 644:	09 00 00 
 647:	c7 05 7c 09 00 00 7c 	movl   $0x97c,0x97c
 64e:	09 00 00 
    base.s.size = 0;
 651:	c7 05 80 09 00 00 00 	movl   $0x0,0x980
 658:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 65b:	b9 7c 09 00 00       	mov    $0x97c,%ecx
 660:	eb d7                	jmp    639 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 662:	39 da                	cmp    %ebx,%edx
 664:	74 1a                	je     680 <malloc+0x64>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 666:	29 da                	sub    %ebx,%edx
 668:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 66b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 66e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 671:	89 0d 78 09 00 00    	mov    %ecx,0x978
      return (void*)(p + 1);
 677:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 67a:	83 c4 04             	add    $0x4,%esp
 67d:	5b                   	pop    %ebx
 67e:	5d                   	pop    %ebp
 67f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 680:	8b 10                	mov    (%eax),%edx
 682:	89 11                	mov    %edx,(%ecx)
 684:	eb eb                	jmp    671 <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 686:	89 c1                	mov    %eax,%ecx
 688:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 68a:	8b 50 04             	mov    0x4(%eax),%edx
 68d:	39 da                	cmp    %ebx,%edx
 68f:	73 d1                	jae    662 <malloc+0x46>
    if(p == freep)
 691:	39 05 78 09 00 00    	cmp    %eax,0x978
 697:	75 ed                	jne    686 <malloc+0x6a>
      if((p = morecore(nunits)) == 0)
 699:	89 d8                	mov    %ebx,%eax
 69b:	e8 2c ff ff ff       	call   5cc <morecore>
 6a0:	85 c0                	test   %eax,%eax
 6a2:	75 e2                	jne    686 <malloc+0x6a>
        return 0;
 6a4:	b8 00 00 00 00       	mov    $0x0,%eax
 6a9:	eb cf                	jmp    67a <malloc+0x5e>
