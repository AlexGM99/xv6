
_dup2test:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00000000 <main>:
#include "user.h"
#include "fcntl.h"

int
main(int argc, char* argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int fd;

  // Ejemplo de dup2 con un fd incorrecto
  if (dup2(-1,8) >= 0)
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 08                	push   $0x8
  14:	6a ff                	push   $0xffffffff
  16:	e8 e8 03 00 00       	call   403 <dup2>
  1b:	83 c4 10             	add    $0x10,%esp
  1e:	85 c0                	test   %eax,%eax
  20:	0f 89 18 01 00 00    	jns    13e <main+0x13e>
    printf(1, "dup2 no funciona con fd incorrecto.\n");

  // Ejemplo de dup2 con un newfd incorrecto
  if (dup2(1,-1) >= 0)
  26:	83 ec 08             	sub    $0x8,%esp
  29:	6a ff                	push   $0xffffffff
  2b:	6a 01                	push   $0x1
  2d:	e8 d1 03 00 00       	call   403 <dup2>
  32:	83 c4 10             	add    $0x10,%esp
  35:	85 c0                	test   %eax,%eax
  37:	0f 89 18 01 00 00    	jns    155 <main+0x155>
    printf(1, "dup2 no funciona con fd incorrecto (2).\n");

  // Ejemplo de dup2 con un fd no mapeado
  if (dup2(6,8) >= 0)
  3d:	83 ec 08             	sub    $0x8,%esp
  40:	6a 08                	push   $0x8
  42:	6a 06                	push   $0x6
  44:	e8 ba 03 00 00       	call   403 <dup2>
  49:	83 c4 10             	add    $0x10,%esp
  4c:	85 c0                	test   %eax,%eax
  4e:	0f 89 18 01 00 00    	jns    16c <main+0x16c>
    printf(1, "dup2 no funciona con fd inexistente.\n");

  if (dup2(1,20) >= 0)
  54:	83 ec 08             	sub    $0x8,%esp
  57:	6a 14                	push   $0x14
  59:	6a 01                	push   $0x1
  5b:	e8 a3 03 00 00       	call   403 <dup2>
  60:	83 c4 10             	add    $0x10,%esp
  63:	85 c0                	test   %eax,%eax
  65:	0f 89 18 01 00 00    	jns    183 <main+0x183>
    printf(1, "dup2 no funciona con fd superior a NOFILE.\n");

  // Ejemplo de dup2 con fd existente
  if (dup2(1,4) != 4)
  6b:	83 ec 08             	sub    $0x8,%esp
  6e:	6a 04                	push   $0x4
  70:	6a 01                	push   $0x1
  72:	e8 8c 03 00 00       	call   403 <dup2>
  77:	83 c4 10             	add    $0x10,%esp
  7a:	83 f8 04             	cmp    $0x4,%eax
  7d:	0f 85 17 01 00 00    	jne    19a <main+0x19a>
    printf(1, "dup2 no funciona con fd existente.\n");

  printf(4, "Este mensaje debe salir por terminal.\n");
  83:	83 ec 08             	sub    $0x8,%esp
  86:	68 54 08 00 00       	push   $0x854
  8b:	6a 04                	push   $0x4
  8d:	e8 3b 04 00 00       	call   4cd <printf>

  fd = open ("fichero_salida.txt", O_CREATE|O_RDWR);
  92:	83 c4 08             	add    $0x8,%esp
  95:	68 02 02 00 00       	push   $0x202
  9a:	68 f4 08 00 00       	push   $0x8f4
  9f:	e8 1f 03 00 00       	call   3c3 <open>
  a4:	89 c3                	mov    %eax,%ebx
  printf(fd, "Salida a fichero\n");
  a6:	83 c4 08             	add    $0x8,%esp
  a9:	68 07 09 00 00       	push   $0x907
  ae:	50                   	push   %eax
  af:	e8 19 04 00 00       	call   4cd <printf>

  if (dup2(fd, 9) != 9)
  b4:	83 c4 08             	add    $0x8,%esp
  b7:	6a 09                	push   $0x9
  b9:	53                   	push   %ebx
  ba:	e8 44 03 00 00       	call   403 <dup2>
  bf:	83 c4 10             	add    $0x10,%esp
  c2:	83 f8 09             	cmp    $0x9,%eax
  c5:	0f 85 e6 00 00 00    	jne    1b1 <main+0x1b1>
    printf(1, "dup2 no funciona con fd existente (2).\n");

  printf(9, "Salida también a fichero.\n");
  cb:	83 ec 08             	sub    $0x8,%esp
  ce:	68 19 09 00 00       	push   $0x919
  d3:	6a 09                	push   $0x9
  d5:	e8 f3 03 00 00       	call   4cd <printf>

  if (dup2(9, 9) != 9)
  da:	83 c4 08             	add    $0x8,%esp
  dd:	6a 09                	push   $0x9
  df:	6a 09                	push   $0x9
  e1:	e8 1d 03 00 00       	call   403 <dup2>
  e6:	83 c4 10             	add    $0x10,%esp
  e9:	83 f8 09             	cmp    $0x9,%eax
  ec:	0f 85 d6 00 00 00    	jne    1c8 <main+0x1c8>
    printf(1, "dup2 no funciona con newfd=oldfd (3).\n");

  printf(9, "Salida también a fichero.\n");
  f2:	83 ec 08             	sub    $0x8,%esp
  f5:	68 19 09 00 00       	push   $0x919
  fa:	6a 09                	push   $0x9
  fc:	e8 cc 03 00 00       	call   4cd <printf>

  close(9);
 101:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
 108:	e8 9e 02 00 00       	call   3ab <close>

  if (dup2(1, fd) != fd)
 10d:	83 c4 08             	add    $0x8,%esp
 110:	53                   	push   %ebx
 111:	6a 01                	push   $0x1
 113:	e8 eb 02 00 00       	call   403 <dup2>
 118:	83 c4 10             	add    $0x10,%esp
 11b:	39 d8                	cmp    %ebx,%eax
 11d:	0f 85 bc 00 00 00    	jne    1df <main+0x1df>
    printf(1, "dup2 no funciona con fd existente (4).\n");

  printf(fd, "Este mensaje debe salir por terminal.\n");
 123:	83 ec 08             	sub    $0x8,%esp
 126:	68 54 08 00 00       	push   $0x854
 12b:	53                   	push   %ebx
 12c:	e8 9c 03 00 00       	call   4cd <printf>
  close(fd);
 131:	89 1c 24             	mov    %ebx,(%esp)
 134:	e8 72 02 00 00       	call   3ab <close>

  exit();
 139:	e8 45 02 00 00       	call   383 <exit>
    printf(1, "dup2 no funciona con fd incorrecto.\n");
 13e:	83 ec 08             	sub    $0x8,%esp
 141:	68 88 07 00 00       	push   $0x788
 146:	6a 01                	push   $0x1
 148:	e8 80 03 00 00       	call   4cd <printf>
 14d:	83 c4 10             	add    $0x10,%esp
 150:	e9 d1 fe ff ff       	jmp    26 <main+0x26>
    printf(1, "dup2 no funciona con fd incorrecto (2).\n");
 155:	83 ec 08             	sub    $0x8,%esp
 158:	68 b0 07 00 00       	push   $0x7b0
 15d:	6a 01                	push   $0x1
 15f:	e8 69 03 00 00       	call   4cd <printf>
 164:	83 c4 10             	add    $0x10,%esp
 167:	e9 d1 fe ff ff       	jmp    3d <main+0x3d>
    printf(1, "dup2 no funciona con fd inexistente.\n");
 16c:	83 ec 08             	sub    $0x8,%esp
 16f:	68 dc 07 00 00       	push   $0x7dc
 174:	6a 01                	push   $0x1
 176:	e8 52 03 00 00       	call   4cd <printf>
 17b:	83 c4 10             	add    $0x10,%esp
 17e:	e9 d1 fe ff ff       	jmp    54 <main+0x54>
    printf(1, "dup2 no funciona con fd superior a NOFILE.\n");
 183:	83 ec 08             	sub    $0x8,%esp
 186:	68 04 08 00 00       	push   $0x804
 18b:	6a 01                	push   $0x1
 18d:	e8 3b 03 00 00       	call   4cd <printf>
 192:	83 c4 10             	add    $0x10,%esp
 195:	e9 d1 fe ff ff       	jmp    6b <main+0x6b>
    printf(1, "dup2 no funciona con fd existente.\n");
 19a:	83 ec 08             	sub    $0x8,%esp
 19d:	68 30 08 00 00       	push   $0x830
 1a2:	6a 01                	push   $0x1
 1a4:	e8 24 03 00 00       	call   4cd <printf>
 1a9:	83 c4 10             	add    $0x10,%esp
 1ac:	e9 d2 fe ff ff       	jmp    83 <main+0x83>
    printf(1, "dup2 no funciona con fd existente (2).\n");
 1b1:	83 ec 08             	sub    $0x8,%esp
 1b4:	68 7c 08 00 00       	push   $0x87c
 1b9:	6a 01                	push   $0x1
 1bb:	e8 0d 03 00 00       	call   4cd <printf>
 1c0:	83 c4 10             	add    $0x10,%esp
 1c3:	e9 03 ff ff ff       	jmp    cb <main+0xcb>
    printf(1, "dup2 no funciona con newfd=oldfd (3).\n");
 1c8:	83 ec 08             	sub    $0x8,%esp
 1cb:	68 a4 08 00 00       	push   $0x8a4
 1d0:	6a 01                	push   $0x1
 1d2:	e8 f6 02 00 00       	call   4cd <printf>
 1d7:	83 c4 10             	add    $0x10,%esp
 1da:	e9 13 ff ff ff       	jmp    f2 <main+0xf2>
    printf(1, "dup2 no funciona con fd existente (4).\n");
 1df:	83 ec 08             	sub    $0x8,%esp
 1e2:	68 cc 08 00 00       	push   $0x8cc
 1e7:	6a 01                	push   $0x1
 1e9:	e8 df 02 00 00       	call   4cd <printf>
 1ee:	83 c4 10             	add    $0x10,%esp
 1f1:	e9 2d ff ff ff       	jmp    123 <main+0x123>

000001f6 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1f6:	55                   	push   %ebp
 1f7:	89 e5                	mov    %esp,%ebp
 1f9:	53                   	push   %ebx
 1fa:	8b 45 08             	mov    0x8(%ebp),%eax
 1fd:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 200:	89 c2                	mov    %eax,%edx
 202:	0f b6 19             	movzbl (%ecx),%ebx
 205:	88 1a                	mov    %bl,(%edx)
 207:	8d 52 01             	lea    0x1(%edx),%edx
 20a:	8d 49 01             	lea    0x1(%ecx),%ecx
 20d:	84 db                	test   %bl,%bl
 20f:	75 f1                	jne    202 <strcpy+0xc>
    ;
  return os;
}
 211:	5b                   	pop    %ebx
 212:	5d                   	pop    %ebp
 213:	c3                   	ret    

00000214 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	8b 4d 08             	mov    0x8(%ebp),%ecx
 21a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 21d:	eb 06                	jmp    225 <strcmp+0x11>
    p++, q++;
 21f:	83 c1 01             	add    $0x1,%ecx
 222:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 225:	0f b6 01             	movzbl (%ecx),%eax
 228:	84 c0                	test   %al,%al
 22a:	74 04                	je     230 <strcmp+0x1c>
 22c:	3a 02                	cmp    (%edx),%al
 22e:	74 ef                	je     21f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 230:	0f b6 c0             	movzbl %al,%eax
 233:	0f b6 12             	movzbl (%edx),%edx
 236:	29 d0                	sub    %edx,%eax
}
 238:	5d                   	pop    %ebp
 239:	c3                   	ret    

0000023a <strlen>:

uint
strlen(const char *s)
{
 23a:	55                   	push   %ebp
 23b:	89 e5                	mov    %esp,%ebp
 23d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 240:	ba 00 00 00 00       	mov    $0x0,%edx
 245:	eb 03                	jmp    24a <strlen+0x10>
 247:	83 c2 01             	add    $0x1,%edx
 24a:	89 d0                	mov    %edx,%eax
 24c:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 250:	75 f5                	jne    247 <strlen+0xd>
    ;
  return n;
}
 252:	5d                   	pop    %ebp
 253:	c3                   	ret    

00000254 <memset>:

void*
memset(void *dst, int c, uint n)
{
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	57                   	push   %edi
 258:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 25b:	89 d7                	mov    %edx,%edi
 25d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 260:	8b 45 0c             	mov    0xc(%ebp),%eax
 263:	fc                   	cld    
 264:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 266:	89 d0                	mov    %edx,%eax
 268:	5f                   	pop    %edi
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret    

0000026b <strchr>:

char*
strchr(const char *s, char c)
{
 26b:	55                   	push   %ebp
 26c:	89 e5                	mov    %esp,%ebp
 26e:	8b 45 08             	mov    0x8(%ebp),%eax
 271:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 275:	0f b6 10             	movzbl (%eax),%edx
 278:	84 d2                	test   %dl,%dl
 27a:	74 09                	je     285 <strchr+0x1a>
    if(*s == c)
 27c:	38 ca                	cmp    %cl,%dl
 27e:	74 0a                	je     28a <strchr+0x1f>
  for(; *s; s++)
 280:	83 c0 01             	add    $0x1,%eax
 283:	eb f0                	jmp    275 <strchr+0xa>
      return (char*)s;
  return 0;
 285:	b8 00 00 00 00       	mov    $0x0,%eax
}
 28a:	5d                   	pop    %ebp
 28b:	c3                   	ret    

0000028c <gets>:

char*
gets(char *buf, int max)
{
 28c:	55                   	push   %ebp
 28d:	89 e5                	mov    %esp,%ebp
 28f:	57                   	push   %edi
 290:	56                   	push   %esi
 291:	53                   	push   %ebx
 292:	83 ec 1c             	sub    $0x1c,%esp
 295:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 298:	bb 00 00 00 00       	mov    $0x0,%ebx
 29d:	8d 73 01             	lea    0x1(%ebx),%esi
 2a0:	3b 75 0c             	cmp    0xc(%ebp),%esi
 2a3:	7d 2e                	jge    2d3 <gets+0x47>
    cc = read(0, &c, 1);
 2a5:	83 ec 04             	sub    $0x4,%esp
 2a8:	6a 01                	push   $0x1
 2aa:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2ad:	50                   	push   %eax
 2ae:	6a 00                	push   $0x0
 2b0:	e8 e6 00 00 00       	call   39b <read>
    if(cc < 1)
 2b5:	83 c4 10             	add    $0x10,%esp
 2b8:	85 c0                	test   %eax,%eax
 2ba:	7e 17                	jle    2d3 <gets+0x47>
      break;
    buf[i++] = c;
 2bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2c0:	88 04 1f             	mov    %al,(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 2c3:	3c 0a                	cmp    $0xa,%al
 2c5:	0f 94 c2             	sete   %dl
 2c8:	3c 0d                	cmp    $0xd,%al
 2ca:	0f 94 c0             	sete   %al
    buf[i++] = c;
 2cd:	89 f3                	mov    %esi,%ebx
    if(c == '\n' || c == '\r')
 2cf:	08 c2                	or     %al,%dl
 2d1:	74 ca                	je     29d <gets+0x11>
      break;
  }
  buf[i] = '\0';
 2d3:	c6 04 1f 00          	movb   $0x0,(%edi,%ebx,1)
  return buf;
}
 2d7:	89 f8                	mov    %edi,%eax
 2d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2dc:	5b                   	pop    %ebx
 2dd:	5e                   	pop    %esi
 2de:	5f                   	pop    %edi
 2df:	5d                   	pop    %ebp
 2e0:	c3                   	ret    

000002e1 <stat>:

int
stat(const char *n, struct stat *st)
{
 2e1:	55                   	push   %ebp
 2e2:	89 e5                	mov    %esp,%ebp
 2e4:	56                   	push   %esi
 2e5:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e6:	83 ec 08             	sub    $0x8,%esp
 2e9:	6a 00                	push   $0x0
 2eb:	ff 75 08             	pushl  0x8(%ebp)
 2ee:	e8 d0 00 00 00       	call   3c3 <open>
  if(fd < 0)
 2f3:	83 c4 10             	add    $0x10,%esp
 2f6:	85 c0                	test   %eax,%eax
 2f8:	78 24                	js     31e <stat+0x3d>
 2fa:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2fc:	83 ec 08             	sub    $0x8,%esp
 2ff:	ff 75 0c             	pushl  0xc(%ebp)
 302:	50                   	push   %eax
 303:	e8 d3 00 00 00       	call   3db <fstat>
 308:	89 c6                	mov    %eax,%esi
  close(fd);
 30a:	89 1c 24             	mov    %ebx,(%esp)
 30d:	e8 99 00 00 00       	call   3ab <close>
  return r;
 312:	83 c4 10             	add    $0x10,%esp
}
 315:	89 f0                	mov    %esi,%eax
 317:	8d 65 f8             	lea    -0x8(%ebp),%esp
 31a:	5b                   	pop    %ebx
 31b:	5e                   	pop    %esi
 31c:	5d                   	pop    %ebp
 31d:	c3                   	ret    
    return -1;
 31e:	be ff ff ff ff       	mov    $0xffffffff,%esi
 323:	eb f0                	jmp    315 <stat+0x34>

00000325 <atoi>:

int
atoi(const char *s)
{
 325:	55                   	push   %ebp
 326:	89 e5                	mov    %esp,%ebp
 328:	53                   	push   %ebx
 329:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 32c:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 331:	eb 10                	jmp    343 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 333:	8d 1c 80             	lea    (%eax,%eax,4),%ebx
 336:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
 339:	83 c1 01             	add    $0x1,%ecx
 33c:	0f be d2             	movsbl %dl,%edx
 33f:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
  while('0' <= *s && *s <= '9')
 343:	0f b6 11             	movzbl (%ecx),%edx
 346:	8d 5a d0             	lea    -0x30(%edx),%ebx
 349:	80 fb 09             	cmp    $0x9,%bl
 34c:	76 e5                	jbe    333 <atoi+0xe>
  return n;
}
 34e:	5b                   	pop    %ebx
 34f:	5d                   	pop    %ebp
 350:	c3                   	ret    

00000351 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 351:	55                   	push   %ebp
 352:	89 e5                	mov    %esp,%ebp
 354:	56                   	push   %esi
 355:	53                   	push   %ebx
 356:	8b 45 08             	mov    0x8(%ebp),%eax
 359:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 35c:	8b 55 10             	mov    0x10(%ebp),%edx
  char *dst;
  const char *src;

  dst = vdst;
 35f:	89 c1                	mov    %eax,%ecx
  src = vsrc;
  while(n-- > 0)
 361:	eb 0d                	jmp    370 <memmove+0x1f>
    *dst++ = *src++;
 363:	0f b6 13             	movzbl (%ebx),%edx
 366:	88 11                	mov    %dl,(%ecx)
 368:	8d 5b 01             	lea    0x1(%ebx),%ebx
 36b:	8d 49 01             	lea    0x1(%ecx),%ecx
  while(n-- > 0)
 36e:	89 f2                	mov    %esi,%edx
 370:	8d 72 ff             	lea    -0x1(%edx),%esi
 373:	85 d2                	test   %edx,%edx
 375:	7f ec                	jg     363 <memmove+0x12>
  return vdst;
}
 377:	5b                   	pop    %ebx
 378:	5e                   	pop    %esi
 379:	5d                   	pop    %ebp
 37a:	c3                   	ret    

0000037b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 37b:	b8 01 00 00 00       	mov    $0x1,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <exit>:
SYSCALL(exit)
 383:	b8 02 00 00 00       	mov    $0x2,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <wait>:
SYSCALL(wait)
 38b:	b8 03 00 00 00       	mov    $0x3,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <pipe>:
SYSCALL(pipe)
 393:	b8 04 00 00 00       	mov    $0x4,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <read>:
SYSCALL(read)
 39b:	b8 05 00 00 00       	mov    $0x5,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <write>:
SYSCALL(write)
 3a3:	b8 10 00 00 00       	mov    $0x10,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <close>:
SYSCALL(close)
 3ab:	b8 15 00 00 00       	mov    $0x15,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <kill>:
SYSCALL(kill)
 3b3:	b8 06 00 00 00       	mov    $0x6,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <exec>:
SYSCALL(exec)
 3bb:	b8 07 00 00 00       	mov    $0x7,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <open>:
SYSCALL(open)
 3c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <mknod>:
SYSCALL(mknod)
 3cb:	b8 11 00 00 00       	mov    $0x11,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <unlink>:
SYSCALL(unlink)
 3d3:	b8 12 00 00 00       	mov    $0x12,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <fstat>:
SYSCALL(fstat)
 3db:	b8 08 00 00 00       	mov    $0x8,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <link>:
SYSCALL(link)
 3e3:	b8 13 00 00 00       	mov    $0x13,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <mkdir>:
SYSCALL(mkdir)
 3eb:	b8 14 00 00 00       	mov    $0x14,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <chdir>:
SYSCALL(chdir)
 3f3:	b8 09 00 00 00       	mov    $0x9,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <dup>:
SYSCALL(dup)
 3fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <dup2>:
SYSCALL(dup2)
 403:	b8 17 00 00 00       	mov    $0x17,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <getpid>:
SYSCALL(getpid)
 40b:	b8 0b 00 00 00       	mov    $0xb,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <sbrk>:
SYSCALL(sbrk)
 413:	b8 0c 00 00 00       	mov    $0xc,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <sleep>:
SYSCALL(sleep)
 41b:	b8 0d 00 00 00       	mov    $0xd,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <uptime>:
SYSCALL(uptime)
 423:	b8 0e 00 00 00       	mov    $0xe,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <date>:
SYSCALL(date)
 42b:	b8 16 00 00 00       	mov    $0x16,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 433:	55                   	push   %ebp
 434:	89 e5                	mov    %esp,%ebp
 436:	83 ec 1c             	sub    $0x1c,%esp
 439:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 43c:	6a 01                	push   $0x1
 43e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 441:	52                   	push   %edx
 442:	50                   	push   %eax
 443:	e8 5b ff ff ff       	call   3a3 <write>
}
 448:	83 c4 10             	add    $0x10,%esp
 44b:	c9                   	leave  
 44c:	c3                   	ret    

0000044d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 44d:	55                   	push   %ebp
 44e:	89 e5                	mov    %esp,%ebp
 450:	57                   	push   %edi
 451:	56                   	push   %esi
 452:	53                   	push   %ebx
 453:	83 ec 2c             	sub    $0x2c,%esp
 456:	89 c7                	mov    %eax,%edi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 458:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 45c:	0f 95 c3             	setne  %bl
 45f:	89 d0                	mov    %edx,%eax
 461:	c1 e8 1f             	shr    $0x1f,%eax
 464:	84 c3                	test   %al,%bl
 466:	74 10                	je     478 <printint+0x2b>
    neg = 1;
    x = -xx;
 468:	f7 da                	neg    %edx
    neg = 1;
 46a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 471:	be 00 00 00 00       	mov    $0x0,%esi
 476:	eb 0b                	jmp    483 <printint+0x36>
  neg = 0;
 478:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 47f:	eb f0                	jmp    471 <printint+0x24>
  do{
    buf[i++] = digits[x % base];
 481:	89 c6                	mov    %eax,%esi
 483:	89 d0                	mov    %edx,%eax
 485:	ba 00 00 00 00       	mov    $0x0,%edx
 48a:	f7 f1                	div    %ecx
 48c:	89 c3                	mov    %eax,%ebx
 48e:	8d 46 01             	lea    0x1(%esi),%eax
 491:	0f b6 92 3c 09 00 00 	movzbl 0x93c(%edx),%edx
 498:	88 54 35 d8          	mov    %dl,-0x28(%ebp,%esi,1)
  }while((x /= base) != 0);
 49c:	89 da                	mov    %ebx,%edx
 49e:	85 db                	test   %ebx,%ebx
 4a0:	75 df                	jne    481 <printint+0x34>
 4a2:	89 c3                	mov    %eax,%ebx
  if(neg)
 4a4:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4a8:	74 16                	je     4c0 <printint+0x73>
    buf[i++] = '-';
 4aa:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
 4af:	8d 5e 02             	lea    0x2(%esi),%ebx
 4b2:	eb 0c                	jmp    4c0 <printint+0x73>

  while(--i >= 0)
    putc(fd, buf[i]);
 4b4:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4b9:	89 f8                	mov    %edi,%eax
 4bb:	e8 73 ff ff ff       	call   433 <putc>
  while(--i >= 0)
 4c0:	83 eb 01             	sub    $0x1,%ebx
 4c3:	79 ef                	jns    4b4 <printint+0x67>
}
 4c5:	83 c4 2c             	add    $0x2c,%esp
 4c8:	5b                   	pop    %ebx
 4c9:	5e                   	pop    %esi
 4ca:	5f                   	pop    %edi
 4cb:	5d                   	pop    %ebp
 4cc:	c3                   	ret    

000004cd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4cd:	55                   	push   %ebp
 4ce:	89 e5                	mov    %esp,%ebp
 4d0:	57                   	push   %edi
 4d1:	56                   	push   %esi
 4d2:	53                   	push   %ebx
 4d3:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4d6:	8d 45 10             	lea    0x10(%ebp),%eax
 4d9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4dc:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4e1:	bb 00 00 00 00       	mov    $0x0,%ebx
 4e6:	eb 14                	jmp    4fc <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4e8:	89 fa                	mov    %edi,%edx
 4ea:	8b 45 08             	mov    0x8(%ebp),%eax
 4ed:	e8 41 ff ff ff       	call   433 <putc>
 4f2:	eb 05                	jmp    4f9 <printf+0x2c>
      }
    } else if(state == '%'){
 4f4:	83 fe 25             	cmp    $0x25,%esi
 4f7:	74 25                	je     51e <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4f9:	83 c3 01             	add    $0x1,%ebx
 4fc:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ff:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 503:	84 c0                	test   %al,%al
 505:	0f 84 23 01 00 00    	je     62e <printf+0x161>
    c = fmt[i] & 0xff;
 50b:	0f be f8             	movsbl %al,%edi
 50e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 511:	85 f6                	test   %esi,%esi
 513:	75 df                	jne    4f4 <printf+0x27>
      if(c == '%'){
 515:	83 f8 25             	cmp    $0x25,%eax
 518:	75 ce                	jne    4e8 <printf+0x1b>
        state = '%';
 51a:	89 c6                	mov    %eax,%esi
 51c:	eb db                	jmp    4f9 <printf+0x2c>
      if(c == 'd'){
 51e:	83 f8 64             	cmp    $0x64,%eax
 521:	74 49                	je     56c <printf+0x9f>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 523:	83 f8 78             	cmp    $0x78,%eax
 526:	0f 94 c1             	sete   %cl
 529:	83 f8 70             	cmp    $0x70,%eax
 52c:	0f 94 c2             	sete   %dl
 52f:	08 d1                	or     %dl,%cl
 531:	75 63                	jne    596 <printf+0xc9>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 533:	83 f8 73             	cmp    $0x73,%eax
 536:	0f 84 84 00 00 00    	je     5c0 <printf+0xf3>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 53c:	83 f8 63             	cmp    $0x63,%eax
 53f:	0f 84 b7 00 00 00    	je     5fc <printf+0x12f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 545:	83 f8 25             	cmp    $0x25,%eax
 548:	0f 84 cc 00 00 00    	je     61a <printf+0x14d>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 54e:	ba 25 00 00 00       	mov    $0x25,%edx
 553:	8b 45 08             	mov    0x8(%ebp),%eax
 556:	e8 d8 fe ff ff       	call   433 <putc>
        putc(fd, c);
 55b:	89 fa                	mov    %edi,%edx
 55d:	8b 45 08             	mov    0x8(%ebp),%eax
 560:	e8 ce fe ff ff       	call   433 <putc>
      }
      state = 0;
 565:	be 00 00 00 00       	mov    $0x0,%esi
 56a:	eb 8d                	jmp    4f9 <printf+0x2c>
        printint(fd, *ap, 10, 1);
 56c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 56f:	8b 17                	mov    (%edi),%edx
 571:	83 ec 0c             	sub    $0xc,%esp
 574:	6a 01                	push   $0x1
 576:	b9 0a 00 00 00       	mov    $0xa,%ecx
 57b:	8b 45 08             	mov    0x8(%ebp),%eax
 57e:	e8 ca fe ff ff       	call   44d <printint>
        ap++;
 583:	83 c7 04             	add    $0x4,%edi
 586:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 589:	83 c4 10             	add    $0x10,%esp
      state = 0;
 58c:	be 00 00 00 00       	mov    $0x0,%esi
 591:	e9 63 ff ff ff       	jmp    4f9 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 596:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 599:	8b 17                	mov    (%edi),%edx
 59b:	83 ec 0c             	sub    $0xc,%esp
 59e:	6a 00                	push   $0x0
 5a0:	b9 10 00 00 00       	mov    $0x10,%ecx
 5a5:	8b 45 08             	mov    0x8(%ebp),%eax
 5a8:	e8 a0 fe ff ff       	call   44d <printint>
        ap++;
 5ad:	83 c7 04             	add    $0x4,%edi
 5b0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5b3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5b6:	be 00 00 00 00       	mov    $0x0,%esi
 5bb:	e9 39 ff ff ff       	jmp    4f9 <printf+0x2c>
        s = (char*)*ap;
 5c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c3:	8b 30                	mov    (%eax),%esi
        ap++;
 5c5:	83 c0 04             	add    $0x4,%eax
 5c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5cb:	85 f6                	test   %esi,%esi
 5cd:	75 28                	jne    5f7 <printf+0x12a>
          s = "(null)";
 5cf:	be 35 09 00 00       	mov    $0x935,%esi
 5d4:	8b 7d 08             	mov    0x8(%ebp),%edi
 5d7:	eb 0d                	jmp    5e6 <printf+0x119>
          putc(fd, *s);
 5d9:	0f be d2             	movsbl %dl,%edx
 5dc:	89 f8                	mov    %edi,%eax
 5de:	e8 50 fe ff ff       	call   433 <putc>
          s++;
 5e3:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5e6:	0f b6 16             	movzbl (%esi),%edx
 5e9:	84 d2                	test   %dl,%dl
 5eb:	75 ec                	jne    5d9 <printf+0x10c>
      state = 0;
 5ed:	be 00 00 00 00       	mov    $0x0,%esi
 5f2:	e9 02 ff ff ff       	jmp    4f9 <printf+0x2c>
 5f7:	8b 7d 08             	mov    0x8(%ebp),%edi
 5fa:	eb ea                	jmp    5e6 <printf+0x119>
        putc(fd, *ap);
 5fc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5ff:	0f be 17             	movsbl (%edi),%edx
 602:	8b 45 08             	mov    0x8(%ebp),%eax
 605:	e8 29 fe ff ff       	call   433 <putc>
        ap++;
 60a:	83 c7 04             	add    $0x4,%edi
 60d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 610:	be 00 00 00 00       	mov    $0x0,%esi
 615:	e9 df fe ff ff       	jmp    4f9 <printf+0x2c>
        putc(fd, c);
 61a:	89 fa                	mov    %edi,%edx
 61c:	8b 45 08             	mov    0x8(%ebp),%eax
 61f:	e8 0f fe ff ff       	call   433 <putc>
      state = 0;
 624:	be 00 00 00 00       	mov    $0x0,%esi
 629:	e9 cb fe ff ff       	jmp    4f9 <printf+0x2c>
    }
  }
}
 62e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 631:	5b                   	pop    %ebx
 632:	5e                   	pop    %esi
 633:	5f                   	pop    %edi
 634:	5d                   	pop    %ebp
 635:	c3                   	ret    

00000636 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 636:	55                   	push   %ebp
 637:	89 e5                	mov    %esp,%ebp
 639:	57                   	push   %edi
 63a:	56                   	push   %esi
 63b:	53                   	push   %ebx
 63c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 63f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 642:	a1 d8 0b 00 00       	mov    0xbd8,%eax
 647:	eb 02                	jmp    64b <free+0x15>
 649:	89 d0                	mov    %edx,%eax
 64b:	39 c8                	cmp    %ecx,%eax
 64d:	73 04                	jae    653 <free+0x1d>
 64f:	39 08                	cmp    %ecx,(%eax)
 651:	77 12                	ja     665 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 653:	8b 10                	mov    (%eax),%edx
 655:	39 c2                	cmp    %eax,%edx
 657:	77 f0                	ja     649 <free+0x13>
 659:	39 c8                	cmp    %ecx,%eax
 65b:	72 08                	jb     665 <free+0x2f>
 65d:	39 ca                	cmp    %ecx,%edx
 65f:	77 04                	ja     665 <free+0x2f>
 661:	89 d0                	mov    %edx,%eax
 663:	eb e6                	jmp    64b <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 665:	8b 73 fc             	mov    -0x4(%ebx),%esi
 668:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 66b:	8b 10                	mov    (%eax),%edx
 66d:	39 d7                	cmp    %edx,%edi
 66f:	74 19                	je     68a <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 671:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 674:	8b 50 04             	mov    0x4(%eax),%edx
 677:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 67a:	39 ce                	cmp    %ecx,%esi
 67c:	74 1b                	je     699 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 67e:	89 08                	mov    %ecx,(%eax)
  freep = p;
 680:	a3 d8 0b 00 00       	mov    %eax,0xbd8
}
 685:	5b                   	pop    %ebx
 686:	5e                   	pop    %esi
 687:	5f                   	pop    %edi
 688:	5d                   	pop    %ebp
 689:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 68a:	03 72 04             	add    0x4(%edx),%esi
 68d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 690:	8b 10                	mov    (%eax),%edx
 692:	8b 12                	mov    (%edx),%edx
 694:	89 53 f8             	mov    %edx,-0x8(%ebx)
 697:	eb db                	jmp    674 <free+0x3e>
    p->s.size += bp->s.size;
 699:	03 53 fc             	add    -0x4(%ebx),%edx
 69c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 69f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6a2:	89 10                	mov    %edx,(%eax)
 6a4:	eb da                	jmp    680 <free+0x4a>

000006a6 <morecore>:

static Header*
morecore(uint nu)
{
 6a6:	55                   	push   %ebp
 6a7:	89 e5                	mov    %esp,%ebp
 6a9:	53                   	push   %ebx
 6aa:	83 ec 04             	sub    $0x4,%esp
 6ad:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6af:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6b4:	77 05                	ja     6bb <morecore+0x15>
    nu = 4096;
 6b6:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6bb:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6c2:	83 ec 0c             	sub    $0xc,%esp
 6c5:	50                   	push   %eax
 6c6:	e8 48 fd ff ff       	call   413 <sbrk>
  if(p == (char*)-1)
 6cb:	83 c4 10             	add    $0x10,%esp
 6ce:	83 f8 ff             	cmp    $0xffffffff,%eax
 6d1:	74 1c                	je     6ef <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6d3:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6d6:	83 c0 08             	add    $0x8,%eax
 6d9:	83 ec 0c             	sub    $0xc,%esp
 6dc:	50                   	push   %eax
 6dd:	e8 54 ff ff ff       	call   636 <free>
  return freep;
 6e2:	a1 d8 0b 00 00       	mov    0xbd8,%eax
 6e7:	83 c4 10             	add    $0x10,%esp
}
 6ea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6ed:	c9                   	leave  
 6ee:	c3                   	ret    
    return 0;
 6ef:	b8 00 00 00 00       	mov    $0x0,%eax
 6f4:	eb f4                	jmp    6ea <morecore+0x44>

000006f6 <malloc>:

void*
malloc(uint nbytes)
{
 6f6:	55                   	push   %ebp
 6f7:	89 e5                	mov    %esp,%ebp
 6f9:	53                   	push   %ebx
 6fa:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6fd:	8b 45 08             	mov    0x8(%ebp),%eax
 700:	8d 58 07             	lea    0x7(%eax),%ebx
 703:	c1 eb 03             	shr    $0x3,%ebx
 706:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 709:	8b 0d d8 0b 00 00    	mov    0xbd8,%ecx
 70f:	85 c9                	test   %ecx,%ecx
 711:	74 04                	je     717 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 713:	8b 01                	mov    (%ecx),%eax
 715:	eb 4d                	jmp    764 <malloc+0x6e>
    base.s.ptr = freep = prevp = &base;
 717:	c7 05 d8 0b 00 00 dc 	movl   $0xbdc,0xbd8
 71e:	0b 00 00 
 721:	c7 05 dc 0b 00 00 dc 	movl   $0xbdc,0xbdc
 728:	0b 00 00 
    base.s.size = 0;
 72b:	c7 05 e0 0b 00 00 00 	movl   $0x0,0xbe0
 732:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 735:	b9 dc 0b 00 00       	mov    $0xbdc,%ecx
 73a:	eb d7                	jmp    713 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 73c:	39 da                	cmp    %ebx,%edx
 73e:	74 1a                	je     75a <malloc+0x64>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 740:	29 da                	sub    %ebx,%edx
 742:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 745:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 748:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 74b:	89 0d d8 0b 00 00    	mov    %ecx,0xbd8
      return (void*)(p + 1);
 751:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 754:	83 c4 04             	add    $0x4,%esp
 757:	5b                   	pop    %ebx
 758:	5d                   	pop    %ebp
 759:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 75a:	8b 10                	mov    (%eax),%edx
 75c:	89 11                	mov    %edx,(%ecx)
 75e:	eb eb                	jmp    74b <malloc+0x55>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 760:	89 c1                	mov    %eax,%ecx
 762:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 764:	8b 50 04             	mov    0x4(%eax),%edx
 767:	39 da                	cmp    %ebx,%edx
 769:	73 d1                	jae    73c <malloc+0x46>
    if(p == freep)
 76b:	39 05 d8 0b 00 00    	cmp    %eax,0xbd8
 771:	75 ed                	jne    760 <malloc+0x6a>
      if((p = morecore(nunits)) == 0)
 773:	89 d8                	mov    %ebx,%eax
 775:	e8 2c ff ff ff       	call   6a6 <morecore>
 77a:	85 c0                	test   %eax,%eax
 77c:	75 e2                	jne    760 <malloc+0x6a>
        return 0;
 77e:	b8 00 00 00 00       	mov    $0x0,%eax
 783:	eb cf                	jmp    754 <malloc+0x5e>
