
kernel:     formato del fichero elf32-i386


Desensamblado de la sección .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 80 10 00       	mov    $0x108000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc c0 a5 10 80       	mov    $0x8010a5c0,%esp
8010002d:	b8 64 2a 10 80       	mov    $0x80102a64,%eax
80100032:	ff e0                	jmp    *%eax

80100034 <bget>:
80100034:	55                   	push   %ebp
80100035:	89 e5                	mov    %esp,%ebp
80100037:	57                   	push   %edi
80100038:	56                   	push   %esi
80100039:	53                   	push   %ebx
8010003a:	83 ec 18             	sub    $0x18,%esp
8010003d:	89 c6                	mov    %eax,%esi
8010003f:	89 d7                	mov    %edx,%edi
80100041:	68 c0 a5 10 80       	push   $0x8010a5c0
80100046:	e8 4a 3b 00 00       	call   80103b95 <acquire>
8010004b:	8b 1d 10 ed 10 80    	mov    0x8010ed10,%ebx
80100051:	83 c4 10             	add    $0x10,%esp
80100054:	eb 03                	jmp    80100059 <bget+0x25>
80100056:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100059:	81 fb bc ec 10 80    	cmp    $0x8010ecbc,%ebx
8010005f:	74 30                	je     80100091 <bget+0x5d>
80100061:	39 73 04             	cmp    %esi,0x4(%ebx)
80100064:	75 f0                	jne    80100056 <bget+0x22>
80100066:	39 7b 08             	cmp    %edi,0x8(%ebx)
80100069:	75 eb                	jne    80100056 <bget+0x22>
8010006b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010006e:	83 c0 01             	add    $0x1,%eax
80100071:	89 43 4c             	mov    %eax,0x4c(%ebx)
80100074:	83 ec 0c             	sub    $0xc,%esp
80100077:	68 c0 a5 10 80       	push   $0x8010a5c0
8010007c:	e8 79 3b 00 00       	call   80103bfa <release>
80100081:	8d 43 0c             	lea    0xc(%ebx),%eax
80100084:	89 04 24             	mov    %eax,(%esp)
80100087:	e8 f5 38 00 00       	call   80103981 <acquiresleep>
8010008c:	83 c4 10             	add    $0x10,%esp
8010008f:	eb 4c                	jmp    801000dd <bget+0xa9>
80100091:	8b 1d 0c ed 10 80    	mov    0x8010ed0c,%ebx
80100097:	eb 03                	jmp    8010009c <bget+0x68>
80100099:	8b 5b 50             	mov    0x50(%ebx),%ebx
8010009c:	81 fb bc ec 10 80    	cmp    $0x8010ecbc,%ebx
801000a2:	74 43                	je     801000e7 <bget+0xb3>
801000a4:	83 7b 4c 00          	cmpl   $0x0,0x4c(%ebx)
801000a8:	75 ef                	jne    80100099 <bget+0x65>
801000aa:	f6 03 04             	testb  $0x4,(%ebx)
801000ad:	75 ea                	jne    80100099 <bget+0x65>
801000af:	89 73 04             	mov    %esi,0x4(%ebx)
801000b2:	89 7b 08             	mov    %edi,0x8(%ebx)
801000b5:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801000bb:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
801000c2:	83 ec 0c             	sub    $0xc,%esp
801000c5:	68 c0 a5 10 80       	push   $0x8010a5c0
801000ca:	e8 2b 3b 00 00       	call   80103bfa <release>
801000cf:	8d 43 0c             	lea    0xc(%ebx),%eax
801000d2:	89 04 24             	mov    %eax,(%esp)
801000d5:	e8 a7 38 00 00       	call   80103981 <acquiresleep>
801000da:	83 c4 10             	add    $0x10,%esp
801000dd:	89 d8                	mov    %ebx,%eax
801000df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801000e2:	5b                   	pop    %ebx
801000e3:	5e                   	pop    %esi
801000e4:	5f                   	pop    %edi
801000e5:	5d                   	pop    %ebp
801000e6:	c3                   	ret    
801000e7:	83 ec 0c             	sub    $0xc,%esp
801000ea:	68 80 65 10 80       	push   $0x80106580
801000ef:	e8 54 02 00 00       	call   80100348 <panic>

801000f4 <binit>:
801000f4:	55                   	push   %ebp
801000f5:	89 e5                	mov    %esp,%ebp
801000f7:	53                   	push   %ebx
801000f8:	83 ec 0c             	sub    $0xc,%esp
801000fb:	68 91 65 10 80       	push   $0x80106591
80100100:	68 c0 a5 10 80       	push   $0x8010a5c0
80100105:	e8 4f 39 00 00       	call   80103a59 <initlock>
8010010a:	c7 05 0c ed 10 80 bc 	movl   $0x8010ecbc,0x8010ed0c
80100111:	ec 10 80 
80100114:	c7 05 10 ed 10 80 bc 	movl   $0x8010ecbc,0x8010ed10
8010011b:	ec 10 80 
8010011e:	83 c4 10             	add    $0x10,%esp
80100121:	bb f4 a5 10 80       	mov    $0x8010a5f4,%ebx
80100126:	eb 37                	jmp    8010015f <binit+0x6b>
80100128:	a1 10 ed 10 80       	mov    0x8010ed10,%eax
8010012d:	89 43 54             	mov    %eax,0x54(%ebx)
80100130:	c7 43 50 bc ec 10 80 	movl   $0x8010ecbc,0x50(%ebx)
80100137:	83 ec 08             	sub    $0x8,%esp
8010013a:	68 98 65 10 80       	push   $0x80106598
8010013f:	8d 43 0c             	lea    0xc(%ebx),%eax
80100142:	50                   	push   %eax
80100143:	e8 06 38 00 00       	call   8010394e <initsleeplock>
80100148:	a1 10 ed 10 80       	mov    0x8010ed10,%eax
8010014d:	89 58 50             	mov    %ebx,0x50(%eax)
80100150:	89 1d 10 ed 10 80    	mov    %ebx,0x8010ed10
80100156:	81 c3 5c 02 00 00    	add    $0x25c,%ebx
8010015c:	83 c4 10             	add    $0x10,%esp
8010015f:	81 fb bc ec 10 80    	cmp    $0x8010ecbc,%ebx
80100165:	72 c1                	jb     80100128 <binit+0x34>
80100167:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010016a:	c9                   	leave  
8010016b:	c3                   	ret    

8010016c <bread>:
8010016c:	55                   	push   %ebp
8010016d:	89 e5                	mov    %esp,%ebp
8010016f:	53                   	push   %ebx
80100170:	83 ec 04             	sub    $0x4,%esp
80100173:	8b 55 0c             	mov    0xc(%ebp),%edx
80100176:	8b 45 08             	mov    0x8(%ebp),%eax
80100179:	e8 b6 fe ff ff       	call   80100034 <bget>
8010017e:	89 c3                	mov    %eax,%ebx
80100180:	f6 00 02             	testb  $0x2,(%eax)
80100183:	74 07                	je     8010018c <bread+0x20>
80100185:	89 d8                	mov    %ebx,%eax
80100187:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010018a:	c9                   	leave  
8010018b:	c3                   	ret    
8010018c:	83 ec 0c             	sub    $0xc,%esp
8010018f:	50                   	push   %eax
80100190:	e8 77 1c 00 00       	call   80101e0c <iderw>
80100195:	83 c4 10             	add    $0x10,%esp
80100198:	eb eb                	jmp    80100185 <bread+0x19>

8010019a <bwrite>:
8010019a:	55                   	push   %ebp
8010019b:	89 e5                	mov    %esp,%ebp
8010019d:	53                   	push   %ebx
8010019e:	83 ec 10             	sub    $0x10,%esp
801001a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001a4:	8d 43 0c             	lea    0xc(%ebx),%eax
801001a7:	50                   	push   %eax
801001a8:	e8 5e 38 00 00       	call   80103a0b <holdingsleep>
801001ad:	83 c4 10             	add    $0x10,%esp
801001b0:	85 c0                	test   %eax,%eax
801001b2:	74 14                	je     801001c8 <bwrite+0x2e>
801001b4:	83 0b 04             	orl    $0x4,(%ebx)
801001b7:	83 ec 0c             	sub    $0xc,%esp
801001ba:	53                   	push   %ebx
801001bb:	e8 4c 1c 00 00       	call   80101e0c <iderw>
801001c0:	83 c4 10             	add    $0x10,%esp
801001c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c6:	c9                   	leave  
801001c7:	c3                   	ret    
801001c8:	83 ec 0c             	sub    $0xc,%esp
801001cb:	68 9f 65 10 80       	push   $0x8010659f
801001d0:	e8 73 01 00 00       	call   80100348 <panic>

801001d5 <brelse>:
801001d5:	55                   	push   %ebp
801001d6:	89 e5                	mov    %esp,%ebp
801001d8:	56                   	push   %esi
801001d9:	53                   	push   %ebx
801001da:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001dd:	8d 73 0c             	lea    0xc(%ebx),%esi
801001e0:	83 ec 0c             	sub    $0xc,%esp
801001e3:	56                   	push   %esi
801001e4:	e8 22 38 00 00       	call   80103a0b <holdingsleep>
801001e9:	83 c4 10             	add    $0x10,%esp
801001ec:	85 c0                	test   %eax,%eax
801001ee:	74 6b                	je     8010025b <brelse+0x86>
801001f0:	83 ec 0c             	sub    $0xc,%esp
801001f3:	56                   	push   %esi
801001f4:	e8 d7 37 00 00       	call   801039d0 <releasesleep>
801001f9:	c7 04 24 c0 a5 10 80 	movl   $0x8010a5c0,(%esp)
80100200:	e8 90 39 00 00       	call   80103b95 <acquire>
80100205:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100208:	83 e8 01             	sub    $0x1,%eax
8010020b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010020e:	83 c4 10             	add    $0x10,%esp
80100211:	85 c0                	test   %eax,%eax
80100213:	75 2f                	jne    80100244 <brelse+0x6f>
80100215:	8b 43 54             	mov    0x54(%ebx),%eax
80100218:	8b 53 50             	mov    0x50(%ebx),%edx
8010021b:	89 50 50             	mov    %edx,0x50(%eax)
8010021e:	8b 43 50             	mov    0x50(%ebx),%eax
80100221:	8b 53 54             	mov    0x54(%ebx),%edx
80100224:	89 50 54             	mov    %edx,0x54(%eax)
80100227:	a1 10 ed 10 80       	mov    0x8010ed10,%eax
8010022c:	89 43 54             	mov    %eax,0x54(%ebx)
8010022f:	c7 43 50 bc ec 10 80 	movl   $0x8010ecbc,0x50(%ebx)
80100236:	a1 10 ed 10 80       	mov    0x8010ed10,%eax
8010023b:	89 58 50             	mov    %ebx,0x50(%eax)
8010023e:	89 1d 10 ed 10 80    	mov    %ebx,0x8010ed10
80100244:	83 ec 0c             	sub    $0xc,%esp
80100247:	68 c0 a5 10 80       	push   $0x8010a5c0
8010024c:	e8 a9 39 00 00       	call   80103bfa <release>
80100251:	83 c4 10             	add    $0x10,%esp
80100254:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100257:	5b                   	pop    %ebx
80100258:	5e                   	pop    %esi
80100259:	5d                   	pop    %ebp
8010025a:	c3                   	ret    
8010025b:	83 ec 0c             	sub    $0xc,%esp
8010025e:	68 a6 65 10 80       	push   $0x801065a6
80100263:	e8 e0 00 00 00       	call   80100348 <panic>

80100268 <consoleread>:
80100268:	55                   	push   %ebp
80100269:	89 e5                	mov    %esp,%ebp
8010026b:	57                   	push   %edi
8010026c:	56                   	push   %esi
8010026d:	53                   	push   %ebx
8010026e:	83 ec 28             	sub    $0x28,%esp
80100271:	8b 7d 08             	mov    0x8(%ebp),%edi
80100274:	8b 75 0c             	mov    0xc(%ebp),%esi
80100277:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010027a:	57                   	push   %edi
8010027b:	e8 c3 13 00 00       	call   80101643 <iunlock>
80100280:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100283:	c7 04 24 20 95 10 80 	movl   $0x80109520,(%esp)
8010028a:	e8 06 39 00 00       	call   80103b95 <acquire>
8010028f:	83 c4 10             	add    $0x10,%esp
80100292:	85 db                	test   %ebx,%ebx
80100294:	0f 8e 8f 00 00 00    	jle    80100329 <consoleread+0xc1>
8010029a:	a1 a0 ef 10 80       	mov    0x8010efa0,%eax
8010029f:	3b 05 a4 ef 10 80    	cmp    0x8010efa4,%eax
801002a5:	75 47                	jne    801002ee <consoleread+0x86>
801002a7:	e8 4a 2f 00 00       	call   801031f6 <myproc>
801002ac:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
801002b0:	75 17                	jne    801002c9 <consoleread+0x61>
801002b2:	83 ec 08             	sub    $0x8,%esp
801002b5:	68 20 95 10 80       	push   $0x80109520
801002ba:	68 a0 ef 10 80       	push   $0x8010efa0
801002bf:	e8 d6 33 00 00       	call   8010369a <sleep>
801002c4:	83 c4 10             	add    $0x10,%esp
801002c7:	eb d1                	jmp    8010029a <consoleread+0x32>
801002c9:	83 ec 0c             	sub    $0xc,%esp
801002cc:	68 20 95 10 80       	push   $0x80109520
801002d1:	e8 24 39 00 00       	call   80103bfa <release>
801002d6:	89 3c 24             	mov    %edi,(%esp)
801002d9:	e8 a3 12 00 00       	call   80101581 <ilock>
801002de:	83 c4 10             	add    $0x10,%esp
801002e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801002e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002e9:	5b                   	pop    %ebx
801002ea:	5e                   	pop    %esi
801002eb:	5f                   	pop    %edi
801002ec:	5d                   	pop    %ebp
801002ed:	c3                   	ret    
801002ee:	8d 50 01             	lea    0x1(%eax),%edx
801002f1:	89 15 a0 ef 10 80    	mov    %edx,0x8010efa0
801002f7:	89 c2                	mov    %eax,%edx
801002f9:	83 e2 7f             	and    $0x7f,%edx
801002fc:	0f b6 8a 20 ef 10 80 	movzbl -0x7fef10e0(%edx),%ecx
80100303:	0f be d1             	movsbl %cl,%edx
80100306:	83 fa 04             	cmp    $0x4,%edx
80100309:	74 14                	je     8010031f <consoleread+0xb7>
8010030b:	8d 46 01             	lea    0x1(%esi),%eax
8010030e:	88 0e                	mov    %cl,(%esi)
80100310:	83 eb 01             	sub    $0x1,%ebx
80100313:	83 fa 0a             	cmp    $0xa,%edx
80100316:	74 11                	je     80100329 <consoleread+0xc1>
80100318:	89 c6                	mov    %eax,%esi
8010031a:	e9 73 ff ff ff       	jmp    80100292 <consoleread+0x2a>
8010031f:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
80100322:	73 05                	jae    80100329 <consoleread+0xc1>
80100324:	a3 a0 ef 10 80       	mov    %eax,0x8010efa0
80100329:	83 ec 0c             	sub    $0xc,%esp
8010032c:	68 20 95 10 80       	push   $0x80109520
80100331:	e8 c4 38 00 00       	call   80103bfa <release>
80100336:	89 3c 24             	mov    %edi,(%esp)
80100339:	e8 43 12 00 00       	call   80101581 <ilock>
8010033e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100341:	29 d8                	sub    %ebx,%eax
80100343:	83 c4 10             	add    $0x10,%esp
80100346:	eb 9e                	jmp    801002e6 <consoleread+0x7e>

80100348 <panic>:
80100348:	55                   	push   %ebp
80100349:	89 e5                	mov    %esp,%ebp
8010034b:	53                   	push   %ebx
8010034c:	83 ec 34             	sub    $0x34,%esp
8010034f:	fa                   	cli    
80100350:	c7 05 54 95 10 80 00 	movl   $0x0,0x80109554
80100357:	00 00 00 
8010035a:	e8 1f 20 00 00       	call   8010237e <lapicid>
8010035f:	83 ec 08             	sub    $0x8,%esp
80100362:	50                   	push   %eax
80100363:	68 ad 65 10 80       	push   $0x801065ad
80100368:	e8 9e 02 00 00       	call   8010060b <cprintf>
8010036d:	83 c4 04             	add    $0x4,%esp
80100370:	ff 75 08             	pushl  0x8(%ebp)
80100373:	e8 93 02 00 00       	call   8010060b <cprintf>
80100378:	c7 04 24 42 6d 10 80 	movl   $0x80106d42,(%esp)
8010037f:	e8 87 02 00 00       	call   8010060b <cprintf>
80100384:	83 c4 08             	add    $0x8,%esp
80100387:	8d 45 d0             	lea    -0x30(%ebp),%eax
8010038a:	50                   	push   %eax
8010038b:	8d 45 08             	lea    0x8(%ebp),%eax
8010038e:	50                   	push   %eax
8010038f:	e8 e0 36 00 00       	call   80103a74 <getcallerpcs>
80100394:	83 c4 10             	add    $0x10,%esp
80100397:	bb 00 00 00 00       	mov    $0x0,%ebx
8010039c:	eb 17                	jmp    801003b5 <panic+0x6d>
8010039e:	83 ec 08             	sub    $0x8,%esp
801003a1:	ff 74 9d d0          	pushl  -0x30(%ebp,%ebx,4)
801003a5:	68 c1 65 10 80       	push   $0x801065c1
801003aa:	e8 5c 02 00 00       	call   8010060b <cprintf>
801003af:	83 c3 01             	add    $0x1,%ebx
801003b2:	83 c4 10             	add    $0x10,%esp
801003b5:	83 fb 09             	cmp    $0x9,%ebx
801003b8:	7e e4                	jle    8010039e <panic+0x56>
801003ba:	c7 05 58 95 10 80 01 	movl   $0x1,0x80109558
801003c1:	00 00 00 
801003c4:	eb fe                	jmp    801003c4 <panic+0x7c>

801003c6 <cgaputc>:
801003c6:	55                   	push   %ebp
801003c7:	89 e5                	mov    %esp,%ebp
801003c9:	57                   	push   %edi
801003ca:	56                   	push   %esi
801003cb:	53                   	push   %ebx
801003cc:	83 ec 0c             	sub    $0xc,%esp
801003cf:	89 c6                	mov    %eax,%esi
801003d1:	b9 d4 03 00 00       	mov    $0x3d4,%ecx
801003d6:	b8 0e 00 00 00       	mov    $0xe,%eax
801003db:	89 ca                	mov    %ecx,%edx
801003dd:	ee                   	out    %al,(%dx)
801003de:	bb d5 03 00 00       	mov    $0x3d5,%ebx
801003e3:	89 da                	mov    %ebx,%edx
801003e5:	ec                   	in     (%dx),%al
801003e6:	0f b6 f8             	movzbl %al,%edi
801003e9:	c1 e7 08             	shl    $0x8,%edi
801003ec:	b8 0f 00 00 00       	mov    $0xf,%eax
801003f1:	89 ca                	mov    %ecx,%edx
801003f3:	ee                   	out    %al,(%dx)
801003f4:	89 da                	mov    %ebx,%edx
801003f6:	ec                   	in     (%dx),%al
801003f7:	0f b6 c8             	movzbl %al,%ecx
801003fa:	09 f9                	or     %edi,%ecx
801003fc:	83 fe 0a             	cmp    $0xa,%esi
801003ff:	74 6a                	je     8010046b <cgaputc+0xa5>
80100401:	81 fe 00 01 00 00    	cmp    $0x100,%esi
80100407:	0f 84 81 00 00 00    	je     8010048e <cgaputc+0xc8>
8010040d:	89 f0                	mov    %esi,%eax
8010040f:	0f b6 f0             	movzbl %al,%esi
80100412:	8d 59 01             	lea    0x1(%ecx),%ebx
80100415:	66 81 ce 00 07       	or     $0x700,%si
8010041a:	66 89 b4 09 00 80 0b 	mov    %si,-0x7ff48000(%ecx,%ecx,1)
80100421:	80 
80100422:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
80100428:	77 71                	ja     8010049b <cgaputc+0xd5>
8010042a:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
80100430:	7f 76                	jg     801004a8 <cgaputc+0xe2>
80100432:	be d4 03 00 00       	mov    $0x3d4,%esi
80100437:	b8 0e 00 00 00       	mov    $0xe,%eax
8010043c:	89 f2                	mov    %esi,%edx
8010043e:	ee                   	out    %al,(%dx)
8010043f:	89 d8                	mov    %ebx,%eax
80100441:	c1 f8 08             	sar    $0x8,%eax
80100444:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100449:	89 ca                	mov    %ecx,%edx
8010044b:	ee                   	out    %al,(%dx)
8010044c:	b8 0f 00 00 00       	mov    $0xf,%eax
80100451:	89 f2                	mov    %esi,%edx
80100453:	ee                   	out    %al,(%dx)
80100454:	89 d8                	mov    %ebx,%eax
80100456:	89 ca                	mov    %ecx,%edx
80100458:	ee                   	out    %al,(%dx)
80100459:	66 c7 84 1b 00 80 0b 	movw   $0x720,-0x7ff48000(%ebx,%ebx,1)
80100460:	80 20 07 
80100463:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100466:	5b                   	pop    %ebx
80100467:	5e                   	pop    %esi
80100468:	5f                   	pop    %edi
80100469:	5d                   	pop    %ebp
8010046a:	c3                   	ret    
8010046b:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100470:	89 c8                	mov    %ecx,%eax
80100472:	f7 ea                	imul   %edx
80100474:	c1 fa 05             	sar    $0x5,%edx
80100477:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010047a:	89 d0                	mov    %edx,%eax
8010047c:	c1 e0 04             	shl    $0x4,%eax
8010047f:	89 ca                	mov    %ecx,%edx
80100481:	29 c2                	sub    %eax,%edx
80100483:	bb 50 00 00 00       	mov    $0x50,%ebx
80100488:	29 d3                	sub    %edx,%ebx
8010048a:	01 cb                	add    %ecx,%ebx
8010048c:	eb 94                	jmp    80100422 <cgaputc+0x5c>
8010048e:	85 c9                	test   %ecx,%ecx
80100490:	7e 05                	jle    80100497 <cgaputc+0xd1>
80100492:	8d 59 ff             	lea    -0x1(%ecx),%ebx
80100495:	eb 8b                	jmp    80100422 <cgaputc+0x5c>
80100497:	89 cb                	mov    %ecx,%ebx
80100499:	eb 87                	jmp    80100422 <cgaputc+0x5c>
8010049b:	83 ec 0c             	sub    $0xc,%esp
8010049e:	68 c5 65 10 80       	push   $0x801065c5
801004a3:	e8 a0 fe ff ff       	call   80100348 <panic>
801004a8:	83 ec 04             	sub    $0x4,%esp
801004ab:	68 60 0e 00 00       	push   $0xe60
801004b0:	68 a0 80 0b 80       	push   $0x800b80a0
801004b5:	68 00 80 0b 80       	push   $0x800b8000
801004ba:	e8 fd 37 00 00       	call   80103cbc <memmove>
801004bf:	83 eb 50             	sub    $0x50,%ebx
801004c2:	b8 80 07 00 00       	mov    $0x780,%eax
801004c7:	29 d8                	sub    %ebx,%eax
801004c9:	8d 94 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%edx
801004d0:	83 c4 0c             	add    $0xc,%esp
801004d3:	01 c0                	add    %eax,%eax
801004d5:	50                   	push   %eax
801004d6:	6a 00                	push   $0x0
801004d8:	52                   	push   %edx
801004d9:	e8 63 37 00 00       	call   80103c41 <memset>
801004de:	83 c4 10             	add    $0x10,%esp
801004e1:	e9 4c ff ff ff       	jmp    80100432 <cgaputc+0x6c>

801004e6 <consputc>:
801004e6:	83 3d 58 95 10 80 00 	cmpl   $0x0,0x80109558
801004ed:	74 03                	je     801004f2 <consputc+0xc>
801004ef:	fa                   	cli    
801004f0:	eb fe                	jmp    801004f0 <consputc+0xa>
801004f2:	55                   	push   %ebp
801004f3:	89 e5                	mov    %esp,%ebp
801004f5:	53                   	push   %ebx
801004f6:	83 ec 04             	sub    $0x4,%esp
801004f9:	89 c3                	mov    %eax,%ebx
801004fb:	3d 00 01 00 00       	cmp    $0x100,%eax
80100500:	74 18                	je     8010051a <consputc+0x34>
80100502:	83 ec 0c             	sub    $0xc,%esp
80100505:	50                   	push   %eax
80100506:	e8 63 4c 00 00       	call   8010516e <uartputc>
8010050b:	83 c4 10             	add    $0x10,%esp
8010050e:	89 d8                	mov    %ebx,%eax
80100510:	e8 b1 fe ff ff       	call   801003c6 <cgaputc>
80100515:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100518:	c9                   	leave  
80100519:	c3                   	ret    
8010051a:	83 ec 0c             	sub    $0xc,%esp
8010051d:	6a 08                	push   $0x8
8010051f:	e8 4a 4c 00 00       	call   8010516e <uartputc>
80100524:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
8010052b:	e8 3e 4c 00 00       	call   8010516e <uartputc>
80100530:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100537:	e8 32 4c 00 00       	call   8010516e <uartputc>
8010053c:	83 c4 10             	add    $0x10,%esp
8010053f:	eb cd                	jmp    8010050e <consputc+0x28>

80100541 <printint>:
80100541:	55                   	push   %ebp
80100542:	89 e5                	mov    %esp,%ebp
80100544:	57                   	push   %edi
80100545:	56                   	push   %esi
80100546:	53                   	push   %ebx
80100547:	83 ec 1c             	sub    $0x1c,%esp
8010054a:	89 d7                	mov    %edx,%edi
8010054c:	85 c9                	test   %ecx,%ecx
8010054e:	74 09                	je     80100559 <printint+0x18>
80100550:	89 c1                	mov    %eax,%ecx
80100552:	c1 e9 1f             	shr    $0x1f,%ecx
80100555:	85 c0                	test   %eax,%eax
80100557:	78 09                	js     80100562 <printint+0x21>
80100559:	89 c2                	mov    %eax,%edx
8010055b:	be 00 00 00 00       	mov    $0x0,%esi
80100560:	eb 08                	jmp    8010056a <printint+0x29>
80100562:	f7 d8                	neg    %eax
80100564:	89 c2                	mov    %eax,%edx
80100566:	eb f3                	jmp    8010055b <printint+0x1a>
80100568:	89 de                	mov    %ebx,%esi
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	ba 00 00 00 00       	mov    $0x0,%edx
80100571:	f7 f7                	div    %edi
80100573:	8d 5e 01             	lea    0x1(%esi),%ebx
80100576:	0f b6 92 f0 65 10 80 	movzbl -0x7fef9a10(%edx),%edx
8010057d:	88 54 35 d8          	mov    %dl,-0x28(%ebp,%esi,1)
80100581:	89 c2                	mov    %eax,%edx
80100583:	85 c0                	test   %eax,%eax
80100585:	75 e1                	jne    80100568 <printint+0x27>
80100587:	85 c9                	test   %ecx,%ecx
80100589:	74 14                	je     8010059f <printint+0x5e>
8010058b:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
80100590:	8d 5e 02             	lea    0x2(%esi),%ebx
80100593:	eb 0a                	jmp    8010059f <printint+0x5e>
80100595:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
8010059a:	e8 47 ff ff ff       	call   801004e6 <consputc>
8010059f:	83 eb 01             	sub    $0x1,%ebx
801005a2:	79 f1                	jns    80100595 <printint+0x54>
801005a4:	83 c4 1c             	add    $0x1c,%esp
801005a7:	5b                   	pop    %ebx
801005a8:	5e                   	pop    %esi
801005a9:	5f                   	pop    %edi
801005aa:	5d                   	pop    %ebp
801005ab:	c3                   	ret    

801005ac <consolewrite>:
801005ac:	55                   	push   %ebp
801005ad:	89 e5                	mov    %esp,%ebp
801005af:	57                   	push   %edi
801005b0:	56                   	push   %esi
801005b1:	53                   	push   %ebx
801005b2:	83 ec 18             	sub    $0x18,%esp
801005b5:	8b 7d 0c             	mov    0xc(%ebp),%edi
801005b8:	8b 75 10             	mov    0x10(%ebp),%esi
801005bb:	ff 75 08             	pushl  0x8(%ebp)
801005be:	e8 80 10 00 00       	call   80101643 <iunlock>
801005c3:	c7 04 24 20 95 10 80 	movl   $0x80109520,(%esp)
801005ca:	e8 c6 35 00 00       	call   80103b95 <acquire>
801005cf:	83 c4 10             	add    $0x10,%esp
801005d2:	bb 00 00 00 00       	mov    $0x0,%ebx
801005d7:	eb 0c                	jmp    801005e5 <consolewrite+0x39>
801005d9:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801005dd:	e8 04 ff ff ff       	call   801004e6 <consputc>
801005e2:	83 c3 01             	add    $0x1,%ebx
801005e5:	39 f3                	cmp    %esi,%ebx
801005e7:	7c f0                	jl     801005d9 <consolewrite+0x2d>
801005e9:	83 ec 0c             	sub    $0xc,%esp
801005ec:	68 20 95 10 80       	push   $0x80109520
801005f1:	e8 04 36 00 00       	call   80103bfa <release>
801005f6:	83 c4 04             	add    $0x4,%esp
801005f9:	ff 75 08             	pushl  0x8(%ebp)
801005fc:	e8 80 0f 00 00       	call   80101581 <ilock>
80100601:	89 f0                	mov    %esi,%eax
80100603:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100606:	5b                   	pop    %ebx
80100607:	5e                   	pop    %esi
80100608:	5f                   	pop    %edi
80100609:	5d                   	pop    %ebp
8010060a:	c3                   	ret    

8010060b <cprintf>:
8010060b:	55                   	push   %ebp
8010060c:	89 e5                	mov    %esp,%ebp
8010060e:	57                   	push   %edi
8010060f:	56                   	push   %esi
80100610:	53                   	push   %ebx
80100611:	83 ec 1c             	sub    $0x1c,%esp
80100614:	a1 54 95 10 80       	mov    0x80109554,%eax
80100619:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010061c:	85 c0                	test   %eax,%eax
8010061e:	75 10                	jne    80100630 <cprintf+0x25>
80100620:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
80100624:	74 1c                	je     80100642 <cprintf+0x37>
80100626:	8d 7d 0c             	lea    0xc(%ebp),%edi
80100629:	bb 00 00 00 00       	mov    $0x0,%ebx
8010062e:	eb 27                	jmp    80100657 <cprintf+0x4c>
80100630:	83 ec 0c             	sub    $0xc,%esp
80100633:	68 20 95 10 80       	push   $0x80109520
80100638:	e8 58 35 00 00       	call   80103b95 <acquire>
8010063d:	83 c4 10             	add    $0x10,%esp
80100640:	eb de                	jmp    80100620 <cprintf+0x15>
80100642:	83 ec 0c             	sub    $0xc,%esp
80100645:	68 df 65 10 80       	push   $0x801065df
8010064a:	e8 f9 fc ff ff       	call   80100348 <panic>
8010064f:	e8 92 fe ff ff       	call   801004e6 <consputc>
80100654:	83 c3 01             	add    $0x1,%ebx
80100657:	8b 55 08             	mov    0x8(%ebp),%edx
8010065a:	0f b6 04 1a          	movzbl (%edx,%ebx,1),%eax
8010065e:	85 c0                	test   %eax,%eax
80100660:	0f 84 b8 00 00 00    	je     8010071e <cprintf+0x113>
80100666:	83 f8 25             	cmp    $0x25,%eax
80100669:	75 e4                	jne    8010064f <cprintf+0x44>
8010066b:	83 c3 01             	add    $0x1,%ebx
8010066e:	0f b6 34 1a          	movzbl (%edx,%ebx,1),%esi
80100672:	85 f6                	test   %esi,%esi
80100674:	0f 84 a4 00 00 00    	je     8010071e <cprintf+0x113>
8010067a:	83 fe 70             	cmp    $0x70,%esi
8010067d:	74 48                	je     801006c7 <cprintf+0xbc>
8010067f:	83 fe 70             	cmp    $0x70,%esi
80100682:	7f 26                	jg     801006aa <cprintf+0x9f>
80100684:	83 fe 25             	cmp    $0x25,%esi
80100687:	0f 84 82 00 00 00    	je     8010070f <cprintf+0x104>
8010068d:	83 fe 64             	cmp    $0x64,%esi
80100690:	75 22                	jne    801006b4 <cprintf+0xa9>
80100692:	8d 77 04             	lea    0x4(%edi),%esi
80100695:	8b 07                	mov    (%edi),%eax
80100697:	b9 01 00 00 00       	mov    $0x1,%ecx
8010069c:	ba 0a 00 00 00       	mov    $0xa,%edx
801006a1:	e8 9b fe ff ff       	call   80100541 <printint>
801006a6:	89 f7                	mov    %esi,%edi
801006a8:	eb aa                	jmp    80100654 <cprintf+0x49>
801006aa:	83 fe 73             	cmp    $0x73,%esi
801006ad:	74 33                	je     801006e2 <cprintf+0xd7>
801006af:	83 fe 78             	cmp    $0x78,%esi
801006b2:	74 13                	je     801006c7 <cprintf+0xbc>
801006b4:	b8 25 00 00 00       	mov    $0x25,%eax
801006b9:	e8 28 fe ff ff       	call   801004e6 <consputc>
801006be:	89 f0                	mov    %esi,%eax
801006c0:	e8 21 fe ff ff       	call   801004e6 <consputc>
801006c5:	eb 8d                	jmp    80100654 <cprintf+0x49>
801006c7:	8d 77 04             	lea    0x4(%edi),%esi
801006ca:	8b 07                	mov    (%edi),%eax
801006cc:	b9 00 00 00 00       	mov    $0x0,%ecx
801006d1:	ba 10 00 00 00       	mov    $0x10,%edx
801006d6:	e8 66 fe ff ff       	call   80100541 <printint>
801006db:	89 f7                	mov    %esi,%edi
801006dd:	e9 72 ff ff ff       	jmp    80100654 <cprintf+0x49>
801006e2:	8d 47 04             	lea    0x4(%edi),%eax
801006e5:	89 45 e0             	mov    %eax,-0x20(%ebp)
801006e8:	8b 37                	mov    (%edi),%esi
801006ea:	85 f6                	test   %esi,%esi
801006ec:	75 12                	jne    80100700 <cprintf+0xf5>
801006ee:	be d8 65 10 80       	mov    $0x801065d8,%esi
801006f3:	eb 0b                	jmp    80100700 <cprintf+0xf5>
801006f5:	0f be c0             	movsbl %al,%eax
801006f8:	e8 e9 fd ff ff       	call   801004e6 <consputc>
801006fd:	83 c6 01             	add    $0x1,%esi
80100700:	0f b6 06             	movzbl (%esi),%eax
80100703:	84 c0                	test   %al,%al
80100705:	75 ee                	jne    801006f5 <cprintf+0xea>
80100707:	8b 7d e0             	mov    -0x20(%ebp),%edi
8010070a:	e9 45 ff ff ff       	jmp    80100654 <cprintf+0x49>
8010070f:	b8 25 00 00 00       	mov    $0x25,%eax
80100714:	e8 cd fd ff ff       	call   801004e6 <consputc>
80100719:	e9 36 ff ff ff       	jmp    80100654 <cprintf+0x49>
8010071e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
80100722:	75 08                	jne    8010072c <cprintf+0x121>
80100724:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100727:	5b                   	pop    %ebx
80100728:	5e                   	pop    %esi
80100729:	5f                   	pop    %edi
8010072a:	5d                   	pop    %ebp
8010072b:	c3                   	ret    
8010072c:	83 ec 0c             	sub    $0xc,%esp
8010072f:	68 20 95 10 80       	push   $0x80109520
80100734:	e8 c1 34 00 00       	call   80103bfa <release>
80100739:	83 c4 10             	add    $0x10,%esp
8010073c:	eb e6                	jmp    80100724 <cprintf+0x119>

8010073e <consoleintr>:
8010073e:	55                   	push   %ebp
8010073f:	89 e5                	mov    %esp,%ebp
80100741:	57                   	push   %edi
80100742:	56                   	push   %esi
80100743:	53                   	push   %ebx
80100744:	83 ec 18             	sub    $0x18,%esp
80100747:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010074a:	68 20 95 10 80       	push   $0x80109520
8010074f:	e8 41 34 00 00       	call   80103b95 <acquire>
80100754:	83 c4 10             	add    $0x10,%esp
80100757:	be 00 00 00 00       	mov    $0x0,%esi
8010075c:	e9 c5 00 00 00       	jmp    80100826 <consoleintr+0xe8>
80100761:	83 ff 08             	cmp    $0x8,%edi
80100764:	0f 84 e0 00 00 00    	je     8010084a <consoleintr+0x10c>
8010076a:	85 ff                	test   %edi,%edi
8010076c:	0f 84 b4 00 00 00    	je     80100826 <consoleintr+0xe8>
80100772:	a1 a8 ef 10 80       	mov    0x8010efa8,%eax
80100777:	89 c2                	mov    %eax,%edx
80100779:	2b 15 a0 ef 10 80    	sub    0x8010efa0,%edx
8010077f:	83 fa 7f             	cmp    $0x7f,%edx
80100782:	0f 87 9e 00 00 00    	ja     80100826 <consoleintr+0xe8>
80100788:	83 ff 0d             	cmp    $0xd,%edi
8010078b:	0f 84 86 00 00 00    	je     80100817 <consoleintr+0xd9>
80100791:	8d 50 01             	lea    0x1(%eax),%edx
80100794:	89 15 a8 ef 10 80    	mov    %edx,0x8010efa8
8010079a:	83 e0 7f             	and    $0x7f,%eax
8010079d:	89 f9                	mov    %edi,%ecx
8010079f:	88 88 20 ef 10 80    	mov    %cl,-0x7fef10e0(%eax)
801007a5:	89 f8                	mov    %edi,%eax
801007a7:	e8 3a fd ff ff       	call   801004e6 <consputc>
801007ac:	83 ff 0a             	cmp    $0xa,%edi
801007af:	0f 94 c2             	sete   %dl
801007b2:	83 ff 04             	cmp    $0x4,%edi
801007b5:	0f 94 c0             	sete   %al
801007b8:	08 c2                	or     %al,%dl
801007ba:	75 10                	jne    801007cc <consoleintr+0x8e>
801007bc:	a1 a0 ef 10 80       	mov    0x8010efa0,%eax
801007c1:	83 e8 80             	sub    $0xffffff80,%eax
801007c4:	39 05 a8 ef 10 80    	cmp    %eax,0x8010efa8
801007ca:	75 5a                	jne    80100826 <consoleintr+0xe8>
801007cc:	a1 a8 ef 10 80       	mov    0x8010efa8,%eax
801007d1:	a3 a4 ef 10 80       	mov    %eax,0x8010efa4
801007d6:	83 ec 0c             	sub    $0xc,%esp
801007d9:	68 a0 ef 10 80       	push   $0x8010efa0
801007de:	e8 1c 30 00 00       	call   801037ff <wakeup>
801007e3:	83 c4 10             	add    $0x10,%esp
801007e6:	eb 3e                	jmp    80100826 <consoleintr+0xe8>
801007e8:	a3 a8 ef 10 80       	mov    %eax,0x8010efa8
801007ed:	b8 00 01 00 00       	mov    $0x100,%eax
801007f2:	e8 ef fc ff ff       	call   801004e6 <consputc>
801007f7:	a1 a8 ef 10 80       	mov    0x8010efa8,%eax
801007fc:	3b 05 a4 ef 10 80    	cmp    0x8010efa4,%eax
80100802:	74 22                	je     80100826 <consoleintr+0xe8>
80100804:	83 e8 01             	sub    $0x1,%eax
80100807:	89 c2                	mov    %eax,%edx
80100809:	83 e2 7f             	and    $0x7f,%edx
8010080c:	80 ba 20 ef 10 80 0a 	cmpb   $0xa,-0x7fef10e0(%edx)
80100813:	75 d3                	jne    801007e8 <consoleintr+0xaa>
80100815:	eb 0f                	jmp    80100826 <consoleintr+0xe8>
80100817:	bf 0a 00 00 00       	mov    $0xa,%edi
8010081c:	e9 70 ff ff ff       	jmp    80100791 <consoleintr+0x53>
80100821:	be 01 00 00 00       	mov    $0x1,%esi
80100826:	ff d3                	call   *%ebx
80100828:	89 c7                	mov    %eax,%edi
8010082a:	85 c0                	test   %eax,%eax
8010082c:	78 3d                	js     8010086b <consoleintr+0x12d>
8010082e:	83 ff 10             	cmp    $0x10,%edi
80100831:	74 ee                	je     80100821 <consoleintr+0xe3>
80100833:	83 ff 10             	cmp    $0x10,%edi
80100836:	0f 8e 25 ff ff ff    	jle    80100761 <consoleintr+0x23>
8010083c:	83 ff 15             	cmp    $0x15,%edi
8010083f:	74 b6                	je     801007f7 <consoleintr+0xb9>
80100841:	83 ff 7f             	cmp    $0x7f,%edi
80100844:	0f 85 20 ff ff ff    	jne    8010076a <consoleintr+0x2c>
8010084a:	a1 a8 ef 10 80       	mov    0x8010efa8,%eax
8010084f:	3b 05 a4 ef 10 80    	cmp    0x8010efa4,%eax
80100855:	74 cf                	je     80100826 <consoleintr+0xe8>
80100857:	83 e8 01             	sub    $0x1,%eax
8010085a:	a3 a8 ef 10 80       	mov    %eax,0x8010efa8
8010085f:	b8 00 01 00 00       	mov    $0x100,%eax
80100864:	e8 7d fc ff ff       	call   801004e6 <consputc>
80100869:	eb bb                	jmp    80100826 <consoleintr+0xe8>
8010086b:	83 ec 0c             	sub    $0xc,%esp
8010086e:	68 20 95 10 80       	push   $0x80109520
80100873:	e8 82 33 00 00       	call   80103bfa <release>
80100878:	83 c4 10             	add    $0x10,%esp
8010087b:	85 f6                	test   %esi,%esi
8010087d:	75 08                	jne    80100887 <consoleintr+0x149>
8010087f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100882:	5b                   	pop    %ebx
80100883:	5e                   	pop    %esi
80100884:	5f                   	pop    %edi
80100885:	5d                   	pop    %ebp
80100886:	c3                   	ret    
80100887:	e8 10 30 00 00       	call   8010389c <procdump>
8010088c:	eb f1                	jmp    8010087f <consoleintr+0x141>

8010088e <consoleinit>:
8010088e:	55                   	push   %ebp
8010088f:	89 e5                	mov    %esp,%ebp
80100891:	83 ec 10             	sub    $0x10,%esp
80100894:	68 e8 65 10 80       	push   $0x801065e8
80100899:	68 20 95 10 80       	push   $0x80109520
8010089e:	e8 b6 31 00 00       	call   80103a59 <initlock>
801008a3:	c7 05 6c f9 10 80 ac 	movl   $0x801005ac,0x8010f96c
801008aa:	05 10 80 
801008ad:	c7 05 68 f9 10 80 68 	movl   $0x80100268,0x8010f968
801008b4:	02 10 80 
801008b7:	c7 05 54 95 10 80 01 	movl   $0x1,0x80109554
801008be:	00 00 00 
801008c1:	83 c4 08             	add    $0x8,%esp
801008c4:	6a 00                	push   $0x0
801008c6:	6a 01                	push   $0x1
801008c8:	e8 b1 16 00 00       	call   80101f7e <ioapicenable>
801008cd:	83 c4 10             	add    $0x10,%esp
801008d0:	c9                   	leave  
801008d1:	c3                   	ret    

801008d2 <exec>:
801008d2:	55                   	push   %ebp
801008d3:	89 e5                	mov    %esp,%ebp
801008d5:	57                   	push   %edi
801008d6:	56                   	push   %esi
801008d7:	53                   	push   %ebx
801008d8:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
801008de:	e8 13 29 00 00       	call   801031f6 <myproc>
801008e3:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
801008e9:	e8 c0 1e 00 00       	call   801027ae <begin_op>
801008ee:	83 ec 0c             	sub    $0xc,%esp
801008f1:	ff 75 08             	pushl  0x8(%ebp)
801008f4:	e8 e8 12 00 00       	call   80101be1 <namei>
801008f9:	83 c4 10             	add    $0x10,%esp
801008fc:	85 c0                	test   %eax,%eax
801008fe:	74 4a                	je     8010094a <exec+0x78>
80100900:	89 c3                	mov    %eax,%ebx
80100902:	83 ec 0c             	sub    $0xc,%esp
80100905:	50                   	push   %eax
80100906:	e8 76 0c 00 00       	call   80101581 <ilock>
8010090b:	6a 34                	push   $0x34
8010090d:	6a 00                	push   $0x0
8010090f:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100915:	50                   	push   %eax
80100916:	53                   	push   %ebx
80100917:	e8 57 0e 00 00       	call   80101773 <readi>
8010091c:	83 c4 20             	add    $0x20,%esp
8010091f:	83 f8 34             	cmp    $0x34,%eax
80100922:	74 42                	je     80100966 <exec+0x94>
80100924:	85 db                	test   %ebx,%ebx
80100926:	0f 84 dd 02 00 00    	je     80100c09 <exec+0x337>
8010092c:	83 ec 0c             	sub    $0xc,%esp
8010092f:	53                   	push   %ebx
80100930:	e8 f3 0d 00 00       	call   80101728 <iunlockput>
80100935:	e8 ee 1e 00 00       	call   80102828 <end_op>
8010093a:	83 c4 10             	add    $0x10,%esp
8010093d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100942:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100945:	5b                   	pop    %ebx
80100946:	5e                   	pop    %esi
80100947:	5f                   	pop    %edi
80100948:	5d                   	pop    %ebp
80100949:	c3                   	ret    
8010094a:	e8 d9 1e 00 00       	call   80102828 <end_op>
8010094f:	83 ec 0c             	sub    $0xc,%esp
80100952:	68 01 66 10 80       	push   $0x80106601
80100957:	e8 af fc ff ff       	call   8010060b <cprintf>
8010095c:	83 c4 10             	add    $0x10,%esp
8010095f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100964:	eb dc                	jmp    80100942 <exec+0x70>
80100966:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
8010096d:	45 4c 46 
80100970:	75 b2                	jne    80100924 <exec+0x52>
80100972:	e8 b9 59 00 00       	call   80106330 <setupkvm>
80100977:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
8010097d:	85 c0                	test   %eax,%eax
8010097f:	0f 84 06 01 00 00    	je     80100a8b <exec+0x1b9>
80100985:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
8010098b:	bf 00 00 00 00       	mov    $0x0,%edi
80100990:	be 00 00 00 00       	mov    $0x0,%esi
80100995:	eb 0c                	jmp    801009a3 <exec+0xd1>
80100997:	83 c6 01             	add    $0x1,%esi
8010099a:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
801009a0:	83 c0 20             	add    $0x20,%eax
801009a3:	0f b7 95 50 ff ff ff 	movzwl -0xb0(%ebp),%edx
801009aa:	39 f2                	cmp    %esi,%edx
801009ac:	0f 8e 98 00 00 00    	jle    80100a4a <exec+0x178>
801009b2:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
801009b8:	6a 20                	push   $0x20
801009ba:	50                   	push   %eax
801009bb:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
801009c1:	50                   	push   %eax
801009c2:	53                   	push   %ebx
801009c3:	e8 ab 0d 00 00       	call   80101773 <readi>
801009c8:	83 c4 10             	add    $0x10,%esp
801009cb:	83 f8 20             	cmp    $0x20,%eax
801009ce:	0f 85 b7 00 00 00    	jne    80100a8b <exec+0x1b9>
801009d4:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
801009db:	75 ba                	jne    80100997 <exec+0xc5>
801009dd:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
801009e3:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
801009e9:	0f 82 9c 00 00 00    	jb     80100a8b <exec+0x1b9>
801009ef:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
801009f5:	0f 82 90 00 00 00    	jb     80100a8b <exec+0x1b9>
801009fb:	83 ec 04             	sub    $0x4,%esp
801009fe:	50                   	push   %eax
801009ff:	57                   	push   %edi
80100a00:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100a06:	e8 ca 57 00 00       	call   801061d5 <allocuvm>
80100a0b:	89 c7                	mov    %eax,%edi
80100a0d:	83 c4 10             	add    $0x10,%esp
80100a10:	85 c0                	test   %eax,%eax
80100a12:	74 77                	je     80100a8b <exec+0x1b9>
80100a14:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100a1a:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100a1f:	75 6a                	jne    80100a8b <exec+0x1b9>
80100a21:	83 ec 0c             	sub    $0xc,%esp
80100a24:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100a2a:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100a30:	53                   	push   %ebx
80100a31:	50                   	push   %eax
80100a32:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100a38:	e8 66 56 00 00       	call   801060a3 <loaduvm>
80100a3d:	83 c4 20             	add    $0x20,%esp
80100a40:	85 c0                	test   %eax,%eax
80100a42:	0f 89 4f ff ff ff    	jns    80100997 <exec+0xc5>
80100a48:	eb 41                	jmp    80100a8b <exec+0x1b9>
80100a4a:	83 ec 0c             	sub    $0xc,%esp
80100a4d:	53                   	push   %ebx
80100a4e:	e8 d5 0c 00 00       	call   80101728 <iunlockput>
80100a53:	e8 d0 1d 00 00       	call   80102828 <end_op>
80100a58:	8d 87 ff 0f 00 00    	lea    0xfff(%edi),%eax
80100a5e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80100a63:	83 c4 0c             	add    $0xc,%esp
80100a66:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100a6c:	52                   	push   %edx
80100a6d:	50                   	push   %eax
80100a6e:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100a74:	e8 5c 57 00 00       	call   801061d5 <allocuvm>
80100a79:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100a7f:	83 c4 10             	add    $0x10,%esp
80100a82:	85 c0                	test   %eax,%eax
80100a84:	75 24                	jne    80100aaa <exec+0x1d8>
80100a86:	bb 00 00 00 00       	mov    $0x0,%ebx
80100a8b:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100a91:	85 c0                	test   %eax,%eax
80100a93:	0f 84 8b fe ff ff    	je     80100924 <exec+0x52>
80100a99:	83 ec 0c             	sub    $0xc,%esp
80100a9c:	50                   	push   %eax
80100a9d:	e8 1e 58 00 00       	call   801062c0 <freevm>
80100aa2:	83 c4 10             	add    $0x10,%esp
80100aa5:	e9 7a fe ff ff       	jmp    80100924 <exec+0x52>
80100aaa:	89 c7                	mov    %eax,%edi
80100aac:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100ab2:	83 ec 08             	sub    $0x8,%esp
80100ab5:	50                   	push   %eax
80100ab6:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100abc:	e8 f4 58 00 00       	call   801063b5 <clearpteu>
80100ac1:	83 c4 10             	add    $0x10,%esp
80100ac4:	bb 00 00 00 00       	mov    $0x0,%ebx
80100ac9:	8b 45 0c             	mov    0xc(%ebp),%eax
80100acc:	8d 34 98             	lea    (%eax,%ebx,4),%esi
80100acf:	8b 06                	mov    (%esi),%eax
80100ad1:	85 c0                	test   %eax,%eax
80100ad3:	74 4d                	je     80100b22 <exec+0x250>
80100ad5:	83 fb 1f             	cmp    $0x1f,%ebx
80100ad8:	0f 87 0d 01 00 00    	ja     80100beb <exec+0x319>
80100ade:	83 ec 0c             	sub    $0xc,%esp
80100ae1:	50                   	push   %eax
80100ae2:	e8 fc 32 00 00       	call   80103de3 <strlen>
80100ae7:	29 c7                	sub    %eax,%edi
80100ae9:	83 ef 01             	sub    $0x1,%edi
80100aec:	83 e7 fc             	and    $0xfffffffc,%edi
80100aef:	83 c4 04             	add    $0x4,%esp
80100af2:	ff 36                	pushl  (%esi)
80100af4:	e8 ea 32 00 00       	call   80103de3 <strlen>
80100af9:	83 c0 01             	add    $0x1,%eax
80100afc:	50                   	push   %eax
80100afd:	ff 36                	pushl  (%esi)
80100aff:	57                   	push   %edi
80100b00:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100b06:	e8 f8 59 00 00       	call   80106503 <copyout>
80100b0b:	83 c4 20             	add    $0x20,%esp
80100b0e:	85 c0                	test   %eax,%eax
80100b10:	0f 88 df 00 00 00    	js     80100bf5 <exec+0x323>
80100b16:	89 bc 9d 64 ff ff ff 	mov    %edi,-0x9c(%ebp,%ebx,4)
80100b1d:	83 c3 01             	add    $0x1,%ebx
80100b20:	eb a7                	jmp    80100ac9 <exec+0x1f7>
80100b22:	c7 84 9d 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%ebx,4)
80100b29:	00 00 00 00 
80100b2d:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100b34:	ff ff ff 
80100b37:	89 9d 5c ff ff ff    	mov    %ebx,-0xa4(%ebp)
80100b3d:	8d 04 9d 04 00 00 00 	lea    0x4(,%ebx,4),%eax
80100b44:	89 f9                	mov    %edi,%ecx
80100b46:	29 c1                	sub    %eax,%ecx
80100b48:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
80100b4e:	8d 04 9d 10 00 00 00 	lea    0x10(,%ebx,4),%eax
80100b55:	29 c7                	sub    %eax,%edi
80100b57:	50                   	push   %eax
80100b58:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
80100b5e:	50                   	push   %eax
80100b5f:	57                   	push   %edi
80100b60:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100b66:	e8 98 59 00 00       	call   80106503 <copyout>
80100b6b:	83 c4 10             	add    $0x10,%esp
80100b6e:	85 c0                	test   %eax,%eax
80100b70:	0f 88 89 00 00 00    	js     80100bff <exec+0x32d>
80100b76:	8b 55 08             	mov    0x8(%ebp),%edx
80100b79:	89 d0                	mov    %edx,%eax
80100b7b:	eb 03                	jmp    80100b80 <exec+0x2ae>
80100b7d:	83 c0 01             	add    $0x1,%eax
80100b80:	0f b6 08             	movzbl (%eax),%ecx
80100b83:	84 c9                	test   %cl,%cl
80100b85:	74 0a                	je     80100b91 <exec+0x2bf>
80100b87:	80 f9 2f             	cmp    $0x2f,%cl
80100b8a:	75 f1                	jne    80100b7d <exec+0x2ab>
80100b8c:	8d 50 01             	lea    0x1(%eax),%edx
80100b8f:	eb ec                	jmp    80100b7d <exec+0x2ab>
80100b91:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100b97:	89 f0                	mov    %esi,%eax
80100b99:	83 c0 6c             	add    $0x6c,%eax
80100b9c:	83 ec 04             	sub    $0x4,%esp
80100b9f:	6a 10                	push   $0x10
80100ba1:	52                   	push   %edx
80100ba2:	50                   	push   %eax
80100ba3:	e8 00 32 00 00       	call   80103da8 <safestrcpy>
80100ba8:	8b 5e 04             	mov    0x4(%esi),%ebx
80100bab:	8b 8d ec fe ff ff    	mov    -0x114(%ebp),%ecx
80100bb1:	89 4e 04             	mov    %ecx,0x4(%esi)
80100bb4:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
80100bba:	89 0e                	mov    %ecx,(%esi)
80100bbc:	8b 46 18             	mov    0x18(%esi),%eax
80100bbf:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100bc5:	89 50 38             	mov    %edx,0x38(%eax)
80100bc8:	8b 46 18             	mov    0x18(%esi),%eax
80100bcb:	89 78 44             	mov    %edi,0x44(%eax)
80100bce:	89 34 24             	mov    %esi,(%esp)
80100bd1:	e8 4d 53 00 00       	call   80105f23 <switchuvm>
80100bd6:	89 1c 24             	mov    %ebx,(%esp)
80100bd9:	e8 e2 56 00 00       	call   801062c0 <freevm>
80100bde:	83 c4 10             	add    $0x10,%esp
80100be1:	b8 00 00 00 00       	mov    $0x0,%eax
80100be6:	e9 57 fd ff ff       	jmp    80100942 <exec+0x70>
80100beb:	bb 00 00 00 00       	mov    $0x0,%ebx
80100bf0:	e9 96 fe ff ff       	jmp    80100a8b <exec+0x1b9>
80100bf5:	bb 00 00 00 00       	mov    $0x0,%ebx
80100bfa:	e9 8c fe ff ff       	jmp    80100a8b <exec+0x1b9>
80100bff:	bb 00 00 00 00       	mov    $0x0,%ebx
80100c04:	e9 82 fe ff ff       	jmp    80100a8b <exec+0x1b9>
80100c09:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c0e:	e9 2f fd ff ff       	jmp    80100942 <exec+0x70>

80100c13 <fileinit>:
80100c13:	55                   	push   %ebp
80100c14:	89 e5                	mov    %esp,%ebp
80100c16:	83 ec 10             	sub    $0x10,%esp
80100c19:	68 0d 66 10 80       	push   $0x8010660d
80100c1e:	68 c0 ef 10 80       	push   $0x8010efc0
80100c23:	e8 31 2e 00 00       	call   80103a59 <initlock>
80100c28:	83 c4 10             	add    $0x10,%esp
80100c2b:	c9                   	leave  
80100c2c:	c3                   	ret    

80100c2d <filealloc>:
80100c2d:	55                   	push   %ebp
80100c2e:	89 e5                	mov    %esp,%ebp
80100c30:	53                   	push   %ebx
80100c31:	83 ec 10             	sub    $0x10,%esp
80100c34:	68 c0 ef 10 80       	push   $0x8010efc0
80100c39:	e8 57 2f 00 00       	call   80103b95 <acquire>
80100c3e:	83 c4 10             	add    $0x10,%esp
80100c41:	bb f4 ef 10 80       	mov    $0x8010eff4,%ebx
80100c46:	81 fb 54 f9 10 80    	cmp    $0x8010f954,%ebx
80100c4c:	73 29                	jae    80100c77 <filealloc+0x4a>
80100c4e:	83 7b 04 00          	cmpl   $0x0,0x4(%ebx)
80100c52:	74 05                	je     80100c59 <filealloc+0x2c>
80100c54:	83 c3 18             	add    $0x18,%ebx
80100c57:	eb ed                	jmp    80100c46 <filealloc+0x19>
80100c59:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100c60:	83 ec 0c             	sub    $0xc,%esp
80100c63:	68 c0 ef 10 80       	push   $0x8010efc0
80100c68:	e8 8d 2f 00 00       	call   80103bfa <release>
80100c6d:	83 c4 10             	add    $0x10,%esp
80100c70:	89 d8                	mov    %ebx,%eax
80100c72:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100c75:	c9                   	leave  
80100c76:	c3                   	ret    
80100c77:	83 ec 0c             	sub    $0xc,%esp
80100c7a:	68 c0 ef 10 80       	push   $0x8010efc0
80100c7f:	e8 76 2f 00 00       	call   80103bfa <release>
80100c84:	83 c4 10             	add    $0x10,%esp
80100c87:	bb 00 00 00 00       	mov    $0x0,%ebx
80100c8c:	eb e2                	jmp    80100c70 <filealloc+0x43>

80100c8e <filedup>:
80100c8e:	55                   	push   %ebp
80100c8f:	89 e5                	mov    %esp,%ebp
80100c91:	53                   	push   %ebx
80100c92:	83 ec 10             	sub    $0x10,%esp
80100c95:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100c98:	68 c0 ef 10 80       	push   $0x8010efc0
80100c9d:	e8 f3 2e 00 00       	call   80103b95 <acquire>
80100ca2:	8b 43 04             	mov    0x4(%ebx),%eax
80100ca5:	83 c4 10             	add    $0x10,%esp
80100ca8:	85 c0                	test   %eax,%eax
80100caa:	7e 1a                	jle    80100cc6 <filedup+0x38>
80100cac:	83 c0 01             	add    $0x1,%eax
80100caf:	89 43 04             	mov    %eax,0x4(%ebx)
80100cb2:	83 ec 0c             	sub    $0xc,%esp
80100cb5:	68 c0 ef 10 80       	push   $0x8010efc0
80100cba:	e8 3b 2f 00 00       	call   80103bfa <release>
80100cbf:	89 d8                	mov    %ebx,%eax
80100cc1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100cc4:	c9                   	leave  
80100cc5:	c3                   	ret    
80100cc6:	83 ec 0c             	sub    $0xc,%esp
80100cc9:	68 14 66 10 80       	push   $0x80106614
80100cce:	e8 75 f6 ff ff       	call   80100348 <panic>

80100cd3 <fileclose>:
80100cd3:	55                   	push   %ebp
80100cd4:	89 e5                	mov    %esp,%ebp
80100cd6:	53                   	push   %ebx
80100cd7:	83 ec 30             	sub    $0x30,%esp
80100cda:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100cdd:	68 c0 ef 10 80       	push   $0x8010efc0
80100ce2:	e8 ae 2e 00 00       	call   80103b95 <acquire>
80100ce7:	8b 43 04             	mov    0x4(%ebx),%eax
80100cea:	83 c4 10             	add    $0x10,%esp
80100ced:	85 c0                	test   %eax,%eax
80100cef:	7e 1f                	jle    80100d10 <fileclose+0x3d>
80100cf1:	83 e8 01             	sub    $0x1,%eax
80100cf4:	89 43 04             	mov    %eax,0x4(%ebx)
80100cf7:	85 c0                	test   %eax,%eax
80100cf9:	7e 22                	jle    80100d1d <fileclose+0x4a>
80100cfb:	83 ec 0c             	sub    $0xc,%esp
80100cfe:	68 c0 ef 10 80       	push   $0x8010efc0
80100d03:	e8 f2 2e 00 00       	call   80103bfa <release>
80100d08:	83 c4 10             	add    $0x10,%esp
80100d0b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100d0e:	c9                   	leave  
80100d0f:	c3                   	ret    
80100d10:	83 ec 0c             	sub    $0xc,%esp
80100d13:	68 1c 66 10 80       	push   $0x8010661c
80100d18:	e8 2b f6 ff ff       	call   80100348 <panic>
80100d1d:	8b 03                	mov    (%ebx),%eax
80100d1f:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100d22:	8b 43 08             	mov    0x8(%ebx),%eax
80100d25:	89 45 e8             	mov    %eax,-0x18(%ebp)
80100d28:	8b 43 0c             	mov    0xc(%ebx),%eax
80100d2b:	89 45 ec             	mov    %eax,-0x14(%ebp)
80100d2e:	8b 43 10             	mov    0x10(%ebx),%eax
80100d31:	89 45 f0             	mov    %eax,-0x10(%ebp)
80100d34:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
80100d3b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100d41:	83 ec 0c             	sub    $0xc,%esp
80100d44:	68 c0 ef 10 80       	push   $0x8010efc0
80100d49:	e8 ac 2e 00 00       	call   80103bfa <release>
80100d4e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100d51:	83 c4 10             	add    $0x10,%esp
80100d54:	83 f8 01             	cmp    $0x1,%eax
80100d57:	74 1f                	je     80100d78 <fileclose+0xa5>
80100d59:	83 f8 02             	cmp    $0x2,%eax
80100d5c:	75 ad                	jne    80100d0b <fileclose+0x38>
80100d5e:	e8 4b 1a 00 00       	call   801027ae <begin_op>
80100d63:	83 ec 0c             	sub    $0xc,%esp
80100d66:	ff 75 f0             	pushl  -0x10(%ebp)
80100d69:	e8 1a 09 00 00       	call   80101688 <iput>
80100d6e:	e8 b5 1a 00 00       	call   80102828 <end_op>
80100d73:	83 c4 10             	add    $0x10,%esp
80100d76:	eb 93                	jmp    80100d0b <fileclose+0x38>
80100d78:	83 ec 08             	sub    $0x8,%esp
80100d7b:	0f be 45 e9          	movsbl -0x17(%ebp),%eax
80100d7f:	50                   	push   %eax
80100d80:	ff 75 ec             	pushl  -0x14(%ebp)
80100d83:	e8 9a 20 00 00       	call   80102e22 <pipeclose>
80100d88:	83 c4 10             	add    $0x10,%esp
80100d8b:	e9 7b ff ff ff       	jmp    80100d0b <fileclose+0x38>

80100d90 <filestat>:
80100d90:	55                   	push   %ebp
80100d91:	89 e5                	mov    %esp,%ebp
80100d93:	53                   	push   %ebx
80100d94:	83 ec 04             	sub    $0x4,%esp
80100d97:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100d9a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100d9d:	75 31                	jne    80100dd0 <filestat+0x40>
80100d9f:	83 ec 0c             	sub    $0xc,%esp
80100da2:	ff 73 10             	pushl  0x10(%ebx)
80100da5:	e8 d7 07 00 00       	call   80101581 <ilock>
80100daa:	83 c4 08             	add    $0x8,%esp
80100dad:	ff 75 0c             	pushl  0xc(%ebp)
80100db0:	ff 73 10             	pushl  0x10(%ebx)
80100db3:	e8 90 09 00 00       	call   80101748 <stati>
80100db8:	83 c4 04             	add    $0x4,%esp
80100dbb:	ff 73 10             	pushl  0x10(%ebx)
80100dbe:	e8 80 08 00 00       	call   80101643 <iunlock>
80100dc3:	83 c4 10             	add    $0x10,%esp
80100dc6:	b8 00 00 00 00       	mov    $0x0,%eax
80100dcb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dce:	c9                   	leave  
80100dcf:	c3                   	ret    
80100dd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100dd5:	eb f4                	jmp    80100dcb <filestat+0x3b>

80100dd7 <fileread>:
80100dd7:	55                   	push   %ebp
80100dd8:	89 e5                	mov    %esp,%ebp
80100dda:	56                   	push   %esi
80100ddb:	53                   	push   %ebx
80100ddc:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100ddf:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100de3:	74 70                	je     80100e55 <fileread+0x7e>
80100de5:	8b 03                	mov    (%ebx),%eax
80100de7:	83 f8 01             	cmp    $0x1,%eax
80100dea:	74 44                	je     80100e30 <fileread+0x59>
80100dec:	83 f8 02             	cmp    $0x2,%eax
80100def:	75 57                	jne    80100e48 <fileread+0x71>
80100df1:	83 ec 0c             	sub    $0xc,%esp
80100df4:	ff 73 10             	pushl  0x10(%ebx)
80100df7:	e8 85 07 00 00       	call   80101581 <ilock>
80100dfc:	ff 75 10             	pushl  0x10(%ebp)
80100dff:	ff 73 14             	pushl  0x14(%ebx)
80100e02:	ff 75 0c             	pushl  0xc(%ebp)
80100e05:	ff 73 10             	pushl  0x10(%ebx)
80100e08:	e8 66 09 00 00       	call   80101773 <readi>
80100e0d:	89 c6                	mov    %eax,%esi
80100e0f:	83 c4 20             	add    $0x20,%esp
80100e12:	85 c0                	test   %eax,%eax
80100e14:	7e 03                	jle    80100e19 <fileread+0x42>
80100e16:	01 43 14             	add    %eax,0x14(%ebx)
80100e19:	83 ec 0c             	sub    $0xc,%esp
80100e1c:	ff 73 10             	pushl  0x10(%ebx)
80100e1f:	e8 1f 08 00 00       	call   80101643 <iunlock>
80100e24:	83 c4 10             	add    $0x10,%esp
80100e27:	89 f0                	mov    %esi,%eax
80100e29:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100e2c:	5b                   	pop    %ebx
80100e2d:	5e                   	pop    %esi
80100e2e:	5d                   	pop    %ebp
80100e2f:	c3                   	ret    
80100e30:	83 ec 04             	sub    $0x4,%esp
80100e33:	ff 75 10             	pushl  0x10(%ebp)
80100e36:	ff 75 0c             	pushl  0xc(%ebp)
80100e39:	ff 73 0c             	pushl  0xc(%ebx)
80100e3c:	e8 39 21 00 00       	call   80102f7a <piperead>
80100e41:	89 c6                	mov    %eax,%esi
80100e43:	83 c4 10             	add    $0x10,%esp
80100e46:	eb df                	jmp    80100e27 <fileread+0x50>
80100e48:	83 ec 0c             	sub    $0xc,%esp
80100e4b:	68 26 66 10 80       	push   $0x80106626
80100e50:	e8 f3 f4 ff ff       	call   80100348 <panic>
80100e55:	be ff ff ff ff       	mov    $0xffffffff,%esi
80100e5a:	eb cb                	jmp    80100e27 <fileread+0x50>

80100e5c <filewrite>:
80100e5c:	55                   	push   %ebp
80100e5d:	89 e5                	mov    %esp,%ebp
80100e5f:	57                   	push   %edi
80100e60:	56                   	push   %esi
80100e61:	53                   	push   %ebx
80100e62:	83 ec 1c             	sub    $0x1c,%esp
80100e65:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e68:	80 7b 09 00          	cmpb   $0x0,0x9(%ebx)
80100e6c:	0f 84 c5 00 00 00    	je     80100f37 <filewrite+0xdb>
80100e72:	8b 03                	mov    (%ebx),%eax
80100e74:	83 f8 01             	cmp    $0x1,%eax
80100e77:	74 10                	je     80100e89 <filewrite+0x2d>
80100e79:	83 f8 02             	cmp    $0x2,%eax
80100e7c:	0f 85 a8 00 00 00    	jne    80100f2a <filewrite+0xce>
80100e82:	bf 00 00 00 00       	mov    $0x0,%edi
80100e87:	eb 67                	jmp    80100ef0 <filewrite+0x94>
80100e89:	83 ec 04             	sub    $0x4,%esp
80100e8c:	ff 75 10             	pushl  0x10(%ebp)
80100e8f:	ff 75 0c             	pushl  0xc(%ebp)
80100e92:	ff 73 0c             	pushl  0xc(%ebx)
80100e95:	e8 14 20 00 00       	call   80102eae <pipewrite>
80100e9a:	83 c4 10             	add    $0x10,%esp
80100e9d:	e9 80 00 00 00       	jmp    80100f22 <filewrite+0xc6>
80100ea2:	e8 07 19 00 00       	call   801027ae <begin_op>
80100ea7:	83 ec 0c             	sub    $0xc,%esp
80100eaa:	ff 73 10             	pushl  0x10(%ebx)
80100ead:	e8 cf 06 00 00       	call   80101581 <ilock>
80100eb2:	89 f8                	mov    %edi,%eax
80100eb4:	03 45 0c             	add    0xc(%ebp),%eax
80100eb7:	ff 75 e4             	pushl  -0x1c(%ebp)
80100eba:	ff 73 14             	pushl  0x14(%ebx)
80100ebd:	50                   	push   %eax
80100ebe:	ff 73 10             	pushl  0x10(%ebx)
80100ec1:	e8 aa 09 00 00       	call   80101870 <writei>
80100ec6:	89 c6                	mov    %eax,%esi
80100ec8:	83 c4 20             	add    $0x20,%esp
80100ecb:	85 c0                	test   %eax,%eax
80100ecd:	7e 03                	jle    80100ed2 <filewrite+0x76>
80100ecf:	01 43 14             	add    %eax,0x14(%ebx)
80100ed2:	83 ec 0c             	sub    $0xc,%esp
80100ed5:	ff 73 10             	pushl  0x10(%ebx)
80100ed8:	e8 66 07 00 00       	call   80101643 <iunlock>
80100edd:	e8 46 19 00 00       	call   80102828 <end_op>
80100ee2:	83 c4 10             	add    $0x10,%esp
80100ee5:	85 f6                	test   %esi,%esi
80100ee7:	78 31                	js     80100f1a <filewrite+0xbe>
80100ee9:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
80100eec:	75 1f                	jne    80100f0d <filewrite+0xb1>
80100eee:	01 f7                	add    %esi,%edi
80100ef0:	3b 7d 10             	cmp    0x10(%ebp),%edi
80100ef3:	7d 25                	jge    80100f1a <filewrite+0xbe>
80100ef5:	8b 45 10             	mov    0x10(%ebp),%eax
80100ef8:	29 f8                	sub    %edi,%eax
80100efa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100efd:	3d 00 06 00 00       	cmp    $0x600,%eax
80100f02:	7e 9e                	jle    80100ea2 <filewrite+0x46>
80100f04:	c7 45 e4 00 06 00 00 	movl   $0x600,-0x1c(%ebp)
80100f0b:	eb 95                	jmp    80100ea2 <filewrite+0x46>
80100f0d:	83 ec 0c             	sub    $0xc,%esp
80100f10:	68 2f 66 10 80       	push   $0x8010662f
80100f15:	e8 2e f4 ff ff       	call   80100348 <panic>
80100f1a:	3b 7d 10             	cmp    0x10(%ebp),%edi
80100f1d:	75 1f                	jne    80100f3e <filewrite+0xe2>
80100f1f:	8b 45 10             	mov    0x10(%ebp),%eax
80100f22:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f25:	5b                   	pop    %ebx
80100f26:	5e                   	pop    %esi
80100f27:	5f                   	pop    %edi
80100f28:	5d                   	pop    %ebp
80100f29:	c3                   	ret    
80100f2a:	83 ec 0c             	sub    $0xc,%esp
80100f2d:	68 35 66 10 80       	push   $0x80106635
80100f32:	e8 11 f4 ff ff       	call   80100348 <panic>
80100f37:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f3c:	eb e4                	jmp    80100f22 <filewrite+0xc6>
80100f3e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f43:	eb dd                	jmp    80100f22 <filewrite+0xc6>

80100f45 <skipelem>:
80100f45:	55                   	push   %ebp
80100f46:	89 e5                	mov    %esp,%ebp
80100f48:	57                   	push   %edi
80100f49:	56                   	push   %esi
80100f4a:	53                   	push   %ebx
80100f4b:	83 ec 0c             	sub    $0xc,%esp
80100f4e:	89 d7                	mov    %edx,%edi
80100f50:	eb 03                	jmp    80100f55 <skipelem+0x10>
80100f52:	83 c0 01             	add    $0x1,%eax
80100f55:	0f b6 10             	movzbl (%eax),%edx
80100f58:	80 fa 2f             	cmp    $0x2f,%dl
80100f5b:	74 f5                	je     80100f52 <skipelem+0xd>
80100f5d:	84 d2                	test   %dl,%dl
80100f5f:	74 59                	je     80100fba <skipelem+0x75>
80100f61:	89 c3                	mov    %eax,%ebx
80100f63:	eb 03                	jmp    80100f68 <skipelem+0x23>
80100f65:	83 c3 01             	add    $0x1,%ebx
80100f68:	0f b6 13             	movzbl (%ebx),%edx
80100f6b:	80 fa 2f             	cmp    $0x2f,%dl
80100f6e:	0f 95 c1             	setne  %cl
80100f71:	84 d2                	test   %dl,%dl
80100f73:	0f 95 c2             	setne  %dl
80100f76:	84 d1                	test   %dl,%cl
80100f78:	75 eb                	jne    80100f65 <skipelem+0x20>
80100f7a:	89 de                	mov    %ebx,%esi
80100f7c:	29 c6                	sub    %eax,%esi
80100f7e:	83 fe 0d             	cmp    $0xd,%esi
80100f81:	7e 11                	jle    80100f94 <skipelem+0x4f>
80100f83:	83 ec 04             	sub    $0x4,%esp
80100f86:	6a 0e                	push   $0xe
80100f88:	50                   	push   %eax
80100f89:	57                   	push   %edi
80100f8a:	e8 2d 2d 00 00       	call   80103cbc <memmove>
80100f8f:	83 c4 10             	add    $0x10,%esp
80100f92:	eb 17                	jmp    80100fab <skipelem+0x66>
80100f94:	83 ec 04             	sub    $0x4,%esp
80100f97:	56                   	push   %esi
80100f98:	50                   	push   %eax
80100f99:	57                   	push   %edi
80100f9a:	e8 1d 2d 00 00       	call   80103cbc <memmove>
80100f9f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
80100fa3:	83 c4 10             	add    $0x10,%esp
80100fa6:	eb 03                	jmp    80100fab <skipelem+0x66>
80100fa8:	83 c3 01             	add    $0x1,%ebx
80100fab:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80100fae:	74 f8                	je     80100fa8 <skipelem+0x63>
80100fb0:	89 d8                	mov    %ebx,%eax
80100fb2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb5:	5b                   	pop    %ebx
80100fb6:	5e                   	pop    %esi
80100fb7:	5f                   	pop    %edi
80100fb8:	5d                   	pop    %ebp
80100fb9:	c3                   	ret    
80100fba:	bb 00 00 00 00       	mov    $0x0,%ebx
80100fbf:	eb ef                	jmp    80100fb0 <skipelem+0x6b>

80100fc1 <bzero>:
80100fc1:	55                   	push   %ebp
80100fc2:	89 e5                	mov    %esp,%ebp
80100fc4:	53                   	push   %ebx
80100fc5:	83 ec 0c             	sub    $0xc,%esp
80100fc8:	52                   	push   %edx
80100fc9:	50                   	push   %eax
80100fca:	e8 9d f1 ff ff       	call   8010016c <bread>
80100fcf:	89 c3                	mov    %eax,%ebx
80100fd1:	8d 40 5c             	lea    0x5c(%eax),%eax
80100fd4:	83 c4 0c             	add    $0xc,%esp
80100fd7:	68 00 02 00 00       	push   $0x200
80100fdc:	6a 00                	push   $0x0
80100fde:	50                   	push   %eax
80100fdf:	e8 5d 2c 00 00       	call   80103c41 <memset>
80100fe4:	89 1c 24             	mov    %ebx,(%esp)
80100fe7:	e8 eb 18 00 00       	call   801028d7 <log_write>
80100fec:	89 1c 24             	mov    %ebx,(%esp)
80100fef:	e8 e1 f1 ff ff       	call   801001d5 <brelse>
80100ff4:	83 c4 10             	add    $0x10,%esp
80100ff7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100ffa:	c9                   	leave  
80100ffb:	c3                   	ret    

80100ffc <balloc>:
80100ffc:	55                   	push   %ebp
80100ffd:	89 e5                	mov    %esp,%ebp
80100fff:	57                   	push   %edi
80101000:	56                   	push   %esi
80101001:	53                   	push   %ebx
80101002:	83 ec 1c             	sub    $0x1c,%esp
80101005:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101008:	be 00 00 00 00       	mov    $0x0,%esi
8010100d:	eb 14                	jmp    80101023 <balloc+0x27>
8010100f:	83 ec 0c             	sub    $0xc,%esp
80101012:	ff 75 e4             	pushl  -0x1c(%ebp)
80101015:	e8 bb f1 ff ff       	call   801001d5 <brelse>
8010101a:	81 c6 00 10 00 00    	add    $0x1000,%esi
80101020:	83 c4 10             	add    $0x10,%esp
80101023:	39 35 c0 f9 10 80    	cmp    %esi,0x8010f9c0
80101029:	76 75                	jbe    801010a0 <balloc+0xa4>
8010102b:	8d 86 ff 0f 00 00    	lea    0xfff(%esi),%eax
80101031:	85 f6                	test   %esi,%esi
80101033:	0f 49 c6             	cmovns %esi,%eax
80101036:	c1 f8 0c             	sar    $0xc,%eax
80101039:	03 05 d8 f9 10 80    	add    0x8010f9d8,%eax
8010103f:	83 ec 08             	sub    $0x8,%esp
80101042:	50                   	push   %eax
80101043:	ff 75 d8             	pushl  -0x28(%ebp)
80101046:	e8 21 f1 ff ff       	call   8010016c <bread>
8010104b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010104e:	83 c4 10             	add    $0x10,%esp
80101051:	b8 00 00 00 00       	mov    $0x0,%eax
80101056:	3d ff 0f 00 00       	cmp    $0xfff,%eax
8010105b:	7f b2                	jg     8010100f <balloc+0x13>
8010105d:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
80101060:	89 5d e0             	mov    %ebx,-0x20(%ebp)
80101063:	3b 1d c0 f9 10 80    	cmp    0x8010f9c0,%ebx
80101069:	73 a4                	jae    8010100f <balloc+0x13>
8010106b:	99                   	cltd   
8010106c:	c1 ea 1d             	shr    $0x1d,%edx
8010106f:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
80101072:	83 e1 07             	and    $0x7,%ecx
80101075:	29 d1                	sub    %edx,%ecx
80101077:	ba 01 00 00 00       	mov    $0x1,%edx
8010107c:	d3 e2                	shl    %cl,%edx
8010107e:	8d 48 07             	lea    0x7(%eax),%ecx
80101081:	85 c0                	test   %eax,%eax
80101083:	0f 49 c8             	cmovns %eax,%ecx
80101086:	c1 f9 03             	sar    $0x3,%ecx
80101089:	89 4d dc             	mov    %ecx,-0x24(%ebp)
8010108c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010108f:	0f b6 4c 0f 5c       	movzbl 0x5c(%edi,%ecx,1),%ecx
80101094:	0f b6 f9             	movzbl %cl,%edi
80101097:	85 d7                	test   %edx,%edi
80101099:	74 12                	je     801010ad <balloc+0xb1>
8010109b:	83 c0 01             	add    $0x1,%eax
8010109e:	eb b6                	jmp    80101056 <balloc+0x5a>
801010a0:	83 ec 0c             	sub    $0xc,%esp
801010a3:	68 3f 66 10 80       	push   $0x8010663f
801010a8:	e8 9b f2 ff ff       	call   80100348 <panic>
801010ad:	09 ca                	or     %ecx,%edx
801010af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801010b2:	8b 75 dc             	mov    -0x24(%ebp),%esi
801010b5:	88 54 30 5c          	mov    %dl,0x5c(%eax,%esi,1)
801010b9:	83 ec 0c             	sub    $0xc,%esp
801010bc:	89 c6                	mov    %eax,%esi
801010be:	50                   	push   %eax
801010bf:	e8 13 18 00 00       	call   801028d7 <log_write>
801010c4:	89 34 24             	mov    %esi,(%esp)
801010c7:	e8 09 f1 ff ff       	call   801001d5 <brelse>
801010cc:	89 da                	mov    %ebx,%edx
801010ce:	8b 45 d8             	mov    -0x28(%ebp),%eax
801010d1:	e8 eb fe ff ff       	call   80100fc1 <bzero>
801010d6:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010dc:	5b                   	pop    %ebx
801010dd:	5e                   	pop    %esi
801010de:	5f                   	pop    %edi
801010df:	5d                   	pop    %ebp
801010e0:	c3                   	ret    

801010e1 <bmap>:
801010e1:	55                   	push   %ebp
801010e2:	89 e5                	mov    %esp,%ebp
801010e4:	57                   	push   %edi
801010e5:	56                   	push   %esi
801010e6:	53                   	push   %ebx
801010e7:	83 ec 1c             	sub    $0x1c,%esp
801010ea:	89 c6                	mov    %eax,%esi
801010ec:	89 d7                	mov    %edx,%edi
801010ee:	83 fa 0b             	cmp    $0xb,%edx
801010f1:	77 17                	ja     8010110a <bmap+0x29>
801010f3:	8b 5c 90 5c          	mov    0x5c(%eax,%edx,4),%ebx
801010f7:	85 db                	test   %ebx,%ebx
801010f9:	75 4a                	jne    80101145 <bmap+0x64>
801010fb:	8b 00                	mov    (%eax),%eax
801010fd:	e8 fa fe ff ff       	call   80100ffc <balloc>
80101102:	89 c3                	mov    %eax,%ebx
80101104:	89 44 be 5c          	mov    %eax,0x5c(%esi,%edi,4)
80101108:	eb 3b                	jmp    80101145 <bmap+0x64>
8010110a:	8d 5a f4             	lea    -0xc(%edx),%ebx
8010110d:	83 fb 7f             	cmp    $0x7f,%ebx
80101110:	77 68                	ja     8010117a <bmap+0x99>
80101112:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
80101118:	85 c0                	test   %eax,%eax
8010111a:	74 33                	je     8010114f <bmap+0x6e>
8010111c:	83 ec 08             	sub    $0x8,%esp
8010111f:	50                   	push   %eax
80101120:	ff 36                	pushl  (%esi)
80101122:	e8 45 f0 ff ff       	call   8010016c <bread>
80101127:	89 c7                	mov    %eax,%edi
80101129:	8d 44 98 5c          	lea    0x5c(%eax,%ebx,4),%eax
8010112d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101130:	8b 18                	mov    (%eax),%ebx
80101132:	83 c4 10             	add    $0x10,%esp
80101135:	85 db                	test   %ebx,%ebx
80101137:	74 25                	je     8010115e <bmap+0x7d>
80101139:	83 ec 0c             	sub    $0xc,%esp
8010113c:	57                   	push   %edi
8010113d:	e8 93 f0 ff ff       	call   801001d5 <brelse>
80101142:	83 c4 10             	add    $0x10,%esp
80101145:	89 d8                	mov    %ebx,%eax
80101147:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010114a:	5b                   	pop    %ebx
8010114b:	5e                   	pop    %esi
8010114c:	5f                   	pop    %edi
8010114d:	5d                   	pop    %ebp
8010114e:	c3                   	ret    
8010114f:	8b 06                	mov    (%esi),%eax
80101151:	e8 a6 fe ff ff       	call   80100ffc <balloc>
80101156:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
8010115c:	eb be                	jmp    8010111c <bmap+0x3b>
8010115e:	8b 06                	mov    (%esi),%eax
80101160:	e8 97 fe ff ff       	call   80100ffc <balloc>
80101165:	89 c3                	mov    %eax,%ebx
80101167:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010116a:	89 18                	mov    %ebx,(%eax)
8010116c:	83 ec 0c             	sub    $0xc,%esp
8010116f:	57                   	push   %edi
80101170:	e8 62 17 00 00       	call   801028d7 <log_write>
80101175:	83 c4 10             	add    $0x10,%esp
80101178:	eb bf                	jmp    80101139 <bmap+0x58>
8010117a:	83 ec 0c             	sub    $0xc,%esp
8010117d:	68 55 66 10 80       	push   $0x80106655
80101182:	e8 c1 f1 ff ff       	call   80100348 <panic>

80101187 <iget>:
80101187:	55                   	push   %ebp
80101188:	89 e5                	mov    %esp,%ebp
8010118a:	57                   	push   %edi
8010118b:	56                   	push   %esi
8010118c:	53                   	push   %ebx
8010118d:	83 ec 28             	sub    $0x28,%esp
80101190:	89 c7                	mov    %eax,%edi
80101192:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101195:	68 e0 f9 10 80       	push   $0x8010f9e0
8010119a:	e8 f6 29 00 00       	call   80103b95 <acquire>
8010119f:	83 c4 10             	add    $0x10,%esp
801011a2:	be 00 00 00 00       	mov    $0x0,%esi
801011a7:	bb 14 fa 10 80       	mov    $0x8010fa14,%ebx
801011ac:	eb 0a                	jmp    801011b8 <iget+0x31>
801011ae:	85 f6                	test   %esi,%esi
801011b0:	74 3b                	je     801011ed <iget+0x66>
801011b2:	81 c3 90 00 00 00    	add    $0x90,%ebx
801011b8:	81 fb 34 16 11 80    	cmp    $0x80111634,%ebx
801011be:	73 35                	jae    801011f5 <iget+0x6e>
801011c0:	8b 43 08             	mov    0x8(%ebx),%eax
801011c3:	85 c0                	test   %eax,%eax
801011c5:	7e e7                	jle    801011ae <iget+0x27>
801011c7:	39 3b                	cmp    %edi,(%ebx)
801011c9:	75 e3                	jne    801011ae <iget+0x27>
801011cb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801011ce:	39 4b 04             	cmp    %ecx,0x4(%ebx)
801011d1:	75 db                	jne    801011ae <iget+0x27>
801011d3:	83 c0 01             	add    $0x1,%eax
801011d6:	89 43 08             	mov    %eax,0x8(%ebx)
801011d9:	83 ec 0c             	sub    $0xc,%esp
801011dc:	68 e0 f9 10 80       	push   $0x8010f9e0
801011e1:	e8 14 2a 00 00       	call   80103bfa <release>
801011e6:	83 c4 10             	add    $0x10,%esp
801011e9:	89 de                	mov    %ebx,%esi
801011eb:	eb 32                	jmp    8010121f <iget+0x98>
801011ed:	85 c0                	test   %eax,%eax
801011ef:	75 c1                	jne    801011b2 <iget+0x2b>
801011f1:	89 de                	mov    %ebx,%esi
801011f3:	eb bd                	jmp    801011b2 <iget+0x2b>
801011f5:	85 f6                	test   %esi,%esi
801011f7:	74 30                	je     80101229 <iget+0xa2>
801011f9:	89 3e                	mov    %edi,(%esi)
801011fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801011fe:	89 46 04             	mov    %eax,0x4(%esi)
80101201:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
80101208:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010120f:	83 ec 0c             	sub    $0xc,%esp
80101212:	68 e0 f9 10 80       	push   $0x8010f9e0
80101217:	e8 de 29 00 00       	call   80103bfa <release>
8010121c:	83 c4 10             	add    $0x10,%esp
8010121f:	89 f0                	mov    %esi,%eax
80101221:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101224:	5b                   	pop    %ebx
80101225:	5e                   	pop    %esi
80101226:	5f                   	pop    %edi
80101227:	5d                   	pop    %ebp
80101228:	c3                   	ret    
80101229:	83 ec 0c             	sub    $0xc,%esp
8010122c:	68 68 66 10 80       	push   $0x80106668
80101231:	e8 12 f1 ff ff       	call   80100348 <panic>

80101236 <readsb>:
80101236:	55                   	push   %ebp
80101237:	89 e5                	mov    %esp,%ebp
80101239:	53                   	push   %ebx
8010123a:	83 ec 0c             	sub    $0xc,%esp
8010123d:	6a 01                	push   $0x1
8010123f:	ff 75 08             	pushl  0x8(%ebp)
80101242:	e8 25 ef ff ff       	call   8010016c <bread>
80101247:	89 c3                	mov    %eax,%ebx
80101249:	8d 40 5c             	lea    0x5c(%eax),%eax
8010124c:	83 c4 0c             	add    $0xc,%esp
8010124f:	6a 1c                	push   $0x1c
80101251:	50                   	push   %eax
80101252:	ff 75 0c             	pushl  0xc(%ebp)
80101255:	e8 62 2a 00 00       	call   80103cbc <memmove>
8010125a:	89 1c 24             	mov    %ebx,(%esp)
8010125d:	e8 73 ef ff ff       	call   801001d5 <brelse>
80101262:	83 c4 10             	add    $0x10,%esp
80101265:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101268:	c9                   	leave  
80101269:	c3                   	ret    

8010126a <bfree>:
8010126a:	55                   	push   %ebp
8010126b:	89 e5                	mov    %esp,%ebp
8010126d:	56                   	push   %esi
8010126e:	53                   	push   %ebx
8010126f:	89 c6                	mov    %eax,%esi
80101271:	89 d3                	mov    %edx,%ebx
80101273:	83 ec 08             	sub    $0x8,%esp
80101276:	68 c0 f9 10 80       	push   $0x8010f9c0
8010127b:	50                   	push   %eax
8010127c:	e8 b5 ff ff ff       	call   80101236 <readsb>
80101281:	89 d8                	mov    %ebx,%eax
80101283:	c1 e8 0c             	shr    $0xc,%eax
80101286:	03 05 d8 f9 10 80    	add    0x8010f9d8,%eax
8010128c:	83 c4 08             	add    $0x8,%esp
8010128f:	50                   	push   %eax
80101290:	56                   	push   %esi
80101291:	e8 d6 ee ff ff       	call   8010016c <bread>
80101296:	89 c6                	mov    %eax,%esi
80101298:	89 d9                	mov    %ebx,%ecx
8010129a:	83 e1 07             	and    $0x7,%ecx
8010129d:	b8 01 00 00 00       	mov    $0x1,%eax
801012a2:	d3 e0                	shl    %cl,%eax
801012a4:	83 c4 10             	add    $0x10,%esp
801012a7:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
801012ad:	c1 fb 03             	sar    $0x3,%ebx
801012b0:	0f b6 54 1e 5c       	movzbl 0x5c(%esi,%ebx,1),%edx
801012b5:	0f b6 ca             	movzbl %dl,%ecx
801012b8:	85 c1                	test   %eax,%ecx
801012ba:	74 23                	je     801012df <bfree+0x75>
801012bc:	f7 d0                	not    %eax
801012be:	21 d0                	and    %edx,%eax
801012c0:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
801012c4:	83 ec 0c             	sub    $0xc,%esp
801012c7:	56                   	push   %esi
801012c8:	e8 0a 16 00 00       	call   801028d7 <log_write>
801012cd:	89 34 24             	mov    %esi,(%esp)
801012d0:	e8 00 ef ff ff       	call   801001d5 <brelse>
801012d5:	83 c4 10             	add    $0x10,%esp
801012d8:	8d 65 f8             	lea    -0x8(%ebp),%esp
801012db:	5b                   	pop    %ebx
801012dc:	5e                   	pop    %esi
801012dd:	5d                   	pop    %ebp
801012de:	c3                   	ret    
801012df:	83 ec 0c             	sub    $0xc,%esp
801012e2:	68 78 66 10 80       	push   $0x80106678
801012e7:	e8 5c f0 ff ff       	call   80100348 <panic>

801012ec <iinit>:
801012ec:	55                   	push   %ebp
801012ed:	89 e5                	mov    %esp,%ebp
801012ef:	53                   	push   %ebx
801012f0:	83 ec 0c             	sub    $0xc,%esp
801012f3:	68 8b 66 10 80       	push   $0x8010668b
801012f8:	68 e0 f9 10 80       	push   $0x8010f9e0
801012fd:	e8 57 27 00 00       	call   80103a59 <initlock>
80101302:	83 c4 10             	add    $0x10,%esp
80101305:	bb 00 00 00 00       	mov    $0x0,%ebx
8010130a:	eb 21                	jmp    8010132d <iinit+0x41>
8010130c:	83 ec 08             	sub    $0x8,%esp
8010130f:	68 92 66 10 80       	push   $0x80106692
80101314:	8d 14 db             	lea    (%ebx,%ebx,8),%edx
80101317:	89 d0                	mov    %edx,%eax
80101319:	c1 e0 04             	shl    $0x4,%eax
8010131c:	05 20 fa 10 80       	add    $0x8010fa20,%eax
80101321:	50                   	push   %eax
80101322:	e8 27 26 00 00       	call   8010394e <initsleeplock>
80101327:	83 c3 01             	add    $0x1,%ebx
8010132a:	83 c4 10             	add    $0x10,%esp
8010132d:	83 fb 31             	cmp    $0x31,%ebx
80101330:	7e da                	jle    8010130c <iinit+0x20>
80101332:	83 ec 08             	sub    $0x8,%esp
80101335:	68 c0 f9 10 80       	push   $0x8010f9c0
8010133a:	ff 75 08             	pushl  0x8(%ebp)
8010133d:	e8 f4 fe ff ff       	call   80101236 <readsb>
80101342:	ff 35 d8 f9 10 80    	pushl  0x8010f9d8
80101348:	ff 35 d4 f9 10 80    	pushl  0x8010f9d4
8010134e:	ff 35 d0 f9 10 80    	pushl  0x8010f9d0
80101354:	ff 35 cc f9 10 80    	pushl  0x8010f9cc
8010135a:	ff 35 c8 f9 10 80    	pushl  0x8010f9c8
80101360:	ff 35 c4 f9 10 80    	pushl  0x8010f9c4
80101366:	ff 35 c0 f9 10 80    	pushl  0x8010f9c0
8010136c:	68 f8 66 10 80       	push   $0x801066f8
80101371:	e8 95 f2 ff ff       	call   8010060b <cprintf>
80101376:	83 c4 30             	add    $0x30,%esp
80101379:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010137c:	c9                   	leave  
8010137d:	c3                   	ret    

8010137e <ialloc>:
8010137e:	55                   	push   %ebp
8010137f:	89 e5                	mov    %esp,%ebp
80101381:	57                   	push   %edi
80101382:	56                   	push   %esi
80101383:	53                   	push   %ebx
80101384:	83 ec 1c             	sub    $0x1c,%esp
80101387:	8b 45 0c             	mov    0xc(%ebp),%eax
8010138a:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010138d:	bb 01 00 00 00       	mov    $0x1,%ebx
80101392:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80101395:	39 1d c8 f9 10 80    	cmp    %ebx,0x8010f9c8
8010139b:	76 3f                	jbe    801013dc <ialloc+0x5e>
8010139d:	89 d8                	mov    %ebx,%eax
8010139f:	c1 e8 03             	shr    $0x3,%eax
801013a2:	03 05 d4 f9 10 80    	add    0x8010f9d4,%eax
801013a8:	83 ec 08             	sub    $0x8,%esp
801013ab:	50                   	push   %eax
801013ac:	ff 75 08             	pushl  0x8(%ebp)
801013af:	e8 b8 ed ff ff       	call   8010016c <bread>
801013b4:	89 c6                	mov    %eax,%esi
801013b6:	89 d8                	mov    %ebx,%eax
801013b8:	83 e0 07             	and    $0x7,%eax
801013bb:	c1 e0 06             	shl    $0x6,%eax
801013be:	8d 7c 06 5c          	lea    0x5c(%esi,%eax,1),%edi
801013c2:	83 c4 10             	add    $0x10,%esp
801013c5:	66 83 3f 00          	cmpw   $0x0,(%edi)
801013c9:	74 1e                	je     801013e9 <ialloc+0x6b>
801013cb:	83 ec 0c             	sub    $0xc,%esp
801013ce:	56                   	push   %esi
801013cf:	e8 01 ee ff ff       	call   801001d5 <brelse>
801013d4:	83 c3 01             	add    $0x1,%ebx
801013d7:	83 c4 10             	add    $0x10,%esp
801013da:	eb b6                	jmp    80101392 <ialloc+0x14>
801013dc:	83 ec 0c             	sub    $0xc,%esp
801013df:	68 98 66 10 80       	push   $0x80106698
801013e4:	e8 5f ef ff ff       	call   80100348 <panic>
801013e9:	83 ec 04             	sub    $0x4,%esp
801013ec:	6a 40                	push   $0x40
801013ee:	6a 00                	push   $0x0
801013f0:	57                   	push   %edi
801013f1:	e8 4b 28 00 00       	call   80103c41 <memset>
801013f6:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
801013fa:	66 89 07             	mov    %ax,(%edi)
801013fd:	89 34 24             	mov    %esi,(%esp)
80101400:	e8 d2 14 00 00       	call   801028d7 <log_write>
80101405:	89 34 24             	mov    %esi,(%esp)
80101408:	e8 c8 ed ff ff       	call   801001d5 <brelse>
8010140d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101410:	8b 45 08             	mov    0x8(%ebp),%eax
80101413:	e8 6f fd ff ff       	call   80101187 <iget>
80101418:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010141b:	5b                   	pop    %ebx
8010141c:	5e                   	pop    %esi
8010141d:	5f                   	pop    %edi
8010141e:	5d                   	pop    %ebp
8010141f:	c3                   	ret    

80101420 <iupdate>:
80101420:	55                   	push   %ebp
80101421:	89 e5                	mov    %esp,%ebp
80101423:	56                   	push   %esi
80101424:	53                   	push   %ebx
80101425:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101428:	8b 43 04             	mov    0x4(%ebx),%eax
8010142b:	c1 e8 03             	shr    $0x3,%eax
8010142e:	03 05 d4 f9 10 80    	add    0x8010f9d4,%eax
80101434:	83 ec 08             	sub    $0x8,%esp
80101437:	50                   	push   %eax
80101438:	ff 33                	pushl  (%ebx)
8010143a:	e8 2d ed ff ff       	call   8010016c <bread>
8010143f:	89 c6                	mov    %eax,%esi
80101441:	8b 43 04             	mov    0x4(%ebx),%eax
80101444:	83 e0 07             	and    $0x7,%eax
80101447:	c1 e0 06             	shl    $0x6,%eax
8010144a:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
8010144e:	0f b7 53 50          	movzwl 0x50(%ebx),%edx
80101452:	66 89 10             	mov    %dx,(%eax)
80101455:	0f b7 53 52          	movzwl 0x52(%ebx),%edx
80101459:	66 89 50 02          	mov    %dx,0x2(%eax)
8010145d:	0f b7 53 54          	movzwl 0x54(%ebx),%edx
80101461:	66 89 50 04          	mov    %dx,0x4(%eax)
80101465:	0f b7 53 56          	movzwl 0x56(%ebx),%edx
80101469:	66 89 50 06          	mov    %dx,0x6(%eax)
8010146d:	8b 53 58             	mov    0x58(%ebx),%edx
80101470:	89 50 08             	mov    %edx,0x8(%eax)
80101473:	83 c3 5c             	add    $0x5c,%ebx
80101476:	83 c0 0c             	add    $0xc,%eax
80101479:	83 c4 0c             	add    $0xc,%esp
8010147c:	6a 34                	push   $0x34
8010147e:	53                   	push   %ebx
8010147f:	50                   	push   %eax
80101480:	e8 37 28 00 00       	call   80103cbc <memmove>
80101485:	89 34 24             	mov    %esi,(%esp)
80101488:	e8 4a 14 00 00       	call   801028d7 <log_write>
8010148d:	89 34 24             	mov    %esi,(%esp)
80101490:	e8 40 ed ff ff       	call   801001d5 <brelse>
80101495:	83 c4 10             	add    $0x10,%esp
80101498:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010149b:	5b                   	pop    %ebx
8010149c:	5e                   	pop    %esi
8010149d:	5d                   	pop    %ebp
8010149e:	c3                   	ret    

8010149f <itrunc>:
8010149f:	55                   	push   %ebp
801014a0:	89 e5                	mov    %esp,%ebp
801014a2:	57                   	push   %edi
801014a3:	56                   	push   %esi
801014a4:	53                   	push   %ebx
801014a5:	83 ec 1c             	sub    $0x1c,%esp
801014a8:	89 c6                	mov    %eax,%esi
801014aa:	bb 00 00 00 00       	mov    $0x0,%ebx
801014af:	eb 03                	jmp    801014b4 <itrunc+0x15>
801014b1:	83 c3 01             	add    $0x1,%ebx
801014b4:	83 fb 0b             	cmp    $0xb,%ebx
801014b7:	7f 19                	jg     801014d2 <itrunc+0x33>
801014b9:	8b 54 9e 5c          	mov    0x5c(%esi,%ebx,4),%edx
801014bd:	85 d2                	test   %edx,%edx
801014bf:	74 f0                	je     801014b1 <itrunc+0x12>
801014c1:	8b 06                	mov    (%esi),%eax
801014c3:	e8 a2 fd ff ff       	call   8010126a <bfree>
801014c8:	c7 44 9e 5c 00 00 00 	movl   $0x0,0x5c(%esi,%ebx,4)
801014cf:	00 
801014d0:	eb df                	jmp    801014b1 <itrunc+0x12>
801014d2:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
801014d8:	85 c0                	test   %eax,%eax
801014da:	75 1b                	jne    801014f7 <itrunc+0x58>
801014dc:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
801014e3:	83 ec 0c             	sub    $0xc,%esp
801014e6:	56                   	push   %esi
801014e7:	e8 34 ff ff ff       	call   80101420 <iupdate>
801014ec:	83 c4 10             	add    $0x10,%esp
801014ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
801014f2:	5b                   	pop    %ebx
801014f3:	5e                   	pop    %esi
801014f4:	5f                   	pop    %edi
801014f5:	5d                   	pop    %ebp
801014f6:	c3                   	ret    
801014f7:	83 ec 08             	sub    $0x8,%esp
801014fa:	50                   	push   %eax
801014fb:	ff 36                	pushl  (%esi)
801014fd:	e8 6a ec ff ff       	call   8010016c <bread>
80101502:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101505:	8d 78 5c             	lea    0x5c(%eax),%edi
80101508:	83 c4 10             	add    $0x10,%esp
8010150b:	bb 00 00 00 00       	mov    $0x0,%ebx
80101510:	eb 03                	jmp    80101515 <itrunc+0x76>
80101512:	83 c3 01             	add    $0x1,%ebx
80101515:	83 fb 7f             	cmp    $0x7f,%ebx
80101518:	77 10                	ja     8010152a <itrunc+0x8b>
8010151a:	8b 14 9f             	mov    (%edi,%ebx,4),%edx
8010151d:	85 d2                	test   %edx,%edx
8010151f:	74 f1                	je     80101512 <itrunc+0x73>
80101521:	8b 06                	mov    (%esi),%eax
80101523:	e8 42 fd ff ff       	call   8010126a <bfree>
80101528:	eb e8                	jmp    80101512 <itrunc+0x73>
8010152a:	83 ec 0c             	sub    $0xc,%esp
8010152d:	ff 75 e4             	pushl  -0x1c(%ebp)
80101530:	e8 a0 ec ff ff       	call   801001d5 <brelse>
80101535:	8b 06                	mov    (%esi),%eax
80101537:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
8010153d:	e8 28 fd ff ff       	call   8010126a <bfree>
80101542:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
80101549:	00 00 00 
8010154c:	83 c4 10             	add    $0x10,%esp
8010154f:	eb 8b                	jmp    801014dc <itrunc+0x3d>

80101551 <idup>:
80101551:	55                   	push   %ebp
80101552:	89 e5                	mov    %esp,%ebp
80101554:	53                   	push   %ebx
80101555:	83 ec 10             	sub    $0x10,%esp
80101558:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010155b:	68 e0 f9 10 80       	push   $0x8010f9e0
80101560:	e8 30 26 00 00       	call   80103b95 <acquire>
80101565:	8b 43 08             	mov    0x8(%ebx),%eax
80101568:	83 c0 01             	add    $0x1,%eax
8010156b:	89 43 08             	mov    %eax,0x8(%ebx)
8010156e:	c7 04 24 e0 f9 10 80 	movl   $0x8010f9e0,(%esp)
80101575:	e8 80 26 00 00       	call   80103bfa <release>
8010157a:	89 d8                	mov    %ebx,%eax
8010157c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010157f:	c9                   	leave  
80101580:	c3                   	ret    

80101581 <ilock>:
80101581:	55                   	push   %ebp
80101582:	89 e5                	mov    %esp,%ebp
80101584:	56                   	push   %esi
80101585:	53                   	push   %ebx
80101586:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101589:	85 db                	test   %ebx,%ebx
8010158b:	74 22                	je     801015af <ilock+0x2e>
8010158d:	83 7b 08 00          	cmpl   $0x0,0x8(%ebx)
80101591:	7e 1c                	jle    801015af <ilock+0x2e>
80101593:	83 ec 0c             	sub    $0xc,%esp
80101596:	8d 43 0c             	lea    0xc(%ebx),%eax
80101599:	50                   	push   %eax
8010159a:	e8 e2 23 00 00       	call   80103981 <acquiresleep>
8010159f:	83 c4 10             	add    $0x10,%esp
801015a2:	83 7b 4c 00          	cmpl   $0x0,0x4c(%ebx)
801015a6:	74 14                	je     801015bc <ilock+0x3b>
801015a8:	8d 65 f8             	lea    -0x8(%ebp),%esp
801015ab:	5b                   	pop    %ebx
801015ac:	5e                   	pop    %esi
801015ad:	5d                   	pop    %ebp
801015ae:	c3                   	ret    
801015af:	83 ec 0c             	sub    $0xc,%esp
801015b2:	68 aa 66 10 80       	push   $0x801066aa
801015b7:	e8 8c ed ff ff       	call   80100348 <panic>
801015bc:	8b 43 04             	mov    0x4(%ebx),%eax
801015bf:	c1 e8 03             	shr    $0x3,%eax
801015c2:	03 05 d4 f9 10 80    	add    0x8010f9d4,%eax
801015c8:	83 ec 08             	sub    $0x8,%esp
801015cb:	50                   	push   %eax
801015cc:	ff 33                	pushl  (%ebx)
801015ce:	e8 99 eb ff ff       	call   8010016c <bread>
801015d3:	89 c6                	mov    %eax,%esi
801015d5:	8b 43 04             	mov    0x4(%ebx),%eax
801015d8:	83 e0 07             	and    $0x7,%eax
801015db:	c1 e0 06             	shl    $0x6,%eax
801015de:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801015e2:	0f b7 10             	movzwl (%eax),%edx
801015e5:	66 89 53 50          	mov    %dx,0x50(%ebx)
801015e9:	0f b7 50 02          	movzwl 0x2(%eax),%edx
801015ed:	66 89 53 52          	mov    %dx,0x52(%ebx)
801015f1:	0f b7 50 04          	movzwl 0x4(%eax),%edx
801015f5:	66 89 53 54          	mov    %dx,0x54(%ebx)
801015f9:	0f b7 50 06          	movzwl 0x6(%eax),%edx
801015fd:	66 89 53 56          	mov    %dx,0x56(%ebx)
80101601:	8b 50 08             	mov    0x8(%eax),%edx
80101604:	89 53 58             	mov    %edx,0x58(%ebx)
80101607:	83 c0 0c             	add    $0xc,%eax
8010160a:	8d 53 5c             	lea    0x5c(%ebx),%edx
8010160d:	83 c4 0c             	add    $0xc,%esp
80101610:	6a 34                	push   $0x34
80101612:	50                   	push   %eax
80101613:	52                   	push   %edx
80101614:	e8 a3 26 00 00       	call   80103cbc <memmove>
80101619:	89 34 24             	mov    %esi,(%esp)
8010161c:	e8 b4 eb ff ff       	call   801001d5 <brelse>
80101621:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101628:	83 c4 10             	add    $0x10,%esp
8010162b:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101630:	0f 85 72 ff ff ff    	jne    801015a8 <ilock+0x27>
80101636:	83 ec 0c             	sub    $0xc,%esp
80101639:	68 b0 66 10 80       	push   $0x801066b0
8010163e:	e8 05 ed ff ff       	call   80100348 <panic>

80101643 <iunlock>:
80101643:	55                   	push   %ebp
80101644:	89 e5                	mov    %esp,%ebp
80101646:	56                   	push   %esi
80101647:	53                   	push   %ebx
80101648:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010164b:	85 db                	test   %ebx,%ebx
8010164d:	74 2c                	je     8010167b <iunlock+0x38>
8010164f:	8d 73 0c             	lea    0xc(%ebx),%esi
80101652:	83 ec 0c             	sub    $0xc,%esp
80101655:	56                   	push   %esi
80101656:	e8 b0 23 00 00       	call   80103a0b <holdingsleep>
8010165b:	83 c4 10             	add    $0x10,%esp
8010165e:	85 c0                	test   %eax,%eax
80101660:	74 19                	je     8010167b <iunlock+0x38>
80101662:	83 7b 08 00          	cmpl   $0x0,0x8(%ebx)
80101666:	7e 13                	jle    8010167b <iunlock+0x38>
80101668:	83 ec 0c             	sub    $0xc,%esp
8010166b:	56                   	push   %esi
8010166c:	e8 5f 23 00 00       	call   801039d0 <releasesleep>
80101671:	83 c4 10             	add    $0x10,%esp
80101674:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101677:	5b                   	pop    %ebx
80101678:	5e                   	pop    %esi
80101679:	5d                   	pop    %ebp
8010167a:	c3                   	ret    
8010167b:	83 ec 0c             	sub    $0xc,%esp
8010167e:	68 bf 66 10 80       	push   $0x801066bf
80101683:	e8 c0 ec ff ff       	call   80100348 <panic>

80101688 <iput>:
80101688:	55                   	push   %ebp
80101689:	89 e5                	mov    %esp,%ebp
8010168b:	57                   	push   %edi
8010168c:	56                   	push   %esi
8010168d:	53                   	push   %ebx
8010168e:	83 ec 18             	sub    $0x18,%esp
80101691:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101694:	8d 73 0c             	lea    0xc(%ebx),%esi
80101697:	56                   	push   %esi
80101698:	e8 e4 22 00 00       	call   80103981 <acquiresleep>
8010169d:	83 c4 10             	add    $0x10,%esp
801016a0:	83 7b 4c 00          	cmpl   $0x0,0x4c(%ebx)
801016a4:	74 07                	je     801016ad <iput+0x25>
801016a6:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801016ab:	74 35                	je     801016e2 <iput+0x5a>
801016ad:	83 ec 0c             	sub    $0xc,%esp
801016b0:	56                   	push   %esi
801016b1:	e8 1a 23 00 00       	call   801039d0 <releasesleep>
801016b6:	c7 04 24 e0 f9 10 80 	movl   $0x8010f9e0,(%esp)
801016bd:	e8 d3 24 00 00       	call   80103b95 <acquire>
801016c2:	8b 43 08             	mov    0x8(%ebx),%eax
801016c5:	83 e8 01             	sub    $0x1,%eax
801016c8:	89 43 08             	mov    %eax,0x8(%ebx)
801016cb:	c7 04 24 e0 f9 10 80 	movl   $0x8010f9e0,(%esp)
801016d2:	e8 23 25 00 00       	call   80103bfa <release>
801016d7:	83 c4 10             	add    $0x10,%esp
801016da:	8d 65 f4             	lea    -0xc(%ebp),%esp
801016dd:	5b                   	pop    %ebx
801016de:	5e                   	pop    %esi
801016df:	5f                   	pop    %edi
801016e0:	5d                   	pop    %ebp
801016e1:	c3                   	ret    
801016e2:	83 ec 0c             	sub    $0xc,%esp
801016e5:	68 e0 f9 10 80       	push   $0x8010f9e0
801016ea:	e8 a6 24 00 00       	call   80103b95 <acquire>
801016ef:	8b 7b 08             	mov    0x8(%ebx),%edi
801016f2:	c7 04 24 e0 f9 10 80 	movl   $0x8010f9e0,(%esp)
801016f9:	e8 fc 24 00 00       	call   80103bfa <release>
801016fe:	83 c4 10             	add    $0x10,%esp
80101701:	83 ff 01             	cmp    $0x1,%edi
80101704:	75 a7                	jne    801016ad <iput+0x25>
80101706:	89 d8                	mov    %ebx,%eax
80101708:	e8 92 fd ff ff       	call   8010149f <itrunc>
8010170d:	66 c7 43 50 00 00    	movw   $0x0,0x50(%ebx)
80101713:	83 ec 0c             	sub    $0xc,%esp
80101716:	53                   	push   %ebx
80101717:	e8 04 fd ff ff       	call   80101420 <iupdate>
8010171c:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
80101723:	83 c4 10             	add    $0x10,%esp
80101726:	eb 85                	jmp    801016ad <iput+0x25>

80101728 <iunlockput>:
80101728:	55                   	push   %ebp
80101729:	89 e5                	mov    %esp,%ebp
8010172b:	53                   	push   %ebx
8010172c:	83 ec 10             	sub    $0x10,%esp
8010172f:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101732:	53                   	push   %ebx
80101733:	e8 0b ff ff ff       	call   80101643 <iunlock>
80101738:	89 1c 24             	mov    %ebx,(%esp)
8010173b:	e8 48 ff ff ff       	call   80101688 <iput>
80101740:	83 c4 10             	add    $0x10,%esp
80101743:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101746:	c9                   	leave  
80101747:	c3                   	ret    

80101748 <stati>:
80101748:	55                   	push   %ebp
80101749:	89 e5                	mov    %esp,%ebp
8010174b:	8b 55 08             	mov    0x8(%ebp),%edx
8010174e:	8b 45 0c             	mov    0xc(%ebp),%eax
80101751:	8b 0a                	mov    (%edx),%ecx
80101753:	89 48 04             	mov    %ecx,0x4(%eax)
80101756:	8b 4a 04             	mov    0x4(%edx),%ecx
80101759:	89 48 08             	mov    %ecx,0x8(%eax)
8010175c:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101760:	66 89 08             	mov    %cx,(%eax)
80101763:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
80101767:	66 89 48 0c          	mov    %cx,0xc(%eax)
8010176b:	8b 52 58             	mov    0x58(%edx),%edx
8010176e:	89 50 10             	mov    %edx,0x10(%eax)
80101771:	5d                   	pop    %ebp
80101772:	c3                   	ret    

80101773 <readi>:
80101773:	55                   	push   %ebp
80101774:	89 e5                	mov    %esp,%ebp
80101776:	57                   	push   %edi
80101777:	56                   	push   %esi
80101778:	53                   	push   %ebx
80101779:	83 ec 1c             	sub    $0x1c,%esp
8010177c:	8b 7d 10             	mov    0x10(%ebp),%edi
8010177f:	8b 45 08             	mov    0x8(%ebp),%eax
80101782:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101787:	74 2c                	je     801017b5 <readi+0x42>
80101789:	8b 45 08             	mov    0x8(%ebp),%eax
8010178c:	8b 40 58             	mov    0x58(%eax),%eax
8010178f:	39 f8                	cmp    %edi,%eax
80101791:	0f 82 cb 00 00 00    	jb     80101862 <readi+0xef>
80101797:	89 fa                	mov    %edi,%edx
80101799:	03 55 14             	add    0x14(%ebp),%edx
8010179c:	0f 82 c7 00 00 00    	jb     80101869 <readi+0xf6>
801017a2:	39 d0                	cmp    %edx,%eax
801017a4:	73 05                	jae    801017ab <readi+0x38>
801017a6:	29 f8                	sub    %edi,%eax
801017a8:	89 45 14             	mov    %eax,0x14(%ebp)
801017ab:	be 00 00 00 00       	mov    $0x0,%esi
801017b0:	e9 8f 00 00 00       	jmp    80101844 <readi+0xd1>
801017b5:	0f b7 40 52          	movzwl 0x52(%eax),%eax
801017b9:	66 83 f8 09          	cmp    $0x9,%ax
801017bd:	0f 87 91 00 00 00    	ja     80101854 <readi+0xe1>
801017c3:	98                   	cwtl   
801017c4:	8b 04 c5 60 f9 10 80 	mov    -0x7fef06a0(,%eax,8),%eax
801017cb:	85 c0                	test   %eax,%eax
801017cd:	0f 84 88 00 00 00    	je     8010185b <readi+0xe8>
801017d3:	83 ec 04             	sub    $0x4,%esp
801017d6:	ff 75 14             	pushl  0x14(%ebp)
801017d9:	ff 75 0c             	pushl  0xc(%ebp)
801017dc:	ff 75 08             	pushl  0x8(%ebp)
801017df:	ff d0                	call   *%eax
801017e1:	83 c4 10             	add    $0x10,%esp
801017e4:	eb 66                	jmp    8010184c <readi+0xd9>
801017e6:	89 fa                	mov    %edi,%edx
801017e8:	c1 ea 09             	shr    $0x9,%edx
801017eb:	8b 45 08             	mov    0x8(%ebp),%eax
801017ee:	e8 ee f8 ff ff       	call   801010e1 <bmap>
801017f3:	83 ec 08             	sub    $0x8,%esp
801017f6:	50                   	push   %eax
801017f7:	8b 45 08             	mov    0x8(%ebp),%eax
801017fa:	ff 30                	pushl  (%eax)
801017fc:	e8 6b e9 ff ff       	call   8010016c <bread>
80101801:	89 c1                	mov    %eax,%ecx
80101803:	89 f8                	mov    %edi,%eax
80101805:	25 ff 01 00 00       	and    $0x1ff,%eax
8010180a:	bb 00 02 00 00       	mov    $0x200,%ebx
8010180f:	29 c3                	sub    %eax,%ebx
80101811:	8b 55 14             	mov    0x14(%ebp),%edx
80101814:	29 f2                	sub    %esi,%edx
80101816:	83 c4 0c             	add    $0xc,%esp
80101819:	39 d3                	cmp    %edx,%ebx
8010181b:	0f 47 da             	cmova  %edx,%ebx
8010181e:	53                   	push   %ebx
8010181f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101822:	8d 44 01 5c          	lea    0x5c(%ecx,%eax,1),%eax
80101826:	50                   	push   %eax
80101827:	ff 75 0c             	pushl  0xc(%ebp)
8010182a:	e8 8d 24 00 00       	call   80103cbc <memmove>
8010182f:	83 c4 04             	add    $0x4,%esp
80101832:	ff 75 e4             	pushl  -0x1c(%ebp)
80101835:	e8 9b e9 ff ff       	call   801001d5 <brelse>
8010183a:	01 de                	add    %ebx,%esi
8010183c:	01 df                	add    %ebx,%edi
8010183e:	01 5d 0c             	add    %ebx,0xc(%ebp)
80101841:	83 c4 10             	add    $0x10,%esp
80101844:	39 75 14             	cmp    %esi,0x14(%ebp)
80101847:	77 9d                	ja     801017e6 <readi+0x73>
80101849:	8b 45 14             	mov    0x14(%ebp),%eax
8010184c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010184f:	5b                   	pop    %ebx
80101850:	5e                   	pop    %esi
80101851:	5f                   	pop    %edi
80101852:	5d                   	pop    %ebp
80101853:	c3                   	ret    
80101854:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101859:	eb f1                	jmp    8010184c <readi+0xd9>
8010185b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101860:	eb ea                	jmp    8010184c <readi+0xd9>
80101862:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101867:	eb e3                	jmp    8010184c <readi+0xd9>
80101869:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010186e:	eb dc                	jmp    8010184c <readi+0xd9>

80101870 <writei>:
80101870:	55                   	push   %ebp
80101871:	89 e5                	mov    %esp,%ebp
80101873:	57                   	push   %edi
80101874:	56                   	push   %esi
80101875:	53                   	push   %ebx
80101876:	83 ec 0c             	sub    $0xc,%esp
80101879:	8b 45 08             	mov    0x8(%ebp),%eax
8010187c:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101881:	74 2f                	je     801018b2 <writei+0x42>
80101883:	8b 45 08             	mov    0x8(%ebp),%eax
80101886:	8b 4d 10             	mov    0x10(%ebp),%ecx
80101889:	39 48 58             	cmp    %ecx,0x58(%eax)
8010188c:	0f 82 f4 00 00 00    	jb     80101986 <writei+0x116>
80101892:	89 c8                	mov    %ecx,%eax
80101894:	03 45 14             	add    0x14(%ebp),%eax
80101897:	0f 82 f0 00 00 00    	jb     8010198d <writei+0x11d>
8010189d:	3d 00 18 01 00       	cmp    $0x11800,%eax
801018a2:	0f 87 ec 00 00 00    	ja     80101994 <writei+0x124>
801018a8:	be 00 00 00 00       	mov    $0x0,%esi
801018ad:	e9 94 00 00 00       	jmp    80101946 <writei+0xd6>
801018b2:	0f b7 40 52          	movzwl 0x52(%eax),%eax
801018b6:	66 83 f8 09          	cmp    $0x9,%ax
801018ba:	0f 87 b8 00 00 00    	ja     80101978 <writei+0x108>
801018c0:	98                   	cwtl   
801018c1:	8b 04 c5 64 f9 10 80 	mov    -0x7fef069c(,%eax,8),%eax
801018c8:	85 c0                	test   %eax,%eax
801018ca:	0f 84 af 00 00 00    	je     8010197f <writei+0x10f>
801018d0:	83 ec 04             	sub    $0x4,%esp
801018d3:	ff 75 14             	pushl  0x14(%ebp)
801018d6:	ff 75 0c             	pushl  0xc(%ebp)
801018d9:	ff 75 08             	pushl  0x8(%ebp)
801018dc:	ff d0                	call   *%eax
801018de:	83 c4 10             	add    $0x10,%esp
801018e1:	eb 7c                	jmp    8010195f <writei+0xef>
801018e3:	8b 55 10             	mov    0x10(%ebp),%edx
801018e6:	c1 ea 09             	shr    $0x9,%edx
801018e9:	8b 45 08             	mov    0x8(%ebp),%eax
801018ec:	e8 f0 f7 ff ff       	call   801010e1 <bmap>
801018f1:	83 ec 08             	sub    $0x8,%esp
801018f4:	50                   	push   %eax
801018f5:	8b 45 08             	mov    0x8(%ebp),%eax
801018f8:	ff 30                	pushl  (%eax)
801018fa:	e8 6d e8 ff ff       	call   8010016c <bread>
801018ff:	89 c7                	mov    %eax,%edi
80101901:	8b 45 10             	mov    0x10(%ebp),%eax
80101904:	25 ff 01 00 00       	and    $0x1ff,%eax
80101909:	bb 00 02 00 00       	mov    $0x200,%ebx
8010190e:	29 c3                	sub    %eax,%ebx
80101910:	8b 55 14             	mov    0x14(%ebp),%edx
80101913:	29 f2                	sub    %esi,%edx
80101915:	83 c4 0c             	add    $0xc,%esp
80101918:	39 d3                	cmp    %edx,%ebx
8010191a:	0f 47 da             	cmova  %edx,%ebx
8010191d:	53                   	push   %ebx
8010191e:	ff 75 0c             	pushl  0xc(%ebp)
80101921:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
80101925:	50                   	push   %eax
80101926:	e8 91 23 00 00       	call   80103cbc <memmove>
8010192b:	89 3c 24             	mov    %edi,(%esp)
8010192e:	e8 a4 0f 00 00       	call   801028d7 <log_write>
80101933:	89 3c 24             	mov    %edi,(%esp)
80101936:	e8 9a e8 ff ff       	call   801001d5 <brelse>
8010193b:	01 de                	add    %ebx,%esi
8010193d:	01 5d 10             	add    %ebx,0x10(%ebp)
80101940:	01 5d 0c             	add    %ebx,0xc(%ebp)
80101943:	83 c4 10             	add    $0x10,%esp
80101946:	3b 75 14             	cmp    0x14(%ebp),%esi
80101949:	72 98                	jb     801018e3 <writei+0x73>
8010194b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
8010194f:	74 0b                	je     8010195c <writei+0xec>
80101951:	8b 45 08             	mov    0x8(%ebp),%eax
80101954:	8b 4d 10             	mov    0x10(%ebp),%ecx
80101957:	39 48 58             	cmp    %ecx,0x58(%eax)
8010195a:	72 0b                	jb     80101967 <writei+0xf7>
8010195c:	8b 45 14             	mov    0x14(%ebp),%eax
8010195f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101962:	5b                   	pop    %ebx
80101963:	5e                   	pop    %esi
80101964:	5f                   	pop    %edi
80101965:	5d                   	pop    %ebp
80101966:	c3                   	ret    
80101967:	89 48 58             	mov    %ecx,0x58(%eax)
8010196a:	83 ec 0c             	sub    $0xc,%esp
8010196d:	50                   	push   %eax
8010196e:	e8 ad fa ff ff       	call   80101420 <iupdate>
80101973:	83 c4 10             	add    $0x10,%esp
80101976:	eb e4                	jmp    8010195c <writei+0xec>
80101978:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010197d:	eb e0                	jmp    8010195f <writei+0xef>
8010197f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101984:	eb d9                	jmp    8010195f <writei+0xef>
80101986:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010198b:	eb d2                	jmp    8010195f <writei+0xef>
8010198d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101992:	eb cb                	jmp    8010195f <writei+0xef>
80101994:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101999:	eb c4                	jmp    8010195f <writei+0xef>

8010199b <namecmp>:
8010199b:	55                   	push   %ebp
8010199c:	89 e5                	mov    %esp,%ebp
8010199e:	83 ec 0c             	sub    $0xc,%esp
801019a1:	6a 0e                	push   $0xe
801019a3:	ff 75 0c             	pushl  0xc(%ebp)
801019a6:	ff 75 08             	pushl  0x8(%ebp)
801019a9:	e8 75 23 00 00       	call   80103d23 <strncmp>
801019ae:	c9                   	leave  
801019af:	c3                   	ret    

801019b0 <dirlookup>:
801019b0:	55                   	push   %ebp
801019b1:	89 e5                	mov    %esp,%ebp
801019b3:	57                   	push   %edi
801019b4:	56                   	push   %esi
801019b5:	53                   	push   %ebx
801019b6:	83 ec 1c             	sub    $0x1c,%esp
801019b9:	8b 75 08             	mov    0x8(%ebp),%esi
801019bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801019bf:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
801019c4:	75 07                	jne    801019cd <dirlookup+0x1d>
801019c6:	bb 00 00 00 00       	mov    $0x0,%ebx
801019cb:	eb 1d                	jmp    801019ea <dirlookup+0x3a>
801019cd:	83 ec 0c             	sub    $0xc,%esp
801019d0:	68 c7 66 10 80       	push   $0x801066c7
801019d5:	e8 6e e9 ff ff       	call   80100348 <panic>
801019da:	83 ec 0c             	sub    $0xc,%esp
801019dd:	68 d9 66 10 80       	push   $0x801066d9
801019e2:	e8 61 e9 ff ff       	call   80100348 <panic>
801019e7:	83 c3 10             	add    $0x10,%ebx
801019ea:	39 5e 58             	cmp    %ebx,0x58(%esi)
801019ed:	76 48                	jbe    80101a37 <dirlookup+0x87>
801019ef:	6a 10                	push   $0x10
801019f1:	53                   	push   %ebx
801019f2:	8d 45 d8             	lea    -0x28(%ebp),%eax
801019f5:	50                   	push   %eax
801019f6:	56                   	push   %esi
801019f7:	e8 77 fd ff ff       	call   80101773 <readi>
801019fc:	83 c4 10             	add    $0x10,%esp
801019ff:	83 f8 10             	cmp    $0x10,%eax
80101a02:	75 d6                	jne    801019da <dirlookup+0x2a>
80101a04:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101a09:	74 dc                	je     801019e7 <dirlookup+0x37>
80101a0b:	83 ec 08             	sub    $0x8,%esp
80101a0e:	8d 45 da             	lea    -0x26(%ebp),%eax
80101a11:	50                   	push   %eax
80101a12:	57                   	push   %edi
80101a13:	e8 83 ff ff ff       	call   8010199b <namecmp>
80101a18:	83 c4 10             	add    $0x10,%esp
80101a1b:	85 c0                	test   %eax,%eax
80101a1d:	75 c8                	jne    801019e7 <dirlookup+0x37>
80101a1f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80101a23:	74 05                	je     80101a2a <dirlookup+0x7a>
80101a25:	8b 45 10             	mov    0x10(%ebp),%eax
80101a28:	89 18                	mov    %ebx,(%eax)
80101a2a:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101a2e:	8b 06                	mov    (%esi),%eax
80101a30:	e8 52 f7 ff ff       	call   80101187 <iget>
80101a35:	eb 05                	jmp    80101a3c <dirlookup+0x8c>
80101a37:	b8 00 00 00 00       	mov    $0x0,%eax
80101a3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a3f:	5b                   	pop    %ebx
80101a40:	5e                   	pop    %esi
80101a41:	5f                   	pop    %edi
80101a42:	5d                   	pop    %ebp
80101a43:	c3                   	ret    

80101a44 <namex>:
80101a44:	55                   	push   %ebp
80101a45:	89 e5                	mov    %esp,%ebp
80101a47:	57                   	push   %edi
80101a48:	56                   	push   %esi
80101a49:	53                   	push   %ebx
80101a4a:	83 ec 1c             	sub    $0x1c,%esp
80101a4d:	89 c6                	mov    %eax,%esi
80101a4f:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101a52:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101a55:	80 38 2f             	cmpb   $0x2f,(%eax)
80101a58:	74 17                	je     80101a71 <namex+0x2d>
80101a5a:	e8 97 17 00 00       	call   801031f6 <myproc>
80101a5f:	83 ec 0c             	sub    $0xc,%esp
80101a62:	ff 70 68             	pushl  0x68(%eax)
80101a65:	e8 e7 fa ff ff       	call   80101551 <idup>
80101a6a:	89 c3                	mov    %eax,%ebx
80101a6c:	83 c4 10             	add    $0x10,%esp
80101a6f:	eb 53                	jmp    80101ac4 <namex+0x80>
80101a71:	ba 01 00 00 00       	mov    $0x1,%edx
80101a76:	b8 01 00 00 00       	mov    $0x1,%eax
80101a7b:	e8 07 f7 ff ff       	call   80101187 <iget>
80101a80:	89 c3                	mov    %eax,%ebx
80101a82:	eb 40                	jmp    80101ac4 <namex+0x80>
80101a84:	83 ec 0c             	sub    $0xc,%esp
80101a87:	53                   	push   %ebx
80101a88:	e8 9b fc ff ff       	call   80101728 <iunlockput>
80101a8d:	83 c4 10             	add    $0x10,%esp
80101a90:	bb 00 00 00 00       	mov    $0x0,%ebx
80101a95:	89 d8                	mov    %ebx,%eax
80101a97:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a9a:	5b                   	pop    %ebx
80101a9b:	5e                   	pop    %esi
80101a9c:	5f                   	pop    %edi
80101a9d:	5d                   	pop    %ebp
80101a9e:	c3                   	ret    
80101a9f:	83 ec 04             	sub    $0x4,%esp
80101aa2:	6a 00                	push   $0x0
80101aa4:	ff 75 e4             	pushl  -0x1c(%ebp)
80101aa7:	53                   	push   %ebx
80101aa8:	e8 03 ff ff ff       	call   801019b0 <dirlookup>
80101aad:	89 c7                	mov    %eax,%edi
80101aaf:	83 c4 10             	add    $0x10,%esp
80101ab2:	85 c0                	test   %eax,%eax
80101ab4:	74 4a                	je     80101b00 <namex+0xbc>
80101ab6:	83 ec 0c             	sub    $0xc,%esp
80101ab9:	53                   	push   %ebx
80101aba:	e8 69 fc ff ff       	call   80101728 <iunlockput>
80101abf:	83 c4 10             	add    $0x10,%esp
80101ac2:	89 fb                	mov    %edi,%ebx
80101ac4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101ac7:	89 f0                	mov    %esi,%eax
80101ac9:	e8 77 f4 ff ff       	call   80100f45 <skipelem>
80101ace:	89 c6                	mov    %eax,%esi
80101ad0:	85 c0                	test   %eax,%eax
80101ad2:	74 3c                	je     80101b10 <namex+0xcc>
80101ad4:	83 ec 0c             	sub    $0xc,%esp
80101ad7:	53                   	push   %ebx
80101ad8:	e8 a4 fa ff ff       	call   80101581 <ilock>
80101add:	83 c4 10             	add    $0x10,%esp
80101ae0:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101ae5:	75 9d                	jne    80101a84 <namex+0x40>
80101ae7:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
80101aeb:	74 b2                	je     80101a9f <namex+0x5b>
80101aed:	80 3e 00             	cmpb   $0x0,(%esi)
80101af0:	75 ad                	jne    80101a9f <namex+0x5b>
80101af2:	83 ec 0c             	sub    $0xc,%esp
80101af5:	53                   	push   %ebx
80101af6:	e8 48 fb ff ff       	call   80101643 <iunlock>
80101afb:	83 c4 10             	add    $0x10,%esp
80101afe:	eb 95                	jmp    80101a95 <namex+0x51>
80101b00:	83 ec 0c             	sub    $0xc,%esp
80101b03:	53                   	push   %ebx
80101b04:	e8 1f fc ff ff       	call   80101728 <iunlockput>
80101b09:	83 c4 10             	add    $0x10,%esp
80101b0c:	89 fb                	mov    %edi,%ebx
80101b0e:	eb 85                	jmp    80101a95 <namex+0x51>
80101b10:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
80101b14:	0f 84 7b ff ff ff    	je     80101a95 <namex+0x51>
80101b1a:	83 ec 0c             	sub    $0xc,%esp
80101b1d:	53                   	push   %ebx
80101b1e:	e8 65 fb ff ff       	call   80101688 <iput>
80101b23:	83 c4 10             	add    $0x10,%esp
80101b26:	bb 00 00 00 00       	mov    $0x0,%ebx
80101b2b:	e9 65 ff ff ff       	jmp    80101a95 <namex+0x51>

80101b30 <dirlink>:
80101b30:	55                   	push   %ebp
80101b31:	89 e5                	mov    %esp,%ebp
80101b33:	57                   	push   %edi
80101b34:	56                   	push   %esi
80101b35:	53                   	push   %ebx
80101b36:	83 ec 20             	sub    $0x20,%esp
80101b39:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101b3c:	8b 7d 0c             	mov    0xc(%ebp),%edi
80101b3f:	6a 00                	push   $0x0
80101b41:	57                   	push   %edi
80101b42:	53                   	push   %ebx
80101b43:	e8 68 fe ff ff       	call   801019b0 <dirlookup>
80101b48:	83 c4 10             	add    $0x10,%esp
80101b4b:	85 c0                	test   %eax,%eax
80101b4d:	75 2d                	jne    80101b7c <dirlink+0x4c>
80101b4f:	b8 00 00 00 00       	mov    $0x0,%eax
80101b54:	89 c6                	mov    %eax,%esi
80101b56:	39 43 58             	cmp    %eax,0x58(%ebx)
80101b59:	76 41                	jbe    80101b9c <dirlink+0x6c>
80101b5b:	6a 10                	push   $0x10
80101b5d:	50                   	push   %eax
80101b5e:	8d 45 d8             	lea    -0x28(%ebp),%eax
80101b61:	50                   	push   %eax
80101b62:	53                   	push   %ebx
80101b63:	e8 0b fc ff ff       	call   80101773 <readi>
80101b68:	83 c4 10             	add    $0x10,%esp
80101b6b:	83 f8 10             	cmp    $0x10,%eax
80101b6e:	75 1f                	jne    80101b8f <dirlink+0x5f>
80101b70:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101b75:	74 25                	je     80101b9c <dirlink+0x6c>
80101b77:	8d 46 10             	lea    0x10(%esi),%eax
80101b7a:	eb d8                	jmp    80101b54 <dirlink+0x24>
80101b7c:	83 ec 0c             	sub    $0xc,%esp
80101b7f:	50                   	push   %eax
80101b80:	e8 03 fb ff ff       	call   80101688 <iput>
80101b85:	83 c4 10             	add    $0x10,%esp
80101b88:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b8d:	eb 3d                	jmp    80101bcc <dirlink+0x9c>
80101b8f:	83 ec 0c             	sub    $0xc,%esp
80101b92:	68 e8 66 10 80       	push   $0x801066e8
80101b97:	e8 ac e7 ff ff       	call   80100348 <panic>
80101b9c:	83 ec 04             	sub    $0x4,%esp
80101b9f:	6a 0e                	push   $0xe
80101ba1:	57                   	push   %edi
80101ba2:	8d 7d d8             	lea    -0x28(%ebp),%edi
80101ba5:	8d 45 da             	lea    -0x26(%ebp),%eax
80101ba8:	50                   	push   %eax
80101ba9:	e8 b2 21 00 00       	call   80103d60 <strncpy>
80101bae:	8b 45 10             	mov    0x10(%ebp),%eax
80101bb1:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101bb5:	6a 10                	push   $0x10
80101bb7:	56                   	push   %esi
80101bb8:	57                   	push   %edi
80101bb9:	53                   	push   %ebx
80101bba:	e8 b1 fc ff ff       	call   80101870 <writei>
80101bbf:	83 c4 20             	add    $0x20,%esp
80101bc2:	83 f8 10             	cmp    $0x10,%eax
80101bc5:	75 0d                	jne    80101bd4 <dirlink+0xa4>
80101bc7:	b8 00 00 00 00       	mov    $0x0,%eax
80101bcc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101bcf:	5b                   	pop    %ebx
80101bd0:	5e                   	pop    %esi
80101bd1:	5f                   	pop    %edi
80101bd2:	5d                   	pop    %ebp
80101bd3:	c3                   	ret    
80101bd4:	83 ec 0c             	sub    $0xc,%esp
80101bd7:	68 f8 6c 10 80       	push   $0x80106cf8
80101bdc:	e8 67 e7 ff ff       	call   80100348 <panic>

80101be1 <namei>:
80101be1:	55                   	push   %ebp
80101be2:	89 e5                	mov    %esp,%ebp
80101be4:	83 ec 18             	sub    $0x18,%esp
80101be7:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101bea:	ba 00 00 00 00       	mov    $0x0,%edx
80101bef:	8b 45 08             	mov    0x8(%ebp),%eax
80101bf2:	e8 4d fe ff ff       	call   80101a44 <namex>
80101bf7:	c9                   	leave  
80101bf8:	c3                   	ret    

80101bf9 <nameiparent>:
80101bf9:	55                   	push   %ebp
80101bfa:	89 e5                	mov    %esp,%ebp
80101bfc:	83 ec 08             	sub    $0x8,%esp
80101bff:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101c02:	ba 01 00 00 00       	mov    $0x1,%edx
80101c07:	8b 45 08             	mov    0x8(%ebp),%eax
80101c0a:	e8 35 fe ff ff       	call   80101a44 <namex>
80101c0f:	c9                   	leave  
80101c10:	c3                   	ret    

80101c11 <idewait>:
80101c11:	55                   	push   %ebp
80101c12:	89 e5                	mov    %esp,%ebp
80101c14:	89 c1                	mov    %eax,%ecx
80101c16:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101c1b:	ec                   	in     (%dx),%al
80101c1c:	89 c2                	mov    %eax,%edx
80101c1e:	83 e0 c0             	and    $0xffffffc0,%eax
80101c21:	3c 40                	cmp    $0x40,%al
80101c23:	75 f1                	jne    80101c16 <idewait+0x5>
80101c25:	85 c9                	test   %ecx,%ecx
80101c27:	74 0c                	je     80101c35 <idewait+0x24>
80101c29:	f6 c2 21             	test   $0x21,%dl
80101c2c:	75 0e                	jne    80101c3c <idewait+0x2b>
80101c2e:	b8 00 00 00 00       	mov    $0x0,%eax
80101c33:	eb 05                	jmp    80101c3a <idewait+0x29>
80101c35:	b8 00 00 00 00       	mov    $0x0,%eax
80101c3a:	5d                   	pop    %ebp
80101c3b:	c3                   	ret    
80101c3c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101c41:	eb f7                	jmp    80101c3a <idewait+0x29>

80101c43 <idestart>:
80101c43:	55                   	push   %ebp
80101c44:	89 e5                	mov    %esp,%ebp
80101c46:	56                   	push   %esi
80101c47:	53                   	push   %ebx
80101c48:	85 c0                	test   %eax,%eax
80101c4a:	74 7d                	je     80101cc9 <idestart+0x86>
80101c4c:	89 c6                	mov    %eax,%esi
80101c4e:	8b 58 08             	mov    0x8(%eax),%ebx
80101c51:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101c57:	77 7d                	ja     80101cd6 <idestart+0x93>
80101c59:	b8 00 00 00 00       	mov    $0x0,%eax
80101c5e:	e8 ae ff ff ff       	call   80101c11 <idewait>
80101c63:	b8 00 00 00 00       	mov    $0x0,%eax
80101c68:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101c6d:	ee                   	out    %al,(%dx)
80101c6e:	b8 01 00 00 00       	mov    $0x1,%eax
80101c73:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101c78:	ee                   	out    %al,(%dx)
80101c79:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101c7e:	89 d8                	mov    %ebx,%eax
80101c80:	ee                   	out    %al,(%dx)
80101c81:	89 d8                	mov    %ebx,%eax
80101c83:	c1 f8 08             	sar    $0x8,%eax
80101c86:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101c8b:	ee                   	out    %al,(%dx)
80101c8c:	89 d8                	mov    %ebx,%eax
80101c8e:	c1 f8 10             	sar    $0x10,%eax
80101c91:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101c96:	ee                   	out    %al,(%dx)
80101c97:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80101c9b:	c1 e0 04             	shl    $0x4,%eax
80101c9e:	83 e0 10             	and    $0x10,%eax
80101ca1:	c1 fb 18             	sar    $0x18,%ebx
80101ca4:	83 e3 0f             	and    $0xf,%ebx
80101ca7:	09 d8                	or     %ebx,%eax
80101ca9:	83 c8 e0             	or     $0xffffffe0,%eax
80101cac:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101cb1:	ee                   	out    %al,(%dx)
80101cb2:	f6 06 04             	testb  $0x4,(%esi)
80101cb5:	75 2c                	jne    80101ce3 <idestart+0xa0>
80101cb7:	b8 20 00 00 00       	mov    $0x20,%eax
80101cbc:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101cc1:	ee                   	out    %al,(%dx)
80101cc2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101cc5:	5b                   	pop    %ebx
80101cc6:	5e                   	pop    %esi
80101cc7:	5d                   	pop    %ebp
80101cc8:	c3                   	ret    
80101cc9:	83 ec 0c             	sub    $0xc,%esp
80101ccc:	68 4b 67 10 80       	push   $0x8010674b
80101cd1:	e8 72 e6 ff ff       	call   80100348 <panic>
80101cd6:	83 ec 0c             	sub    $0xc,%esp
80101cd9:	68 54 67 10 80       	push   $0x80106754
80101cde:	e8 65 e6 ff ff       	call   80100348 <panic>
80101ce3:	b8 30 00 00 00       	mov    $0x30,%eax
80101ce8:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101ced:	ee                   	out    %al,(%dx)
80101cee:	83 c6 5c             	add    $0x5c,%esi
80101cf1:	b9 80 00 00 00       	mov    $0x80,%ecx
80101cf6:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101cfb:	fc                   	cld    
80101cfc:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80101cfe:	eb c2                	jmp    80101cc2 <idestart+0x7f>

80101d00 <ideinit>:
80101d00:	55                   	push   %ebp
80101d01:	89 e5                	mov    %esp,%ebp
80101d03:	83 ec 10             	sub    $0x10,%esp
80101d06:	68 66 67 10 80       	push   $0x80106766
80101d0b:	68 80 95 10 80       	push   $0x80109580
80101d10:	e8 44 1d 00 00       	call   80103a59 <initlock>
80101d15:	83 c4 08             	add    $0x8,%esp
80101d18:	a1 00 1d 11 80       	mov    0x80111d00,%eax
80101d1d:	83 e8 01             	sub    $0x1,%eax
80101d20:	50                   	push   %eax
80101d21:	6a 0e                	push   $0xe
80101d23:	e8 56 02 00 00       	call   80101f7e <ioapicenable>
80101d28:	b8 00 00 00 00       	mov    $0x0,%eax
80101d2d:	e8 df fe ff ff       	call   80101c11 <idewait>
80101d32:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80101d37:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101d3c:	ee                   	out    %al,(%dx)
80101d3d:	83 c4 10             	add    $0x10,%esp
80101d40:	b9 00 00 00 00       	mov    $0x0,%ecx
80101d45:	81 f9 e7 03 00 00    	cmp    $0x3e7,%ecx
80101d4b:	7f 19                	jg     80101d66 <ideinit+0x66>
80101d4d:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101d52:	ec                   	in     (%dx),%al
80101d53:	84 c0                	test   %al,%al
80101d55:	75 05                	jne    80101d5c <ideinit+0x5c>
80101d57:	83 c1 01             	add    $0x1,%ecx
80101d5a:	eb e9                	jmp    80101d45 <ideinit+0x45>
80101d5c:	c7 05 60 95 10 80 01 	movl   $0x1,0x80109560
80101d63:	00 00 00 
80101d66:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80101d6b:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101d70:	ee                   	out    %al,(%dx)
80101d71:	c9                   	leave  
80101d72:	c3                   	ret    

80101d73 <ideintr>:
80101d73:	55                   	push   %ebp
80101d74:	89 e5                	mov    %esp,%ebp
80101d76:	57                   	push   %edi
80101d77:	53                   	push   %ebx
80101d78:	83 ec 0c             	sub    $0xc,%esp
80101d7b:	68 80 95 10 80       	push   $0x80109580
80101d80:	e8 10 1e 00 00       	call   80103b95 <acquire>
80101d85:	8b 1d 64 95 10 80    	mov    0x80109564,%ebx
80101d8b:	83 c4 10             	add    $0x10,%esp
80101d8e:	85 db                	test   %ebx,%ebx
80101d90:	74 48                	je     80101dda <ideintr+0x67>
80101d92:	8b 43 58             	mov    0x58(%ebx),%eax
80101d95:	a3 64 95 10 80       	mov    %eax,0x80109564
80101d9a:	f6 03 04             	testb  $0x4,(%ebx)
80101d9d:	74 4d                	je     80101dec <ideintr+0x79>
80101d9f:	8b 03                	mov    (%ebx),%eax
80101da1:	83 c8 02             	or     $0x2,%eax
80101da4:	83 e0 fb             	and    $0xfffffffb,%eax
80101da7:	89 03                	mov    %eax,(%ebx)
80101da9:	83 ec 0c             	sub    $0xc,%esp
80101dac:	53                   	push   %ebx
80101dad:	e8 4d 1a 00 00       	call   801037ff <wakeup>
80101db2:	a1 64 95 10 80       	mov    0x80109564,%eax
80101db7:	83 c4 10             	add    $0x10,%esp
80101dba:	85 c0                	test   %eax,%eax
80101dbc:	74 05                	je     80101dc3 <ideintr+0x50>
80101dbe:	e8 80 fe ff ff       	call   80101c43 <idestart>
80101dc3:	83 ec 0c             	sub    $0xc,%esp
80101dc6:	68 80 95 10 80       	push   $0x80109580
80101dcb:	e8 2a 1e 00 00       	call   80103bfa <release>
80101dd0:	83 c4 10             	add    $0x10,%esp
80101dd3:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101dd6:	5b                   	pop    %ebx
80101dd7:	5f                   	pop    %edi
80101dd8:	5d                   	pop    %ebp
80101dd9:	c3                   	ret    
80101dda:	83 ec 0c             	sub    $0xc,%esp
80101ddd:	68 80 95 10 80       	push   $0x80109580
80101de2:	e8 13 1e 00 00       	call   80103bfa <release>
80101de7:	83 c4 10             	add    $0x10,%esp
80101dea:	eb e7                	jmp    80101dd3 <ideintr+0x60>
80101dec:	b8 01 00 00 00       	mov    $0x1,%eax
80101df1:	e8 1b fe ff ff       	call   80101c11 <idewait>
80101df6:	85 c0                	test   %eax,%eax
80101df8:	78 a5                	js     80101d9f <ideintr+0x2c>
80101dfa:	8d 7b 5c             	lea    0x5c(%ebx),%edi
80101dfd:	b9 80 00 00 00       	mov    $0x80,%ecx
80101e02:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101e07:	fc                   	cld    
80101e08:	f3 6d                	rep insl (%dx),%es:(%edi)
80101e0a:	eb 93                	jmp    80101d9f <ideintr+0x2c>

80101e0c <iderw>:
80101e0c:	55                   	push   %ebp
80101e0d:	89 e5                	mov    %esp,%ebp
80101e0f:	53                   	push   %ebx
80101e10:	83 ec 10             	sub    $0x10,%esp
80101e13:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101e16:	8d 43 0c             	lea    0xc(%ebx),%eax
80101e19:	50                   	push   %eax
80101e1a:	e8 ec 1b 00 00       	call   80103a0b <holdingsleep>
80101e1f:	83 c4 10             	add    $0x10,%esp
80101e22:	85 c0                	test   %eax,%eax
80101e24:	74 37                	je     80101e5d <iderw+0x51>
80101e26:	8b 03                	mov    (%ebx),%eax
80101e28:	83 e0 06             	and    $0x6,%eax
80101e2b:	83 f8 02             	cmp    $0x2,%eax
80101e2e:	74 3a                	je     80101e6a <iderw+0x5e>
80101e30:	83 7b 04 00          	cmpl   $0x0,0x4(%ebx)
80101e34:	74 09                	je     80101e3f <iderw+0x33>
80101e36:	83 3d 60 95 10 80 00 	cmpl   $0x0,0x80109560
80101e3d:	74 38                	je     80101e77 <iderw+0x6b>
80101e3f:	83 ec 0c             	sub    $0xc,%esp
80101e42:	68 80 95 10 80       	push   $0x80109580
80101e47:	e8 49 1d 00 00       	call   80103b95 <acquire>
80101e4c:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
80101e53:	83 c4 10             	add    $0x10,%esp
80101e56:	ba 64 95 10 80       	mov    $0x80109564,%edx
80101e5b:	eb 2a                	jmp    80101e87 <iderw+0x7b>
80101e5d:	83 ec 0c             	sub    $0xc,%esp
80101e60:	68 6a 67 10 80       	push   $0x8010676a
80101e65:	e8 de e4 ff ff       	call   80100348 <panic>
80101e6a:	83 ec 0c             	sub    $0xc,%esp
80101e6d:	68 80 67 10 80       	push   $0x80106780
80101e72:	e8 d1 e4 ff ff       	call   80100348 <panic>
80101e77:	83 ec 0c             	sub    $0xc,%esp
80101e7a:	68 95 67 10 80       	push   $0x80106795
80101e7f:	e8 c4 e4 ff ff       	call   80100348 <panic>
80101e84:	8d 50 58             	lea    0x58(%eax),%edx
80101e87:	8b 02                	mov    (%edx),%eax
80101e89:	85 c0                	test   %eax,%eax
80101e8b:	75 f7                	jne    80101e84 <iderw+0x78>
80101e8d:	89 1a                	mov    %ebx,(%edx)
80101e8f:	39 1d 64 95 10 80    	cmp    %ebx,0x80109564
80101e95:	75 1a                	jne    80101eb1 <iderw+0xa5>
80101e97:	89 d8                	mov    %ebx,%eax
80101e99:	e8 a5 fd ff ff       	call   80101c43 <idestart>
80101e9e:	eb 11                	jmp    80101eb1 <iderw+0xa5>
80101ea0:	83 ec 08             	sub    $0x8,%esp
80101ea3:	68 80 95 10 80       	push   $0x80109580
80101ea8:	53                   	push   %ebx
80101ea9:	e8 ec 17 00 00       	call   8010369a <sleep>
80101eae:	83 c4 10             	add    $0x10,%esp
80101eb1:	8b 03                	mov    (%ebx),%eax
80101eb3:	83 e0 06             	and    $0x6,%eax
80101eb6:	83 f8 02             	cmp    $0x2,%eax
80101eb9:	75 e5                	jne    80101ea0 <iderw+0x94>
80101ebb:	83 ec 0c             	sub    $0xc,%esp
80101ebe:	68 80 95 10 80       	push   $0x80109580
80101ec3:	e8 32 1d 00 00       	call   80103bfa <release>
80101ec8:	83 c4 10             	add    $0x10,%esp
80101ecb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101ece:	c9                   	leave  
80101ecf:	c3                   	ret    

80101ed0 <ioapicread>:
80101ed0:	55                   	push   %ebp
80101ed1:	89 e5                	mov    %esp,%ebp
80101ed3:	8b 15 34 16 11 80    	mov    0x80111634,%edx
80101ed9:	89 02                	mov    %eax,(%edx)
80101edb:	a1 34 16 11 80       	mov    0x80111634,%eax
80101ee0:	8b 40 10             	mov    0x10(%eax),%eax
80101ee3:	5d                   	pop    %ebp
80101ee4:	c3                   	ret    

80101ee5 <ioapicwrite>:
80101ee5:	55                   	push   %ebp
80101ee6:	89 e5                	mov    %esp,%ebp
80101ee8:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
80101eee:	89 01                	mov    %eax,(%ecx)
80101ef0:	a1 34 16 11 80       	mov    0x80111634,%eax
80101ef5:	89 50 10             	mov    %edx,0x10(%eax)
80101ef8:	5d                   	pop    %ebp
80101ef9:	c3                   	ret    

80101efa <ioapicinit>:
80101efa:	55                   	push   %ebp
80101efb:	89 e5                	mov    %esp,%ebp
80101efd:	57                   	push   %edi
80101efe:	56                   	push   %esi
80101eff:	53                   	push   %ebx
80101f00:	83 ec 0c             	sub    $0xc,%esp
80101f03:	c7 05 34 16 11 80 00 	movl   $0xfec00000,0x80111634
80101f0a:	00 c0 fe 
80101f0d:	b8 01 00 00 00       	mov    $0x1,%eax
80101f12:	e8 b9 ff ff ff       	call   80101ed0 <ioapicread>
80101f17:	c1 e8 10             	shr    $0x10,%eax
80101f1a:	0f b6 f8             	movzbl %al,%edi
80101f1d:	b8 00 00 00 00       	mov    $0x0,%eax
80101f22:	e8 a9 ff ff ff       	call   80101ed0 <ioapicread>
80101f27:	c1 e8 18             	shr    $0x18,%eax
80101f2a:	0f b6 15 60 17 11 80 	movzbl 0x80111760,%edx
80101f31:	39 c2                	cmp    %eax,%edx
80101f33:	75 07                	jne    80101f3c <ioapicinit+0x42>
80101f35:	bb 00 00 00 00       	mov    $0x0,%ebx
80101f3a:	eb 36                	jmp    80101f72 <ioapicinit+0x78>
80101f3c:	83 ec 0c             	sub    $0xc,%esp
80101f3f:	68 b4 67 10 80       	push   $0x801067b4
80101f44:	e8 c2 e6 ff ff       	call   8010060b <cprintf>
80101f49:	83 c4 10             	add    $0x10,%esp
80101f4c:	eb e7                	jmp    80101f35 <ioapicinit+0x3b>
80101f4e:	8d 53 20             	lea    0x20(%ebx),%edx
80101f51:	81 ca 00 00 01 00    	or     $0x10000,%edx
80101f57:	8d 74 1b 10          	lea    0x10(%ebx,%ebx,1),%esi
80101f5b:	89 f0                	mov    %esi,%eax
80101f5d:	e8 83 ff ff ff       	call   80101ee5 <ioapicwrite>
80101f62:	8d 46 01             	lea    0x1(%esi),%eax
80101f65:	ba 00 00 00 00       	mov    $0x0,%edx
80101f6a:	e8 76 ff ff ff       	call   80101ee5 <ioapicwrite>
80101f6f:	83 c3 01             	add    $0x1,%ebx
80101f72:	39 fb                	cmp    %edi,%ebx
80101f74:	7e d8                	jle    80101f4e <ioapicinit+0x54>
80101f76:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f79:	5b                   	pop    %ebx
80101f7a:	5e                   	pop    %esi
80101f7b:	5f                   	pop    %edi
80101f7c:	5d                   	pop    %ebp
80101f7d:	c3                   	ret    

80101f7e <ioapicenable>:
80101f7e:	55                   	push   %ebp
80101f7f:	89 e5                	mov    %esp,%ebp
80101f81:	53                   	push   %ebx
80101f82:	8b 45 08             	mov    0x8(%ebp),%eax
80101f85:	8d 50 20             	lea    0x20(%eax),%edx
80101f88:	8d 5c 00 10          	lea    0x10(%eax,%eax,1),%ebx
80101f8c:	89 d8                	mov    %ebx,%eax
80101f8e:	e8 52 ff ff ff       	call   80101ee5 <ioapicwrite>
80101f93:	8b 55 0c             	mov    0xc(%ebp),%edx
80101f96:	c1 e2 18             	shl    $0x18,%edx
80101f99:	8d 43 01             	lea    0x1(%ebx),%eax
80101f9c:	e8 44 ff ff ff       	call   80101ee5 <ioapicwrite>
80101fa1:	5b                   	pop    %ebx
80101fa2:	5d                   	pop    %ebp
80101fa3:	c3                   	ret    

80101fa4 <kfree>:
80101fa4:	55                   	push   %ebp
80101fa5:	89 e5                	mov    %esp,%ebp
80101fa7:	53                   	push   %ebx
80101fa8:	83 ec 04             	sub    $0x4,%esp
80101fab:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101fae:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80101fb4:	75 4c                	jne    80102002 <kfree+0x5e>
80101fb6:	81 fb a8 44 11 80    	cmp    $0x801144a8,%ebx
80101fbc:	72 44                	jb     80102002 <kfree+0x5e>
80101fbe:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80101fc4:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80101fc9:	77 37                	ja     80102002 <kfree+0x5e>
80101fcb:	83 ec 04             	sub    $0x4,%esp
80101fce:	68 00 10 00 00       	push   $0x1000
80101fd3:	6a 01                	push   $0x1
80101fd5:	53                   	push   %ebx
80101fd6:	e8 66 1c 00 00       	call   80103c41 <memset>
80101fdb:	83 c4 10             	add    $0x10,%esp
80101fde:	83 3d 74 16 11 80 00 	cmpl   $0x0,0x80111674
80101fe5:	75 28                	jne    8010200f <kfree+0x6b>
80101fe7:	a1 78 16 11 80       	mov    0x80111678,%eax
80101fec:	89 03                	mov    %eax,(%ebx)
80101fee:	89 1d 78 16 11 80    	mov    %ebx,0x80111678
80101ff4:	83 3d 74 16 11 80 00 	cmpl   $0x0,0x80111674
80101ffb:	75 24                	jne    80102021 <kfree+0x7d>
80101ffd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102000:	c9                   	leave  
80102001:	c3                   	ret    
80102002:	83 ec 0c             	sub    $0xc,%esp
80102005:	68 e6 67 10 80       	push   $0x801067e6
8010200a:	e8 39 e3 ff ff       	call   80100348 <panic>
8010200f:	83 ec 0c             	sub    $0xc,%esp
80102012:	68 40 16 11 80       	push   $0x80111640
80102017:	e8 79 1b 00 00       	call   80103b95 <acquire>
8010201c:	83 c4 10             	add    $0x10,%esp
8010201f:	eb c6                	jmp    80101fe7 <kfree+0x43>
80102021:	83 ec 0c             	sub    $0xc,%esp
80102024:	68 40 16 11 80       	push   $0x80111640
80102029:	e8 cc 1b 00 00       	call   80103bfa <release>
8010202e:	83 c4 10             	add    $0x10,%esp
80102031:	eb ca                	jmp    80101ffd <kfree+0x59>

80102033 <freerange>:
80102033:	55                   	push   %ebp
80102034:	89 e5                	mov    %esp,%ebp
80102036:	56                   	push   %esi
80102037:	53                   	push   %ebx
80102038:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010203b:	8b 45 08             	mov    0x8(%ebp),%eax
8010203e:	05 ff 0f 00 00       	add    $0xfff,%eax
80102043:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80102048:	eb 0e                	jmp    80102058 <freerange+0x25>
8010204a:	83 ec 0c             	sub    $0xc,%esp
8010204d:	50                   	push   %eax
8010204e:	e8 51 ff ff ff       	call   80101fa4 <kfree>
80102053:	83 c4 10             	add    $0x10,%esp
80102056:	89 f0                	mov    %esi,%eax
80102058:	8d b0 00 10 00 00    	lea    0x1000(%eax),%esi
8010205e:	39 de                	cmp    %ebx,%esi
80102060:	76 e8                	jbe    8010204a <freerange+0x17>
80102062:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102065:	5b                   	pop    %ebx
80102066:	5e                   	pop    %esi
80102067:	5d                   	pop    %ebp
80102068:	c3                   	ret    

80102069 <kinit1>:
80102069:	55                   	push   %ebp
8010206a:	89 e5                	mov    %esp,%ebp
8010206c:	83 ec 10             	sub    $0x10,%esp
8010206f:	68 ec 67 10 80       	push   $0x801067ec
80102074:	68 40 16 11 80       	push   $0x80111640
80102079:	e8 db 19 00 00       	call   80103a59 <initlock>
8010207e:	c7 05 74 16 11 80 00 	movl   $0x0,0x80111674
80102085:	00 00 00 
80102088:	83 c4 08             	add    $0x8,%esp
8010208b:	ff 75 0c             	pushl  0xc(%ebp)
8010208e:	ff 75 08             	pushl  0x8(%ebp)
80102091:	e8 9d ff ff ff       	call   80102033 <freerange>
80102096:	83 c4 10             	add    $0x10,%esp
80102099:	c9                   	leave  
8010209a:	c3                   	ret    

8010209b <kinit2>:
8010209b:	55                   	push   %ebp
8010209c:	89 e5                	mov    %esp,%ebp
8010209e:	83 ec 10             	sub    $0x10,%esp
801020a1:	ff 75 0c             	pushl  0xc(%ebp)
801020a4:	ff 75 08             	pushl  0x8(%ebp)
801020a7:	e8 87 ff ff ff       	call   80102033 <freerange>
801020ac:	c7 05 74 16 11 80 01 	movl   $0x1,0x80111674
801020b3:	00 00 00 
801020b6:	83 c4 10             	add    $0x10,%esp
801020b9:	c9                   	leave  
801020ba:	c3                   	ret    

801020bb <kalloc>:
801020bb:	55                   	push   %ebp
801020bc:	89 e5                	mov    %esp,%ebp
801020be:	53                   	push   %ebx
801020bf:	83 ec 04             	sub    $0x4,%esp
801020c2:	83 3d 74 16 11 80 00 	cmpl   $0x0,0x80111674
801020c9:	75 21                	jne    801020ec <kalloc+0x31>
801020cb:	8b 1d 78 16 11 80    	mov    0x80111678,%ebx
801020d1:	85 db                	test   %ebx,%ebx
801020d3:	74 07                	je     801020dc <kalloc+0x21>
801020d5:	8b 03                	mov    (%ebx),%eax
801020d7:	a3 78 16 11 80       	mov    %eax,0x80111678
801020dc:	83 3d 74 16 11 80 00 	cmpl   $0x0,0x80111674
801020e3:	75 19                	jne    801020fe <kalloc+0x43>
801020e5:	89 d8                	mov    %ebx,%eax
801020e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801020ea:	c9                   	leave  
801020eb:	c3                   	ret    
801020ec:	83 ec 0c             	sub    $0xc,%esp
801020ef:	68 40 16 11 80       	push   $0x80111640
801020f4:	e8 9c 1a 00 00       	call   80103b95 <acquire>
801020f9:	83 c4 10             	add    $0x10,%esp
801020fc:	eb cd                	jmp    801020cb <kalloc+0x10>
801020fe:	83 ec 0c             	sub    $0xc,%esp
80102101:	68 40 16 11 80       	push   $0x80111640
80102106:	e8 ef 1a 00 00       	call   80103bfa <release>
8010210b:	83 c4 10             	add    $0x10,%esp
8010210e:	eb d5                	jmp    801020e5 <kalloc+0x2a>

80102110 <kbdgetc>:
80102110:	55                   	push   %ebp
80102111:	89 e5                	mov    %esp,%ebp
80102113:	ba 64 00 00 00       	mov    $0x64,%edx
80102118:	ec                   	in     (%dx),%al
80102119:	a8 01                	test   $0x1,%al
8010211b:	0f 84 b5 00 00 00    	je     801021d6 <kbdgetc+0xc6>
80102121:	ba 60 00 00 00       	mov    $0x60,%edx
80102126:	ec                   	in     (%dx),%al
80102127:	0f b6 d0             	movzbl %al,%edx
8010212a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102130:	74 5c                	je     8010218e <kbdgetc+0x7e>
80102132:	84 c0                	test   %al,%al
80102134:	78 66                	js     8010219c <kbdgetc+0x8c>
80102136:	8b 0d b4 95 10 80    	mov    0x801095b4,%ecx
8010213c:	f6 c1 40             	test   $0x40,%cl
8010213f:	74 0f                	je     80102150 <kbdgetc+0x40>
80102141:	83 c8 80             	or     $0xffffff80,%eax
80102144:	0f b6 d0             	movzbl %al,%edx
80102147:	83 e1 bf             	and    $0xffffffbf,%ecx
8010214a:	89 0d b4 95 10 80    	mov    %ecx,0x801095b4
80102150:	0f b6 8a 20 69 10 80 	movzbl -0x7fef96e0(%edx),%ecx
80102157:	0b 0d b4 95 10 80    	or     0x801095b4,%ecx
8010215d:	0f b6 82 20 68 10 80 	movzbl -0x7fef97e0(%edx),%eax
80102164:	31 c1                	xor    %eax,%ecx
80102166:	89 0d b4 95 10 80    	mov    %ecx,0x801095b4
8010216c:	89 c8                	mov    %ecx,%eax
8010216e:	83 e0 03             	and    $0x3,%eax
80102171:	8b 04 85 00 68 10 80 	mov    -0x7fef9800(,%eax,4),%eax
80102178:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
8010217c:	f6 c1 08             	test   $0x8,%cl
8010217f:	74 19                	je     8010219a <kbdgetc+0x8a>
80102181:	8d 50 9f             	lea    -0x61(%eax),%edx
80102184:	83 fa 19             	cmp    $0x19,%edx
80102187:	77 40                	ja     801021c9 <kbdgetc+0xb9>
80102189:	83 e8 20             	sub    $0x20,%eax
8010218c:	eb 0c                	jmp    8010219a <kbdgetc+0x8a>
8010218e:	83 0d b4 95 10 80 40 	orl    $0x40,0x801095b4
80102195:	b8 00 00 00 00       	mov    $0x0,%eax
8010219a:	5d                   	pop    %ebp
8010219b:	c3                   	ret    
8010219c:	8b 0d b4 95 10 80    	mov    0x801095b4,%ecx
801021a2:	f6 c1 40             	test   $0x40,%cl
801021a5:	75 05                	jne    801021ac <kbdgetc+0x9c>
801021a7:	89 c2                	mov    %eax,%edx
801021a9:	83 e2 7f             	and    $0x7f,%edx
801021ac:	0f b6 82 20 69 10 80 	movzbl -0x7fef96e0(%edx),%eax
801021b3:	83 c8 40             	or     $0x40,%eax
801021b6:	0f b6 c0             	movzbl %al,%eax
801021b9:	f7 d0                	not    %eax
801021bb:	21 c8                	and    %ecx,%eax
801021bd:	a3 b4 95 10 80       	mov    %eax,0x801095b4
801021c2:	b8 00 00 00 00       	mov    $0x0,%eax
801021c7:	eb d1                	jmp    8010219a <kbdgetc+0x8a>
801021c9:	8d 50 bf             	lea    -0x41(%eax),%edx
801021cc:	83 fa 19             	cmp    $0x19,%edx
801021cf:	77 c9                	ja     8010219a <kbdgetc+0x8a>
801021d1:	83 c0 20             	add    $0x20,%eax
801021d4:	eb c4                	jmp    8010219a <kbdgetc+0x8a>
801021d6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801021db:	eb bd                	jmp    8010219a <kbdgetc+0x8a>

801021dd <kbdintr>:
801021dd:	55                   	push   %ebp
801021de:	89 e5                	mov    %esp,%ebp
801021e0:	83 ec 14             	sub    $0x14,%esp
801021e3:	68 10 21 10 80       	push   $0x80102110
801021e8:	e8 51 e5 ff ff       	call   8010073e <consoleintr>
801021ed:	83 c4 10             	add    $0x10,%esp
801021f0:	c9                   	leave  
801021f1:	c3                   	ret    

801021f2 <lapicw>:
801021f2:	55                   	push   %ebp
801021f3:	89 e5                	mov    %esp,%ebp
801021f5:	8b 0d 7c 16 11 80    	mov    0x8011167c,%ecx
801021fb:	8d 04 81             	lea    (%ecx,%eax,4),%eax
801021fe:	89 10                	mov    %edx,(%eax)
80102200:	a1 7c 16 11 80       	mov    0x8011167c,%eax
80102205:	8b 40 20             	mov    0x20(%eax),%eax
80102208:	5d                   	pop    %ebp
80102209:	c3                   	ret    

8010220a <cmos_read>:
8010220a:	55                   	push   %ebp
8010220b:	89 e5                	mov    %esp,%ebp
8010220d:	ba 70 00 00 00       	mov    $0x70,%edx
80102212:	ee                   	out    %al,(%dx)
80102213:	ba 71 00 00 00       	mov    $0x71,%edx
80102218:	ec                   	in     (%dx),%al
80102219:	0f b6 c0             	movzbl %al,%eax
8010221c:	5d                   	pop    %ebp
8010221d:	c3                   	ret    

8010221e <fill_rtcdate>:
8010221e:	55                   	push   %ebp
8010221f:	89 e5                	mov    %esp,%ebp
80102221:	53                   	push   %ebx
80102222:	89 c3                	mov    %eax,%ebx
80102224:	b8 00 00 00 00       	mov    $0x0,%eax
80102229:	e8 dc ff ff ff       	call   8010220a <cmos_read>
8010222e:	89 03                	mov    %eax,(%ebx)
80102230:	b8 02 00 00 00       	mov    $0x2,%eax
80102235:	e8 d0 ff ff ff       	call   8010220a <cmos_read>
8010223a:	89 43 04             	mov    %eax,0x4(%ebx)
8010223d:	b8 04 00 00 00       	mov    $0x4,%eax
80102242:	e8 c3 ff ff ff       	call   8010220a <cmos_read>
80102247:	89 43 08             	mov    %eax,0x8(%ebx)
8010224a:	b8 07 00 00 00       	mov    $0x7,%eax
8010224f:	e8 b6 ff ff ff       	call   8010220a <cmos_read>
80102254:	89 43 0c             	mov    %eax,0xc(%ebx)
80102257:	b8 08 00 00 00       	mov    $0x8,%eax
8010225c:	e8 a9 ff ff ff       	call   8010220a <cmos_read>
80102261:	89 43 10             	mov    %eax,0x10(%ebx)
80102264:	b8 09 00 00 00       	mov    $0x9,%eax
80102269:	e8 9c ff ff ff       	call   8010220a <cmos_read>
8010226e:	89 43 14             	mov    %eax,0x14(%ebx)
80102271:	5b                   	pop    %ebx
80102272:	5d                   	pop    %ebp
80102273:	c3                   	ret    

80102274 <lapicinit>:
80102274:	83 3d 7c 16 11 80 00 	cmpl   $0x0,0x8011167c
8010227b:	0f 84 fb 00 00 00    	je     8010237c <lapicinit+0x108>
80102281:	55                   	push   %ebp
80102282:	89 e5                	mov    %esp,%ebp
80102284:	ba 3f 01 00 00       	mov    $0x13f,%edx
80102289:	b8 3c 00 00 00       	mov    $0x3c,%eax
8010228e:	e8 5f ff ff ff       	call   801021f2 <lapicw>
80102293:	ba 0b 00 00 00       	mov    $0xb,%edx
80102298:	b8 f8 00 00 00       	mov    $0xf8,%eax
8010229d:	e8 50 ff ff ff       	call   801021f2 <lapicw>
801022a2:	ba 20 00 02 00       	mov    $0x20020,%edx
801022a7:	b8 c8 00 00 00       	mov    $0xc8,%eax
801022ac:	e8 41 ff ff ff       	call   801021f2 <lapicw>
801022b1:	ba 80 96 98 00       	mov    $0x989680,%edx
801022b6:	b8 e0 00 00 00       	mov    $0xe0,%eax
801022bb:	e8 32 ff ff ff       	call   801021f2 <lapicw>
801022c0:	ba 00 00 01 00       	mov    $0x10000,%edx
801022c5:	b8 d4 00 00 00       	mov    $0xd4,%eax
801022ca:	e8 23 ff ff ff       	call   801021f2 <lapicw>
801022cf:	ba 00 00 01 00       	mov    $0x10000,%edx
801022d4:	b8 d8 00 00 00       	mov    $0xd8,%eax
801022d9:	e8 14 ff ff ff       	call   801021f2 <lapicw>
801022de:	a1 7c 16 11 80       	mov    0x8011167c,%eax
801022e3:	8b 40 30             	mov    0x30(%eax),%eax
801022e6:	c1 e8 10             	shr    $0x10,%eax
801022e9:	3c 03                	cmp    $0x3,%al
801022eb:	77 7b                	ja     80102368 <lapicinit+0xf4>
801022ed:	ba 33 00 00 00       	mov    $0x33,%edx
801022f2:	b8 dc 00 00 00       	mov    $0xdc,%eax
801022f7:	e8 f6 fe ff ff       	call   801021f2 <lapicw>
801022fc:	ba 00 00 00 00       	mov    $0x0,%edx
80102301:	b8 a0 00 00 00       	mov    $0xa0,%eax
80102306:	e8 e7 fe ff ff       	call   801021f2 <lapicw>
8010230b:	ba 00 00 00 00       	mov    $0x0,%edx
80102310:	b8 a0 00 00 00       	mov    $0xa0,%eax
80102315:	e8 d8 fe ff ff       	call   801021f2 <lapicw>
8010231a:	ba 00 00 00 00       	mov    $0x0,%edx
8010231f:	b8 2c 00 00 00       	mov    $0x2c,%eax
80102324:	e8 c9 fe ff ff       	call   801021f2 <lapicw>
80102329:	ba 00 00 00 00       	mov    $0x0,%edx
8010232e:	b8 c4 00 00 00       	mov    $0xc4,%eax
80102333:	e8 ba fe ff ff       	call   801021f2 <lapicw>
80102338:	ba 00 85 08 00       	mov    $0x88500,%edx
8010233d:	b8 c0 00 00 00       	mov    $0xc0,%eax
80102342:	e8 ab fe ff ff       	call   801021f2 <lapicw>
80102347:	a1 7c 16 11 80       	mov    0x8011167c,%eax
8010234c:	8b 80 00 03 00 00    	mov    0x300(%eax),%eax
80102352:	f6 c4 10             	test   $0x10,%ah
80102355:	75 f0                	jne    80102347 <lapicinit+0xd3>
80102357:	ba 00 00 00 00       	mov    $0x0,%edx
8010235c:	b8 20 00 00 00       	mov    $0x20,%eax
80102361:	e8 8c fe ff ff       	call   801021f2 <lapicw>
80102366:	5d                   	pop    %ebp
80102367:	c3                   	ret    
80102368:	ba 00 00 01 00       	mov    $0x10000,%edx
8010236d:	b8 d0 00 00 00       	mov    $0xd0,%eax
80102372:	e8 7b fe ff ff       	call   801021f2 <lapicw>
80102377:	e9 71 ff ff ff       	jmp    801022ed <lapicinit+0x79>
8010237c:	f3 c3                	repz ret 

8010237e <lapicid>:
8010237e:	55                   	push   %ebp
8010237f:	89 e5                	mov    %esp,%ebp
80102381:	a1 7c 16 11 80       	mov    0x8011167c,%eax
80102386:	85 c0                	test   %eax,%eax
80102388:	74 08                	je     80102392 <lapicid+0x14>
8010238a:	8b 40 20             	mov    0x20(%eax),%eax
8010238d:	c1 e8 18             	shr    $0x18,%eax
80102390:	5d                   	pop    %ebp
80102391:	c3                   	ret    
80102392:	b8 00 00 00 00       	mov    $0x0,%eax
80102397:	eb f7                	jmp    80102390 <lapicid+0x12>

80102399 <lapiceoi>:
80102399:	83 3d 7c 16 11 80 00 	cmpl   $0x0,0x8011167c
801023a0:	74 14                	je     801023b6 <lapiceoi+0x1d>
801023a2:	55                   	push   %ebp
801023a3:	89 e5                	mov    %esp,%ebp
801023a5:	ba 00 00 00 00       	mov    $0x0,%edx
801023aa:	b8 2c 00 00 00       	mov    $0x2c,%eax
801023af:	e8 3e fe ff ff       	call   801021f2 <lapicw>
801023b4:	5d                   	pop    %ebp
801023b5:	c3                   	ret    
801023b6:	f3 c3                	repz ret 

801023b8 <microdelay>:
801023b8:	55                   	push   %ebp
801023b9:	89 e5                	mov    %esp,%ebp
801023bb:	5d                   	pop    %ebp
801023bc:	c3                   	ret    

801023bd <lapicstartap>:
801023bd:	55                   	push   %ebp
801023be:	89 e5                	mov    %esp,%ebp
801023c0:	57                   	push   %edi
801023c1:	56                   	push   %esi
801023c2:	53                   	push   %ebx
801023c3:	8b 75 08             	mov    0x8(%ebp),%esi
801023c6:	8b 7d 0c             	mov    0xc(%ebp),%edi
801023c9:	b8 0f 00 00 00       	mov    $0xf,%eax
801023ce:	ba 70 00 00 00       	mov    $0x70,%edx
801023d3:	ee                   	out    %al,(%dx)
801023d4:	b8 0a 00 00 00       	mov    $0xa,%eax
801023d9:	ba 71 00 00 00       	mov    $0x71,%edx
801023de:	ee                   	out    %al,(%dx)
801023df:	66 c7 05 67 04 00 80 	movw   $0x0,0x80000467
801023e6:	00 00 
801023e8:	89 f8                	mov    %edi,%eax
801023ea:	c1 e8 04             	shr    $0x4,%eax
801023ed:	66 a3 69 04 00 80    	mov    %ax,0x80000469
801023f3:	c1 e6 18             	shl    $0x18,%esi
801023f6:	89 f2                	mov    %esi,%edx
801023f8:	b8 c4 00 00 00       	mov    $0xc4,%eax
801023fd:	e8 f0 fd ff ff       	call   801021f2 <lapicw>
80102402:	ba 00 c5 00 00       	mov    $0xc500,%edx
80102407:	b8 c0 00 00 00       	mov    $0xc0,%eax
8010240c:	e8 e1 fd ff ff       	call   801021f2 <lapicw>
80102411:	ba 00 85 00 00       	mov    $0x8500,%edx
80102416:	b8 c0 00 00 00       	mov    $0xc0,%eax
8010241b:	e8 d2 fd ff ff       	call   801021f2 <lapicw>
80102420:	bb 00 00 00 00       	mov    $0x0,%ebx
80102425:	eb 21                	jmp    80102448 <lapicstartap+0x8b>
80102427:	89 f2                	mov    %esi,%edx
80102429:	b8 c4 00 00 00       	mov    $0xc4,%eax
8010242e:	e8 bf fd ff ff       	call   801021f2 <lapicw>
80102433:	89 fa                	mov    %edi,%edx
80102435:	c1 ea 0c             	shr    $0xc,%edx
80102438:	80 ce 06             	or     $0x6,%dh
8010243b:	b8 c0 00 00 00       	mov    $0xc0,%eax
80102440:	e8 ad fd ff ff       	call   801021f2 <lapicw>
80102445:	83 c3 01             	add    $0x1,%ebx
80102448:	83 fb 01             	cmp    $0x1,%ebx
8010244b:	7e da                	jle    80102427 <lapicstartap+0x6a>
8010244d:	5b                   	pop    %ebx
8010244e:	5e                   	pop    %esi
8010244f:	5f                   	pop    %edi
80102450:	5d                   	pop    %ebp
80102451:	c3                   	ret    

80102452 <cmostime>:
80102452:	55                   	push   %ebp
80102453:	89 e5                	mov    %esp,%ebp
80102455:	57                   	push   %edi
80102456:	56                   	push   %esi
80102457:	53                   	push   %ebx
80102458:	83 ec 3c             	sub    $0x3c,%esp
8010245b:	8b 75 08             	mov    0x8(%ebp),%esi
8010245e:	b8 0b 00 00 00       	mov    $0xb,%eax
80102463:	e8 a2 fd ff ff       	call   8010220a <cmos_read>
80102468:	83 e0 04             	and    $0x4,%eax
8010246b:	89 c7                	mov    %eax,%edi
8010246d:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102470:	e8 a9 fd ff ff       	call   8010221e <fill_rtcdate>
80102475:	b8 0a 00 00 00       	mov    $0xa,%eax
8010247a:	e8 8b fd ff ff       	call   8010220a <cmos_read>
8010247f:	a8 80                	test   $0x80,%al
80102481:	75 ea                	jne    8010246d <cmostime+0x1b>
80102483:	8d 5d b8             	lea    -0x48(%ebp),%ebx
80102486:	89 d8                	mov    %ebx,%eax
80102488:	e8 91 fd ff ff       	call   8010221e <fill_rtcdate>
8010248d:	83 ec 04             	sub    $0x4,%esp
80102490:	6a 18                	push   $0x18
80102492:	53                   	push   %ebx
80102493:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102496:	50                   	push   %eax
80102497:	e8 eb 17 00 00       	call   80103c87 <memcmp>
8010249c:	83 c4 10             	add    $0x10,%esp
8010249f:	85 c0                	test   %eax,%eax
801024a1:	75 ca                	jne    8010246d <cmostime+0x1b>
801024a3:	85 ff                	test   %edi,%edi
801024a5:	0f 85 84 00 00 00    	jne    8010252f <cmostime+0xdd>
801024ab:	8b 55 d0             	mov    -0x30(%ebp),%edx
801024ae:	89 d0                	mov    %edx,%eax
801024b0:	c1 e8 04             	shr    $0x4,%eax
801024b3:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
801024b6:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
801024b9:	83 e2 0f             	and    $0xf,%edx
801024bc:	01 d0                	add    %edx,%eax
801024be:	89 45 d0             	mov    %eax,-0x30(%ebp)
801024c1:	8b 55 d4             	mov    -0x2c(%ebp),%edx
801024c4:	89 d0                	mov    %edx,%eax
801024c6:	c1 e8 04             	shr    $0x4,%eax
801024c9:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
801024cc:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
801024cf:	83 e2 0f             	and    $0xf,%edx
801024d2:	01 d0                	add    %edx,%eax
801024d4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801024d7:	8b 55 d8             	mov    -0x28(%ebp),%edx
801024da:	89 d0                	mov    %edx,%eax
801024dc:	c1 e8 04             	shr    $0x4,%eax
801024df:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
801024e2:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
801024e5:	83 e2 0f             	and    $0xf,%edx
801024e8:	01 d0                	add    %edx,%eax
801024ea:	89 45 d8             	mov    %eax,-0x28(%ebp)
801024ed:	8b 55 dc             	mov    -0x24(%ebp),%edx
801024f0:	89 d0                	mov    %edx,%eax
801024f2:	c1 e8 04             	shr    $0x4,%eax
801024f5:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
801024f8:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
801024fb:	83 e2 0f             	and    $0xf,%edx
801024fe:	01 d0                	add    %edx,%eax
80102500:	89 45 dc             	mov    %eax,-0x24(%ebp)
80102503:	8b 55 e0             	mov    -0x20(%ebp),%edx
80102506:	89 d0                	mov    %edx,%eax
80102508:	c1 e8 04             	shr    $0x4,%eax
8010250b:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
8010250e:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
80102511:	83 e2 0f             	and    $0xf,%edx
80102514:	01 d0                	add    %edx,%eax
80102516:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102519:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010251c:	89 d0                	mov    %edx,%eax
8010251e:	c1 e8 04             	shr    $0x4,%eax
80102521:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102524:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
80102527:	83 e2 0f             	and    $0xf,%edx
8010252a:	01 d0                	add    %edx,%eax
8010252c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010252f:	8b 45 d0             	mov    -0x30(%ebp),%eax
80102532:	89 06                	mov    %eax,(%esi)
80102534:	8b 45 d4             	mov    -0x2c(%ebp),%eax
80102537:	89 46 04             	mov    %eax,0x4(%esi)
8010253a:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010253d:	89 46 08             	mov    %eax,0x8(%esi)
80102540:	8b 45 dc             	mov    -0x24(%ebp),%eax
80102543:	89 46 0c             	mov    %eax,0xc(%esi)
80102546:	8b 45 e0             	mov    -0x20(%ebp),%eax
80102549:	89 46 10             	mov    %eax,0x10(%esi)
8010254c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010254f:	89 46 14             	mov    %eax,0x14(%esi)
80102552:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
80102559:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010255c:	5b                   	pop    %ebx
8010255d:	5e                   	pop    %esi
8010255e:	5f                   	pop    %edi
8010255f:	5d                   	pop    %ebp
80102560:	c3                   	ret    

80102561 <read_head>:
80102561:	55                   	push   %ebp
80102562:	89 e5                	mov    %esp,%ebp
80102564:	53                   	push   %ebx
80102565:	83 ec 0c             	sub    $0xc,%esp
80102568:	ff 35 b4 16 11 80    	pushl  0x801116b4
8010256e:	ff 35 c4 16 11 80    	pushl  0x801116c4
80102574:	e8 f3 db ff ff       	call   8010016c <bread>
80102579:	8b 58 5c             	mov    0x5c(%eax),%ebx
8010257c:	89 1d c8 16 11 80    	mov    %ebx,0x801116c8
80102582:	83 c4 10             	add    $0x10,%esp
80102585:	ba 00 00 00 00       	mov    $0x0,%edx
8010258a:	eb 0e                	jmp    8010259a <read_head+0x39>
8010258c:	8b 4c 90 60          	mov    0x60(%eax,%edx,4),%ecx
80102590:	89 0c 95 cc 16 11 80 	mov    %ecx,-0x7feee934(,%edx,4)
80102597:	83 c2 01             	add    $0x1,%edx
8010259a:	39 d3                	cmp    %edx,%ebx
8010259c:	7f ee                	jg     8010258c <read_head+0x2b>
8010259e:	83 ec 0c             	sub    $0xc,%esp
801025a1:	50                   	push   %eax
801025a2:	e8 2e dc ff ff       	call   801001d5 <brelse>
801025a7:	83 c4 10             	add    $0x10,%esp
801025aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801025ad:	c9                   	leave  
801025ae:	c3                   	ret    

801025af <install_trans>:
801025af:	55                   	push   %ebp
801025b0:	89 e5                	mov    %esp,%ebp
801025b2:	57                   	push   %edi
801025b3:	56                   	push   %esi
801025b4:	53                   	push   %ebx
801025b5:	83 ec 0c             	sub    $0xc,%esp
801025b8:	bb 00 00 00 00       	mov    $0x0,%ebx
801025bd:	eb 66                	jmp    80102625 <install_trans+0x76>
801025bf:	89 d8                	mov    %ebx,%eax
801025c1:	03 05 b4 16 11 80    	add    0x801116b4,%eax
801025c7:	83 c0 01             	add    $0x1,%eax
801025ca:	83 ec 08             	sub    $0x8,%esp
801025cd:	50                   	push   %eax
801025ce:	ff 35 c4 16 11 80    	pushl  0x801116c4
801025d4:	e8 93 db ff ff       	call   8010016c <bread>
801025d9:	89 c7                	mov    %eax,%edi
801025db:	83 c4 08             	add    $0x8,%esp
801025de:	ff 34 9d cc 16 11 80 	pushl  -0x7feee934(,%ebx,4)
801025e5:	ff 35 c4 16 11 80    	pushl  0x801116c4
801025eb:	e8 7c db ff ff       	call   8010016c <bread>
801025f0:	89 c6                	mov    %eax,%esi
801025f2:	8d 57 5c             	lea    0x5c(%edi),%edx
801025f5:	8d 40 5c             	lea    0x5c(%eax),%eax
801025f8:	83 c4 0c             	add    $0xc,%esp
801025fb:	68 00 02 00 00       	push   $0x200
80102600:	52                   	push   %edx
80102601:	50                   	push   %eax
80102602:	e8 b5 16 00 00       	call   80103cbc <memmove>
80102607:	89 34 24             	mov    %esi,(%esp)
8010260a:	e8 8b db ff ff       	call   8010019a <bwrite>
8010260f:	89 3c 24             	mov    %edi,(%esp)
80102612:	e8 be db ff ff       	call   801001d5 <brelse>
80102617:	89 34 24             	mov    %esi,(%esp)
8010261a:	e8 b6 db ff ff       	call   801001d5 <brelse>
8010261f:	83 c3 01             	add    $0x1,%ebx
80102622:	83 c4 10             	add    $0x10,%esp
80102625:	39 1d c8 16 11 80    	cmp    %ebx,0x801116c8
8010262b:	7f 92                	jg     801025bf <install_trans+0x10>
8010262d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102630:	5b                   	pop    %ebx
80102631:	5e                   	pop    %esi
80102632:	5f                   	pop    %edi
80102633:	5d                   	pop    %ebp
80102634:	c3                   	ret    

80102635 <write_head>:
80102635:	55                   	push   %ebp
80102636:	89 e5                	mov    %esp,%ebp
80102638:	53                   	push   %ebx
80102639:	83 ec 0c             	sub    $0xc,%esp
8010263c:	ff 35 b4 16 11 80    	pushl  0x801116b4
80102642:	ff 35 c4 16 11 80    	pushl  0x801116c4
80102648:	e8 1f db ff ff       	call   8010016c <bread>
8010264d:	89 c3                	mov    %eax,%ebx
8010264f:	8b 0d c8 16 11 80    	mov    0x801116c8,%ecx
80102655:	89 48 5c             	mov    %ecx,0x5c(%eax)
80102658:	83 c4 10             	add    $0x10,%esp
8010265b:	b8 00 00 00 00       	mov    $0x0,%eax
80102660:	eb 0e                	jmp    80102670 <write_head+0x3b>
80102662:	8b 14 85 cc 16 11 80 	mov    -0x7feee934(,%eax,4),%edx
80102669:	89 54 83 60          	mov    %edx,0x60(%ebx,%eax,4)
8010266d:	83 c0 01             	add    $0x1,%eax
80102670:	39 c1                	cmp    %eax,%ecx
80102672:	7f ee                	jg     80102662 <write_head+0x2d>
80102674:	83 ec 0c             	sub    $0xc,%esp
80102677:	53                   	push   %ebx
80102678:	e8 1d db ff ff       	call   8010019a <bwrite>
8010267d:	89 1c 24             	mov    %ebx,(%esp)
80102680:	e8 50 db ff ff       	call   801001d5 <brelse>
80102685:	83 c4 10             	add    $0x10,%esp
80102688:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010268b:	c9                   	leave  
8010268c:	c3                   	ret    

8010268d <recover_from_log>:
8010268d:	55                   	push   %ebp
8010268e:	89 e5                	mov    %esp,%ebp
80102690:	83 ec 08             	sub    $0x8,%esp
80102693:	e8 c9 fe ff ff       	call   80102561 <read_head>
80102698:	e8 12 ff ff ff       	call   801025af <install_trans>
8010269d:	c7 05 c8 16 11 80 00 	movl   $0x0,0x801116c8
801026a4:	00 00 00 
801026a7:	e8 89 ff ff ff       	call   80102635 <write_head>
801026ac:	c9                   	leave  
801026ad:	c3                   	ret    

801026ae <write_log>:
801026ae:	55                   	push   %ebp
801026af:	89 e5                	mov    %esp,%ebp
801026b1:	57                   	push   %edi
801026b2:	56                   	push   %esi
801026b3:	53                   	push   %ebx
801026b4:	83 ec 0c             	sub    $0xc,%esp
801026b7:	bb 00 00 00 00       	mov    $0x0,%ebx
801026bc:	eb 66                	jmp    80102724 <write_log+0x76>
801026be:	89 d8                	mov    %ebx,%eax
801026c0:	03 05 b4 16 11 80    	add    0x801116b4,%eax
801026c6:	83 c0 01             	add    $0x1,%eax
801026c9:	83 ec 08             	sub    $0x8,%esp
801026cc:	50                   	push   %eax
801026cd:	ff 35 c4 16 11 80    	pushl  0x801116c4
801026d3:	e8 94 da ff ff       	call   8010016c <bread>
801026d8:	89 c6                	mov    %eax,%esi
801026da:	83 c4 08             	add    $0x8,%esp
801026dd:	ff 34 9d cc 16 11 80 	pushl  -0x7feee934(,%ebx,4)
801026e4:	ff 35 c4 16 11 80    	pushl  0x801116c4
801026ea:	e8 7d da ff ff       	call   8010016c <bread>
801026ef:	89 c7                	mov    %eax,%edi
801026f1:	8d 50 5c             	lea    0x5c(%eax),%edx
801026f4:	8d 46 5c             	lea    0x5c(%esi),%eax
801026f7:	83 c4 0c             	add    $0xc,%esp
801026fa:	68 00 02 00 00       	push   $0x200
801026ff:	52                   	push   %edx
80102700:	50                   	push   %eax
80102701:	e8 b6 15 00 00       	call   80103cbc <memmove>
80102706:	89 34 24             	mov    %esi,(%esp)
80102709:	e8 8c da ff ff       	call   8010019a <bwrite>
8010270e:	89 3c 24             	mov    %edi,(%esp)
80102711:	e8 bf da ff ff       	call   801001d5 <brelse>
80102716:	89 34 24             	mov    %esi,(%esp)
80102719:	e8 b7 da ff ff       	call   801001d5 <brelse>
8010271e:	83 c3 01             	add    $0x1,%ebx
80102721:	83 c4 10             	add    $0x10,%esp
80102724:	39 1d c8 16 11 80    	cmp    %ebx,0x801116c8
8010272a:	7f 92                	jg     801026be <write_log+0x10>
8010272c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010272f:	5b                   	pop    %ebx
80102730:	5e                   	pop    %esi
80102731:	5f                   	pop    %edi
80102732:	5d                   	pop    %ebp
80102733:	c3                   	ret    

80102734 <commit>:
80102734:	83 3d c8 16 11 80 00 	cmpl   $0x0,0x801116c8
8010273b:	7e 26                	jle    80102763 <commit+0x2f>
8010273d:	55                   	push   %ebp
8010273e:	89 e5                	mov    %esp,%ebp
80102740:	83 ec 08             	sub    $0x8,%esp
80102743:	e8 66 ff ff ff       	call   801026ae <write_log>
80102748:	e8 e8 fe ff ff       	call   80102635 <write_head>
8010274d:	e8 5d fe ff ff       	call   801025af <install_trans>
80102752:	c7 05 c8 16 11 80 00 	movl   $0x0,0x801116c8
80102759:	00 00 00 
8010275c:	e8 d4 fe ff ff       	call   80102635 <write_head>
80102761:	c9                   	leave  
80102762:	c3                   	ret    
80102763:	f3 c3                	repz ret 

80102765 <initlog>:
80102765:	55                   	push   %ebp
80102766:	89 e5                	mov    %esp,%ebp
80102768:	53                   	push   %ebx
80102769:	83 ec 2c             	sub    $0x2c,%esp
8010276c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010276f:	68 20 6a 10 80       	push   $0x80106a20
80102774:	68 80 16 11 80       	push   $0x80111680
80102779:	e8 db 12 00 00       	call   80103a59 <initlock>
8010277e:	83 c4 08             	add    $0x8,%esp
80102781:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102784:	50                   	push   %eax
80102785:	53                   	push   %ebx
80102786:	e8 ab ea ff ff       	call   80101236 <readsb>
8010278b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010278e:	a3 b4 16 11 80       	mov    %eax,0x801116b4
80102793:	8b 45 e8             	mov    -0x18(%ebp),%eax
80102796:	a3 b8 16 11 80       	mov    %eax,0x801116b8
8010279b:	89 1d c4 16 11 80    	mov    %ebx,0x801116c4
801027a1:	e8 e7 fe ff ff       	call   8010268d <recover_from_log>
801027a6:	83 c4 10             	add    $0x10,%esp
801027a9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801027ac:	c9                   	leave  
801027ad:	c3                   	ret    

801027ae <begin_op>:
801027ae:	55                   	push   %ebp
801027af:	89 e5                	mov    %esp,%ebp
801027b1:	83 ec 14             	sub    $0x14,%esp
801027b4:	68 80 16 11 80       	push   $0x80111680
801027b9:	e8 d7 13 00 00       	call   80103b95 <acquire>
801027be:	83 c4 10             	add    $0x10,%esp
801027c1:	eb 15                	jmp    801027d8 <begin_op+0x2a>
801027c3:	83 ec 08             	sub    $0x8,%esp
801027c6:	68 80 16 11 80       	push   $0x80111680
801027cb:	68 80 16 11 80       	push   $0x80111680
801027d0:	e8 c5 0e 00 00       	call   8010369a <sleep>
801027d5:	83 c4 10             	add    $0x10,%esp
801027d8:	83 3d c0 16 11 80 00 	cmpl   $0x0,0x801116c0
801027df:	75 e2                	jne    801027c3 <begin_op+0x15>
801027e1:	a1 bc 16 11 80       	mov    0x801116bc,%eax
801027e6:	83 c0 01             	add    $0x1,%eax
801027e9:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
801027ec:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
801027ef:	03 15 c8 16 11 80    	add    0x801116c8,%edx
801027f5:	83 fa 1e             	cmp    $0x1e,%edx
801027f8:	7e 17                	jle    80102811 <begin_op+0x63>
801027fa:	83 ec 08             	sub    $0x8,%esp
801027fd:	68 80 16 11 80       	push   $0x80111680
80102802:	68 80 16 11 80       	push   $0x80111680
80102807:	e8 8e 0e 00 00       	call   8010369a <sleep>
8010280c:	83 c4 10             	add    $0x10,%esp
8010280f:	eb c7                	jmp    801027d8 <begin_op+0x2a>
80102811:	a3 bc 16 11 80       	mov    %eax,0x801116bc
80102816:	83 ec 0c             	sub    $0xc,%esp
80102819:	68 80 16 11 80       	push   $0x80111680
8010281e:	e8 d7 13 00 00       	call   80103bfa <release>
80102823:	83 c4 10             	add    $0x10,%esp
80102826:	c9                   	leave  
80102827:	c3                   	ret    

80102828 <end_op>:
80102828:	55                   	push   %ebp
80102829:	89 e5                	mov    %esp,%ebp
8010282b:	53                   	push   %ebx
8010282c:	83 ec 10             	sub    $0x10,%esp
8010282f:	68 80 16 11 80       	push   $0x80111680
80102834:	e8 5c 13 00 00       	call   80103b95 <acquire>
80102839:	a1 bc 16 11 80       	mov    0x801116bc,%eax
8010283e:	83 e8 01             	sub    $0x1,%eax
80102841:	a3 bc 16 11 80       	mov    %eax,0x801116bc
80102846:	8b 1d c0 16 11 80    	mov    0x801116c0,%ebx
8010284c:	83 c4 10             	add    $0x10,%esp
8010284f:	85 db                	test   %ebx,%ebx
80102851:	75 2c                	jne    8010287f <end_op+0x57>
80102853:	85 c0                	test   %eax,%eax
80102855:	75 35                	jne    8010288c <end_op+0x64>
80102857:	c7 05 c0 16 11 80 01 	movl   $0x1,0x801116c0
8010285e:	00 00 00 
80102861:	bb 01 00 00 00       	mov    $0x1,%ebx
80102866:	83 ec 0c             	sub    $0xc,%esp
80102869:	68 80 16 11 80       	push   $0x80111680
8010286e:	e8 87 13 00 00       	call   80103bfa <release>
80102873:	83 c4 10             	add    $0x10,%esp
80102876:	85 db                	test   %ebx,%ebx
80102878:	75 24                	jne    8010289e <end_op+0x76>
8010287a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010287d:	c9                   	leave  
8010287e:	c3                   	ret    
8010287f:	83 ec 0c             	sub    $0xc,%esp
80102882:	68 24 6a 10 80       	push   $0x80106a24
80102887:	e8 bc da ff ff       	call   80100348 <panic>
8010288c:	83 ec 0c             	sub    $0xc,%esp
8010288f:	68 80 16 11 80       	push   $0x80111680
80102894:	e8 66 0f 00 00       	call   801037ff <wakeup>
80102899:	83 c4 10             	add    $0x10,%esp
8010289c:	eb c8                	jmp    80102866 <end_op+0x3e>
8010289e:	e8 91 fe ff ff       	call   80102734 <commit>
801028a3:	83 ec 0c             	sub    $0xc,%esp
801028a6:	68 80 16 11 80       	push   $0x80111680
801028ab:	e8 e5 12 00 00       	call   80103b95 <acquire>
801028b0:	c7 05 c0 16 11 80 00 	movl   $0x0,0x801116c0
801028b7:	00 00 00 
801028ba:	c7 04 24 80 16 11 80 	movl   $0x80111680,(%esp)
801028c1:	e8 39 0f 00 00       	call   801037ff <wakeup>
801028c6:	c7 04 24 80 16 11 80 	movl   $0x80111680,(%esp)
801028cd:	e8 28 13 00 00       	call   80103bfa <release>
801028d2:	83 c4 10             	add    $0x10,%esp
801028d5:	eb a3                	jmp    8010287a <end_op+0x52>

801028d7 <log_write>:
801028d7:	55                   	push   %ebp
801028d8:	89 e5                	mov    %esp,%ebp
801028da:	53                   	push   %ebx
801028db:	83 ec 04             	sub    $0x4,%esp
801028de:	8b 5d 08             	mov    0x8(%ebp),%ebx
801028e1:	8b 15 c8 16 11 80    	mov    0x801116c8,%edx
801028e7:	83 fa 1d             	cmp    $0x1d,%edx
801028ea:	7f 45                	jg     80102931 <log_write+0x5a>
801028ec:	a1 b8 16 11 80       	mov    0x801116b8,%eax
801028f1:	83 e8 01             	sub    $0x1,%eax
801028f4:	39 c2                	cmp    %eax,%edx
801028f6:	7d 39                	jge    80102931 <log_write+0x5a>
801028f8:	83 3d bc 16 11 80 00 	cmpl   $0x0,0x801116bc
801028ff:	7e 3d                	jle    8010293e <log_write+0x67>
80102901:	83 ec 0c             	sub    $0xc,%esp
80102904:	68 80 16 11 80       	push   $0x80111680
80102909:	e8 87 12 00 00       	call   80103b95 <acquire>
8010290e:	83 c4 10             	add    $0x10,%esp
80102911:	b8 00 00 00 00       	mov    $0x0,%eax
80102916:	8b 15 c8 16 11 80    	mov    0x801116c8,%edx
8010291c:	39 c2                	cmp    %eax,%edx
8010291e:	7e 2b                	jle    8010294b <log_write+0x74>
80102920:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102923:	39 0c 85 cc 16 11 80 	cmp    %ecx,-0x7feee934(,%eax,4)
8010292a:	74 1f                	je     8010294b <log_write+0x74>
8010292c:	83 c0 01             	add    $0x1,%eax
8010292f:	eb e5                	jmp    80102916 <log_write+0x3f>
80102931:	83 ec 0c             	sub    $0xc,%esp
80102934:	68 33 6a 10 80       	push   $0x80106a33
80102939:	e8 0a da ff ff       	call   80100348 <panic>
8010293e:	83 ec 0c             	sub    $0xc,%esp
80102941:	68 49 6a 10 80       	push   $0x80106a49
80102946:	e8 fd d9 ff ff       	call   80100348 <panic>
8010294b:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010294e:	89 0c 85 cc 16 11 80 	mov    %ecx,-0x7feee934(,%eax,4)
80102955:	39 c2                	cmp    %eax,%edx
80102957:	74 18                	je     80102971 <log_write+0x9a>
80102959:	83 0b 04             	orl    $0x4,(%ebx)
8010295c:	83 ec 0c             	sub    $0xc,%esp
8010295f:	68 80 16 11 80       	push   $0x80111680
80102964:	e8 91 12 00 00       	call   80103bfa <release>
80102969:	83 c4 10             	add    $0x10,%esp
8010296c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010296f:	c9                   	leave  
80102970:	c3                   	ret    
80102971:	83 c2 01             	add    $0x1,%edx
80102974:	89 15 c8 16 11 80    	mov    %edx,0x801116c8
8010297a:	eb dd                	jmp    80102959 <log_write+0x82>

8010297c <startothers>:
8010297c:	55                   	push   %ebp
8010297d:	89 e5                	mov    %esp,%ebp
8010297f:	53                   	push   %ebx
80102980:	83 ec 08             	sub    $0x8,%esp
80102983:	68 8a 00 00 00       	push   $0x8a
80102988:	68 8c 94 10 80       	push   $0x8010948c
8010298d:	68 00 70 00 80       	push   $0x80007000
80102992:	e8 25 13 00 00       	call   80103cbc <memmove>
80102997:	83 c4 10             	add    $0x10,%esp
8010299a:	bb 80 17 11 80       	mov    $0x80111780,%ebx
8010299f:	eb 06                	jmp    801029a7 <startothers+0x2b>
801029a1:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
801029a7:	69 05 00 1d 11 80 b0 	imul   $0xb0,0x80111d00,%eax
801029ae:	00 00 00 
801029b1:	05 80 17 11 80       	add    $0x80111780,%eax
801029b6:	39 d8                	cmp    %ebx,%eax
801029b8:	76 4c                	jbe    80102a06 <startothers+0x8a>
801029ba:	e8 c0 07 00 00       	call   8010317f <mycpu>
801029bf:	39 d8                	cmp    %ebx,%eax
801029c1:	74 de                	je     801029a1 <startothers+0x25>
801029c3:	e8 f3 f6 ff ff       	call   801020bb <kalloc>
801029c8:	05 00 10 00 00       	add    $0x1000,%eax
801029cd:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
801029d2:	c7 05 f8 6f 00 80 4a 	movl   $0x80102a4a,0x80006ff8
801029d9:	2a 10 80 
801029dc:	c7 05 f4 6f 00 80 00 	movl   $0x108000,0x80006ff4
801029e3:	80 10 00 
801029e6:	83 ec 08             	sub    $0x8,%esp
801029e9:	68 00 70 00 00       	push   $0x7000
801029ee:	0f b6 03             	movzbl (%ebx),%eax
801029f1:	50                   	push   %eax
801029f2:	e8 c6 f9 ff ff       	call   801023bd <lapicstartap>
801029f7:	83 c4 10             	add    $0x10,%esp
801029fa:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102a00:	85 c0                	test   %eax,%eax
80102a02:	74 f6                	je     801029fa <startothers+0x7e>
80102a04:	eb 9b                	jmp    801029a1 <startothers+0x25>
80102a06:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102a09:	c9                   	leave  
80102a0a:	c3                   	ret    

80102a0b <mpmain>:
80102a0b:	55                   	push   %ebp
80102a0c:	89 e5                	mov    %esp,%ebp
80102a0e:	53                   	push   %ebx
80102a0f:	83 ec 04             	sub    $0x4,%esp
80102a12:	e8 c4 07 00 00       	call   801031db <cpuid>
80102a17:	89 c3                	mov    %eax,%ebx
80102a19:	e8 bd 07 00 00       	call   801031db <cpuid>
80102a1e:	83 ec 04             	sub    $0x4,%esp
80102a21:	53                   	push   %ebx
80102a22:	50                   	push   %eax
80102a23:	68 64 6a 10 80       	push   $0x80106a64
80102a28:	e8 de db ff ff       	call   8010060b <cprintf>
80102a2d:	e8 24 24 00 00       	call   80104e56 <idtinit>
80102a32:	e8 48 07 00 00       	call   8010317f <mycpu>
80102a37:	89 c2                	mov    %eax,%edx
80102a39:	b8 01 00 00 00       	mov    $0x1,%eax
80102a3e:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80102a45:	e8 2b 0a 00 00       	call   80103475 <scheduler>

80102a4a <mpenter>:
80102a4a:	55                   	push   %ebp
80102a4b:	89 e5                	mov    %esp,%ebp
80102a4d:	83 ec 08             	sub    $0x8,%esp
80102a50:	e8 bc 34 00 00       	call   80105f11 <switchkvm>
80102a55:	e8 f3 32 00 00       	call   80105d4d <seginit>
80102a5a:	e8 15 f8 ff ff       	call   80102274 <lapicinit>
80102a5f:	e8 a7 ff ff ff       	call   80102a0b <mpmain>

80102a64 <main>:
80102a64:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102a68:	83 e4 f0             	and    $0xfffffff0,%esp
80102a6b:	ff 71 fc             	pushl  -0x4(%ecx)
80102a6e:	55                   	push   %ebp
80102a6f:	89 e5                	mov    %esp,%ebp
80102a71:	51                   	push   %ecx
80102a72:	83 ec 0c             	sub    $0xc,%esp
80102a75:	68 00 00 40 80       	push   $0x80400000
80102a7a:	68 a8 44 11 80       	push   $0x801144a8
80102a7f:	e8 e5 f5 ff ff       	call   80102069 <kinit1>
80102a84:	e8 15 39 00 00       	call   8010639e <kvmalloc>
80102a89:	e8 c9 01 00 00       	call   80102c57 <mpinit>
80102a8e:	e8 e1 f7 ff ff       	call   80102274 <lapicinit>
80102a93:	e8 b5 32 00 00       	call   80105d4d <seginit>
80102a98:	e8 82 02 00 00       	call   80102d1f <picinit>
80102a9d:	e8 58 f4 ff ff       	call   80101efa <ioapicinit>
80102aa2:	e8 e7 dd ff ff       	call   8010088e <consoleinit>
80102aa7:	e8 08 27 00 00       	call   801051b4 <uartinit>
80102aac:	e8 b4 06 00 00       	call   80103165 <pinit>
80102ab1:	e8 ef 22 00 00       	call   80104da5 <tvinit>
80102ab6:	e8 39 d6 ff ff       	call   801000f4 <binit>
80102abb:	e8 53 e1 ff ff       	call   80100c13 <fileinit>
80102ac0:	e8 3b f2 ff ff       	call   80101d00 <ideinit>
80102ac5:	e8 b2 fe ff ff       	call   8010297c <startothers>
80102aca:	83 c4 08             	add    $0x8,%esp
80102acd:	68 00 00 00 8e       	push   $0x8e000000
80102ad2:	68 00 00 40 80       	push   $0x80400000
80102ad7:	e8 bf f5 ff ff       	call   8010209b <kinit2>
80102adc:	e8 39 07 00 00       	call   8010321a <userinit>
80102ae1:	e8 25 ff ff ff       	call   80102a0b <mpmain>

80102ae6 <sum>:
80102ae6:	55                   	push   %ebp
80102ae7:	89 e5                	mov    %esp,%ebp
80102ae9:	56                   	push   %esi
80102aea:	53                   	push   %ebx
80102aeb:	bb 00 00 00 00       	mov    $0x0,%ebx
80102af0:	b9 00 00 00 00       	mov    $0x0,%ecx
80102af5:	eb 09                	jmp    80102b00 <sum+0x1a>
80102af7:	0f b6 34 08          	movzbl (%eax,%ecx,1),%esi
80102afb:	01 f3                	add    %esi,%ebx
80102afd:	83 c1 01             	add    $0x1,%ecx
80102b00:	39 d1                	cmp    %edx,%ecx
80102b02:	7c f3                	jl     80102af7 <sum+0x11>
80102b04:	89 d8                	mov    %ebx,%eax
80102b06:	5b                   	pop    %ebx
80102b07:	5e                   	pop    %esi
80102b08:	5d                   	pop    %ebp
80102b09:	c3                   	ret    

80102b0a <mpsearch1>:
80102b0a:	55                   	push   %ebp
80102b0b:	89 e5                	mov    %esp,%ebp
80102b0d:	56                   	push   %esi
80102b0e:	53                   	push   %ebx
80102b0f:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80102b15:	89 f3                	mov    %esi,%ebx
80102b17:	01 d6                	add    %edx,%esi
80102b19:	eb 03                	jmp    80102b1e <mpsearch1+0x14>
80102b1b:	83 c3 10             	add    $0x10,%ebx
80102b1e:	39 f3                	cmp    %esi,%ebx
80102b20:	73 29                	jae    80102b4b <mpsearch1+0x41>
80102b22:	83 ec 04             	sub    $0x4,%esp
80102b25:	6a 04                	push   $0x4
80102b27:	68 78 6a 10 80       	push   $0x80106a78
80102b2c:	53                   	push   %ebx
80102b2d:	e8 55 11 00 00       	call   80103c87 <memcmp>
80102b32:	83 c4 10             	add    $0x10,%esp
80102b35:	85 c0                	test   %eax,%eax
80102b37:	75 e2                	jne    80102b1b <mpsearch1+0x11>
80102b39:	ba 10 00 00 00       	mov    $0x10,%edx
80102b3e:	89 d8                	mov    %ebx,%eax
80102b40:	e8 a1 ff ff ff       	call   80102ae6 <sum>
80102b45:	84 c0                	test   %al,%al
80102b47:	75 d2                	jne    80102b1b <mpsearch1+0x11>
80102b49:	eb 05                	jmp    80102b50 <mpsearch1+0x46>
80102b4b:	bb 00 00 00 00       	mov    $0x0,%ebx
80102b50:	89 d8                	mov    %ebx,%eax
80102b52:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102b55:	5b                   	pop    %ebx
80102b56:	5e                   	pop    %esi
80102b57:	5d                   	pop    %ebp
80102b58:	c3                   	ret    

80102b59 <mpsearch>:
80102b59:	55                   	push   %ebp
80102b5a:	89 e5                	mov    %esp,%ebp
80102b5c:	83 ec 08             	sub    $0x8,%esp
80102b5f:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80102b66:	c1 e0 08             	shl    $0x8,%eax
80102b69:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80102b70:	09 d0                	or     %edx,%eax
80102b72:	c1 e0 04             	shl    $0x4,%eax
80102b75:	85 c0                	test   %eax,%eax
80102b77:	74 1f                	je     80102b98 <mpsearch+0x3f>
80102b79:	ba 00 04 00 00       	mov    $0x400,%edx
80102b7e:	e8 87 ff ff ff       	call   80102b0a <mpsearch1>
80102b83:	85 c0                	test   %eax,%eax
80102b85:	75 0f                	jne    80102b96 <mpsearch+0x3d>
80102b87:	ba 00 00 01 00       	mov    $0x10000,%edx
80102b8c:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80102b91:	e8 74 ff ff ff       	call   80102b0a <mpsearch1>
80102b96:	c9                   	leave  
80102b97:	c3                   	ret    
80102b98:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
80102b9f:	c1 e0 08             	shl    $0x8,%eax
80102ba2:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80102ba9:	09 d0                	or     %edx,%eax
80102bab:	c1 e0 0a             	shl    $0xa,%eax
80102bae:	2d 00 04 00 00       	sub    $0x400,%eax
80102bb3:	ba 00 04 00 00       	mov    $0x400,%edx
80102bb8:	e8 4d ff ff ff       	call   80102b0a <mpsearch1>
80102bbd:	85 c0                	test   %eax,%eax
80102bbf:	75 d5                	jne    80102b96 <mpsearch+0x3d>
80102bc1:	eb c4                	jmp    80102b87 <mpsearch+0x2e>

80102bc3 <mpconfig>:
80102bc3:	55                   	push   %ebp
80102bc4:	89 e5                	mov    %esp,%ebp
80102bc6:	57                   	push   %edi
80102bc7:	56                   	push   %esi
80102bc8:	53                   	push   %ebx
80102bc9:	83 ec 1c             	sub    $0x1c,%esp
80102bcc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80102bcf:	e8 85 ff ff ff       	call   80102b59 <mpsearch>
80102bd4:	85 c0                	test   %eax,%eax
80102bd6:	74 5c                	je     80102c34 <mpconfig+0x71>
80102bd8:	89 c7                	mov    %eax,%edi
80102bda:	8b 58 04             	mov    0x4(%eax),%ebx
80102bdd:	85 db                	test   %ebx,%ebx
80102bdf:	74 5a                	je     80102c3b <mpconfig+0x78>
80102be1:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
80102be7:	83 ec 04             	sub    $0x4,%esp
80102bea:	6a 04                	push   $0x4
80102bec:	68 7d 6a 10 80       	push   $0x80106a7d
80102bf1:	56                   	push   %esi
80102bf2:	e8 90 10 00 00       	call   80103c87 <memcmp>
80102bf7:	83 c4 10             	add    $0x10,%esp
80102bfa:	85 c0                	test   %eax,%eax
80102bfc:	75 44                	jne    80102c42 <mpconfig+0x7f>
80102bfe:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80102c05:	3c 01                	cmp    $0x1,%al
80102c07:	0f 95 c2             	setne  %dl
80102c0a:	3c 04                	cmp    $0x4,%al
80102c0c:	0f 95 c0             	setne  %al
80102c0f:	84 c2                	test   %al,%dl
80102c11:	75 36                	jne    80102c49 <mpconfig+0x86>
80102c13:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
80102c1a:	89 f0                	mov    %esi,%eax
80102c1c:	e8 c5 fe ff ff       	call   80102ae6 <sum>
80102c21:	84 c0                	test   %al,%al
80102c23:	75 2b                	jne    80102c50 <mpconfig+0x8d>
80102c25:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80102c28:	89 38                	mov    %edi,(%eax)
80102c2a:	89 f0                	mov    %esi,%eax
80102c2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102c2f:	5b                   	pop    %ebx
80102c30:	5e                   	pop    %esi
80102c31:	5f                   	pop    %edi
80102c32:	5d                   	pop    %ebp
80102c33:	c3                   	ret    
80102c34:	be 00 00 00 00       	mov    $0x0,%esi
80102c39:	eb ef                	jmp    80102c2a <mpconfig+0x67>
80102c3b:	be 00 00 00 00       	mov    $0x0,%esi
80102c40:	eb e8                	jmp    80102c2a <mpconfig+0x67>
80102c42:	be 00 00 00 00       	mov    $0x0,%esi
80102c47:	eb e1                	jmp    80102c2a <mpconfig+0x67>
80102c49:	be 00 00 00 00       	mov    $0x0,%esi
80102c4e:	eb da                	jmp    80102c2a <mpconfig+0x67>
80102c50:	be 00 00 00 00       	mov    $0x0,%esi
80102c55:	eb d3                	jmp    80102c2a <mpconfig+0x67>

80102c57 <mpinit>:
80102c57:	55                   	push   %ebp
80102c58:	89 e5                	mov    %esp,%ebp
80102c5a:	57                   	push   %edi
80102c5b:	56                   	push   %esi
80102c5c:	53                   	push   %ebx
80102c5d:	83 ec 1c             	sub    $0x1c,%esp
80102c60:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80102c63:	e8 5b ff ff ff       	call   80102bc3 <mpconfig>
80102c68:	85 c0                	test   %eax,%eax
80102c6a:	74 19                	je     80102c85 <mpinit+0x2e>
80102c6c:	8b 50 24             	mov    0x24(%eax),%edx
80102c6f:	89 15 7c 16 11 80    	mov    %edx,0x8011167c
80102c75:	8d 50 2c             	lea    0x2c(%eax),%edx
80102c78:	0f b7 48 04          	movzwl 0x4(%eax),%ecx
80102c7c:	01 c1                	add    %eax,%ecx
80102c7e:	bb 01 00 00 00       	mov    $0x1,%ebx
80102c83:	eb 34                	jmp    80102cb9 <mpinit+0x62>
80102c85:	83 ec 0c             	sub    $0xc,%esp
80102c88:	68 82 6a 10 80       	push   $0x80106a82
80102c8d:	e8 b6 d6 ff ff       	call   80100348 <panic>
80102c92:	8b 35 00 1d 11 80    	mov    0x80111d00,%esi
80102c98:	83 fe 07             	cmp    $0x7,%esi
80102c9b:	7f 19                	jg     80102cb6 <mpinit+0x5f>
80102c9d:	0f b6 42 01          	movzbl 0x1(%edx),%eax
80102ca1:	69 fe b0 00 00 00    	imul   $0xb0,%esi,%edi
80102ca7:	88 87 80 17 11 80    	mov    %al,-0x7feee880(%edi)
80102cad:	83 c6 01             	add    $0x1,%esi
80102cb0:	89 35 00 1d 11 80    	mov    %esi,0x80111d00
80102cb6:	83 c2 14             	add    $0x14,%edx
80102cb9:	39 ca                	cmp    %ecx,%edx
80102cbb:	73 2b                	jae    80102ce8 <mpinit+0x91>
80102cbd:	0f b6 02             	movzbl (%edx),%eax
80102cc0:	3c 04                	cmp    $0x4,%al
80102cc2:	77 1d                	ja     80102ce1 <mpinit+0x8a>
80102cc4:	0f b6 c0             	movzbl %al,%eax
80102cc7:	ff 24 85 bc 6a 10 80 	jmp    *-0x7fef9544(,%eax,4)
80102cce:	0f b6 42 01          	movzbl 0x1(%edx),%eax
80102cd2:	a2 60 17 11 80       	mov    %al,0x80111760
80102cd7:	83 c2 08             	add    $0x8,%edx
80102cda:	eb dd                	jmp    80102cb9 <mpinit+0x62>
80102cdc:	83 c2 08             	add    $0x8,%edx
80102cdf:	eb d8                	jmp    80102cb9 <mpinit+0x62>
80102ce1:	bb 00 00 00 00       	mov    $0x0,%ebx
80102ce6:	eb d1                	jmp    80102cb9 <mpinit+0x62>
80102ce8:	85 db                	test   %ebx,%ebx
80102cea:	74 26                	je     80102d12 <mpinit+0xbb>
80102cec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80102cef:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80102cf3:	74 15                	je     80102d0a <mpinit+0xb3>
80102cf5:	b8 70 00 00 00       	mov    $0x70,%eax
80102cfa:	ba 22 00 00 00       	mov    $0x22,%edx
80102cff:	ee                   	out    %al,(%dx)
80102d00:	ba 23 00 00 00       	mov    $0x23,%edx
80102d05:	ec                   	in     (%dx),%al
80102d06:	83 c8 01             	or     $0x1,%eax
80102d09:	ee                   	out    %al,(%dx)
80102d0a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d0d:	5b                   	pop    %ebx
80102d0e:	5e                   	pop    %esi
80102d0f:	5f                   	pop    %edi
80102d10:	5d                   	pop    %ebp
80102d11:	c3                   	ret    
80102d12:	83 ec 0c             	sub    $0xc,%esp
80102d15:	68 9c 6a 10 80       	push   $0x80106a9c
80102d1a:	e8 29 d6 ff ff       	call   80100348 <panic>

80102d1f <picinit>:
80102d1f:	55                   	push   %ebp
80102d20:	89 e5                	mov    %esp,%ebp
80102d22:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102d27:	ba 21 00 00 00       	mov    $0x21,%edx
80102d2c:	ee                   	out    %al,(%dx)
80102d2d:	ba a1 00 00 00       	mov    $0xa1,%edx
80102d32:	ee                   	out    %al,(%dx)
80102d33:	5d                   	pop    %ebp
80102d34:	c3                   	ret    

80102d35 <pipealloc>:
80102d35:	55                   	push   %ebp
80102d36:	89 e5                	mov    %esp,%ebp
80102d38:	57                   	push   %edi
80102d39:	56                   	push   %esi
80102d3a:	53                   	push   %ebx
80102d3b:	83 ec 0c             	sub    $0xc,%esp
80102d3e:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d41:	8b 75 0c             	mov    0xc(%ebp),%esi
80102d44:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80102d4a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80102d50:	e8 d8 de ff ff       	call   80100c2d <filealloc>
80102d55:	89 03                	mov    %eax,(%ebx)
80102d57:	85 c0                	test   %eax,%eax
80102d59:	74 16                	je     80102d71 <pipealloc+0x3c>
80102d5b:	e8 cd de ff ff       	call   80100c2d <filealloc>
80102d60:	89 06                	mov    %eax,(%esi)
80102d62:	85 c0                	test   %eax,%eax
80102d64:	74 0b                	je     80102d71 <pipealloc+0x3c>
80102d66:	e8 50 f3 ff ff       	call   801020bb <kalloc>
80102d6b:	89 c7                	mov    %eax,%edi
80102d6d:	85 c0                	test   %eax,%eax
80102d6f:	75 35                	jne    80102da6 <pipealloc+0x71>
80102d71:	8b 03                	mov    (%ebx),%eax
80102d73:	85 c0                	test   %eax,%eax
80102d75:	74 0c                	je     80102d83 <pipealloc+0x4e>
80102d77:	83 ec 0c             	sub    $0xc,%esp
80102d7a:	50                   	push   %eax
80102d7b:	e8 53 df ff ff       	call   80100cd3 <fileclose>
80102d80:	83 c4 10             	add    $0x10,%esp
80102d83:	8b 06                	mov    (%esi),%eax
80102d85:	85 c0                	test   %eax,%eax
80102d87:	0f 84 8b 00 00 00    	je     80102e18 <pipealloc+0xe3>
80102d8d:	83 ec 0c             	sub    $0xc,%esp
80102d90:	50                   	push   %eax
80102d91:	e8 3d df ff ff       	call   80100cd3 <fileclose>
80102d96:	83 c4 10             	add    $0x10,%esp
80102d99:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102d9e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102da1:	5b                   	pop    %ebx
80102da2:	5e                   	pop    %esi
80102da3:	5f                   	pop    %edi
80102da4:	5d                   	pop    %ebp
80102da5:	c3                   	ret    
80102da6:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80102dad:	00 00 00 
80102db0:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80102db7:	00 00 00 
80102dba:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80102dc1:	00 00 00 
80102dc4:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80102dcb:	00 00 00 
80102dce:	83 ec 08             	sub    $0x8,%esp
80102dd1:	68 d0 6a 10 80       	push   $0x80106ad0
80102dd6:	50                   	push   %eax
80102dd7:	e8 7d 0c 00 00       	call   80103a59 <initlock>
80102ddc:	8b 03                	mov    (%ebx),%eax
80102dde:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80102de4:	8b 03                	mov    (%ebx),%eax
80102de6:	c6 40 08 01          	movb   $0x1,0x8(%eax)
80102dea:	8b 03                	mov    (%ebx),%eax
80102dec:	c6 40 09 00          	movb   $0x0,0x9(%eax)
80102df0:	8b 03                	mov    (%ebx),%eax
80102df2:	89 78 0c             	mov    %edi,0xc(%eax)
80102df5:	8b 06                	mov    (%esi),%eax
80102df7:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80102dfd:	8b 06                	mov    (%esi),%eax
80102dff:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80102e03:	8b 06                	mov    (%esi),%eax
80102e05:	c6 40 09 01          	movb   $0x1,0x9(%eax)
80102e09:	8b 06                	mov    (%esi),%eax
80102e0b:	89 78 0c             	mov    %edi,0xc(%eax)
80102e0e:	83 c4 10             	add    $0x10,%esp
80102e11:	b8 00 00 00 00       	mov    $0x0,%eax
80102e16:	eb 86                	jmp    80102d9e <pipealloc+0x69>
80102e18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102e1d:	e9 7c ff ff ff       	jmp    80102d9e <pipealloc+0x69>

80102e22 <pipeclose>:
80102e22:	55                   	push   %ebp
80102e23:	89 e5                	mov    %esp,%ebp
80102e25:	53                   	push   %ebx
80102e26:	83 ec 10             	sub    $0x10,%esp
80102e29:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102e2c:	53                   	push   %ebx
80102e2d:	e8 63 0d 00 00       	call   80103b95 <acquire>
80102e32:	83 c4 10             	add    $0x10,%esp
80102e35:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
80102e39:	74 3f                	je     80102e7a <pipeclose+0x58>
80102e3b:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
80102e42:	00 00 00 
80102e45:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80102e4b:	83 ec 0c             	sub    $0xc,%esp
80102e4e:	50                   	push   %eax
80102e4f:	e8 ab 09 00 00       	call   801037ff <wakeup>
80102e54:	83 c4 10             	add    $0x10,%esp
80102e57:	83 bb 3c 02 00 00 00 	cmpl   $0x0,0x23c(%ebx)
80102e5e:	75 09                	jne    80102e69 <pipeclose+0x47>
80102e60:	83 bb 40 02 00 00 00 	cmpl   $0x0,0x240(%ebx)
80102e67:	74 2f                	je     80102e98 <pipeclose+0x76>
80102e69:	83 ec 0c             	sub    $0xc,%esp
80102e6c:	53                   	push   %ebx
80102e6d:	e8 88 0d 00 00       	call   80103bfa <release>
80102e72:	83 c4 10             	add    $0x10,%esp
80102e75:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e78:	c9                   	leave  
80102e79:	c3                   	ret    
80102e7a:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80102e81:	00 00 00 
80102e84:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80102e8a:	83 ec 0c             	sub    $0xc,%esp
80102e8d:	50                   	push   %eax
80102e8e:	e8 6c 09 00 00       	call   801037ff <wakeup>
80102e93:	83 c4 10             	add    $0x10,%esp
80102e96:	eb bf                	jmp    80102e57 <pipeclose+0x35>
80102e98:	83 ec 0c             	sub    $0xc,%esp
80102e9b:	53                   	push   %ebx
80102e9c:	e8 59 0d 00 00       	call   80103bfa <release>
80102ea1:	89 1c 24             	mov    %ebx,(%esp)
80102ea4:	e8 fb f0 ff ff       	call   80101fa4 <kfree>
80102ea9:	83 c4 10             	add    $0x10,%esp
80102eac:	eb c7                	jmp    80102e75 <pipeclose+0x53>

80102eae <pipewrite>:
80102eae:	55                   	push   %ebp
80102eaf:	89 e5                	mov    %esp,%ebp
80102eb1:	57                   	push   %edi
80102eb2:	56                   	push   %esi
80102eb3:	53                   	push   %ebx
80102eb4:	83 ec 18             	sub    $0x18,%esp
80102eb7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102eba:	89 de                	mov    %ebx,%esi
80102ebc:	53                   	push   %ebx
80102ebd:	e8 d3 0c 00 00       	call   80103b95 <acquire>
80102ec2:	83 c4 10             	add    $0x10,%esp
80102ec5:	bf 00 00 00 00       	mov    $0x0,%edi
80102eca:	3b 7d 10             	cmp    0x10(%ebp),%edi
80102ecd:	0f 8d 88 00 00 00    	jge    80102f5b <pipewrite+0xad>
80102ed3:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
80102ed9:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80102edf:	05 00 02 00 00       	add    $0x200,%eax
80102ee4:	39 c2                	cmp    %eax,%edx
80102ee6:	75 51                	jne    80102f39 <pipewrite+0x8b>
80102ee8:	83 bb 3c 02 00 00 00 	cmpl   $0x0,0x23c(%ebx)
80102eef:	74 2f                	je     80102f20 <pipewrite+0x72>
80102ef1:	e8 00 03 00 00       	call   801031f6 <myproc>
80102ef6:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80102efa:	75 24                	jne    80102f20 <pipewrite+0x72>
80102efc:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80102f02:	83 ec 0c             	sub    $0xc,%esp
80102f05:	50                   	push   %eax
80102f06:	e8 f4 08 00 00       	call   801037ff <wakeup>
80102f0b:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80102f11:	83 c4 08             	add    $0x8,%esp
80102f14:	56                   	push   %esi
80102f15:	50                   	push   %eax
80102f16:	e8 7f 07 00 00       	call   8010369a <sleep>
80102f1b:	83 c4 10             	add    $0x10,%esp
80102f1e:	eb b3                	jmp    80102ed3 <pipewrite+0x25>
80102f20:	83 ec 0c             	sub    $0xc,%esp
80102f23:	53                   	push   %ebx
80102f24:	e8 d1 0c 00 00       	call   80103bfa <release>
80102f29:	83 c4 10             	add    $0x10,%esp
80102f2c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102f31:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102f34:	5b                   	pop    %ebx
80102f35:	5e                   	pop    %esi
80102f36:	5f                   	pop    %edi
80102f37:	5d                   	pop    %ebp
80102f38:	c3                   	ret    
80102f39:	8d 42 01             	lea    0x1(%edx),%eax
80102f3c:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80102f42:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80102f48:	8b 45 0c             	mov    0xc(%ebp),%eax
80102f4b:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
80102f4f:	88 44 13 34          	mov    %al,0x34(%ebx,%edx,1)
80102f53:	83 c7 01             	add    $0x1,%edi
80102f56:	e9 6f ff ff ff       	jmp    80102eca <pipewrite+0x1c>
80102f5b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80102f61:	83 ec 0c             	sub    $0xc,%esp
80102f64:	50                   	push   %eax
80102f65:	e8 95 08 00 00       	call   801037ff <wakeup>
80102f6a:	89 1c 24             	mov    %ebx,(%esp)
80102f6d:	e8 88 0c 00 00       	call   80103bfa <release>
80102f72:	83 c4 10             	add    $0x10,%esp
80102f75:	8b 45 10             	mov    0x10(%ebp),%eax
80102f78:	eb b7                	jmp    80102f31 <pipewrite+0x83>

80102f7a <piperead>:
80102f7a:	55                   	push   %ebp
80102f7b:	89 e5                	mov    %esp,%ebp
80102f7d:	57                   	push   %edi
80102f7e:	56                   	push   %esi
80102f7f:	53                   	push   %ebx
80102f80:	83 ec 18             	sub    $0x18,%esp
80102f83:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102f86:	89 df                	mov    %ebx,%edi
80102f88:	53                   	push   %ebx
80102f89:	e8 07 0c 00 00       	call   80103b95 <acquire>
80102f8e:	83 c4 10             	add    $0x10,%esp
80102f91:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80102f97:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
80102f9d:	75 3d                	jne    80102fdc <piperead+0x62>
80102f9f:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
80102fa5:	85 f6                	test   %esi,%esi
80102fa7:	74 38                	je     80102fe1 <piperead+0x67>
80102fa9:	e8 48 02 00 00       	call   801031f6 <myproc>
80102fae:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80102fb2:	75 15                	jne    80102fc9 <piperead+0x4f>
80102fb4:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80102fba:	83 ec 08             	sub    $0x8,%esp
80102fbd:	57                   	push   %edi
80102fbe:	50                   	push   %eax
80102fbf:	e8 d6 06 00 00       	call   8010369a <sleep>
80102fc4:	83 c4 10             	add    $0x10,%esp
80102fc7:	eb c8                	jmp    80102f91 <piperead+0x17>
80102fc9:	83 ec 0c             	sub    $0xc,%esp
80102fcc:	53                   	push   %ebx
80102fcd:	e8 28 0c 00 00       	call   80103bfa <release>
80102fd2:	83 c4 10             	add    $0x10,%esp
80102fd5:	be ff ff ff ff       	mov    $0xffffffff,%esi
80102fda:	eb 50                	jmp    8010302c <piperead+0xb2>
80102fdc:	be 00 00 00 00       	mov    $0x0,%esi
80102fe1:	3b 75 10             	cmp    0x10(%ebp),%esi
80102fe4:	7d 2c                	jge    80103012 <piperead+0x98>
80102fe6:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80102fec:	3b 83 38 02 00 00    	cmp    0x238(%ebx),%eax
80102ff2:	74 1e                	je     80103012 <piperead+0x98>
80102ff4:	8d 50 01             	lea    0x1(%eax),%edx
80102ff7:	89 93 34 02 00 00    	mov    %edx,0x234(%ebx)
80102ffd:	25 ff 01 00 00       	and    $0x1ff,%eax
80103002:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
80103007:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010300a:	88 04 31             	mov    %al,(%ecx,%esi,1)
8010300d:	83 c6 01             	add    $0x1,%esi
80103010:	eb cf                	jmp    80102fe1 <piperead+0x67>
80103012:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103018:	83 ec 0c             	sub    $0xc,%esp
8010301b:	50                   	push   %eax
8010301c:	e8 de 07 00 00       	call   801037ff <wakeup>
80103021:	89 1c 24             	mov    %ebx,(%esp)
80103024:	e8 d1 0b 00 00       	call   80103bfa <release>
80103029:	83 c4 10             	add    $0x10,%esp
8010302c:	89 f0                	mov    %esi,%eax
8010302e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103031:	5b                   	pop    %ebx
80103032:	5e                   	pop    %esi
80103033:	5f                   	pop    %edi
80103034:	5d                   	pop    %ebp
80103035:	c3                   	ret    

80103036 <wakeup1>:
80103036:	55                   	push   %ebp
80103037:	89 e5                	mov    %esp,%ebp
80103039:	ba 54 1d 11 80       	mov    $0x80111d54,%edx
8010303e:	eb 03                	jmp    80103043 <wakeup1+0xd>
80103040:	83 c2 7c             	add    $0x7c,%edx
80103043:	81 fa 54 3c 11 80    	cmp    $0x80113c54,%edx
80103049:	73 14                	jae    8010305f <wakeup1+0x29>
8010304b:	83 7a 0c 02          	cmpl   $0x2,0xc(%edx)
8010304f:	75 ef                	jne    80103040 <wakeup1+0xa>
80103051:	39 42 20             	cmp    %eax,0x20(%edx)
80103054:	75 ea                	jne    80103040 <wakeup1+0xa>
80103056:	c7 42 0c 03 00 00 00 	movl   $0x3,0xc(%edx)
8010305d:	eb e1                	jmp    80103040 <wakeup1+0xa>
8010305f:	5d                   	pop    %ebp
80103060:	c3                   	ret    

80103061 <allocproc>:
80103061:	55                   	push   %ebp
80103062:	89 e5                	mov    %esp,%ebp
80103064:	53                   	push   %ebx
80103065:	83 ec 10             	sub    $0x10,%esp
80103068:	68 20 1d 11 80       	push   $0x80111d20
8010306d:	e8 23 0b 00 00       	call   80103b95 <acquire>
80103072:	83 c4 10             	add    $0x10,%esp
80103075:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
8010307a:	81 fb 54 3c 11 80    	cmp    $0x80113c54,%ebx
80103080:	73 0b                	jae    8010308d <allocproc+0x2c>
80103082:	83 7b 0c 00          	cmpl   $0x0,0xc(%ebx)
80103086:	74 1c                	je     801030a4 <allocproc+0x43>
80103088:	83 c3 7c             	add    $0x7c,%ebx
8010308b:	eb ed                	jmp    8010307a <allocproc+0x19>
8010308d:	83 ec 0c             	sub    $0xc,%esp
80103090:	68 20 1d 11 80       	push   $0x80111d20
80103095:	e8 60 0b 00 00       	call   80103bfa <release>
8010309a:	83 c4 10             	add    $0x10,%esp
8010309d:	bb 00 00 00 00       	mov    $0x0,%ebx
801030a2:	eb 69                	jmp    8010310d <allocproc+0xac>
801030a4:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
801030ab:	a1 04 90 10 80       	mov    0x80109004,%eax
801030b0:	8d 50 01             	lea    0x1(%eax),%edx
801030b3:	89 15 04 90 10 80    	mov    %edx,0x80109004
801030b9:	89 43 10             	mov    %eax,0x10(%ebx)
801030bc:	83 ec 0c             	sub    $0xc,%esp
801030bf:	68 20 1d 11 80       	push   $0x80111d20
801030c4:	e8 31 0b 00 00       	call   80103bfa <release>
801030c9:	e8 ed ef ff ff       	call   801020bb <kalloc>
801030ce:	89 43 08             	mov    %eax,0x8(%ebx)
801030d1:	83 c4 10             	add    $0x10,%esp
801030d4:	85 c0                	test   %eax,%eax
801030d6:	74 3c                	je     80103114 <allocproc+0xb3>
801030d8:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
801030de:	89 53 18             	mov    %edx,0x18(%ebx)
801030e1:	c7 80 b0 0f 00 00 9a 	movl   $0x80104d9a,0xfb0(%eax)
801030e8:	4d 10 80 
801030eb:	05 9c 0f 00 00       	add    $0xf9c,%eax
801030f0:	89 43 1c             	mov    %eax,0x1c(%ebx)
801030f3:	83 ec 04             	sub    $0x4,%esp
801030f6:	6a 14                	push   $0x14
801030f8:	6a 00                	push   $0x0
801030fa:	50                   	push   %eax
801030fb:	e8 41 0b 00 00       	call   80103c41 <memset>
80103100:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103103:	c7 40 10 22 31 10 80 	movl   $0x80103122,0x10(%eax)
8010310a:	83 c4 10             	add    $0x10,%esp
8010310d:	89 d8                	mov    %ebx,%eax
8010310f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103112:	c9                   	leave  
80103113:	c3                   	ret    
80103114:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
8010311b:	bb 00 00 00 00       	mov    $0x0,%ebx
80103120:	eb eb                	jmp    8010310d <allocproc+0xac>

80103122 <forkret>:
80103122:	55                   	push   %ebp
80103123:	89 e5                	mov    %esp,%ebp
80103125:	83 ec 14             	sub    $0x14,%esp
80103128:	68 20 1d 11 80       	push   $0x80111d20
8010312d:	e8 c8 0a 00 00       	call   80103bfa <release>
80103132:	83 c4 10             	add    $0x10,%esp
80103135:	83 3d 00 90 10 80 00 	cmpl   $0x0,0x80109000
8010313c:	75 02                	jne    80103140 <forkret+0x1e>
8010313e:	c9                   	leave  
8010313f:	c3                   	ret    
80103140:	c7 05 00 90 10 80 00 	movl   $0x0,0x80109000
80103147:	00 00 00 
8010314a:	83 ec 0c             	sub    $0xc,%esp
8010314d:	6a 01                	push   $0x1
8010314f:	e8 98 e1 ff ff       	call   801012ec <iinit>
80103154:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010315b:	e8 05 f6 ff ff       	call   80102765 <initlog>
80103160:	83 c4 10             	add    $0x10,%esp
80103163:	eb d9                	jmp    8010313e <forkret+0x1c>

80103165 <pinit>:
80103165:	55                   	push   %ebp
80103166:	89 e5                	mov    %esp,%ebp
80103168:	83 ec 10             	sub    $0x10,%esp
8010316b:	68 d5 6a 10 80       	push   $0x80106ad5
80103170:	68 20 1d 11 80       	push   $0x80111d20
80103175:	e8 df 08 00 00       	call   80103a59 <initlock>
8010317a:	83 c4 10             	add    $0x10,%esp
8010317d:	c9                   	leave  
8010317e:	c3                   	ret    

8010317f <mycpu>:
8010317f:	55                   	push   %ebp
80103180:	89 e5                	mov    %esp,%ebp
80103182:	83 ec 08             	sub    $0x8,%esp
80103185:	9c                   	pushf  
80103186:	58                   	pop    %eax
80103187:	f6 c4 02             	test   $0x2,%ah
8010318a:	75 28                	jne    801031b4 <mycpu+0x35>
8010318c:	e8 ed f1 ff ff       	call   8010237e <lapicid>
80103191:	ba 00 00 00 00       	mov    $0x0,%edx
80103196:	39 15 00 1d 11 80    	cmp    %edx,0x80111d00
8010319c:	7e 23                	jle    801031c1 <mycpu+0x42>
8010319e:	69 ca b0 00 00 00    	imul   $0xb0,%edx,%ecx
801031a4:	0f b6 89 80 17 11 80 	movzbl -0x7feee880(%ecx),%ecx
801031ab:	39 c1                	cmp    %eax,%ecx
801031ad:	74 1f                	je     801031ce <mycpu+0x4f>
801031af:	83 c2 01             	add    $0x1,%edx
801031b2:	eb e2                	jmp    80103196 <mycpu+0x17>
801031b4:	83 ec 0c             	sub    $0xc,%esp
801031b7:	68 b8 6b 10 80       	push   $0x80106bb8
801031bc:	e8 87 d1 ff ff       	call   80100348 <panic>
801031c1:	83 ec 0c             	sub    $0xc,%esp
801031c4:	68 dc 6a 10 80       	push   $0x80106adc
801031c9:	e8 7a d1 ff ff       	call   80100348 <panic>
801031ce:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
801031d4:	05 80 17 11 80       	add    $0x80111780,%eax
801031d9:	c9                   	leave  
801031da:	c3                   	ret    

801031db <cpuid>:
801031db:	55                   	push   %ebp
801031dc:	89 e5                	mov    %esp,%ebp
801031de:	83 ec 08             	sub    $0x8,%esp
801031e1:	e8 99 ff ff ff       	call   8010317f <mycpu>
801031e6:	2d 80 17 11 80       	sub    $0x80111780,%eax
801031eb:	c1 f8 04             	sar    $0x4,%eax
801031ee:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
801031f4:	c9                   	leave  
801031f5:	c3                   	ret    

801031f6 <myproc>:
801031f6:	55                   	push   %ebp
801031f7:	89 e5                	mov    %esp,%ebp
801031f9:	53                   	push   %ebx
801031fa:	83 ec 04             	sub    $0x4,%esp
801031fd:	e8 b6 08 00 00       	call   80103ab8 <pushcli>
80103202:	e8 78 ff ff ff       	call   8010317f <mycpu>
80103207:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
8010320d:	e8 e3 08 00 00       	call   80103af5 <popcli>
80103212:	89 d8                	mov    %ebx,%eax
80103214:	83 c4 04             	add    $0x4,%esp
80103217:	5b                   	pop    %ebx
80103218:	5d                   	pop    %ebp
80103219:	c3                   	ret    

8010321a <userinit>:
8010321a:	55                   	push   %ebp
8010321b:	89 e5                	mov    %esp,%ebp
8010321d:	53                   	push   %ebx
8010321e:	83 ec 04             	sub    $0x4,%esp
80103221:	e8 3b fe ff ff       	call   80103061 <allocproc>
80103226:	89 c3                	mov    %eax,%ebx
80103228:	a3 b8 95 10 80       	mov    %eax,0x801095b8
8010322d:	e8 fe 30 00 00       	call   80106330 <setupkvm>
80103232:	89 43 04             	mov    %eax,0x4(%ebx)
80103235:	85 c0                	test   %eax,%eax
80103237:	0f 84 b7 00 00 00    	je     801032f4 <userinit+0xda>
8010323d:	83 ec 04             	sub    $0x4,%esp
80103240:	68 2c 00 00 00       	push   $0x2c
80103245:	68 60 94 10 80       	push   $0x80109460
8010324a:	50                   	push   %eax
8010324b:	e8 eb 2d 00 00       	call   8010603b <inituvm>
80103250:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
80103256:	83 c4 0c             	add    $0xc,%esp
80103259:	6a 4c                	push   $0x4c
8010325b:	6a 00                	push   $0x0
8010325d:	ff 73 18             	pushl  0x18(%ebx)
80103260:	e8 dc 09 00 00       	call   80103c41 <memset>
80103265:	8b 43 18             	mov    0x18(%ebx),%eax
80103268:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
8010326e:	8b 43 18             	mov    0x18(%ebx),%eax
80103271:	66 c7 40 2c 23 00    	movw   $0x23,0x2c(%eax)
80103277:	8b 43 18             	mov    0x18(%ebx),%eax
8010327a:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010327e:	66 89 50 28          	mov    %dx,0x28(%eax)
80103282:	8b 43 18             	mov    0x18(%ebx),%eax
80103285:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103289:	66 89 50 48          	mov    %dx,0x48(%eax)
8010328d:	8b 43 18             	mov    0x18(%ebx),%eax
80103290:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
80103297:	8b 43 18             	mov    0x18(%ebx),%eax
8010329a:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
801032a1:	8b 43 18             	mov    0x18(%ebx),%eax
801032a4:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
801032ab:	8d 43 6c             	lea    0x6c(%ebx),%eax
801032ae:	83 c4 0c             	add    $0xc,%esp
801032b1:	6a 10                	push   $0x10
801032b3:	68 05 6b 10 80       	push   $0x80106b05
801032b8:	50                   	push   %eax
801032b9:	e8 ea 0a 00 00       	call   80103da8 <safestrcpy>
801032be:	c7 04 24 0e 6b 10 80 	movl   $0x80106b0e,(%esp)
801032c5:	e8 17 e9 ff ff       	call   80101be1 <namei>
801032ca:	89 43 68             	mov    %eax,0x68(%ebx)
801032cd:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
801032d4:	e8 bc 08 00 00       	call   80103b95 <acquire>
801032d9:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
801032e0:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
801032e7:	e8 0e 09 00 00       	call   80103bfa <release>
801032ec:	83 c4 10             	add    $0x10,%esp
801032ef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801032f2:	c9                   	leave  
801032f3:	c3                   	ret    
801032f4:	83 ec 0c             	sub    $0xc,%esp
801032f7:	68 ec 6a 10 80       	push   $0x80106aec
801032fc:	e8 47 d0 ff ff       	call   80100348 <panic>

80103301 <growproc>:
80103301:	55                   	push   %ebp
80103302:	89 e5                	mov    %esp,%ebp
80103304:	56                   	push   %esi
80103305:	53                   	push   %ebx
80103306:	8b 75 08             	mov    0x8(%ebp),%esi
80103309:	e8 e8 fe ff ff       	call   801031f6 <myproc>
8010330e:	89 c3                	mov    %eax,%ebx
80103310:	8b 00                	mov    (%eax),%eax
80103312:	85 f6                	test   %esi,%esi
80103314:	7f 21                	jg     80103337 <growproc+0x36>
80103316:	85 f6                	test   %esi,%esi
80103318:	79 33                	jns    8010334d <growproc+0x4c>
8010331a:	83 ec 04             	sub    $0x4,%esp
8010331d:	01 c6                	add    %eax,%esi
8010331f:	56                   	push   %esi
80103320:	50                   	push   %eax
80103321:	ff 73 04             	pushl  0x4(%ebx)
80103324:	e8 1a 2e 00 00       	call   80106143 <deallocuvm>
80103329:	83 c4 10             	add    $0x10,%esp
8010332c:	85 c0                	test   %eax,%eax
8010332e:	75 1d                	jne    8010334d <growproc+0x4c>
80103330:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103335:	eb 29                	jmp    80103360 <growproc+0x5f>
80103337:	83 ec 04             	sub    $0x4,%esp
8010333a:	01 c6                	add    %eax,%esi
8010333c:	56                   	push   %esi
8010333d:	50                   	push   %eax
8010333e:	ff 73 04             	pushl  0x4(%ebx)
80103341:	e8 8f 2e 00 00       	call   801061d5 <allocuvm>
80103346:	83 c4 10             	add    $0x10,%esp
80103349:	85 c0                	test   %eax,%eax
8010334b:	74 1a                	je     80103367 <growproc+0x66>
8010334d:	89 03                	mov    %eax,(%ebx)
8010334f:	83 ec 0c             	sub    $0xc,%esp
80103352:	53                   	push   %ebx
80103353:	e8 cb 2b 00 00       	call   80105f23 <switchuvm>
80103358:	83 c4 10             	add    $0x10,%esp
8010335b:	b8 00 00 00 00       	mov    $0x0,%eax
80103360:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103363:	5b                   	pop    %ebx
80103364:	5e                   	pop    %esi
80103365:	5d                   	pop    %ebp
80103366:	c3                   	ret    
80103367:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010336c:	eb f2                	jmp    80103360 <growproc+0x5f>

8010336e <fork>:
8010336e:	55                   	push   %ebp
8010336f:	89 e5                	mov    %esp,%ebp
80103371:	57                   	push   %edi
80103372:	56                   	push   %esi
80103373:	53                   	push   %ebx
80103374:	83 ec 1c             	sub    $0x1c,%esp
80103377:	e8 7a fe ff ff       	call   801031f6 <myproc>
8010337c:	89 c3                	mov    %eax,%ebx
8010337e:	e8 de fc ff ff       	call   80103061 <allocproc>
80103383:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103386:	85 c0                	test   %eax,%eax
80103388:	0f 84 e0 00 00 00    	je     8010346e <fork+0x100>
8010338e:	89 c7                	mov    %eax,%edi
80103390:	83 ec 08             	sub    $0x8,%esp
80103393:	ff 33                	pushl  (%ebx)
80103395:	ff 73 04             	pushl  0x4(%ebx)
80103398:	e8 44 30 00 00       	call   801063e1 <copyuvm>
8010339d:	89 47 04             	mov    %eax,0x4(%edi)
801033a0:	83 c4 10             	add    $0x10,%esp
801033a3:	85 c0                	test   %eax,%eax
801033a5:	74 2a                	je     801033d1 <fork+0x63>
801033a7:	8b 03                	mov    (%ebx),%eax
801033a9:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801033ac:	89 01                	mov    %eax,(%ecx)
801033ae:	89 c8                	mov    %ecx,%eax
801033b0:	89 59 14             	mov    %ebx,0x14(%ecx)
801033b3:	8b 73 18             	mov    0x18(%ebx),%esi
801033b6:	8b 79 18             	mov    0x18(%ecx),%edi
801033b9:	b9 13 00 00 00       	mov    $0x13,%ecx
801033be:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
801033c0:	8b 40 18             	mov    0x18(%eax),%eax
801033c3:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
801033ca:	be 00 00 00 00       	mov    $0x0,%esi
801033cf:	eb 29                	jmp    801033fa <fork+0x8c>
801033d1:	83 ec 0c             	sub    $0xc,%esp
801033d4:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801033d7:	ff 73 08             	pushl  0x8(%ebx)
801033da:	e8 c5 eb ff ff       	call   80101fa4 <kfree>
801033df:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
801033e6:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
801033ed:	83 c4 10             	add    $0x10,%esp
801033f0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801033f5:	eb 6d                	jmp    80103464 <fork+0xf6>
801033f7:	83 c6 01             	add    $0x1,%esi
801033fa:	83 fe 0f             	cmp    $0xf,%esi
801033fd:	7f 1d                	jg     8010341c <fork+0xae>
801033ff:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103403:	85 c0                	test   %eax,%eax
80103405:	74 f0                	je     801033f7 <fork+0x89>
80103407:	83 ec 0c             	sub    $0xc,%esp
8010340a:	50                   	push   %eax
8010340b:	e8 7e d8 ff ff       	call   80100c8e <filedup>
80103410:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103413:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
80103417:	83 c4 10             	add    $0x10,%esp
8010341a:	eb db                	jmp    801033f7 <fork+0x89>
8010341c:	83 ec 0c             	sub    $0xc,%esp
8010341f:	ff 73 68             	pushl  0x68(%ebx)
80103422:	e8 2a e1 ff ff       	call   80101551 <idup>
80103427:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010342a:	89 47 68             	mov    %eax,0x68(%edi)
8010342d:	83 c3 6c             	add    $0x6c,%ebx
80103430:	8d 47 6c             	lea    0x6c(%edi),%eax
80103433:	83 c4 0c             	add    $0xc,%esp
80103436:	6a 10                	push   $0x10
80103438:	53                   	push   %ebx
80103439:	50                   	push   %eax
8010343a:	e8 69 09 00 00       	call   80103da8 <safestrcpy>
8010343f:	8b 5f 10             	mov    0x10(%edi),%ebx
80103442:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103449:	e8 47 07 00 00       	call   80103b95 <acquire>
8010344e:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
80103455:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
8010345c:	e8 99 07 00 00       	call   80103bfa <release>
80103461:	83 c4 10             	add    $0x10,%esp
80103464:	89 d8                	mov    %ebx,%eax
80103466:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103469:	5b                   	pop    %ebx
8010346a:	5e                   	pop    %esi
8010346b:	5f                   	pop    %edi
8010346c:	5d                   	pop    %ebp
8010346d:	c3                   	ret    
8010346e:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103473:	eb ef                	jmp    80103464 <fork+0xf6>

80103475 <scheduler>:
80103475:	55                   	push   %ebp
80103476:	89 e5                	mov    %esp,%ebp
80103478:	56                   	push   %esi
80103479:	53                   	push   %ebx
8010347a:	e8 00 fd ff ff       	call   8010317f <mycpu>
8010347f:	89 c6                	mov    %eax,%esi
80103481:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103488:	00 00 00 
8010348b:	eb 5a                	jmp    801034e7 <scheduler+0x72>
8010348d:	83 c3 7c             	add    $0x7c,%ebx
80103490:	81 fb 54 3c 11 80    	cmp    $0x80113c54,%ebx
80103496:	73 3f                	jae    801034d7 <scheduler+0x62>
80103498:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
8010349c:	75 ef                	jne    8010348d <scheduler+0x18>
8010349e:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
801034a4:	83 ec 0c             	sub    $0xc,%esp
801034a7:	53                   	push   %ebx
801034a8:	e8 76 2a 00 00       	call   80105f23 <switchuvm>
801034ad:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
801034b4:	83 c4 08             	add    $0x8,%esp
801034b7:	ff 73 1c             	pushl  0x1c(%ebx)
801034ba:	8d 46 04             	lea    0x4(%esi),%eax
801034bd:	50                   	push   %eax
801034be:	e8 38 09 00 00       	call   80103dfb <swtch>
801034c3:	e8 49 2a 00 00       	call   80105f11 <switchkvm>
801034c8:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
801034cf:	00 00 00 
801034d2:	83 c4 10             	add    $0x10,%esp
801034d5:	eb b6                	jmp    8010348d <scheduler+0x18>
801034d7:	83 ec 0c             	sub    $0xc,%esp
801034da:	68 20 1d 11 80       	push   $0x80111d20
801034df:	e8 16 07 00 00       	call   80103bfa <release>
801034e4:	83 c4 10             	add    $0x10,%esp
801034e7:	fb                   	sti    
801034e8:	83 ec 0c             	sub    $0xc,%esp
801034eb:	68 20 1d 11 80       	push   $0x80111d20
801034f0:	e8 a0 06 00 00       	call   80103b95 <acquire>
801034f5:	83 c4 10             	add    $0x10,%esp
801034f8:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
801034fd:	eb 91                	jmp    80103490 <scheduler+0x1b>

801034ff <sched>:
801034ff:	55                   	push   %ebp
80103500:	89 e5                	mov    %esp,%ebp
80103502:	56                   	push   %esi
80103503:	53                   	push   %ebx
80103504:	e8 ed fc ff ff       	call   801031f6 <myproc>
80103509:	89 c3                	mov    %eax,%ebx
8010350b:	83 ec 0c             	sub    $0xc,%esp
8010350e:	68 20 1d 11 80       	push   $0x80111d20
80103513:	e8 3d 06 00 00       	call   80103b55 <holding>
80103518:	83 c4 10             	add    $0x10,%esp
8010351b:	85 c0                	test   %eax,%eax
8010351d:	74 4f                	je     8010356e <sched+0x6f>
8010351f:	e8 5b fc ff ff       	call   8010317f <mycpu>
80103524:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
8010352b:	75 4e                	jne    8010357b <sched+0x7c>
8010352d:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103531:	74 55                	je     80103588 <sched+0x89>
80103533:	9c                   	pushf  
80103534:	58                   	pop    %eax
80103535:	f6 c4 02             	test   $0x2,%ah
80103538:	75 5b                	jne    80103595 <sched+0x96>
8010353a:	e8 40 fc ff ff       	call   8010317f <mycpu>
8010353f:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
80103545:	e8 35 fc ff ff       	call   8010317f <mycpu>
8010354a:	83 ec 08             	sub    $0x8,%esp
8010354d:	ff 70 04             	pushl  0x4(%eax)
80103550:	83 c3 1c             	add    $0x1c,%ebx
80103553:	53                   	push   %ebx
80103554:	e8 a2 08 00 00       	call   80103dfb <swtch>
80103559:	e8 21 fc ff ff       	call   8010317f <mycpu>
8010355e:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
80103564:	83 c4 10             	add    $0x10,%esp
80103567:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010356a:	5b                   	pop    %ebx
8010356b:	5e                   	pop    %esi
8010356c:	5d                   	pop    %ebp
8010356d:	c3                   	ret    
8010356e:	83 ec 0c             	sub    $0xc,%esp
80103571:	68 10 6b 10 80       	push   $0x80106b10
80103576:	e8 cd cd ff ff       	call   80100348 <panic>
8010357b:	83 ec 0c             	sub    $0xc,%esp
8010357e:	68 22 6b 10 80       	push   $0x80106b22
80103583:	e8 c0 cd ff ff       	call   80100348 <panic>
80103588:	83 ec 0c             	sub    $0xc,%esp
8010358b:	68 2e 6b 10 80       	push   $0x80106b2e
80103590:	e8 b3 cd ff ff       	call   80100348 <panic>
80103595:	83 ec 0c             	sub    $0xc,%esp
80103598:	68 3c 6b 10 80       	push   $0x80106b3c
8010359d:	e8 a6 cd ff ff       	call   80100348 <panic>

801035a2 <exit>:
801035a2:	55                   	push   %ebp
801035a3:	89 e5                	mov    %esp,%ebp
801035a5:	56                   	push   %esi
801035a6:	53                   	push   %ebx
801035a7:	e8 4a fc ff ff       	call   801031f6 <myproc>
801035ac:	39 05 b8 95 10 80    	cmp    %eax,0x801095b8
801035b2:	74 09                	je     801035bd <exit+0x1b>
801035b4:	89 c6                	mov    %eax,%esi
801035b6:	bb 00 00 00 00       	mov    $0x0,%ebx
801035bb:	eb 10                	jmp    801035cd <exit+0x2b>
801035bd:	83 ec 0c             	sub    $0xc,%esp
801035c0:	68 50 6b 10 80       	push   $0x80106b50
801035c5:	e8 7e cd ff ff       	call   80100348 <panic>
801035ca:	83 c3 01             	add    $0x1,%ebx
801035cd:	83 fb 0f             	cmp    $0xf,%ebx
801035d0:	7f 1e                	jg     801035f0 <exit+0x4e>
801035d2:	8b 44 9e 28          	mov    0x28(%esi,%ebx,4),%eax
801035d6:	85 c0                	test   %eax,%eax
801035d8:	74 f0                	je     801035ca <exit+0x28>
801035da:	83 ec 0c             	sub    $0xc,%esp
801035dd:	50                   	push   %eax
801035de:	e8 f0 d6 ff ff       	call   80100cd3 <fileclose>
801035e3:	c7 44 9e 28 00 00 00 	movl   $0x0,0x28(%esi,%ebx,4)
801035ea:	00 
801035eb:	83 c4 10             	add    $0x10,%esp
801035ee:	eb da                	jmp    801035ca <exit+0x28>
801035f0:	e8 b9 f1 ff ff       	call   801027ae <begin_op>
801035f5:	83 ec 0c             	sub    $0xc,%esp
801035f8:	ff 76 68             	pushl  0x68(%esi)
801035fb:	e8 88 e0 ff ff       	call   80101688 <iput>
80103600:	e8 23 f2 ff ff       	call   80102828 <end_op>
80103605:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
8010360c:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103613:	e8 7d 05 00 00       	call   80103b95 <acquire>
80103618:	8b 46 14             	mov    0x14(%esi),%eax
8010361b:	e8 16 fa ff ff       	call   80103036 <wakeup1>
80103620:	83 c4 10             	add    $0x10,%esp
80103623:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
80103628:	eb 03                	jmp    8010362d <exit+0x8b>
8010362a:	83 c3 7c             	add    $0x7c,%ebx
8010362d:	81 fb 54 3c 11 80    	cmp    $0x80113c54,%ebx
80103633:	73 1a                	jae    8010364f <exit+0xad>
80103635:	39 73 14             	cmp    %esi,0x14(%ebx)
80103638:	75 f0                	jne    8010362a <exit+0x88>
8010363a:	a1 b8 95 10 80       	mov    0x801095b8,%eax
8010363f:	89 43 14             	mov    %eax,0x14(%ebx)
80103642:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103646:	75 e2                	jne    8010362a <exit+0x88>
80103648:	e8 e9 f9 ff ff       	call   80103036 <wakeup1>
8010364d:	eb db                	jmp    8010362a <exit+0x88>
8010364f:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
80103656:	e8 a4 fe ff ff       	call   801034ff <sched>
8010365b:	83 ec 0c             	sub    $0xc,%esp
8010365e:	68 5d 6b 10 80       	push   $0x80106b5d
80103663:	e8 e0 cc ff ff       	call   80100348 <panic>

80103668 <yield>:
80103668:	55                   	push   %ebp
80103669:	89 e5                	mov    %esp,%ebp
8010366b:	83 ec 14             	sub    $0x14,%esp
8010366e:	68 20 1d 11 80       	push   $0x80111d20
80103673:	e8 1d 05 00 00       	call   80103b95 <acquire>
80103678:	e8 79 fb ff ff       	call   801031f6 <myproc>
8010367d:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103684:	e8 76 fe ff ff       	call   801034ff <sched>
80103689:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103690:	e8 65 05 00 00       	call   80103bfa <release>
80103695:	83 c4 10             	add    $0x10,%esp
80103698:	c9                   	leave  
80103699:	c3                   	ret    

8010369a <sleep>:
8010369a:	55                   	push   %ebp
8010369b:	89 e5                	mov    %esp,%ebp
8010369d:	56                   	push   %esi
8010369e:	53                   	push   %ebx
8010369f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801036a2:	e8 4f fb ff ff       	call   801031f6 <myproc>
801036a7:	85 c0                	test   %eax,%eax
801036a9:	74 66                	je     80103711 <sleep+0x77>
801036ab:	89 c6                	mov    %eax,%esi
801036ad:	85 db                	test   %ebx,%ebx
801036af:	74 6d                	je     8010371e <sleep+0x84>
801036b1:	81 fb 20 1d 11 80    	cmp    $0x80111d20,%ebx
801036b7:	74 18                	je     801036d1 <sleep+0x37>
801036b9:	83 ec 0c             	sub    $0xc,%esp
801036bc:	68 20 1d 11 80       	push   $0x80111d20
801036c1:	e8 cf 04 00 00       	call   80103b95 <acquire>
801036c6:	89 1c 24             	mov    %ebx,(%esp)
801036c9:	e8 2c 05 00 00       	call   80103bfa <release>
801036ce:	83 c4 10             	add    $0x10,%esp
801036d1:	8b 45 08             	mov    0x8(%ebp),%eax
801036d4:	89 46 20             	mov    %eax,0x20(%esi)
801036d7:	c7 46 0c 02 00 00 00 	movl   $0x2,0xc(%esi)
801036de:	e8 1c fe ff ff       	call   801034ff <sched>
801036e3:	c7 46 20 00 00 00 00 	movl   $0x0,0x20(%esi)
801036ea:	81 fb 20 1d 11 80    	cmp    $0x80111d20,%ebx
801036f0:	74 18                	je     8010370a <sleep+0x70>
801036f2:	83 ec 0c             	sub    $0xc,%esp
801036f5:	68 20 1d 11 80       	push   $0x80111d20
801036fa:	e8 fb 04 00 00       	call   80103bfa <release>
801036ff:	89 1c 24             	mov    %ebx,(%esp)
80103702:	e8 8e 04 00 00       	call   80103b95 <acquire>
80103707:	83 c4 10             	add    $0x10,%esp
8010370a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010370d:	5b                   	pop    %ebx
8010370e:	5e                   	pop    %esi
8010370f:	5d                   	pop    %ebp
80103710:	c3                   	ret    
80103711:	83 ec 0c             	sub    $0xc,%esp
80103714:	68 69 6b 10 80       	push   $0x80106b69
80103719:	e8 2a cc ff ff       	call   80100348 <panic>
8010371e:	83 ec 0c             	sub    $0xc,%esp
80103721:	68 6f 6b 10 80       	push   $0x80106b6f
80103726:	e8 1d cc ff ff       	call   80100348 <panic>

8010372b <wait>:
8010372b:	55                   	push   %ebp
8010372c:	89 e5                	mov    %esp,%ebp
8010372e:	56                   	push   %esi
8010372f:	53                   	push   %ebx
80103730:	e8 c1 fa ff ff       	call   801031f6 <myproc>
80103735:	89 c6                	mov    %eax,%esi
80103737:	83 ec 0c             	sub    $0xc,%esp
8010373a:	68 20 1d 11 80       	push   $0x80111d20
8010373f:	e8 51 04 00 00       	call   80103b95 <acquire>
80103744:	83 c4 10             	add    $0x10,%esp
80103747:	b8 00 00 00 00       	mov    $0x0,%eax
8010374c:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
80103751:	eb 5b                	jmp    801037ae <wait+0x83>
80103753:	8b 73 10             	mov    0x10(%ebx),%esi
80103756:	83 ec 0c             	sub    $0xc,%esp
80103759:	ff 73 08             	pushl  0x8(%ebx)
8010375c:	e8 43 e8 ff ff       	call   80101fa4 <kfree>
80103761:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103768:	83 c4 04             	add    $0x4,%esp
8010376b:	ff 73 04             	pushl  0x4(%ebx)
8010376e:	e8 4d 2b 00 00       	call   801062c0 <freevm>
80103773:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
8010377a:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
80103781:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
80103785:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
8010378c:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103793:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
8010379a:	e8 5b 04 00 00       	call   80103bfa <release>
8010379f:	83 c4 10             	add    $0x10,%esp
801037a2:	89 f0                	mov    %esi,%eax
801037a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801037a7:	5b                   	pop    %ebx
801037a8:	5e                   	pop    %esi
801037a9:	5d                   	pop    %ebp
801037aa:	c3                   	ret    
801037ab:	83 c3 7c             	add    $0x7c,%ebx
801037ae:	81 fb 54 3c 11 80    	cmp    $0x80113c54,%ebx
801037b4:	73 12                	jae    801037c8 <wait+0x9d>
801037b6:	39 73 14             	cmp    %esi,0x14(%ebx)
801037b9:	75 f0                	jne    801037ab <wait+0x80>
801037bb:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
801037bf:	74 92                	je     80103753 <wait+0x28>
801037c1:	b8 01 00 00 00       	mov    $0x1,%eax
801037c6:	eb e3                	jmp    801037ab <wait+0x80>
801037c8:	85 c0                	test   %eax,%eax
801037ca:	74 06                	je     801037d2 <wait+0xa7>
801037cc:	83 7e 24 00          	cmpl   $0x0,0x24(%esi)
801037d0:	74 17                	je     801037e9 <wait+0xbe>
801037d2:	83 ec 0c             	sub    $0xc,%esp
801037d5:	68 20 1d 11 80       	push   $0x80111d20
801037da:	e8 1b 04 00 00       	call   80103bfa <release>
801037df:	83 c4 10             	add    $0x10,%esp
801037e2:	be ff ff ff ff       	mov    $0xffffffff,%esi
801037e7:	eb b9                	jmp    801037a2 <wait+0x77>
801037e9:	83 ec 08             	sub    $0x8,%esp
801037ec:	68 20 1d 11 80       	push   $0x80111d20
801037f1:	56                   	push   %esi
801037f2:	e8 a3 fe ff ff       	call   8010369a <sleep>
801037f7:	83 c4 10             	add    $0x10,%esp
801037fa:	e9 48 ff ff ff       	jmp    80103747 <wait+0x1c>

801037ff <wakeup>:
801037ff:	55                   	push   %ebp
80103800:	89 e5                	mov    %esp,%ebp
80103802:	83 ec 14             	sub    $0x14,%esp
80103805:	68 20 1d 11 80       	push   $0x80111d20
8010380a:	e8 86 03 00 00       	call   80103b95 <acquire>
8010380f:	8b 45 08             	mov    0x8(%ebp),%eax
80103812:	e8 1f f8 ff ff       	call   80103036 <wakeup1>
80103817:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
8010381e:	e8 d7 03 00 00       	call   80103bfa <release>
80103823:	83 c4 10             	add    $0x10,%esp
80103826:	c9                   	leave  
80103827:	c3                   	ret    

80103828 <kill>:
80103828:	55                   	push   %ebp
80103829:	89 e5                	mov    %esp,%ebp
8010382b:	53                   	push   %ebx
8010382c:	83 ec 10             	sub    $0x10,%esp
8010382f:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103832:	68 20 1d 11 80       	push   $0x80111d20
80103837:	e8 59 03 00 00       	call   80103b95 <acquire>
8010383c:	83 c4 10             	add    $0x10,%esp
8010383f:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
80103844:	3d 54 3c 11 80       	cmp    $0x80113c54,%eax
80103849:	73 3a                	jae    80103885 <kill+0x5d>
8010384b:	39 58 10             	cmp    %ebx,0x10(%eax)
8010384e:	74 05                	je     80103855 <kill+0x2d>
80103850:	83 c0 7c             	add    $0x7c,%eax
80103853:	eb ef                	jmp    80103844 <kill+0x1c>
80103855:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010385c:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103860:	74 1a                	je     8010387c <kill+0x54>
80103862:	83 ec 0c             	sub    $0xc,%esp
80103865:	68 20 1d 11 80       	push   $0x80111d20
8010386a:	e8 8b 03 00 00       	call   80103bfa <release>
8010386f:	83 c4 10             	add    $0x10,%esp
80103872:	b8 00 00 00 00       	mov    $0x0,%eax
80103877:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010387a:	c9                   	leave  
8010387b:	c3                   	ret    
8010387c:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103883:	eb dd                	jmp    80103862 <kill+0x3a>
80103885:	83 ec 0c             	sub    $0xc,%esp
80103888:	68 20 1d 11 80       	push   $0x80111d20
8010388d:	e8 68 03 00 00       	call   80103bfa <release>
80103892:	83 c4 10             	add    $0x10,%esp
80103895:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010389a:	eb db                	jmp    80103877 <kill+0x4f>

8010389c <procdump>:
8010389c:	55                   	push   %ebp
8010389d:	89 e5                	mov    %esp,%ebp
8010389f:	56                   	push   %esi
801038a0:	53                   	push   %ebx
801038a1:	83 ec 30             	sub    $0x30,%esp
801038a4:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
801038a9:	eb 33                	jmp    801038de <procdump+0x42>
801038ab:	b8 80 6b 10 80       	mov    $0x80106b80,%eax
801038b0:	8d 53 6c             	lea    0x6c(%ebx),%edx
801038b3:	52                   	push   %edx
801038b4:	50                   	push   %eax
801038b5:	ff 73 10             	pushl  0x10(%ebx)
801038b8:	68 84 6b 10 80       	push   $0x80106b84
801038bd:	e8 49 cd ff ff       	call   8010060b <cprintf>
801038c2:	83 c4 10             	add    $0x10,%esp
801038c5:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
801038c9:	74 39                	je     80103904 <procdump+0x68>
801038cb:	83 ec 0c             	sub    $0xc,%esp
801038ce:	68 42 6d 10 80       	push   $0x80106d42
801038d3:	e8 33 cd ff ff       	call   8010060b <cprintf>
801038d8:	83 c4 10             	add    $0x10,%esp
801038db:	83 c3 7c             	add    $0x7c,%ebx
801038de:	81 fb 54 3c 11 80    	cmp    $0x80113c54,%ebx
801038e4:	73 61                	jae    80103947 <procdump+0xab>
801038e6:	8b 43 0c             	mov    0xc(%ebx),%eax
801038e9:	85 c0                	test   %eax,%eax
801038eb:	74 ee                	je     801038db <procdump+0x3f>
801038ed:	83 f8 05             	cmp    $0x5,%eax
801038f0:	77 b9                	ja     801038ab <procdump+0xf>
801038f2:	8b 04 85 e0 6b 10 80 	mov    -0x7fef9420(,%eax,4),%eax
801038f9:	85 c0                	test   %eax,%eax
801038fb:	75 b3                	jne    801038b0 <procdump+0x14>
801038fd:	b8 80 6b 10 80       	mov    $0x80106b80,%eax
80103902:	eb ac                	jmp    801038b0 <procdump+0x14>
80103904:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103907:	8b 40 0c             	mov    0xc(%eax),%eax
8010390a:	83 c0 08             	add    $0x8,%eax
8010390d:	83 ec 08             	sub    $0x8,%esp
80103910:	8d 55 d0             	lea    -0x30(%ebp),%edx
80103913:	52                   	push   %edx
80103914:	50                   	push   %eax
80103915:	e8 5a 01 00 00       	call   80103a74 <getcallerpcs>
8010391a:	83 c4 10             	add    $0x10,%esp
8010391d:	be 00 00 00 00       	mov    $0x0,%esi
80103922:	eb 14                	jmp    80103938 <procdump+0x9c>
80103924:	83 ec 08             	sub    $0x8,%esp
80103927:	50                   	push   %eax
80103928:	68 c1 65 10 80       	push   $0x801065c1
8010392d:	e8 d9 cc ff ff       	call   8010060b <cprintf>
80103932:	83 c6 01             	add    $0x1,%esi
80103935:	83 c4 10             	add    $0x10,%esp
80103938:	83 fe 09             	cmp    $0x9,%esi
8010393b:	7f 8e                	jg     801038cb <procdump+0x2f>
8010393d:	8b 44 b5 d0          	mov    -0x30(%ebp,%esi,4),%eax
80103941:	85 c0                	test   %eax,%eax
80103943:	75 df                	jne    80103924 <procdump+0x88>
80103945:	eb 84                	jmp    801038cb <procdump+0x2f>
80103947:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010394a:	5b                   	pop    %ebx
8010394b:	5e                   	pop    %esi
8010394c:	5d                   	pop    %ebp
8010394d:	c3                   	ret    

8010394e <initsleeplock>:
8010394e:	55                   	push   %ebp
8010394f:	89 e5                	mov    %esp,%ebp
80103951:	53                   	push   %ebx
80103952:	83 ec 0c             	sub    $0xc,%esp
80103955:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103958:	68 f8 6b 10 80       	push   $0x80106bf8
8010395d:	8d 43 04             	lea    0x4(%ebx),%eax
80103960:	50                   	push   %eax
80103961:	e8 f3 00 00 00       	call   80103a59 <initlock>
80103966:	8b 45 0c             	mov    0xc(%ebp),%eax
80103969:	89 43 38             	mov    %eax,0x38(%ebx)
8010396c:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103972:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80103979:	83 c4 10             	add    $0x10,%esp
8010397c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010397f:	c9                   	leave  
80103980:	c3                   	ret    

80103981 <acquiresleep>:
80103981:	55                   	push   %ebp
80103982:	89 e5                	mov    %esp,%ebp
80103984:	56                   	push   %esi
80103985:	53                   	push   %ebx
80103986:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103989:	8d 73 04             	lea    0x4(%ebx),%esi
8010398c:	83 ec 0c             	sub    $0xc,%esp
8010398f:	56                   	push   %esi
80103990:	e8 00 02 00 00       	call   80103b95 <acquire>
80103995:	83 c4 10             	add    $0x10,%esp
80103998:	eb 0d                	jmp    801039a7 <acquiresleep+0x26>
8010399a:	83 ec 08             	sub    $0x8,%esp
8010399d:	56                   	push   %esi
8010399e:	53                   	push   %ebx
8010399f:	e8 f6 fc ff ff       	call   8010369a <sleep>
801039a4:	83 c4 10             	add    $0x10,%esp
801039a7:	83 3b 00             	cmpl   $0x0,(%ebx)
801039aa:	75 ee                	jne    8010399a <acquiresleep+0x19>
801039ac:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
801039b2:	e8 3f f8 ff ff       	call   801031f6 <myproc>
801039b7:	8b 40 10             	mov    0x10(%eax),%eax
801039ba:	89 43 3c             	mov    %eax,0x3c(%ebx)
801039bd:	83 ec 0c             	sub    $0xc,%esp
801039c0:	56                   	push   %esi
801039c1:	e8 34 02 00 00       	call   80103bfa <release>
801039c6:	83 c4 10             	add    $0x10,%esp
801039c9:	8d 65 f8             	lea    -0x8(%ebp),%esp
801039cc:	5b                   	pop    %ebx
801039cd:	5e                   	pop    %esi
801039ce:	5d                   	pop    %ebp
801039cf:	c3                   	ret    

801039d0 <releasesleep>:
801039d0:	55                   	push   %ebp
801039d1:	89 e5                	mov    %esp,%ebp
801039d3:	56                   	push   %esi
801039d4:	53                   	push   %ebx
801039d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801039d8:	8d 73 04             	lea    0x4(%ebx),%esi
801039db:	83 ec 0c             	sub    $0xc,%esp
801039de:	56                   	push   %esi
801039df:	e8 b1 01 00 00       	call   80103b95 <acquire>
801039e4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801039ea:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801039f1:	89 1c 24             	mov    %ebx,(%esp)
801039f4:	e8 06 fe ff ff       	call   801037ff <wakeup>
801039f9:	89 34 24             	mov    %esi,(%esp)
801039fc:	e8 f9 01 00 00       	call   80103bfa <release>
80103a01:	83 c4 10             	add    $0x10,%esp
80103a04:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103a07:	5b                   	pop    %ebx
80103a08:	5e                   	pop    %esi
80103a09:	5d                   	pop    %ebp
80103a0a:	c3                   	ret    

80103a0b <holdingsleep>:
80103a0b:	55                   	push   %ebp
80103a0c:	89 e5                	mov    %esp,%ebp
80103a0e:	56                   	push   %esi
80103a0f:	53                   	push   %ebx
80103a10:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103a13:	8d 73 04             	lea    0x4(%ebx),%esi
80103a16:	83 ec 0c             	sub    $0xc,%esp
80103a19:	56                   	push   %esi
80103a1a:	e8 76 01 00 00       	call   80103b95 <acquire>
80103a1f:	83 c4 10             	add    $0x10,%esp
80103a22:	83 3b 00             	cmpl   $0x0,(%ebx)
80103a25:	75 17                	jne    80103a3e <holdingsleep+0x33>
80103a27:	bb 00 00 00 00       	mov    $0x0,%ebx
80103a2c:	83 ec 0c             	sub    $0xc,%esp
80103a2f:	56                   	push   %esi
80103a30:	e8 c5 01 00 00       	call   80103bfa <release>
80103a35:	89 d8                	mov    %ebx,%eax
80103a37:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103a3a:	5b                   	pop    %ebx
80103a3b:	5e                   	pop    %esi
80103a3c:	5d                   	pop    %ebp
80103a3d:	c3                   	ret    
80103a3e:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80103a41:	e8 b0 f7 ff ff       	call   801031f6 <myproc>
80103a46:	3b 58 10             	cmp    0x10(%eax),%ebx
80103a49:	74 07                	je     80103a52 <holdingsleep+0x47>
80103a4b:	bb 00 00 00 00       	mov    $0x0,%ebx
80103a50:	eb da                	jmp    80103a2c <holdingsleep+0x21>
80103a52:	bb 01 00 00 00       	mov    $0x1,%ebx
80103a57:	eb d3                	jmp    80103a2c <holdingsleep+0x21>

80103a59 <initlock>:
80103a59:	55                   	push   %ebp
80103a5a:	89 e5                	mov    %esp,%ebp
80103a5c:	8b 45 08             	mov    0x8(%ebp),%eax
80103a5f:	8b 55 0c             	mov    0xc(%ebp),%edx
80103a62:	89 50 04             	mov    %edx,0x4(%eax)
80103a65:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80103a6b:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80103a72:	5d                   	pop    %ebp
80103a73:	c3                   	ret    

80103a74 <getcallerpcs>:
80103a74:	55                   	push   %ebp
80103a75:	89 e5                	mov    %esp,%ebp
80103a77:	53                   	push   %ebx
80103a78:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103a7b:	8b 45 08             	mov    0x8(%ebp),%eax
80103a7e:	8d 50 f8             	lea    -0x8(%eax),%edx
80103a81:	b8 00 00 00 00       	mov    $0x0,%eax
80103a86:	83 f8 09             	cmp    $0x9,%eax
80103a89:	7f 25                	jg     80103ab0 <getcallerpcs+0x3c>
80103a8b:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80103a91:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80103a97:	77 17                	ja     80103ab0 <getcallerpcs+0x3c>
80103a99:	8b 5a 04             	mov    0x4(%edx),%ebx
80103a9c:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
80103a9f:	8b 12                	mov    (%edx),%edx
80103aa1:	83 c0 01             	add    $0x1,%eax
80103aa4:	eb e0                	jmp    80103a86 <getcallerpcs+0x12>
80103aa6:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
80103aad:	83 c0 01             	add    $0x1,%eax
80103ab0:	83 f8 09             	cmp    $0x9,%eax
80103ab3:	7e f1                	jle    80103aa6 <getcallerpcs+0x32>
80103ab5:	5b                   	pop    %ebx
80103ab6:	5d                   	pop    %ebp
80103ab7:	c3                   	ret    

80103ab8 <pushcli>:
80103ab8:	55                   	push   %ebp
80103ab9:	89 e5                	mov    %esp,%ebp
80103abb:	53                   	push   %ebx
80103abc:	83 ec 04             	sub    $0x4,%esp
80103abf:	9c                   	pushf  
80103ac0:	5b                   	pop    %ebx
80103ac1:	fa                   	cli    
80103ac2:	e8 b8 f6 ff ff       	call   8010317f <mycpu>
80103ac7:	83 b8 a4 00 00 00 00 	cmpl   $0x0,0xa4(%eax)
80103ace:	74 12                	je     80103ae2 <pushcli+0x2a>
80103ad0:	e8 aa f6 ff ff       	call   8010317f <mycpu>
80103ad5:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
80103adc:	83 c4 04             	add    $0x4,%esp
80103adf:	5b                   	pop    %ebx
80103ae0:	5d                   	pop    %ebp
80103ae1:	c3                   	ret    
80103ae2:	e8 98 f6 ff ff       	call   8010317f <mycpu>
80103ae7:	81 e3 00 02 00 00    	and    $0x200,%ebx
80103aed:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
80103af3:	eb db                	jmp    80103ad0 <pushcli+0x18>

80103af5 <popcli>:
80103af5:	55                   	push   %ebp
80103af6:	89 e5                	mov    %esp,%ebp
80103af8:	83 ec 08             	sub    $0x8,%esp
80103afb:	9c                   	pushf  
80103afc:	58                   	pop    %eax
80103afd:	f6 c4 02             	test   $0x2,%ah
80103b00:	75 28                	jne    80103b2a <popcli+0x35>
80103b02:	e8 78 f6 ff ff       	call   8010317f <mycpu>
80103b07:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80103b0d:	8d 51 ff             	lea    -0x1(%ecx),%edx
80103b10:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
80103b16:	85 d2                	test   %edx,%edx
80103b18:	78 1d                	js     80103b37 <popcli+0x42>
80103b1a:	e8 60 f6 ff ff       	call   8010317f <mycpu>
80103b1f:	83 b8 a4 00 00 00 00 	cmpl   $0x0,0xa4(%eax)
80103b26:	74 1c                	je     80103b44 <popcli+0x4f>
80103b28:	c9                   	leave  
80103b29:	c3                   	ret    
80103b2a:	83 ec 0c             	sub    $0xc,%esp
80103b2d:	68 03 6c 10 80       	push   $0x80106c03
80103b32:	e8 11 c8 ff ff       	call   80100348 <panic>
80103b37:	83 ec 0c             	sub    $0xc,%esp
80103b3a:	68 1a 6c 10 80       	push   $0x80106c1a
80103b3f:	e8 04 c8 ff ff       	call   80100348 <panic>
80103b44:	e8 36 f6 ff ff       	call   8010317f <mycpu>
80103b49:	83 b8 a8 00 00 00 00 	cmpl   $0x0,0xa8(%eax)
80103b50:	74 d6                	je     80103b28 <popcli+0x33>
80103b52:	fb                   	sti    
80103b53:	eb d3                	jmp    80103b28 <popcli+0x33>

80103b55 <holding>:
80103b55:	55                   	push   %ebp
80103b56:	89 e5                	mov    %esp,%ebp
80103b58:	53                   	push   %ebx
80103b59:	83 ec 04             	sub    $0x4,%esp
80103b5c:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103b5f:	e8 54 ff ff ff       	call   80103ab8 <pushcli>
80103b64:	83 3b 00             	cmpl   $0x0,(%ebx)
80103b67:	75 12                	jne    80103b7b <holding+0x26>
80103b69:	bb 00 00 00 00       	mov    $0x0,%ebx
80103b6e:	e8 82 ff ff ff       	call   80103af5 <popcli>
80103b73:	89 d8                	mov    %ebx,%eax
80103b75:	83 c4 04             	add    $0x4,%esp
80103b78:	5b                   	pop    %ebx
80103b79:	5d                   	pop    %ebp
80103b7a:	c3                   	ret    
80103b7b:	8b 5b 08             	mov    0x8(%ebx),%ebx
80103b7e:	e8 fc f5 ff ff       	call   8010317f <mycpu>
80103b83:	39 c3                	cmp    %eax,%ebx
80103b85:	74 07                	je     80103b8e <holding+0x39>
80103b87:	bb 00 00 00 00       	mov    $0x0,%ebx
80103b8c:	eb e0                	jmp    80103b6e <holding+0x19>
80103b8e:	bb 01 00 00 00       	mov    $0x1,%ebx
80103b93:	eb d9                	jmp    80103b6e <holding+0x19>

80103b95 <acquire>:
80103b95:	55                   	push   %ebp
80103b96:	89 e5                	mov    %esp,%ebp
80103b98:	53                   	push   %ebx
80103b99:	83 ec 04             	sub    $0x4,%esp
80103b9c:	e8 17 ff ff ff       	call   80103ab8 <pushcli>
80103ba1:	83 ec 0c             	sub    $0xc,%esp
80103ba4:	ff 75 08             	pushl  0x8(%ebp)
80103ba7:	e8 a9 ff ff ff       	call   80103b55 <holding>
80103bac:	83 c4 10             	add    $0x10,%esp
80103baf:	85 c0                	test   %eax,%eax
80103bb1:	75 3a                	jne    80103bed <acquire+0x58>
80103bb3:	8b 55 08             	mov    0x8(%ebp),%edx
80103bb6:	b8 01 00 00 00       	mov    $0x1,%eax
80103bbb:	f0 87 02             	lock xchg %eax,(%edx)
80103bbe:	85 c0                	test   %eax,%eax
80103bc0:	75 f1                	jne    80103bb3 <acquire+0x1e>
80103bc2:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80103bc7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103bca:	e8 b0 f5 ff ff       	call   8010317f <mycpu>
80103bcf:	89 43 08             	mov    %eax,0x8(%ebx)
80103bd2:	8b 45 08             	mov    0x8(%ebp),%eax
80103bd5:	83 c0 0c             	add    $0xc,%eax
80103bd8:	83 ec 08             	sub    $0x8,%esp
80103bdb:	50                   	push   %eax
80103bdc:	8d 45 08             	lea    0x8(%ebp),%eax
80103bdf:	50                   	push   %eax
80103be0:	e8 8f fe ff ff       	call   80103a74 <getcallerpcs>
80103be5:	83 c4 10             	add    $0x10,%esp
80103be8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103beb:	c9                   	leave  
80103bec:	c3                   	ret    
80103bed:	83 ec 0c             	sub    $0xc,%esp
80103bf0:	68 21 6c 10 80       	push   $0x80106c21
80103bf5:	e8 4e c7 ff ff       	call   80100348 <panic>

80103bfa <release>:
80103bfa:	55                   	push   %ebp
80103bfb:	89 e5                	mov    %esp,%ebp
80103bfd:	53                   	push   %ebx
80103bfe:	83 ec 10             	sub    $0x10,%esp
80103c01:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103c04:	53                   	push   %ebx
80103c05:	e8 4b ff ff ff       	call   80103b55 <holding>
80103c0a:	83 c4 10             	add    $0x10,%esp
80103c0d:	85 c0                	test   %eax,%eax
80103c0f:	74 23                	je     80103c34 <release+0x3a>
80103c11:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103c18:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103c1f:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80103c24:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103c2a:	e8 c6 fe ff ff       	call   80103af5 <popcli>
80103c2f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103c32:	c9                   	leave  
80103c33:	c3                   	ret    
80103c34:	83 ec 0c             	sub    $0xc,%esp
80103c37:	68 29 6c 10 80       	push   $0x80106c29
80103c3c:	e8 07 c7 ff ff       	call   80100348 <panic>

80103c41 <memset>:
80103c41:	55                   	push   %ebp
80103c42:	89 e5                	mov    %esp,%ebp
80103c44:	57                   	push   %edi
80103c45:	53                   	push   %ebx
80103c46:	8b 55 08             	mov    0x8(%ebp),%edx
80103c49:	8b 4d 10             	mov    0x10(%ebp),%ecx
80103c4c:	f6 c2 03             	test   $0x3,%dl
80103c4f:	75 05                	jne    80103c56 <memset+0x15>
80103c51:	f6 c1 03             	test   $0x3,%cl
80103c54:	74 0e                	je     80103c64 <memset+0x23>
80103c56:	89 d7                	mov    %edx,%edi
80103c58:	8b 45 0c             	mov    0xc(%ebp),%eax
80103c5b:	fc                   	cld    
80103c5c:	f3 aa                	rep stos %al,%es:(%edi)
80103c5e:	89 d0                	mov    %edx,%eax
80103c60:	5b                   	pop    %ebx
80103c61:	5f                   	pop    %edi
80103c62:	5d                   	pop    %ebp
80103c63:	c3                   	ret    
80103c64:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
80103c68:	c1 e9 02             	shr    $0x2,%ecx
80103c6b:	89 f8                	mov    %edi,%eax
80103c6d:	c1 e0 18             	shl    $0x18,%eax
80103c70:	89 fb                	mov    %edi,%ebx
80103c72:	c1 e3 10             	shl    $0x10,%ebx
80103c75:	09 d8                	or     %ebx,%eax
80103c77:	89 fb                	mov    %edi,%ebx
80103c79:	c1 e3 08             	shl    $0x8,%ebx
80103c7c:	09 d8                	or     %ebx,%eax
80103c7e:	09 f8                	or     %edi,%eax
80103c80:	89 d7                	mov    %edx,%edi
80103c82:	fc                   	cld    
80103c83:	f3 ab                	rep stos %eax,%es:(%edi)
80103c85:	eb d7                	jmp    80103c5e <memset+0x1d>

80103c87 <memcmp>:
80103c87:	55                   	push   %ebp
80103c88:	89 e5                	mov    %esp,%ebp
80103c8a:	56                   	push   %esi
80103c8b:	53                   	push   %ebx
80103c8c:	8b 4d 08             	mov    0x8(%ebp),%ecx
80103c8f:	8b 55 0c             	mov    0xc(%ebp),%edx
80103c92:	8b 45 10             	mov    0x10(%ebp),%eax
80103c95:	8d 70 ff             	lea    -0x1(%eax),%esi
80103c98:	85 c0                	test   %eax,%eax
80103c9a:	74 1c                	je     80103cb8 <memcmp+0x31>
80103c9c:	0f b6 01             	movzbl (%ecx),%eax
80103c9f:	0f b6 1a             	movzbl (%edx),%ebx
80103ca2:	38 d8                	cmp    %bl,%al
80103ca4:	75 0a                	jne    80103cb0 <memcmp+0x29>
80103ca6:	83 c1 01             	add    $0x1,%ecx
80103ca9:	83 c2 01             	add    $0x1,%edx
80103cac:	89 f0                	mov    %esi,%eax
80103cae:	eb e5                	jmp    80103c95 <memcmp+0xe>
80103cb0:	0f b6 c0             	movzbl %al,%eax
80103cb3:	0f b6 db             	movzbl %bl,%ebx
80103cb6:	29 d8                	sub    %ebx,%eax
80103cb8:	5b                   	pop    %ebx
80103cb9:	5e                   	pop    %esi
80103cba:	5d                   	pop    %ebp
80103cbb:	c3                   	ret    

80103cbc <memmove>:
80103cbc:	55                   	push   %ebp
80103cbd:	89 e5                	mov    %esp,%ebp
80103cbf:	56                   	push   %esi
80103cc0:	53                   	push   %ebx
80103cc1:	8b 45 08             	mov    0x8(%ebp),%eax
80103cc4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103cc7:	8b 55 10             	mov    0x10(%ebp),%edx
80103cca:	39 c1                	cmp    %eax,%ecx
80103ccc:	73 3a                	jae    80103d08 <memmove+0x4c>
80103cce:	8d 1c 11             	lea    (%ecx,%edx,1),%ebx
80103cd1:	39 c3                	cmp    %eax,%ebx
80103cd3:	76 37                	jbe    80103d0c <memmove+0x50>
80103cd5:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
80103cd8:	eb 0d                	jmp    80103ce7 <memmove+0x2b>
80103cda:	83 eb 01             	sub    $0x1,%ebx
80103cdd:	83 e9 01             	sub    $0x1,%ecx
80103ce0:	0f b6 13             	movzbl (%ebx),%edx
80103ce3:	88 11                	mov    %dl,(%ecx)
80103ce5:	89 f2                	mov    %esi,%edx
80103ce7:	8d 72 ff             	lea    -0x1(%edx),%esi
80103cea:	85 d2                	test   %edx,%edx
80103cec:	75 ec                	jne    80103cda <memmove+0x1e>
80103cee:	eb 14                	jmp    80103d04 <memmove+0x48>
80103cf0:	0f b6 11             	movzbl (%ecx),%edx
80103cf3:	88 13                	mov    %dl,(%ebx)
80103cf5:	8d 5b 01             	lea    0x1(%ebx),%ebx
80103cf8:	8d 49 01             	lea    0x1(%ecx),%ecx
80103cfb:	89 f2                	mov    %esi,%edx
80103cfd:	8d 72 ff             	lea    -0x1(%edx),%esi
80103d00:	85 d2                	test   %edx,%edx
80103d02:	75 ec                	jne    80103cf0 <memmove+0x34>
80103d04:	5b                   	pop    %ebx
80103d05:	5e                   	pop    %esi
80103d06:	5d                   	pop    %ebp
80103d07:	c3                   	ret    
80103d08:	89 c3                	mov    %eax,%ebx
80103d0a:	eb f1                	jmp    80103cfd <memmove+0x41>
80103d0c:	89 c3                	mov    %eax,%ebx
80103d0e:	eb ed                	jmp    80103cfd <memmove+0x41>

80103d10 <memcpy>:
80103d10:	55                   	push   %ebp
80103d11:	89 e5                	mov    %esp,%ebp
80103d13:	ff 75 10             	pushl  0x10(%ebp)
80103d16:	ff 75 0c             	pushl  0xc(%ebp)
80103d19:	ff 75 08             	pushl  0x8(%ebp)
80103d1c:	e8 9b ff ff ff       	call   80103cbc <memmove>
80103d21:	c9                   	leave  
80103d22:	c3                   	ret    

80103d23 <strncmp>:
80103d23:	55                   	push   %ebp
80103d24:	89 e5                	mov    %esp,%ebp
80103d26:	53                   	push   %ebx
80103d27:	8b 55 08             	mov    0x8(%ebp),%edx
80103d2a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103d2d:	8b 45 10             	mov    0x10(%ebp),%eax
80103d30:	eb 09                	jmp    80103d3b <strncmp+0x18>
80103d32:	83 e8 01             	sub    $0x1,%eax
80103d35:	83 c2 01             	add    $0x1,%edx
80103d38:	83 c1 01             	add    $0x1,%ecx
80103d3b:	85 c0                	test   %eax,%eax
80103d3d:	74 0b                	je     80103d4a <strncmp+0x27>
80103d3f:	0f b6 1a             	movzbl (%edx),%ebx
80103d42:	84 db                	test   %bl,%bl
80103d44:	74 04                	je     80103d4a <strncmp+0x27>
80103d46:	3a 19                	cmp    (%ecx),%bl
80103d48:	74 e8                	je     80103d32 <strncmp+0xf>
80103d4a:	85 c0                	test   %eax,%eax
80103d4c:	74 0b                	je     80103d59 <strncmp+0x36>
80103d4e:	0f b6 02             	movzbl (%edx),%eax
80103d51:	0f b6 11             	movzbl (%ecx),%edx
80103d54:	29 d0                	sub    %edx,%eax
80103d56:	5b                   	pop    %ebx
80103d57:	5d                   	pop    %ebp
80103d58:	c3                   	ret    
80103d59:	b8 00 00 00 00       	mov    $0x0,%eax
80103d5e:	eb f6                	jmp    80103d56 <strncmp+0x33>

80103d60 <strncpy>:
80103d60:	55                   	push   %ebp
80103d61:	89 e5                	mov    %esp,%ebp
80103d63:	57                   	push   %edi
80103d64:	56                   	push   %esi
80103d65:	53                   	push   %ebx
80103d66:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80103d69:	8b 4d 10             	mov    0x10(%ebp),%ecx
80103d6c:	8b 45 08             	mov    0x8(%ebp),%eax
80103d6f:	eb 04                	jmp    80103d75 <strncpy+0x15>
80103d71:	89 fb                	mov    %edi,%ebx
80103d73:	89 f0                	mov    %esi,%eax
80103d75:	8d 51 ff             	lea    -0x1(%ecx),%edx
80103d78:	85 c9                	test   %ecx,%ecx
80103d7a:	7e 1d                	jle    80103d99 <strncpy+0x39>
80103d7c:	8d 7b 01             	lea    0x1(%ebx),%edi
80103d7f:	8d 70 01             	lea    0x1(%eax),%esi
80103d82:	0f b6 1b             	movzbl (%ebx),%ebx
80103d85:	88 18                	mov    %bl,(%eax)
80103d87:	89 d1                	mov    %edx,%ecx
80103d89:	84 db                	test   %bl,%bl
80103d8b:	75 e4                	jne    80103d71 <strncpy+0x11>
80103d8d:	89 f0                	mov    %esi,%eax
80103d8f:	eb 08                	jmp    80103d99 <strncpy+0x39>
80103d91:	c6 00 00             	movb   $0x0,(%eax)
80103d94:	89 ca                	mov    %ecx,%edx
80103d96:	8d 40 01             	lea    0x1(%eax),%eax
80103d99:	8d 4a ff             	lea    -0x1(%edx),%ecx
80103d9c:	85 d2                	test   %edx,%edx
80103d9e:	7f f1                	jg     80103d91 <strncpy+0x31>
80103da0:	8b 45 08             	mov    0x8(%ebp),%eax
80103da3:	5b                   	pop    %ebx
80103da4:	5e                   	pop    %esi
80103da5:	5f                   	pop    %edi
80103da6:	5d                   	pop    %ebp
80103da7:	c3                   	ret    

80103da8 <safestrcpy>:
80103da8:	55                   	push   %ebp
80103da9:	89 e5                	mov    %esp,%ebp
80103dab:	57                   	push   %edi
80103dac:	56                   	push   %esi
80103dad:	53                   	push   %ebx
80103dae:	8b 45 08             	mov    0x8(%ebp),%eax
80103db1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80103db4:	8b 55 10             	mov    0x10(%ebp),%edx
80103db7:	85 d2                	test   %edx,%edx
80103db9:	7e 23                	jle    80103dde <safestrcpy+0x36>
80103dbb:	89 c1                	mov    %eax,%ecx
80103dbd:	eb 04                	jmp    80103dc3 <safestrcpy+0x1b>
80103dbf:	89 fb                	mov    %edi,%ebx
80103dc1:	89 f1                	mov    %esi,%ecx
80103dc3:	83 ea 01             	sub    $0x1,%edx
80103dc6:	85 d2                	test   %edx,%edx
80103dc8:	7e 11                	jle    80103ddb <safestrcpy+0x33>
80103dca:	8d 7b 01             	lea    0x1(%ebx),%edi
80103dcd:	8d 71 01             	lea    0x1(%ecx),%esi
80103dd0:	0f b6 1b             	movzbl (%ebx),%ebx
80103dd3:	88 19                	mov    %bl,(%ecx)
80103dd5:	84 db                	test   %bl,%bl
80103dd7:	75 e6                	jne    80103dbf <safestrcpy+0x17>
80103dd9:	89 f1                	mov    %esi,%ecx
80103ddb:	c6 01 00             	movb   $0x0,(%ecx)
80103dde:	5b                   	pop    %ebx
80103ddf:	5e                   	pop    %esi
80103de0:	5f                   	pop    %edi
80103de1:	5d                   	pop    %ebp
80103de2:	c3                   	ret    

80103de3 <strlen>:
80103de3:	55                   	push   %ebp
80103de4:	89 e5                	mov    %esp,%ebp
80103de6:	8b 55 08             	mov    0x8(%ebp),%edx
80103de9:	b8 00 00 00 00       	mov    $0x0,%eax
80103dee:	eb 03                	jmp    80103df3 <strlen+0x10>
80103df0:	83 c0 01             	add    $0x1,%eax
80103df3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80103df7:	75 f7                	jne    80103df0 <strlen+0xd>
80103df9:	5d                   	pop    %ebp
80103dfa:	c3                   	ret    

80103dfb <swtch>:
80103dfb:	8b 44 24 04          	mov    0x4(%esp),%eax
80103dff:	8b 54 24 08          	mov    0x8(%esp),%edx
80103e03:	55                   	push   %ebp
80103e04:	53                   	push   %ebx
80103e05:	56                   	push   %esi
80103e06:	57                   	push   %edi
80103e07:	89 20                	mov    %esp,(%eax)
80103e09:	89 d4                	mov    %edx,%esp
80103e0b:	5f                   	pop    %edi
80103e0c:	5e                   	pop    %esi
80103e0d:	5b                   	pop    %ebx
80103e0e:	5d                   	pop    %ebp
80103e0f:	c3                   	ret    

80103e10 <fetchint>:
80103e10:	55                   	push   %ebp
80103e11:	89 e5                	mov    %esp,%ebp
80103e13:	53                   	push   %ebx
80103e14:	83 ec 04             	sub    $0x4,%esp
80103e17:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103e1a:	e8 d7 f3 ff ff       	call   801031f6 <myproc>
80103e1f:	8b 00                	mov    (%eax),%eax
80103e21:	39 d8                	cmp    %ebx,%eax
80103e23:	76 19                	jbe    80103e3e <fetchint+0x2e>
80103e25:	8d 53 04             	lea    0x4(%ebx),%edx
80103e28:	39 d0                	cmp    %edx,%eax
80103e2a:	72 19                	jb     80103e45 <fetchint+0x35>
80103e2c:	8b 13                	mov    (%ebx),%edx
80103e2e:	8b 45 0c             	mov    0xc(%ebp),%eax
80103e31:	89 10                	mov    %edx,(%eax)
80103e33:	b8 00 00 00 00       	mov    $0x0,%eax
80103e38:	83 c4 04             	add    $0x4,%esp
80103e3b:	5b                   	pop    %ebx
80103e3c:	5d                   	pop    %ebp
80103e3d:	c3                   	ret    
80103e3e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103e43:	eb f3                	jmp    80103e38 <fetchint+0x28>
80103e45:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103e4a:	eb ec                	jmp    80103e38 <fetchint+0x28>

80103e4c <fetchstr>:
80103e4c:	55                   	push   %ebp
80103e4d:	89 e5                	mov    %esp,%ebp
80103e4f:	53                   	push   %ebx
80103e50:	83 ec 04             	sub    $0x4,%esp
80103e53:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103e56:	e8 9b f3 ff ff       	call   801031f6 <myproc>
80103e5b:	39 18                	cmp    %ebx,(%eax)
80103e5d:	76 26                	jbe    80103e85 <fetchstr+0x39>
80103e5f:	8b 55 0c             	mov    0xc(%ebp),%edx
80103e62:	89 1a                	mov    %ebx,(%edx)
80103e64:	8b 10                	mov    (%eax),%edx
80103e66:	89 d8                	mov    %ebx,%eax
80103e68:	39 d0                	cmp    %edx,%eax
80103e6a:	73 0e                	jae    80103e7a <fetchstr+0x2e>
80103e6c:	80 38 00             	cmpb   $0x0,(%eax)
80103e6f:	74 05                	je     80103e76 <fetchstr+0x2a>
80103e71:	83 c0 01             	add    $0x1,%eax
80103e74:	eb f2                	jmp    80103e68 <fetchstr+0x1c>
80103e76:	29 d8                	sub    %ebx,%eax
80103e78:	eb 05                	jmp    80103e7f <fetchstr+0x33>
80103e7a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103e7f:	83 c4 04             	add    $0x4,%esp
80103e82:	5b                   	pop    %ebx
80103e83:	5d                   	pop    %ebp
80103e84:	c3                   	ret    
80103e85:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103e8a:	eb f3                	jmp    80103e7f <fetchstr+0x33>

80103e8c <argint>:
80103e8c:	55                   	push   %ebp
80103e8d:	89 e5                	mov    %esp,%ebp
80103e8f:	83 ec 08             	sub    $0x8,%esp
80103e92:	e8 5f f3 ff ff       	call   801031f6 <myproc>
80103e97:	8b 50 18             	mov    0x18(%eax),%edx
80103e9a:	8b 45 08             	mov    0x8(%ebp),%eax
80103e9d:	c1 e0 02             	shl    $0x2,%eax
80103ea0:	03 42 44             	add    0x44(%edx),%eax
80103ea3:	83 ec 08             	sub    $0x8,%esp
80103ea6:	ff 75 0c             	pushl  0xc(%ebp)
80103ea9:	83 c0 04             	add    $0x4,%eax
80103eac:	50                   	push   %eax
80103ead:	e8 5e ff ff ff       	call   80103e10 <fetchint>
80103eb2:	c9                   	leave  
80103eb3:	c3                   	ret    

80103eb4 <argptr>:
80103eb4:	55                   	push   %ebp
80103eb5:	89 e5                	mov    %esp,%ebp
80103eb7:	56                   	push   %esi
80103eb8:	53                   	push   %ebx
80103eb9:	83 ec 10             	sub    $0x10,%esp
80103ebc:	8b 5d 10             	mov    0x10(%ebp),%ebx
80103ebf:	e8 32 f3 ff ff       	call   801031f6 <myproc>
80103ec4:	89 c6                	mov    %eax,%esi
80103ec6:	83 ec 08             	sub    $0x8,%esp
80103ec9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80103ecc:	50                   	push   %eax
80103ecd:	ff 75 08             	pushl  0x8(%ebp)
80103ed0:	e8 b7 ff ff ff       	call   80103e8c <argint>
80103ed5:	83 c4 10             	add    $0x10,%esp
80103ed8:	85 c0                	test   %eax,%eax
80103eda:	78 24                	js     80103f00 <argptr+0x4c>
80103edc:	85 db                	test   %ebx,%ebx
80103ede:	78 27                	js     80103f07 <argptr+0x53>
80103ee0:	8b 16                	mov    (%esi),%edx
80103ee2:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103ee5:	39 c2                	cmp    %eax,%edx
80103ee7:	76 25                	jbe    80103f0e <argptr+0x5a>
80103ee9:	01 c3                	add    %eax,%ebx
80103eeb:	39 da                	cmp    %ebx,%edx
80103eed:	72 26                	jb     80103f15 <argptr+0x61>
80103eef:	8b 55 0c             	mov    0xc(%ebp),%edx
80103ef2:	89 02                	mov    %eax,(%edx)
80103ef4:	b8 00 00 00 00       	mov    $0x0,%eax
80103ef9:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103efc:	5b                   	pop    %ebx
80103efd:	5e                   	pop    %esi
80103efe:	5d                   	pop    %ebp
80103eff:	c3                   	ret    
80103f00:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f05:	eb f2                	jmp    80103ef9 <argptr+0x45>
80103f07:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f0c:	eb eb                	jmp    80103ef9 <argptr+0x45>
80103f0e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f13:	eb e4                	jmp    80103ef9 <argptr+0x45>
80103f15:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f1a:	eb dd                	jmp    80103ef9 <argptr+0x45>

80103f1c <argstr>:
80103f1c:	55                   	push   %ebp
80103f1d:	89 e5                	mov    %esp,%ebp
80103f1f:	83 ec 20             	sub    $0x20,%esp
80103f22:	8d 45 f4             	lea    -0xc(%ebp),%eax
80103f25:	50                   	push   %eax
80103f26:	ff 75 08             	pushl  0x8(%ebp)
80103f29:	e8 5e ff ff ff       	call   80103e8c <argint>
80103f2e:	83 c4 10             	add    $0x10,%esp
80103f31:	85 c0                	test   %eax,%eax
80103f33:	78 13                	js     80103f48 <argstr+0x2c>
80103f35:	83 ec 08             	sub    $0x8,%esp
80103f38:	ff 75 0c             	pushl  0xc(%ebp)
80103f3b:	ff 75 f4             	pushl  -0xc(%ebp)
80103f3e:	e8 09 ff ff ff       	call   80103e4c <fetchstr>
80103f43:	83 c4 10             	add    $0x10,%esp
80103f46:	c9                   	leave  
80103f47:	c3                   	ret    
80103f48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f4d:	eb f7                	jmp    80103f46 <argstr+0x2a>

80103f4f <syscall>:
80103f4f:	55                   	push   %ebp
80103f50:	89 e5                	mov    %esp,%ebp
80103f52:	53                   	push   %ebx
80103f53:	83 ec 04             	sub    $0x4,%esp
80103f56:	e8 9b f2 ff ff       	call   801031f6 <myproc>
80103f5b:	89 c3                	mov    %eax,%ebx
80103f5d:	8b 40 18             	mov    0x18(%eax),%eax
80103f60:	8b 40 1c             	mov    0x1c(%eax),%eax
80103f63:	8d 50 ff             	lea    -0x1(%eax),%edx
80103f66:	83 fa 16             	cmp    $0x16,%edx
80103f69:	77 18                	ja     80103f83 <syscall+0x34>
80103f6b:	8b 14 85 60 6c 10 80 	mov    -0x7fef93a0(,%eax,4),%edx
80103f72:	85 d2                	test   %edx,%edx
80103f74:	74 0d                	je     80103f83 <syscall+0x34>
80103f76:	ff d2                	call   *%edx
80103f78:	8b 53 18             	mov    0x18(%ebx),%edx
80103f7b:	89 42 1c             	mov    %eax,0x1c(%edx)
80103f7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f81:	c9                   	leave  
80103f82:	c3                   	ret    
80103f83:	8d 53 6c             	lea    0x6c(%ebx),%edx
80103f86:	50                   	push   %eax
80103f87:	52                   	push   %edx
80103f88:	ff 73 10             	pushl  0x10(%ebx)
80103f8b:	68 31 6c 10 80       	push   $0x80106c31
80103f90:	e8 76 c6 ff ff       	call   8010060b <cprintf>
80103f95:	8b 43 18             	mov    0x18(%ebx),%eax
80103f98:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
80103f9f:	83 c4 10             	add    $0x10,%esp
80103fa2:	eb da                	jmp    80103f7e <syscall+0x2f>

80103fa4 <argfd>:
80103fa4:	55                   	push   %ebp
80103fa5:	89 e5                	mov    %esp,%ebp
80103fa7:	56                   	push   %esi
80103fa8:	53                   	push   %ebx
80103fa9:	83 ec 18             	sub    $0x18,%esp
80103fac:	89 d6                	mov    %edx,%esi
80103fae:	89 cb                	mov    %ecx,%ebx
80103fb0:	8d 55 f4             	lea    -0xc(%ebp),%edx
80103fb3:	52                   	push   %edx
80103fb4:	50                   	push   %eax
80103fb5:	e8 d2 fe ff ff       	call   80103e8c <argint>
80103fba:	83 c4 10             	add    $0x10,%esp
80103fbd:	85 c0                	test   %eax,%eax
80103fbf:	78 2e                	js     80103fef <argfd+0x4b>
80103fc1:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80103fc5:	77 2f                	ja     80103ff6 <argfd+0x52>
80103fc7:	e8 2a f2 ff ff       	call   801031f6 <myproc>
80103fcc:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103fcf:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80103fd3:	85 c0                	test   %eax,%eax
80103fd5:	74 26                	je     80103ffd <argfd+0x59>
80103fd7:	85 f6                	test   %esi,%esi
80103fd9:	74 02                	je     80103fdd <argfd+0x39>
80103fdb:	89 16                	mov    %edx,(%esi)
80103fdd:	85 db                	test   %ebx,%ebx
80103fdf:	74 23                	je     80104004 <argfd+0x60>
80103fe1:	89 03                	mov    %eax,(%ebx)
80103fe3:	b8 00 00 00 00       	mov    $0x0,%eax
80103fe8:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103feb:	5b                   	pop    %ebx
80103fec:	5e                   	pop    %esi
80103fed:	5d                   	pop    %ebp
80103fee:	c3                   	ret    
80103fef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103ff4:	eb f2                	jmp    80103fe8 <argfd+0x44>
80103ff6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103ffb:	eb eb                	jmp    80103fe8 <argfd+0x44>
80103ffd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104002:	eb e4                	jmp    80103fe8 <argfd+0x44>
80104004:	b8 00 00 00 00       	mov    $0x0,%eax
80104009:	eb dd                	jmp    80103fe8 <argfd+0x44>

8010400b <fdalloc>:
8010400b:	55                   	push   %ebp
8010400c:	89 e5                	mov    %esp,%ebp
8010400e:	53                   	push   %ebx
8010400f:	83 ec 04             	sub    $0x4,%esp
80104012:	89 c3                	mov    %eax,%ebx
80104014:	e8 dd f1 ff ff       	call   801031f6 <myproc>
80104019:	ba 00 00 00 00       	mov    $0x0,%edx
8010401e:	83 fa 0f             	cmp    $0xf,%edx
80104021:	7f 18                	jg     8010403b <fdalloc+0x30>
80104023:	83 7c 90 28 00       	cmpl   $0x0,0x28(%eax,%edx,4)
80104028:	74 05                	je     8010402f <fdalloc+0x24>
8010402a:	83 c2 01             	add    $0x1,%edx
8010402d:	eb ef                	jmp    8010401e <fdalloc+0x13>
8010402f:	89 5c 90 28          	mov    %ebx,0x28(%eax,%edx,4)
80104033:	89 d0                	mov    %edx,%eax
80104035:	83 c4 04             	add    $0x4,%esp
80104038:	5b                   	pop    %ebx
80104039:	5d                   	pop    %ebp
8010403a:	c3                   	ret    
8010403b:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80104040:	eb f1                	jmp    80104033 <fdalloc+0x28>

80104042 <isdirempty>:
80104042:	55                   	push   %ebp
80104043:	89 e5                	mov    %esp,%ebp
80104045:	56                   	push   %esi
80104046:	53                   	push   %ebx
80104047:	83 ec 10             	sub    $0x10,%esp
8010404a:	89 c3                	mov    %eax,%ebx
8010404c:	b8 20 00 00 00       	mov    $0x20,%eax
80104051:	89 c6                	mov    %eax,%esi
80104053:	39 43 58             	cmp    %eax,0x58(%ebx)
80104056:	76 2e                	jbe    80104086 <isdirempty+0x44>
80104058:	6a 10                	push   $0x10
8010405a:	50                   	push   %eax
8010405b:	8d 45 e8             	lea    -0x18(%ebp),%eax
8010405e:	50                   	push   %eax
8010405f:	53                   	push   %ebx
80104060:	e8 0e d7 ff ff       	call   80101773 <readi>
80104065:	83 c4 10             	add    $0x10,%esp
80104068:	83 f8 10             	cmp    $0x10,%eax
8010406b:	75 0c                	jne    80104079 <isdirempty+0x37>
8010406d:	66 83 7d e8 00       	cmpw   $0x0,-0x18(%ebp)
80104072:	75 1e                	jne    80104092 <isdirempty+0x50>
80104074:	8d 46 10             	lea    0x10(%esi),%eax
80104077:	eb d8                	jmp    80104051 <isdirempty+0xf>
80104079:	83 ec 0c             	sub    $0xc,%esp
8010407c:	68 c0 6c 10 80       	push   $0x80106cc0
80104081:	e8 c2 c2 ff ff       	call   80100348 <panic>
80104086:	b8 01 00 00 00       	mov    $0x1,%eax
8010408b:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010408e:	5b                   	pop    %ebx
8010408f:	5e                   	pop    %esi
80104090:	5d                   	pop    %ebp
80104091:	c3                   	ret    
80104092:	b8 00 00 00 00       	mov    $0x0,%eax
80104097:	eb f2                	jmp    8010408b <isdirempty+0x49>

80104099 <create>:
80104099:	55                   	push   %ebp
8010409a:	89 e5                	mov    %esp,%ebp
8010409c:	57                   	push   %edi
8010409d:	56                   	push   %esi
8010409e:	53                   	push   %ebx
8010409f:	83 ec 44             	sub    $0x44,%esp
801040a2:	89 55 c4             	mov    %edx,-0x3c(%ebp)
801040a5:	89 4d c0             	mov    %ecx,-0x40(%ebp)
801040a8:	8b 7d 08             	mov    0x8(%ebp),%edi
801040ab:	8d 55 d6             	lea    -0x2a(%ebp),%edx
801040ae:	52                   	push   %edx
801040af:	50                   	push   %eax
801040b0:	e8 44 db ff ff       	call   80101bf9 <nameiparent>
801040b5:	89 c6                	mov    %eax,%esi
801040b7:	83 c4 10             	add    $0x10,%esp
801040ba:	85 c0                	test   %eax,%eax
801040bc:	0f 84 3a 01 00 00    	je     801041fc <create+0x163>
801040c2:	83 ec 0c             	sub    $0xc,%esp
801040c5:	50                   	push   %eax
801040c6:	e8 b6 d4 ff ff       	call   80101581 <ilock>
801040cb:	83 c4 0c             	add    $0xc,%esp
801040ce:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801040d1:	50                   	push   %eax
801040d2:	8d 45 d6             	lea    -0x2a(%ebp),%eax
801040d5:	50                   	push   %eax
801040d6:	56                   	push   %esi
801040d7:	e8 d4 d8 ff ff       	call   801019b0 <dirlookup>
801040dc:	89 c3                	mov    %eax,%ebx
801040de:	83 c4 10             	add    $0x10,%esp
801040e1:	85 c0                	test   %eax,%eax
801040e3:	74 3f                	je     80104124 <create+0x8b>
801040e5:	83 ec 0c             	sub    $0xc,%esp
801040e8:	56                   	push   %esi
801040e9:	e8 3a d6 ff ff       	call   80101728 <iunlockput>
801040ee:	89 1c 24             	mov    %ebx,(%esp)
801040f1:	e8 8b d4 ff ff       	call   80101581 <ilock>
801040f6:	83 c4 10             	add    $0x10,%esp
801040f9:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
801040fe:	75 11                	jne    80104111 <create+0x78>
80104100:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
80104105:	75 0a                	jne    80104111 <create+0x78>
80104107:	89 d8                	mov    %ebx,%eax
80104109:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010410c:	5b                   	pop    %ebx
8010410d:	5e                   	pop    %esi
8010410e:	5f                   	pop    %edi
8010410f:	5d                   	pop    %ebp
80104110:	c3                   	ret    
80104111:	83 ec 0c             	sub    $0xc,%esp
80104114:	53                   	push   %ebx
80104115:	e8 0e d6 ff ff       	call   80101728 <iunlockput>
8010411a:	83 c4 10             	add    $0x10,%esp
8010411d:	bb 00 00 00 00       	mov    $0x0,%ebx
80104122:	eb e3                	jmp    80104107 <create+0x6e>
80104124:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104128:	83 ec 08             	sub    $0x8,%esp
8010412b:	50                   	push   %eax
8010412c:	ff 36                	pushl  (%esi)
8010412e:	e8 4b d2 ff ff       	call   8010137e <ialloc>
80104133:	89 c3                	mov    %eax,%ebx
80104135:	83 c4 10             	add    $0x10,%esp
80104138:	85 c0                	test   %eax,%eax
8010413a:	74 55                	je     80104191 <create+0xf8>
8010413c:	83 ec 0c             	sub    $0xc,%esp
8010413f:	50                   	push   %eax
80104140:	e8 3c d4 ff ff       	call   80101581 <ilock>
80104145:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104149:	66 89 43 52          	mov    %ax,0x52(%ebx)
8010414d:	66 89 7b 54          	mov    %di,0x54(%ebx)
80104151:	66 c7 43 56 01 00    	movw   $0x1,0x56(%ebx)
80104157:	89 1c 24             	mov    %ebx,(%esp)
8010415a:	e8 c1 d2 ff ff       	call   80101420 <iupdate>
8010415f:	83 c4 10             	add    $0x10,%esp
80104162:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104167:	74 35                	je     8010419e <create+0x105>
80104169:	83 ec 04             	sub    $0x4,%esp
8010416c:	ff 73 04             	pushl  0x4(%ebx)
8010416f:	8d 45 d6             	lea    -0x2a(%ebp),%eax
80104172:	50                   	push   %eax
80104173:	56                   	push   %esi
80104174:	e8 b7 d9 ff ff       	call   80101b30 <dirlink>
80104179:	83 c4 10             	add    $0x10,%esp
8010417c:	85 c0                	test   %eax,%eax
8010417e:	78 6f                	js     801041ef <create+0x156>
80104180:	83 ec 0c             	sub    $0xc,%esp
80104183:	56                   	push   %esi
80104184:	e8 9f d5 ff ff       	call   80101728 <iunlockput>
80104189:	83 c4 10             	add    $0x10,%esp
8010418c:	e9 76 ff ff ff       	jmp    80104107 <create+0x6e>
80104191:	83 ec 0c             	sub    $0xc,%esp
80104194:	68 d2 6c 10 80       	push   $0x80106cd2
80104199:	e8 aa c1 ff ff       	call   80100348 <panic>
8010419e:	0f b7 46 56          	movzwl 0x56(%esi),%eax
801041a2:	83 c0 01             	add    $0x1,%eax
801041a5:	66 89 46 56          	mov    %ax,0x56(%esi)
801041a9:	83 ec 0c             	sub    $0xc,%esp
801041ac:	56                   	push   %esi
801041ad:	e8 6e d2 ff ff       	call   80101420 <iupdate>
801041b2:	83 c4 0c             	add    $0xc,%esp
801041b5:	ff 73 04             	pushl  0x4(%ebx)
801041b8:	68 e2 6c 10 80       	push   $0x80106ce2
801041bd:	53                   	push   %ebx
801041be:	e8 6d d9 ff ff       	call   80101b30 <dirlink>
801041c3:	83 c4 10             	add    $0x10,%esp
801041c6:	85 c0                	test   %eax,%eax
801041c8:	78 18                	js     801041e2 <create+0x149>
801041ca:	83 ec 04             	sub    $0x4,%esp
801041cd:	ff 76 04             	pushl  0x4(%esi)
801041d0:	68 e1 6c 10 80       	push   $0x80106ce1
801041d5:	53                   	push   %ebx
801041d6:	e8 55 d9 ff ff       	call   80101b30 <dirlink>
801041db:	83 c4 10             	add    $0x10,%esp
801041de:	85 c0                	test   %eax,%eax
801041e0:	79 87                	jns    80104169 <create+0xd0>
801041e2:	83 ec 0c             	sub    $0xc,%esp
801041e5:	68 e4 6c 10 80       	push   $0x80106ce4
801041ea:	e8 59 c1 ff ff       	call   80100348 <panic>
801041ef:	83 ec 0c             	sub    $0xc,%esp
801041f2:	68 f0 6c 10 80       	push   $0x80106cf0
801041f7:	e8 4c c1 ff ff       	call   80100348 <panic>
801041fc:	89 c3                	mov    %eax,%ebx
801041fe:	e9 04 ff ff ff       	jmp    80104107 <create+0x6e>

80104203 <sys_dup>:
80104203:	55                   	push   %ebp
80104204:	89 e5                	mov    %esp,%ebp
80104206:	53                   	push   %ebx
80104207:	83 ec 14             	sub    $0x14,%esp
8010420a:	8d 4d f4             	lea    -0xc(%ebp),%ecx
8010420d:	ba 00 00 00 00       	mov    $0x0,%edx
80104212:	b8 00 00 00 00       	mov    $0x0,%eax
80104217:	e8 88 fd ff ff       	call   80103fa4 <argfd>
8010421c:	85 c0                	test   %eax,%eax
8010421e:	78 23                	js     80104243 <sys_dup+0x40>
80104220:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104223:	e8 e3 fd ff ff       	call   8010400b <fdalloc>
80104228:	89 c3                	mov    %eax,%ebx
8010422a:	85 c0                	test   %eax,%eax
8010422c:	78 1c                	js     8010424a <sys_dup+0x47>
8010422e:	83 ec 0c             	sub    $0xc,%esp
80104231:	ff 75 f4             	pushl  -0xc(%ebp)
80104234:	e8 55 ca ff ff       	call   80100c8e <filedup>
80104239:	83 c4 10             	add    $0x10,%esp
8010423c:	89 d8                	mov    %ebx,%eax
8010423e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104241:	c9                   	leave  
80104242:	c3                   	ret    
80104243:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104248:	eb f2                	jmp    8010423c <sys_dup+0x39>
8010424a:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010424f:	eb eb                	jmp    8010423c <sys_dup+0x39>

80104251 <sys_dup2>:
80104251:	55                   	push   %ebp
80104252:	89 e5                	mov    %esp,%ebp
80104254:	83 ec 18             	sub    $0x18,%esp
80104257:	8d 4d f4             	lea    -0xc(%ebp),%ecx
8010425a:	8d 55 f0             	lea    -0x10(%ebp),%edx
8010425d:	b8 00 00 00 00       	mov    $0x0,%eax
80104262:	e8 3d fd ff ff       	call   80103fa4 <argfd>
80104267:	85 c0                	test   %eax,%eax
80104269:	78 5e                	js     801042c9 <sys_dup2+0x78>
8010426b:	83 ec 08             	sub    $0x8,%esp
8010426e:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104271:	50                   	push   %eax
80104272:	6a 01                	push   $0x1
80104274:	e8 13 fc ff ff       	call   80103e8c <argint>
80104279:	83 c4 10             	add    $0x10,%esp
8010427c:	85 c0                	test   %eax,%eax
8010427e:	78 50                	js     801042d0 <sys_dup2+0x7f>
80104280:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104283:	83 f8 0f             	cmp    $0xf,%eax
80104286:	77 4f                	ja     801042d7 <sys_dup2+0x86>
80104288:	3b 45 f0             	cmp    -0x10(%ebp),%eax
8010428b:	74 3a                	je     801042c7 <sys_dup2+0x76>
8010428d:	e8 64 ef ff ff       	call   801031f6 <myproc>
80104292:	8b 55 ec             	mov    -0x14(%ebp),%edx
80104295:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104299:	85 c0                	test   %eax,%eax
8010429b:	74 0c                	je     801042a9 <sys_dup2+0x58>
8010429d:	83 ec 0c             	sub    $0xc,%esp
801042a0:	50                   	push   %eax
801042a1:	e8 2d ca ff ff       	call   80100cd3 <fileclose>
801042a6:	83 c4 10             	add    $0x10,%esp
801042a9:	e8 48 ef ff ff       	call   801031f6 <myproc>
801042ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
801042b1:	8b 4d ec             	mov    -0x14(%ebp),%ecx
801042b4:	89 54 88 28          	mov    %edx,0x28(%eax,%ecx,4)
801042b8:	83 ec 0c             	sub    $0xc,%esp
801042bb:	52                   	push   %edx
801042bc:	e8 cd c9 ff ff       	call   80100c8e <filedup>
801042c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
801042c4:	83 c4 10             	add    $0x10,%esp
801042c7:	c9                   	leave  
801042c8:	c3                   	ret    
801042c9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801042ce:	eb f7                	jmp    801042c7 <sys_dup2+0x76>
801042d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801042d5:	eb f0                	jmp    801042c7 <sys_dup2+0x76>
801042d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801042dc:	eb e9                	jmp    801042c7 <sys_dup2+0x76>

801042de <sys_read>:
801042de:	55                   	push   %ebp
801042df:	89 e5                	mov    %esp,%ebp
801042e1:	83 ec 18             	sub    $0x18,%esp
801042e4:	8d 4d f4             	lea    -0xc(%ebp),%ecx
801042e7:	ba 00 00 00 00       	mov    $0x0,%edx
801042ec:	b8 00 00 00 00       	mov    $0x0,%eax
801042f1:	e8 ae fc ff ff       	call   80103fa4 <argfd>
801042f6:	85 c0                	test   %eax,%eax
801042f8:	78 43                	js     8010433d <sys_read+0x5f>
801042fa:	83 ec 08             	sub    $0x8,%esp
801042fd:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104300:	50                   	push   %eax
80104301:	6a 02                	push   $0x2
80104303:	e8 84 fb ff ff       	call   80103e8c <argint>
80104308:	83 c4 10             	add    $0x10,%esp
8010430b:	85 c0                	test   %eax,%eax
8010430d:	78 35                	js     80104344 <sys_read+0x66>
8010430f:	83 ec 04             	sub    $0x4,%esp
80104312:	ff 75 f0             	pushl  -0x10(%ebp)
80104315:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104318:	50                   	push   %eax
80104319:	6a 01                	push   $0x1
8010431b:	e8 94 fb ff ff       	call   80103eb4 <argptr>
80104320:	83 c4 10             	add    $0x10,%esp
80104323:	85 c0                	test   %eax,%eax
80104325:	78 24                	js     8010434b <sys_read+0x6d>
80104327:	83 ec 04             	sub    $0x4,%esp
8010432a:	ff 75 f0             	pushl  -0x10(%ebp)
8010432d:	ff 75 ec             	pushl  -0x14(%ebp)
80104330:	ff 75 f4             	pushl  -0xc(%ebp)
80104333:	e8 9f ca ff ff       	call   80100dd7 <fileread>
80104338:	83 c4 10             	add    $0x10,%esp
8010433b:	c9                   	leave  
8010433c:	c3                   	ret    
8010433d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104342:	eb f7                	jmp    8010433b <sys_read+0x5d>
80104344:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104349:	eb f0                	jmp    8010433b <sys_read+0x5d>
8010434b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104350:	eb e9                	jmp    8010433b <sys_read+0x5d>

80104352 <sys_write>:
80104352:	55                   	push   %ebp
80104353:	89 e5                	mov    %esp,%ebp
80104355:	83 ec 18             	sub    $0x18,%esp
80104358:	8d 4d f4             	lea    -0xc(%ebp),%ecx
8010435b:	ba 00 00 00 00       	mov    $0x0,%edx
80104360:	b8 00 00 00 00       	mov    $0x0,%eax
80104365:	e8 3a fc ff ff       	call   80103fa4 <argfd>
8010436a:	85 c0                	test   %eax,%eax
8010436c:	78 43                	js     801043b1 <sys_write+0x5f>
8010436e:	83 ec 08             	sub    $0x8,%esp
80104371:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104374:	50                   	push   %eax
80104375:	6a 02                	push   $0x2
80104377:	e8 10 fb ff ff       	call   80103e8c <argint>
8010437c:	83 c4 10             	add    $0x10,%esp
8010437f:	85 c0                	test   %eax,%eax
80104381:	78 35                	js     801043b8 <sys_write+0x66>
80104383:	83 ec 04             	sub    $0x4,%esp
80104386:	ff 75 f0             	pushl  -0x10(%ebp)
80104389:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010438c:	50                   	push   %eax
8010438d:	6a 01                	push   $0x1
8010438f:	e8 20 fb ff ff       	call   80103eb4 <argptr>
80104394:	83 c4 10             	add    $0x10,%esp
80104397:	85 c0                	test   %eax,%eax
80104399:	78 24                	js     801043bf <sys_write+0x6d>
8010439b:	83 ec 04             	sub    $0x4,%esp
8010439e:	ff 75 f0             	pushl  -0x10(%ebp)
801043a1:	ff 75 ec             	pushl  -0x14(%ebp)
801043a4:	ff 75 f4             	pushl  -0xc(%ebp)
801043a7:	e8 b0 ca ff ff       	call   80100e5c <filewrite>
801043ac:	83 c4 10             	add    $0x10,%esp
801043af:	c9                   	leave  
801043b0:	c3                   	ret    
801043b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801043b6:	eb f7                	jmp    801043af <sys_write+0x5d>
801043b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801043bd:	eb f0                	jmp    801043af <sys_write+0x5d>
801043bf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801043c4:	eb e9                	jmp    801043af <sys_write+0x5d>

801043c6 <sys_close>:
801043c6:	55                   	push   %ebp
801043c7:	89 e5                	mov    %esp,%ebp
801043c9:	83 ec 18             	sub    $0x18,%esp
801043cc:	8d 4d f0             	lea    -0x10(%ebp),%ecx
801043cf:	8d 55 f4             	lea    -0xc(%ebp),%edx
801043d2:	b8 00 00 00 00       	mov    $0x0,%eax
801043d7:	e8 c8 fb ff ff       	call   80103fa4 <argfd>
801043dc:	85 c0                	test   %eax,%eax
801043de:	78 25                	js     80104405 <sys_close+0x3f>
801043e0:	e8 11 ee ff ff       	call   801031f6 <myproc>
801043e5:	8b 55 f4             	mov    -0xc(%ebp),%edx
801043e8:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
801043ef:	00 
801043f0:	83 ec 0c             	sub    $0xc,%esp
801043f3:	ff 75 f0             	pushl  -0x10(%ebp)
801043f6:	e8 d8 c8 ff ff       	call   80100cd3 <fileclose>
801043fb:	83 c4 10             	add    $0x10,%esp
801043fe:	b8 00 00 00 00       	mov    $0x0,%eax
80104403:	c9                   	leave  
80104404:	c3                   	ret    
80104405:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010440a:	eb f7                	jmp    80104403 <sys_close+0x3d>

8010440c <sys_fstat>:
8010440c:	55                   	push   %ebp
8010440d:	89 e5                	mov    %esp,%ebp
8010440f:	83 ec 18             	sub    $0x18,%esp
80104412:	8d 4d f4             	lea    -0xc(%ebp),%ecx
80104415:	ba 00 00 00 00       	mov    $0x0,%edx
8010441a:	b8 00 00 00 00       	mov    $0x0,%eax
8010441f:	e8 80 fb ff ff       	call   80103fa4 <argfd>
80104424:	85 c0                	test   %eax,%eax
80104426:	78 2a                	js     80104452 <sys_fstat+0x46>
80104428:	83 ec 04             	sub    $0x4,%esp
8010442b:	6a 14                	push   $0x14
8010442d:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104430:	50                   	push   %eax
80104431:	6a 01                	push   $0x1
80104433:	e8 7c fa ff ff       	call   80103eb4 <argptr>
80104438:	83 c4 10             	add    $0x10,%esp
8010443b:	85 c0                	test   %eax,%eax
8010443d:	78 1a                	js     80104459 <sys_fstat+0x4d>
8010443f:	83 ec 08             	sub    $0x8,%esp
80104442:	ff 75 f0             	pushl  -0x10(%ebp)
80104445:	ff 75 f4             	pushl  -0xc(%ebp)
80104448:	e8 43 c9 ff ff       	call   80100d90 <filestat>
8010444d:	83 c4 10             	add    $0x10,%esp
80104450:	c9                   	leave  
80104451:	c3                   	ret    
80104452:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104457:	eb f7                	jmp    80104450 <sys_fstat+0x44>
80104459:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010445e:	eb f0                	jmp    80104450 <sys_fstat+0x44>

80104460 <sys_link>:
80104460:	55                   	push   %ebp
80104461:	89 e5                	mov    %esp,%ebp
80104463:	56                   	push   %esi
80104464:	53                   	push   %ebx
80104465:	83 ec 28             	sub    $0x28,%esp
80104468:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010446b:	50                   	push   %eax
8010446c:	6a 00                	push   $0x0
8010446e:	e8 a9 fa ff ff       	call   80103f1c <argstr>
80104473:	83 c4 10             	add    $0x10,%esp
80104476:	85 c0                	test   %eax,%eax
80104478:	0f 88 32 01 00 00    	js     801045b0 <sys_link+0x150>
8010447e:	83 ec 08             	sub    $0x8,%esp
80104481:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104484:	50                   	push   %eax
80104485:	6a 01                	push   $0x1
80104487:	e8 90 fa ff ff       	call   80103f1c <argstr>
8010448c:	83 c4 10             	add    $0x10,%esp
8010448f:	85 c0                	test   %eax,%eax
80104491:	0f 88 20 01 00 00    	js     801045b7 <sys_link+0x157>
80104497:	e8 12 e3 ff ff       	call   801027ae <begin_op>
8010449c:	83 ec 0c             	sub    $0xc,%esp
8010449f:	ff 75 e0             	pushl  -0x20(%ebp)
801044a2:	e8 3a d7 ff ff       	call   80101be1 <namei>
801044a7:	89 c3                	mov    %eax,%ebx
801044a9:	83 c4 10             	add    $0x10,%esp
801044ac:	85 c0                	test   %eax,%eax
801044ae:	0f 84 99 00 00 00    	je     8010454d <sys_link+0xed>
801044b4:	83 ec 0c             	sub    $0xc,%esp
801044b7:	50                   	push   %eax
801044b8:	e8 c4 d0 ff ff       	call   80101581 <ilock>
801044bd:	83 c4 10             	add    $0x10,%esp
801044c0:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801044c5:	0f 84 8e 00 00 00    	je     80104559 <sys_link+0xf9>
801044cb:	0f b7 43 56          	movzwl 0x56(%ebx),%eax
801044cf:	83 c0 01             	add    $0x1,%eax
801044d2:	66 89 43 56          	mov    %ax,0x56(%ebx)
801044d6:	83 ec 0c             	sub    $0xc,%esp
801044d9:	53                   	push   %ebx
801044da:	e8 41 cf ff ff       	call   80101420 <iupdate>
801044df:	89 1c 24             	mov    %ebx,(%esp)
801044e2:	e8 5c d1 ff ff       	call   80101643 <iunlock>
801044e7:	83 c4 08             	add    $0x8,%esp
801044ea:	8d 45 ea             	lea    -0x16(%ebp),%eax
801044ed:	50                   	push   %eax
801044ee:	ff 75 e4             	pushl  -0x1c(%ebp)
801044f1:	e8 03 d7 ff ff       	call   80101bf9 <nameiparent>
801044f6:	89 c6                	mov    %eax,%esi
801044f8:	83 c4 10             	add    $0x10,%esp
801044fb:	85 c0                	test   %eax,%eax
801044fd:	74 7e                	je     8010457d <sys_link+0x11d>
801044ff:	83 ec 0c             	sub    $0xc,%esp
80104502:	50                   	push   %eax
80104503:	e8 79 d0 ff ff       	call   80101581 <ilock>
80104508:	83 c4 10             	add    $0x10,%esp
8010450b:	8b 03                	mov    (%ebx),%eax
8010450d:	39 06                	cmp    %eax,(%esi)
8010450f:	75 60                	jne    80104571 <sys_link+0x111>
80104511:	83 ec 04             	sub    $0x4,%esp
80104514:	ff 73 04             	pushl  0x4(%ebx)
80104517:	8d 45 ea             	lea    -0x16(%ebp),%eax
8010451a:	50                   	push   %eax
8010451b:	56                   	push   %esi
8010451c:	e8 0f d6 ff ff       	call   80101b30 <dirlink>
80104521:	83 c4 10             	add    $0x10,%esp
80104524:	85 c0                	test   %eax,%eax
80104526:	78 49                	js     80104571 <sys_link+0x111>
80104528:	83 ec 0c             	sub    $0xc,%esp
8010452b:	56                   	push   %esi
8010452c:	e8 f7 d1 ff ff       	call   80101728 <iunlockput>
80104531:	89 1c 24             	mov    %ebx,(%esp)
80104534:	e8 4f d1 ff ff       	call   80101688 <iput>
80104539:	e8 ea e2 ff ff       	call   80102828 <end_op>
8010453e:	83 c4 10             	add    $0x10,%esp
80104541:	b8 00 00 00 00       	mov    $0x0,%eax
80104546:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104549:	5b                   	pop    %ebx
8010454a:	5e                   	pop    %esi
8010454b:	5d                   	pop    %ebp
8010454c:	c3                   	ret    
8010454d:	e8 d6 e2 ff ff       	call   80102828 <end_op>
80104552:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104557:	eb ed                	jmp    80104546 <sys_link+0xe6>
80104559:	83 ec 0c             	sub    $0xc,%esp
8010455c:	53                   	push   %ebx
8010455d:	e8 c6 d1 ff ff       	call   80101728 <iunlockput>
80104562:	e8 c1 e2 ff ff       	call   80102828 <end_op>
80104567:	83 c4 10             	add    $0x10,%esp
8010456a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010456f:	eb d5                	jmp    80104546 <sys_link+0xe6>
80104571:	83 ec 0c             	sub    $0xc,%esp
80104574:	56                   	push   %esi
80104575:	e8 ae d1 ff ff       	call   80101728 <iunlockput>
8010457a:	83 c4 10             	add    $0x10,%esp
8010457d:	83 ec 0c             	sub    $0xc,%esp
80104580:	53                   	push   %ebx
80104581:	e8 fb cf ff ff       	call   80101581 <ilock>
80104586:	0f b7 43 56          	movzwl 0x56(%ebx),%eax
8010458a:	83 e8 01             	sub    $0x1,%eax
8010458d:	66 89 43 56          	mov    %ax,0x56(%ebx)
80104591:	89 1c 24             	mov    %ebx,(%esp)
80104594:	e8 87 ce ff ff       	call   80101420 <iupdate>
80104599:	89 1c 24             	mov    %ebx,(%esp)
8010459c:	e8 87 d1 ff ff       	call   80101728 <iunlockput>
801045a1:	e8 82 e2 ff ff       	call   80102828 <end_op>
801045a6:	83 c4 10             	add    $0x10,%esp
801045a9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801045ae:	eb 96                	jmp    80104546 <sys_link+0xe6>
801045b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801045b5:	eb 8f                	jmp    80104546 <sys_link+0xe6>
801045b7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801045bc:	eb 88                	jmp    80104546 <sys_link+0xe6>

801045be <sys_unlink>:
801045be:	55                   	push   %ebp
801045bf:	89 e5                	mov    %esp,%ebp
801045c1:	57                   	push   %edi
801045c2:	56                   	push   %esi
801045c3:	53                   	push   %ebx
801045c4:	83 ec 44             	sub    $0x44,%esp
801045c7:	8d 45 c4             	lea    -0x3c(%ebp),%eax
801045ca:	50                   	push   %eax
801045cb:	6a 00                	push   $0x0
801045cd:	e8 4a f9 ff ff       	call   80103f1c <argstr>
801045d2:	83 c4 10             	add    $0x10,%esp
801045d5:	85 c0                	test   %eax,%eax
801045d7:	0f 88 83 01 00 00    	js     80104760 <sys_unlink+0x1a2>
801045dd:	e8 cc e1 ff ff       	call   801027ae <begin_op>
801045e2:	83 ec 08             	sub    $0x8,%esp
801045e5:	8d 45 ca             	lea    -0x36(%ebp),%eax
801045e8:	50                   	push   %eax
801045e9:	ff 75 c4             	pushl  -0x3c(%ebp)
801045ec:	e8 08 d6 ff ff       	call   80101bf9 <nameiparent>
801045f1:	89 c6                	mov    %eax,%esi
801045f3:	83 c4 10             	add    $0x10,%esp
801045f6:	85 c0                	test   %eax,%eax
801045f8:	0f 84 ed 00 00 00    	je     801046eb <sys_unlink+0x12d>
801045fe:	83 ec 0c             	sub    $0xc,%esp
80104601:	50                   	push   %eax
80104602:	e8 7a cf ff ff       	call   80101581 <ilock>
80104607:	83 c4 08             	add    $0x8,%esp
8010460a:	68 e2 6c 10 80       	push   $0x80106ce2
8010460f:	8d 45 ca             	lea    -0x36(%ebp),%eax
80104612:	50                   	push   %eax
80104613:	e8 83 d3 ff ff       	call   8010199b <namecmp>
80104618:	83 c4 10             	add    $0x10,%esp
8010461b:	85 c0                	test   %eax,%eax
8010461d:	0f 84 fc 00 00 00    	je     8010471f <sys_unlink+0x161>
80104623:	83 ec 08             	sub    $0x8,%esp
80104626:	68 e1 6c 10 80       	push   $0x80106ce1
8010462b:	8d 45 ca             	lea    -0x36(%ebp),%eax
8010462e:	50                   	push   %eax
8010462f:	e8 67 d3 ff ff       	call   8010199b <namecmp>
80104634:	83 c4 10             	add    $0x10,%esp
80104637:	85 c0                	test   %eax,%eax
80104639:	0f 84 e0 00 00 00    	je     8010471f <sys_unlink+0x161>
8010463f:	83 ec 04             	sub    $0x4,%esp
80104642:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104645:	50                   	push   %eax
80104646:	8d 45 ca             	lea    -0x36(%ebp),%eax
80104649:	50                   	push   %eax
8010464a:	56                   	push   %esi
8010464b:	e8 60 d3 ff ff       	call   801019b0 <dirlookup>
80104650:	89 c3                	mov    %eax,%ebx
80104652:	83 c4 10             	add    $0x10,%esp
80104655:	85 c0                	test   %eax,%eax
80104657:	0f 84 c2 00 00 00    	je     8010471f <sys_unlink+0x161>
8010465d:	83 ec 0c             	sub    $0xc,%esp
80104660:	50                   	push   %eax
80104661:	e8 1b cf ff ff       	call   80101581 <ilock>
80104666:	83 c4 10             	add    $0x10,%esp
80104669:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
8010466e:	0f 8e 83 00 00 00    	jle    801046f7 <sys_unlink+0x139>
80104674:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104679:	0f 84 85 00 00 00    	je     80104704 <sys_unlink+0x146>
8010467f:	83 ec 04             	sub    $0x4,%esp
80104682:	6a 10                	push   $0x10
80104684:	6a 00                	push   $0x0
80104686:	8d 7d d8             	lea    -0x28(%ebp),%edi
80104689:	57                   	push   %edi
8010468a:	e8 b2 f5 ff ff       	call   80103c41 <memset>
8010468f:	6a 10                	push   $0x10
80104691:	ff 75 c0             	pushl  -0x40(%ebp)
80104694:	57                   	push   %edi
80104695:	56                   	push   %esi
80104696:	e8 d5 d1 ff ff       	call   80101870 <writei>
8010469b:	83 c4 20             	add    $0x20,%esp
8010469e:	83 f8 10             	cmp    $0x10,%eax
801046a1:	0f 85 90 00 00 00    	jne    80104737 <sys_unlink+0x179>
801046a7:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801046ac:	0f 84 92 00 00 00    	je     80104744 <sys_unlink+0x186>
801046b2:	83 ec 0c             	sub    $0xc,%esp
801046b5:	56                   	push   %esi
801046b6:	e8 6d d0 ff ff       	call   80101728 <iunlockput>
801046bb:	0f b7 43 56          	movzwl 0x56(%ebx),%eax
801046bf:	83 e8 01             	sub    $0x1,%eax
801046c2:	66 89 43 56          	mov    %ax,0x56(%ebx)
801046c6:	89 1c 24             	mov    %ebx,(%esp)
801046c9:	e8 52 cd ff ff       	call   80101420 <iupdate>
801046ce:	89 1c 24             	mov    %ebx,(%esp)
801046d1:	e8 52 d0 ff ff       	call   80101728 <iunlockput>
801046d6:	e8 4d e1 ff ff       	call   80102828 <end_op>
801046db:	83 c4 10             	add    $0x10,%esp
801046de:	b8 00 00 00 00       	mov    $0x0,%eax
801046e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801046e6:	5b                   	pop    %ebx
801046e7:	5e                   	pop    %esi
801046e8:	5f                   	pop    %edi
801046e9:	5d                   	pop    %ebp
801046ea:	c3                   	ret    
801046eb:	e8 38 e1 ff ff       	call   80102828 <end_op>
801046f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801046f5:	eb ec                	jmp    801046e3 <sys_unlink+0x125>
801046f7:	83 ec 0c             	sub    $0xc,%esp
801046fa:	68 00 6d 10 80       	push   $0x80106d00
801046ff:	e8 44 bc ff ff       	call   80100348 <panic>
80104704:	89 d8                	mov    %ebx,%eax
80104706:	e8 37 f9 ff ff       	call   80104042 <isdirempty>
8010470b:	85 c0                	test   %eax,%eax
8010470d:	0f 85 6c ff ff ff    	jne    8010467f <sys_unlink+0xc1>
80104713:	83 ec 0c             	sub    $0xc,%esp
80104716:	53                   	push   %ebx
80104717:	e8 0c d0 ff ff       	call   80101728 <iunlockput>
8010471c:	83 c4 10             	add    $0x10,%esp
8010471f:	83 ec 0c             	sub    $0xc,%esp
80104722:	56                   	push   %esi
80104723:	e8 00 d0 ff ff       	call   80101728 <iunlockput>
80104728:	e8 fb e0 ff ff       	call   80102828 <end_op>
8010472d:	83 c4 10             	add    $0x10,%esp
80104730:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104735:	eb ac                	jmp    801046e3 <sys_unlink+0x125>
80104737:	83 ec 0c             	sub    $0xc,%esp
8010473a:	68 12 6d 10 80       	push   $0x80106d12
8010473f:	e8 04 bc ff ff       	call   80100348 <panic>
80104744:	0f b7 46 56          	movzwl 0x56(%esi),%eax
80104748:	83 e8 01             	sub    $0x1,%eax
8010474b:	66 89 46 56          	mov    %ax,0x56(%esi)
8010474f:	83 ec 0c             	sub    $0xc,%esp
80104752:	56                   	push   %esi
80104753:	e8 c8 cc ff ff       	call   80101420 <iupdate>
80104758:	83 c4 10             	add    $0x10,%esp
8010475b:	e9 52 ff ff ff       	jmp    801046b2 <sys_unlink+0xf4>
80104760:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104765:	e9 79 ff ff ff       	jmp    801046e3 <sys_unlink+0x125>

8010476a <sys_open>:
8010476a:	55                   	push   %ebp
8010476b:	89 e5                	mov    %esp,%ebp
8010476d:	57                   	push   %edi
8010476e:	56                   	push   %esi
8010476f:	53                   	push   %ebx
80104770:	83 ec 24             	sub    $0x24,%esp
80104773:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104776:	50                   	push   %eax
80104777:	6a 00                	push   $0x0
80104779:	e8 9e f7 ff ff       	call   80103f1c <argstr>
8010477e:	83 c4 10             	add    $0x10,%esp
80104781:	85 c0                	test   %eax,%eax
80104783:	0f 88 30 01 00 00    	js     801048b9 <sys_open+0x14f>
80104789:	83 ec 08             	sub    $0x8,%esp
8010478c:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010478f:	50                   	push   %eax
80104790:	6a 01                	push   $0x1
80104792:	e8 f5 f6 ff ff       	call   80103e8c <argint>
80104797:	83 c4 10             	add    $0x10,%esp
8010479a:	85 c0                	test   %eax,%eax
8010479c:	0f 88 21 01 00 00    	js     801048c3 <sys_open+0x159>
801047a2:	e8 07 e0 ff ff       	call   801027ae <begin_op>
801047a7:	f6 45 e1 02          	testb  $0x2,-0x1f(%ebp)
801047ab:	0f 84 84 00 00 00    	je     80104835 <sys_open+0xcb>
801047b1:	83 ec 0c             	sub    $0xc,%esp
801047b4:	6a 00                	push   $0x0
801047b6:	b9 00 00 00 00       	mov    $0x0,%ecx
801047bb:	ba 02 00 00 00       	mov    $0x2,%edx
801047c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801047c3:	e8 d1 f8 ff ff       	call   80104099 <create>
801047c8:	89 c6                	mov    %eax,%esi
801047ca:	83 c4 10             	add    $0x10,%esp
801047cd:	85 c0                	test   %eax,%eax
801047cf:	74 58                	je     80104829 <sys_open+0xbf>
801047d1:	e8 57 c4 ff ff       	call   80100c2d <filealloc>
801047d6:	89 c3                	mov    %eax,%ebx
801047d8:	85 c0                	test   %eax,%eax
801047da:	0f 84 ae 00 00 00    	je     8010488e <sys_open+0x124>
801047e0:	e8 26 f8 ff ff       	call   8010400b <fdalloc>
801047e5:	89 c7                	mov    %eax,%edi
801047e7:	85 c0                	test   %eax,%eax
801047e9:	0f 88 9f 00 00 00    	js     8010488e <sys_open+0x124>
801047ef:	83 ec 0c             	sub    $0xc,%esp
801047f2:	56                   	push   %esi
801047f3:	e8 4b ce ff ff       	call   80101643 <iunlock>
801047f8:	e8 2b e0 ff ff       	call   80102828 <end_op>
801047fd:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
80104803:	89 73 10             	mov    %esi,0x10(%ebx)
80104806:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
8010480d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104810:	83 c4 10             	add    $0x10,%esp
80104813:	a8 01                	test   $0x1,%al
80104815:	0f 94 43 08          	sete   0x8(%ebx)
80104819:	a8 03                	test   $0x3,%al
8010481b:	0f 95 43 09          	setne  0x9(%ebx)
8010481f:	89 f8                	mov    %edi,%eax
80104821:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104824:	5b                   	pop    %ebx
80104825:	5e                   	pop    %esi
80104826:	5f                   	pop    %edi
80104827:	5d                   	pop    %ebp
80104828:	c3                   	ret    
80104829:	e8 fa df ff ff       	call   80102828 <end_op>
8010482e:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80104833:	eb ea                	jmp    8010481f <sys_open+0xb5>
80104835:	83 ec 0c             	sub    $0xc,%esp
80104838:	ff 75 e4             	pushl  -0x1c(%ebp)
8010483b:	e8 a1 d3 ff ff       	call   80101be1 <namei>
80104840:	89 c6                	mov    %eax,%esi
80104842:	83 c4 10             	add    $0x10,%esp
80104845:	85 c0                	test   %eax,%eax
80104847:	74 39                	je     80104882 <sys_open+0x118>
80104849:	83 ec 0c             	sub    $0xc,%esp
8010484c:	50                   	push   %eax
8010484d:	e8 2f cd ff ff       	call   80101581 <ilock>
80104852:	83 c4 10             	add    $0x10,%esp
80104855:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
8010485a:	0f 85 71 ff ff ff    	jne    801047d1 <sys_open+0x67>
80104860:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
80104864:	0f 84 67 ff ff ff    	je     801047d1 <sys_open+0x67>
8010486a:	83 ec 0c             	sub    $0xc,%esp
8010486d:	56                   	push   %esi
8010486e:	e8 b5 ce ff ff       	call   80101728 <iunlockput>
80104873:	e8 b0 df ff ff       	call   80102828 <end_op>
80104878:	83 c4 10             	add    $0x10,%esp
8010487b:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80104880:	eb 9d                	jmp    8010481f <sys_open+0xb5>
80104882:	e8 a1 df ff ff       	call   80102828 <end_op>
80104887:	bf ff ff ff ff       	mov    $0xffffffff,%edi
8010488c:	eb 91                	jmp    8010481f <sys_open+0xb5>
8010488e:	85 db                	test   %ebx,%ebx
80104890:	74 0c                	je     8010489e <sys_open+0x134>
80104892:	83 ec 0c             	sub    $0xc,%esp
80104895:	53                   	push   %ebx
80104896:	e8 38 c4 ff ff       	call   80100cd3 <fileclose>
8010489b:	83 c4 10             	add    $0x10,%esp
8010489e:	83 ec 0c             	sub    $0xc,%esp
801048a1:	56                   	push   %esi
801048a2:	e8 81 ce ff ff       	call   80101728 <iunlockput>
801048a7:	e8 7c df ff ff       	call   80102828 <end_op>
801048ac:	83 c4 10             	add    $0x10,%esp
801048af:	bf ff ff ff ff       	mov    $0xffffffff,%edi
801048b4:	e9 66 ff ff ff       	jmp    8010481f <sys_open+0xb5>
801048b9:	bf ff ff ff ff       	mov    $0xffffffff,%edi
801048be:	e9 5c ff ff ff       	jmp    8010481f <sys_open+0xb5>
801048c3:	bf ff ff ff ff       	mov    $0xffffffff,%edi
801048c8:	e9 52 ff ff ff       	jmp    8010481f <sys_open+0xb5>

801048cd <sys_mkdir>:
801048cd:	55                   	push   %ebp
801048ce:	89 e5                	mov    %esp,%ebp
801048d0:	83 ec 18             	sub    $0x18,%esp
801048d3:	e8 d6 de ff ff       	call   801027ae <begin_op>
801048d8:	83 ec 08             	sub    $0x8,%esp
801048db:	8d 45 f4             	lea    -0xc(%ebp),%eax
801048de:	50                   	push   %eax
801048df:	6a 00                	push   $0x0
801048e1:	e8 36 f6 ff ff       	call   80103f1c <argstr>
801048e6:	83 c4 10             	add    $0x10,%esp
801048e9:	85 c0                	test   %eax,%eax
801048eb:	78 36                	js     80104923 <sys_mkdir+0x56>
801048ed:	83 ec 0c             	sub    $0xc,%esp
801048f0:	6a 00                	push   $0x0
801048f2:	b9 00 00 00 00       	mov    $0x0,%ecx
801048f7:	ba 01 00 00 00       	mov    $0x1,%edx
801048fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801048ff:	e8 95 f7 ff ff       	call   80104099 <create>
80104904:	83 c4 10             	add    $0x10,%esp
80104907:	85 c0                	test   %eax,%eax
80104909:	74 18                	je     80104923 <sys_mkdir+0x56>
8010490b:	83 ec 0c             	sub    $0xc,%esp
8010490e:	50                   	push   %eax
8010490f:	e8 14 ce ff ff       	call   80101728 <iunlockput>
80104914:	e8 0f df ff ff       	call   80102828 <end_op>
80104919:	83 c4 10             	add    $0x10,%esp
8010491c:	b8 00 00 00 00       	mov    $0x0,%eax
80104921:	c9                   	leave  
80104922:	c3                   	ret    
80104923:	e8 00 df ff ff       	call   80102828 <end_op>
80104928:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010492d:	eb f2                	jmp    80104921 <sys_mkdir+0x54>

8010492f <sys_mknod>:
8010492f:	55                   	push   %ebp
80104930:	89 e5                	mov    %esp,%ebp
80104932:	83 ec 18             	sub    $0x18,%esp
80104935:	e8 74 de ff ff       	call   801027ae <begin_op>
8010493a:	83 ec 08             	sub    $0x8,%esp
8010493d:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104940:	50                   	push   %eax
80104941:	6a 00                	push   $0x0
80104943:	e8 d4 f5 ff ff       	call   80103f1c <argstr>
80104948:	83 c4 10             	add    $0x10,%esp
8010494b:	85 c0                	test   %eax,%eax
8010494d:	78 62                	js     801049b1 <sys_mknod+0x82>
8010494f:	83 ec 08             	sub    $0x8,%esp
80104952:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104955:	50                   	push   %eax
80104956:	6a 01                	push   $0x1
80104958:	e8 2f f5 ff ff       	call   80103e8c <argint>
8010495d:	83 c4 10             	add    $0x10,%esp
80104960:	85 c0                	test   %eax,%eax
80104962:	78 4d                	js     801049b1 <sys_mknod+0x82>
80104964:	83 ec 08             	sub    $0x8,%esp
80104967:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010496a:	50                   	push   %eax
8010496b:	6a 02                	push   $0x2
8010496d:	e8 1a f5 ff ff       	call   80103e8c <argint>
80104972:	83 c4 10             	add    $0x10,%esp
80104975:	85 c0                	test   %eax,%eax
80104977:	78 38                	js     801049b1 <sys_mknod+0x82>
80104979:	0f bf 45 ec          	movswl -0x14(%ebp),%eax
8010497d:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80104981:	83 ec 0c             	sub    $0xc,%esp
80104984:	50                   	push   %eax
80104985:	ba 03 00 00 00       	mov    $0x3,%edx
8010498a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010498d:	e8 07 f7 ff ff       	call   80104099 <create>
80104992:	83 c4 10             	add    $0x10,%esp
80104995:	85 c0                	test   %eax,%eax
80104997:	74 18                	je     801049b1 <sys_mknod+0x82>
80104999:	83 ec 0c             	sub    $0xc,%esp
8010499c:	50                   	push   %eax
8010499d:	e8 86 cd ff ff       	call   80101728 <iunlockput>
801049a2:	e8 81 de ff ff       	call   80102828 <end_op>
801049a7:	83 c4 10             	add    $0x10,%esp
801049aa:	b8 00 00 00 00       	mov    $0x0,%eax
801049af:	c9                   	leave  
801049b0:	c3                   	ret    
801049b1:	e8 72 de ff ff       	call   80102828 <end_op>
801049b6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801049bb:	eb f2                	jmp    801049af <sys_mknod+0x80>

801049bd <sys_chdir>:
801049bd:	55                   	push   %ebp
801049be:	89 e5                	mov    %esp,%ebp
801049c0:	56                   	push   %esi
801049c1:	53                   	push   %ebx
801049c2:	83 ec 10             	sub    $0x10,%esp
801049c5:	e8 2c e8 ff ff       	call   801031f6 <myproc>
801049ca:	89 c6                	mov    %eax,%esi
801049cc:	e8 dd dd ff ff       	call   801027ae <begin_op>
801049d1:	83 ec 08             	sub    $0x8,%esp
801049d4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801049d7:	50                   	push   %eax
801049d8:	6a 00                	push   $0x0
801049da:	e8 3d f5 ff ff       	call   80103f1c <argstr>
801049df:	83 c4 10             	add    $0x10,%esp
801049e2:	85 c0                	test   %eax,%eax
801049e4:	78 52                	js     80104a38 <sys_chdir+0x7b>
801049e6:	83 ec 0c             	sub    $0xc,%esp
801049e9:	ff 75 f4             	pushl  -0xc(%ebp)
801049ec:	e8 f0 d1 ff ff       	call   80101be1 <namei>
801049f1:	89 c3                	mov    %eax,%ebx
801049f3:	83 c4 10             	add    $0x10,%esp
801049f6:	85 c0                	test   %eax,%eax
801049f8:	74 3e                	je     80104a38 <sys_chdir+0x7b>
801049fa:	83 ec 0c             	sub    $0xc,%esp
801049fd:	50                   	push   %eax
801049fe:	e8 7e cb ff ff       	call   80101581 <ilock>
80104a03:	83 c4 10             	add    $0x10,%esp
80104a06:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104a0b:	75 37                	jne    80104a44 <sys_chdir+0x87>
80104a0d:	83 ec 0c             	sub    $0xc,%esp
80104a10:	53                   	push   %ebx
80104a11:	e8 2d cc ff ff       	call   80101643 <iunlock>
80104a16:	83 c4 04             	add    $0x4,%esp
80104a19:	ff 76 68             	pushl  0x68(%esi)
80104a1c:	e8 67 cc ff ff       	call   80101688 <iput>
80104a21:	e8 02 de ff ff       	call   80102828 <end_op>
80104a26:	89 5e 68             	mov    %ebx,0x68(%esi)
80104a29:	83 c4 10             	add    $0x10,%esp
80104a2c:	b8 00 00 00 00       	mov    $0x0,%eax
80104a31:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104a34:	5b                   	pop    %ebx
80104a35:	5e                   	pop    %esi
80104a36:	5d                   	pop    %ebp
80104a37:	c3                   	ret    
80104a38:	e8 eb dd ff ff       	call   80102828 <end_op>
80104a3d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a42:	eb ed                	jmp    80104a31 <sys_chdir+0x74>
80104a44:	83 ec 0c             	sub    $0xc,%esp
80104a47:	53                   	push   %ebx
80104a48:	e8 db cc ff ff       	call   80101728 <iunlockput>
80104a4d:	e8 d6 dd ff ff       	call   80102828 <end_op>
80104a52:	83 c4 10             	add    $0x10,%esp
80104a55:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a5a:	eb d5                	jmp    80104a31 <sys_chdir+0x74>

80104a5c <sys_exec>:
80104a5c:	55                   	push   %ebp
80104a5d:	89 e5                	mov    %esp,%ebp
80104a5f:	53                   	push   %ebx
80104a60:	81 ec 9c 00 00 00    	sub    $0x9c,%esp
80104a66:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a69:	50                   	push   %eax
80104a6a:	6a 00                	push   $0x0
80104a6c:	e8 ab f4 ff ff       	call   80103f1c <argstr>
80104a71:	83 c4 10             	add    $0x10,%esp
80104a74:	85 c0                	test   %eax,%eax
80104a76:	0f 88 a8 00 00 00    	js     80104b24 <sys_exec+0xc8>
80104a7c:	83 ec 08             	sub    $0x8,%esp
80104a7f:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
80104a85:	50                   	push   %eax
80104a86:	6a 01                	push   $0x1
80104a88:	e8 ff f3 ff ff       	call   80103e8c <argint>
80104a8d:	83 c4 10             	add    $0x10,%esp
80104a90:	85 c0                	test   %eax,%eax
80104a92:	0f 88 93 00 00 00    	js     80104b2b <sys_exec+0xcf>
80104a98:	83 ec 04             	sub    $0x4,%esp
80104a9b:	68 80 00 00 00       	push   $0x80
80104aa0:	6a 00                	push   $0x0
80104aa2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
80104aa8:	50                   	push   %eax
80104aa9:	e8 93 f1 ff ff       	call   80103c41 <memset>
80104aae:	83 c4 10             	add    $0x10,%esp
80104ab1:	bb 00 00 00 00       	mov    $0x0,%ebx
80104ab6:	83 fb 1f             	cmp    $0x1f,%ebx
80104ab9:	77 77                	ja     80104b32 <sys_exec+0xd6>
80104abb:	83 ec 08             	sub    $0x8,%esp
80104abe:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
80104ac4:	50                   	push   %eax
80104ac5:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
80104acb:	8d 04 98             	lea    (%eax,%ebx,4),%eax
80104ace:	50                   	push   %eax
80104acf:	e8 3c f3 ff ff       	call   80103e10 <fetchint>
80104ad4:	83 c4 10             	add    $0x10,%esp
80104ad7:	85 c0                	test   %eax,%eax
80104ad9:	78 5e                	js     80104b39 <sys_exec+0xdd>
80104adb:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
80104ae1:	85 c0                	test   %eax,%eax
80104ae3:	74 1d                	je     80104b02 <sys_exec+0xa6>
80104ae5:	83 ec 08             	sub    $0x8,%esp
80104ae8:	8d 94 9d 74 ff ff ff 	lea    -0x8c(%ebp,%ebx,4),%edx
80104aef:	52                   	push   %edx
80104af0:	50                   	push   %eax
80104af1:	e8 56 f3 ff ff       	call   80103e4c <fetchstr>
80104af6:	83 c4 10             	add    $0x10,%esp
80104af9:	85 c0                	test   %eax,%eax
80104afb:	78 46                	js     80104b43 <sys_exec+0xe7>
80104afd:	83 c3 01             	add    $0x1,%ebx
80104b00:	eb b4                	jmp    80104ab6 <sys_exec+0x5a>
80104b02:	c7 84 9d 74 ff ff ff 	movl   $0x0,-0x8c(%ebp,%ebx,4)
80104b09:	00 00 00 00 
80104b0d:	83 ec 08             	sub    $0x8,%esp
80104b10:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
80104b16:	50                   	push   %eax
80104b17:	ff 75 f4             	pushl  -0xc(%ebp)
80104b1a:	e8 b3 bd ff ff       	call   801008d2 <exec>
80104b1f:	83 c4 10             	add    $0x10,%esp
80104b22:	eb 1a                	jmp    80104b3e <sys_exec+0xe2>
80104b24:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b29:	eb 13                	jmp    80104b3e <sys_exec+0xe2>
80104b2b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b30:	eb 0c                	jmp    80104b3e <sys_exec+0xe2>
80104b32:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b37:	eb 05                	jmp    80104b3e <sys_exec+0xe2>
80104b39:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b3e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b41:	c9                   	leave  
80104b42:	c3                   	ret    
80104b43:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b48:	eb f4                	jmp    80104b3e <sys_exec+0xe2>

80104b4a <sys_pipe>:
80104b4a:	55                   	push   %ebp
80104b4b:	89 e5                	mov    %esp,%ebp
80104b4d:	53                   	push   %ebx
80104b4e:	83 ec 18             	sub    $0x18,%esp
80104b51:	6a 08                	push   $0x8
80104b53:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b56:	50                   	push   %eax
80104b57:	6a 00                	push   $0x0
80104b59:	e8 56 f3 ff ff       	call   80103eb4 <argptr>
80104b5e:	83 c4 10             	add    $0x10,%esp
80104b61:	85 c0                	test   %eax,%eax
80104b63:	78 77                	js     80104bdc <sys_pipe+0x92>
80104b65:	83 ec 08             	sub    $0x8,%esp
80104b68:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104b6b:	50                   	push   %eax
80104b6c:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b6f:	50                   	push   %eax
80104b70:	e8 c0 e1 ff ff       	call   80102d35 <pipealloc>
80104b75:	83 c4 10             	add    $0x10,%esp
80104b78:	85 c0                	test   %eax,%eax
80104b7a:	78 67                	js     80104be3 <sys_pipe+0x99>
80104b7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104b7f:	e8 87 f4 ff ff       	call   8010400b <fdalloc>
80104b84:	89 c3                	mov    %eax,%ebx
80104b86:	85 c0                	test   %eax,%eax
80104b88:	78 21                	js     80104bab <sys_pipe+0x61>
80104b8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104b8d:	e8 79 f4 ff ff       	call   8010400b <fdalloc>
80104b92:	85 c0                	test   %eax,%eax
80104b94:	78 15                	js     80104bab <sys_pipe+0x61>
80104b96:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104b99:	89 1a                	mov    %ebx,(%edx)
80104b9b:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104b9e:	89 42 04             	mov    %eax,0x4(%edx)
80104ba1:	b8 00 00 00 00       	mov    $0x0,%eax
80104ba6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104ba9:	c9                   	leave  
80104baa:	c3                   	ret    
80104bab:	85 db                	test   %ebx,%ebx
80104bad:	78 0d                	js     80104bbc <sys_pipe+0x72>
80104baf:	e8 42 e6 ff ff       	call   801031f6 <myproc>
80104bb4:	c7 44 98 28 00 00 00 	movl   $0x0,0x28(%eax,%ebx,4)
80104bbb:	00 
80104bbc:	83 ec 0c             	sub    $0xc,%esp
80104bbf:	ff 75 f0             	pushl  -0x10(%ebp)
80104bc2:	e8 0c c1 ff ff       	call   80100cd3 <fileclose>
80104bc7:	83 c4 04             	add    $0x4,%esp
80104bca:	ff 75 ec             	pushl  -0x14(%ebp)
80104bcd:	e8 01 c1 ff ff       	call   80100cd3 <fileclose>
80104bd2:	83 c4 10             	add    $0x10,%esp
80104bd5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104bda:	eb ca                	jmp    80104ba6 <sys_pipe+0x5c>
80104bdc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104be1:	eb c3                	jmp    80104ba6 <sys_pipe+0x5c>
80104be3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104be8:	eb bc                	jmp    80104ba6 <sys_pipe+0x5c>

80104bea <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
80104bea:	55                   	push   %ebp
80104beb:	89 e5                	mov    %esp,%ebp
80104bed:	83 ec 08             	sub    $0x8,%esp
  return fork();
80104bf0:	e8 79 e7 ff ff       	call   8010336e <fork>
}
80104bf5:	c9                   	leave  
80104bf6:	c3                   	ret    

80104bf7 <sys_exit>:

int
sys_exit(void)
{
80104bf7:	55                   	push   %ebp
80104bf8:	89 e5                	mov    %esp,%ebp
80104bfa:	83 ec 08             	sub    $0x8,%esp
  exit();
80104bfd:	e8 a0 e9 ff ff       	call   801035a2 <exit>
  return 0;  // not reached
}
80104c02:	b8 00 00 00 00       	mov    $0x0,%eax
80104c07:	c9                   	leave  
80104c08:	c3                   	ret    

80104c09 <sys_wait>:

int
sys_wait(void)
{
80104c09:	55                   	push   %ebp
80104c0a:	89 e5                	mov    %esp,%ebp
80104c0c:	83 ec 08             	sub    $0x8,%esp
  return wait();
80104c0f:	e8 17 eb ff ff       	call   8010372b <wait>
}
80104c14:	c9                   	leave  
80104c15:	c3                   	ret    

80104c16 <sys_kill>:

int
sys_kill(void)
{
80104c16:	55                   	push   %ebp
80104c17:	89 e5                	mov    %esp,%ebp
80104c19:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80104c1c:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c1f:	50                   	push   %eax
80104c20:	6a 00                	push   $0x0
80104c22:	e8 65 f2 ff ff       	call   80103e8c <argint>
80104c27:	83 c4 10             	add    $0x10,%esp
80104c2a:	85 c0                	test   %eax,%eax
80104c2c:	78 10                	js     80104c3e <sys_kill+0x28>
    return -1;
  return kill(pid);
80104c2e:	83 ec 0c             	sub    $0xc,%esp
80104c31:	ff 75 f4             	pushl  -0xc(%ebp)
80104c34:	e8 ef eb ff ff       	call   80103828 <kill>
80104c39:	83 c4 10             	add    $0x10,%esp
}
80104c3c:	c9                   	leave  
80104c3d:	c3                   	ret    
    return -1;
80104c3e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c43:	eb f7                	jmp    80104c3c <sys_kill+0x26>

80104c45 <sys_getpid>:

int
sys_getpid(void)
{
80104c45:	55                   	push   %ebp
80104c46:	89 e5                	mov    %esp,%ebp
80104c48:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80104c4b:	e8 a6 e5 ff ff       	call   801031f6 <myproc>
80104c50:	8b 40 10             	mov    0x10(%eax),%eax
}
80104c53:	c9                   	leave  
80104c54:	c3                   	ret    

80104c55 <sys_sbrk>:

int
sys_sbrk(void)
{
80104c55:	55                   	push   %ebp
80104c56:	89 e5                	mov    %esp,%ebp
80104c58:	53                   	push   %ebx
80104c59:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
80104c5c:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c5f:	50                   	push   %eax
80104c60:	6a 00                	push   $0x0
80104c62:	e8 25 f2 ff ff       	call   80103e8c <argint>
80104c67:	83 c4 10             	add    $0x10,%esp
80104c6a:	85 c0                	test   %eax,%eax
80104c6c:	78 18                	js     80104c86 <sys_sbrk+0x31>
    return -1;
  addr = myproc()->sz;
80104c6e:	e8 83 e5 ff ff       	call   801031f6 <myproc>
80104c73:	8b 18                	mov    (%eax),%ebx
  myproc()->sz+=n;
80104c75:	e8 7c e5 ff ff       	call   801031f6 <myproc>
80104c7a:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104c7d:	01 10                	add    %edx,(%eax)
  /*if(growproc(n) < 0)
    return -1;*/
  return addr;
}
80104c7f:	89 d8                	mov    %ebx,%eax
80104c81:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104c84:	c9                   	leave  
80104c85:	c3                   	ret    
    return -1;
80104c86:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104c8b:	eb f2                	jmp    80104c7f <sys_sbrk+0x2a>

80104c8d <sys_sleep>:

int
sys_sleep(void)
{
80104c8d:	55                   	push   %ebp
80104c8e:	89 e5                	mov    %esp,%ebp
80104c90:	53                   	push   %ebx
80104c91:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80104c94:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c97:	50                   	push   %eax
80104c98:	6a 00                	push   $0x0
80104c9a:	e8 ed f1 ff ff       	call   80103e8c <argint>
80104c9f:	83 c4 10             	add    $0x10,%esp
80104ca2:	85 c0                	test   %eax,%eax
80104ca4:	78 75                	js     80104d1b <sys_sleep+0x8e>
    return -1;
  acquire(&tickslock);
80104ca6:	83 ec 0c             	sub    $0xc,%esp
80104ca9:	68 60 3c 11 80       	push   $0x80113c60
80104cae:	e8 e2 ee ff ff       	call   80103b95 <acquire>
  ticks0 = ticks;
80104cb3:	8b 1d a0 44 11 80    	mov    0x801144a0,%ebx
  while(ticks - ticks0 < n){
80104cb9:	83 c4 10             	add    $0x10,%esp
80104cbc:	a1 a0 44 11 80       	mov    0x801144a0,%eax
80104cc1:	29 d8                	sub    %ebx,%eax
80104cc3:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80104cc6:	73 39                	jae    80104d01 <sys_sleep+0x74>
    if(myproc()->killed){
80104cc8:	e8 29 e5 ff ff       	call   801031f6 <myproc>
80104ccd:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104cd1:	75 17                	jne    80104cea <sys_sleep+0x5d>
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80104cd3:	83 ec 08             	sub    $0x8,%esp
80104cd6:	68 60 3c 11 80       	push   $0x80113c60
80104cdb:	68 a0 44 11 80       	push   $0x801144a0
80104ce0:	e8 b5 e9 ff ff       	call   8010369a <sleep>
80104ce5:	83 c4 10             	add    $0x10,%esp
80104ce8:	eb d2                	jmp    80104cbc <sys_sleep+0x2f>
      release(&tickslock);
80104cea:	83 ec 0c             	sub    $0xc,%esp
80104ced:	68 60 3c 11 80       	push   $0x80113c60
80104cf2:	e8 03 ef ff ff       	call   80103bfa <release>
      return -1;
80104cf7:	83 c4 10             	add    $0x10,%esp
80104cfa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104cff:	eb 15                	jmp    80104d16 <sys_sleep+0x89>
  }
  release(&tickslock);
80104d01:	83 ec 0c             	sub    $0xc,%esp
80104d04:	68 60 3c 11 80       	push   $0x80113c60
80104d09:	e8 ec ee ff ff       	call   80103bfa <release>
  return 0;
80104d0e:	83 c4 10             	add    $0x10,%esp
80104d11:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104d16:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d19:	c9                   	leave  
80104d1a:	c3                   	ret    
    return -1;
80104d1b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d20:	eb f4                	jmp    80104d16 <sys_sleep+0x89>

80104d22 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80104d22:	55                   	push   %ebp
80104d23:	89 e5                	mov    %esp,%ebp
80104d25:	53                   	push   %ebx
80104d26:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80104d29:	68 60 3c 11 80       	push   $0x80113c60
80104d2e:	e8 62 ee ff ff       	call   80103b95 <acquire>
  xticks = ticks;
80104d33:	8b 1d a0 44 11 80    	mov    0x801144a0,%ebx
  release(&tickslock);
80104d39:	c7 04 24 60 3c 11 80 	movl   $0x80113c60,(%esp)
80104d40:	e8 b5 ee ff ff       	call   80103bfa <release>
  return xticks;
}
80104d45:	89 d8                	mov    %ebx,%eax
80104d47:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d4a:	c9                   	leave  
80104d4b:	c3                   	ret    

80104d4c <sys_date>:

// return the date of the moment at the structure
int 
sys_date(void)
{
80104d4c:	55                   	push   %ebp
80104d4d:	89 e5                	mov    %esp,%ebp
80104d4f:	83 ec 1c             	sub    $0x1c,%esp
    struct rtcdate *r;
    if(argptr(0, (char **)&r, 20) < 0)
80104d52:	6a 14                	push   $0x14
80104d54:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d57:	50                   	push   %eax
80104d58:	6a 00                	push   $0x0
80104d5a:	e8 55 f1 ff ff       	call   80103eb4 <argptr>
80104d5f:	83 c4 10             	add    $0x10,%esp
80104d62:	85 c0                	test   %eax,%eax
80104d64:	78 15                	js     80104d7b <sys_date+0x2f>
        return -1;
    cmostime(r);
80104d66:	83 ec 0c             	sub    $0xc,%esp
80104d69:	ff 75 f4             	pushl  -0xc(%ebp)
80104d6c:	e8 e1 d6 ff ff       	call   80102452 <cmostime>
    return 0;
80104d71:	83 c4 10             	add    $0x10,%esp
80104d74:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104d79:	c9                   	leave  
80104d7a:	c3                   	ret    
        return -1;
80104d7b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d80:	eb f7                	jmp    80104d79 <sys_date+0x2d>

80104d82 <alltraps>:
80104d82:	1e                   	push   %ds
80104d83:	06                   	push   %es
80104d84:	0f a0                	push   %fs
80104d86:	0f a8                	push   %gs
80104d88:	60                   	pusha  
80104d89:	66 b8 10 00          	mov    $0x10,%ax
80104d8d:	8e d8                	mov    %eax,%ds
80104d8f:	8e c0                	mov    %eax,%es
80104d91:	54                   	push   %esp
80104d92:	e8 e3 00 00 00       	call   80104e7a <trap>
80104d97:	83 c4 04             	add    $0x4,%esp

80104d9a <trapret>:
80104d9a:	61                   	popa   
80104d9b:	0f a9                	pop    %gs
80104d9d:	0f a1                	pop    %fs
80104d9f:	07                   	pop    %es
80104da0:	1f                   	pop    %ds
80104da1:	83 c4 08             	add    $0x8,%esp
80104da4:	cf                   	iret   

80104da5 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80104da5:	55                   	push   %ebp
80104da6:	89 e5                	mov    %esp,%ebp
80104da8:	83 ec 08             	sub    $0x8,%esp
  int i;

  for(i = 0; i < 256; i++)
80104dab:	b8 00 00 00 00       	mov    $0x0,%eax
80104db0:	eb 4a                	jmp    80104dfc <tvinit+0x57>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80104db2:	8b 0c 85 08 90 10 80 	mov    -0x7fef6ff8(,%eax,4),%ecx
80104db9:	66 89 0c c5 a0 3c 11 	mov    %cx,-0x7feec360(,%eax,8)
80104dc0:	80 
80104dc1:	66 c7 04 c5 a2 3c 11 	movw   $0x8,-0x7feec35e(,%eax,8)
80104dc8:	80 08 00 
80104dcb:	c6 04 c5 a4 3c 11 80 	movb   $0x0,-0x7feec35c(,%eax,8)
80104dd2:	00 
80104dd3:	0f b6 14 c5 a5 3c 11 	movzbl -0x7feec35b(,%eax,8),%edx
80104dda:	80 
80104ddb:	83 e2 f0             	and    $0xfffffff0,%edx
80104dde:	83 ca 0e             	or     $0xe,%edx
80104de1:	83 e2 8f             	and    $0xffffff8f,%edx
80104de4:	83 ca 80             	or     $0xffffff80,%edx
80104de7:	88 14 c5 a5 3c 11 80 	mov    %dl,-0x7feec35b(,%eax,8)
80104dee:	c1 e9 10             	shr    $0x10,%ecx
80104df1:	66 89 0c c5 a6 3c 11 	mov    %cx,-0x7feec35a(,%eax,8)
80104df8:	80 
  for(i = 0; i < 256; i++)
80104df9:	83 c0 01             	add    $0x1,%eax
80104dfc:	3d ff 00 00 00       	cmp    $0xff,%eax
80104e01:	7e af                	jle    80104db2 <tvinit+0xd>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80104e03:	8b 15 08 91 10 80    	mov    0x80109108,%edx
80104e09:	66 89 15 a0 3e 11 80 	mov    %dx,0x80113ea0
80104e10:	66 c7 05 a2 3e 11 80 	movw   $0x8,0x80113ea2
80104e17:	08 00 
80104e19:	c6 05 a4 3e 11 80 00 	movb   $0x0,0x80113ea4
80104e20:	0f b6 05 a5 3e 11 80 	movzbl 0x80113ea5,%eax
80104e27:	83 c8 0f             	or     $0xf,%eax
80104e2a:	83 e0 ef             	and    $0xffffffef,%eax
80104e2d:	83 c8 e0             	or     $0xffffffe0,%eax
80104e30:	a2 a5 3e 11 80       	mov    %al,0x80113ea5
80104e35:	c1 ea 10             	shr    $0x10,%edx
80104e38:	66 89 15 a6 3e 11 80 	mov    %dx,0x80113ea6

  initlock(&tickslock, "time");
80104e3f:	83 ec 08             	sub    $0x8,%esp
80104e42:	68 21 6d 10 80       	push   $0x80106d21
80104e47:	68 60 3c 11 80       	push   $0x80113c60
80104e4c:	e8 08 ec ff ff       	call   80103a59 <initlock>
}
80104e51:	83 c4 10             	add    $0x10,%esp
80104e54:	c9                   	leave  
80104e55:	c3                   	ret    

80104e56 <idtinit>:

void
idtinit(void)
{
80104e56:	55                   	push   %ebp
80104e57:	89 e5                	mov    %esp,%ebp
80104e59:	83 ec 10             	sub    $0x10,%esp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80104e5c:	66 c7 45 fa ff 07    	movw   $0x7ff,-0x6(%ebp)
  pd[1] = (uint)p;
80104e62:	b8 a0 3c 11 80       	mov    $0x80113ca0,%eax
80104e67:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80104e6b:	c1 e8 10             	shr    $0x10,%eax
80104e6e:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
80104e72:	8d 45 fa             	lea    -0x6(%ebp),%eax
80104e75:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80104e78:	c9                   	leave  
80104e79:	c3                   	ret    

80104e7a <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80104e7a:	55                   	push   %ebp
80104e7b:	89 e5                	mov    %esp,%ebp
80104e7d:	57                   	push   %edi
80104e7e:	56                   	push   %esi
80104e7f:	53                   	push   %ebx
80104e80:	83 ec 1c             	sub    $0x1c,%esp
80104e83:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
80104e86:	8b 43 30             	mov    0x30(%ebx),%eax
80104e89:	83 f8 40             	cmp    $0x40,%eax
80104e8c:	74 13                	je     80104ea1 <trap+0x27>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80104e8e:	83 e8 20             	sub    $0x20,%eax
80104e91:	83 f8 1f             	cmp    $0x1f,%eax
80104e94:	0f 87 3a 01 00 00    	ja     80104fd4 <trap+0x15a>
80104e9a:	ff 24 85 e0 6d 10 80 	jmp    *-0x7fef9220(,%eax,4)
    if(myproc()->killed)
80104ea1:	e8 50 e3 ff ff       	call   801031f6 <myproc>
80104ea6:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104eaa:	75 1f                	jne    80104ecb <trap+0x51>
    myproc()->tf = tf;
80104eac:	e8 45 e3 ff ff       	call   801031f6 <myproc>
80104eb1:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80104eb4:	e8 96 f0 ff ff       	call   80103f4f <syscall>
    if(myproc()->killed)
80104eb9:	e8 38 e3 ff ff       	call   801031f6 <myproc>
80104ebe:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104ec2:	74 7e                	je     80104f42 <trap+0xc8>
      exit();
80104ec4:	e8 d9 e6 ff ff       	call   801035a2 <exit>
80104ec9:	eb 77                	jmp    80104f42 <trap+0xc8>
      exit();
80104ecb:	e8 d2 e6 ff ff       	call   801035a2 <exit>
80104ed0:	eb da                	jmp    80104eac <trap+0x32>
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
80104ed2:	e8 04 e3 ff ff       	call   801031db <cpuid>
80104ed7:	85 c0                	test   %eax,%eax
80104ed9:	74 6f                	je     80104f4a <trap+0xd0>
      acquire(&tickslock);
      ticks++;
      wakeup(&ticks);
      release(&tickslock);
    }
    lapiceoi();
80104edb:	e8 b9 d4 ff ff       	call   80102399 <lapiceoi>
}

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80104ee0:	e8 11 e3 ff ff       	call   801031f6 <myproc>
80104ee5:	85 c0                	test   %eax,%eax
80104ee7:	74 1c                	je     80104f05 <trap+0x8b>
80104ee9:	e8 08 e3 ff ff       	call   801031f6 <myproc>
80104eee:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104ef2:	74 11                	je     80104f05 <trap+0x8b>
80104ef4:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80104ef8:	83 e0 03             	and    $0x3,%eax
80104efb:	66 83 f8 03          	cmp    $0x3,%ax
80104eff:	0f 84 12 02 00 00    	je     80105117 <trap+0x29d>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80104f05:	e8 ec e2 ff ff       	call   801031f6 <myproc>
80104f0a:	85 c0                	test   %eax,%eax
80104f0c:	74 0f                	je     80104f1d <trap+0xa3>
80104f0e:	e8 e3 e2 ff ff       	call   801031f6 <myproc>
80104f13:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80104f17:	0f 84 04 02 00 00    	je     80105121 <trap+0x2a7>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80104f1d:	e8 d4 e2 ff ff       	call   801031f6 <myproc>
80104f22:	85 c0                	test   %eax,%eax
80104f24:	74 1c                	je     80104f42 <trap+0xc8>
80104f26:	e8 cb e2 ff ff       	call   801031f6 <myproc>
80104f2b:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104f2f:	74 11                	je     80104f42 <trap+0xc8>
80104f31:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80104f35:	83 e0 03             	and    $0x3,%eax
80104f38:	66 83 f8 03          	cmp    $0x3,%ax
80104f3c:	0f 84 f3 01 00 00    	je     80105135 <trap+0x2bb>
    exit();
}
80104f42:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f45:	5b                   	pop    %ebx
80104f46:	5e                   	pop    %esi
80104f47:	5f                   	pop    %edi
80104f48:	5d                   	pop    %ebp
80104f49:	c3                   	ret    
      acquire(&tickslock);
80104f4a:	83 ec 0c             	sub    $0xc,%esp
80104f4d:	68 60 3c 11 80       	push   $0x80113c60
80104f52:	e8 3e ec ff ff       	call   80103b95 <acquire>
      ticks++;
80104f57:	83 05 a0 44 11 80 01 	addl   $0x1,0x801144a0
      wakeup(&ticks);
80104f5e:	c7 04 24 a0 44 11 80 	movl   $0x801144a0,(%esp)
80104f65:	e8 95 e8 ff ff       	call   801037ff <wakeup>
      release(&tickslock);
80104f6a:	c7 04 24 60 3c 11 80 	movl   $0x80113c60,(%esp)
80104f71:	e8 84 ec ff ff       	call   80103bfa <release>
80104f76:	83 c4 10             	add    $0x10,%esp
80104f79:	e9 5d ff ff ff       	jmp    80104edb <trap+0x61>
    ideintr();
80104f7e:	e8 f0 cd ff ff       	call   80101d73 <ideintr>
    lapiceoi();
80104f83:	e8 11 d4 ff ff       	call   80102399 <lapiceoi>
    break;
80104f88:	e9 53 ff ff ff       	jmp    80104ee0 <trap+0x66>
    kbdintr();
80104f8d:	e8 4b d2 ff ff       	call   801021dd <kbdintr>
    lapiceoi();
80104f92:	e8 02 d4 ff ff       	call   80102399 <lapiceoi>
    break;
80104f97:	e9 44 ff ff ff       	jmp    80104ee0 <trap+0x66>
    uartintr();
80104f9c:	e8 b5 02 00 00       	call   80105256 <uartintr>
    lapiceoi();
80104fa1:	e8 f3 d3 ff ff       	call   80102399 <lapiceoi>
    break;
80104fa6:	e9 35 ff ff ff       	jmp    80104ee0 <trap+0x66>
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80104fab:	8b 7b 38             	mov    0x38(%ebx),%edi
            cpuid(), tf->cs, tf->eip);
80104fae:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80104fb2:	e8 24 e2 ff ff       	call   801031db <cpuid>
80104fb7:	57                   	push   %edi
80104fb8:	0f b7 f6             	movzwl %si,%esi
80104fbb:	56                   	push   %esi
80104fbc:	50                   	push   %eax
80104fbd:	68 44 6d 10 80       	push   $0x80106d44
80104fc2:	e8 44 b6 ff ff       	call   8010060b <cprintf>
    lapiceoi();
80104fc7:	e8 cd d3 ff ff       	call   80102399 <lapiceoi>
    break;
80104fcc:	83 c4 10             	add    $0x10,%esp
80104fcf:	e9 0c ff ff ff       	jmp    80104ee0 <trap+0x66>
    if(myproc() == 0 || (tf->cs&3) == 0){
80104fd4:	e8 1d e2 ff ff       	call   801031f6 <myproc>
80104fd9:	85 c0                	test   %eax,%eax
80104fdb:	0f 84 a1 00 00 00    	je     80105082 <trap+0x208>
80104fe1:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80104fe5:	0f 84 97 00 00 00    	je     80105082 <trap+0x208>
  if(tf->trapno == T_PGFLT){ //page fault treatment
80104feb:	83 7b 30 0e          	cmpl   $0xe,0x30(%ebx)
80104fef:	0f 85 eb fe ff ff    	jne    80104ee0 <trap+0x66>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80104ff5:	0f 20 d6             	mov    %cr2,%esi
    if (rcr2() < myproc()->sz){ // check that we are on range
80104ff8:	e8 f9 e1 ff ff       	call   801031f6 <myproc>
80104ffd:	39 30                	cmp    %esi,(%eax)
80104fff:	0f 86 b9 00 00 00    	jbe    801050be <trap+0x244>
      if((mem = kalloc()) == 0){ // error on memory == death
80105005:	e8 b1 d0 ff ff       	call   801020bb <kalloc>
8010500a:	89 c6                	mov    %eax,%esi
8010500c:	85 c0                	test   %eax,%eax
8010500e:	0f 84 99 00 00 00    	je     801050ad <trap+0x233>
      memset(mem, 0, PGSIZE); // put every bit on the page to 0
80105014:	83 ec 04             	sub    $0x4,%esp
80105017:	68 00 10 00 00       	push   $0x1000
8010501c:	6a 00                	push   $0x0
8010501e:	50                   	push   %eax
8010501f:	e8 1d ec ff ff       	call   80103c41 <memset>
80105024:	0f 20 d7             	mov    %cr2,%edi
      if(mappages(myproc()->pgdir,(void *) PGROUNDDOWN(rcr2()) , PGSIZE, V2P(mem) , PTE_W|PTE_U) < 0){
80105027:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
8010502d:	e8 c4 e1 ff ff       	call   801031f6 <myproc>
80105032:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
80105039:	8d 96 00 00 00 80    	lea    -0x80000000(%esi),%edx
8010503f:	52                   	push   %edx
80105040:	68 00 10 00 00       	push   $0x1000
80105045:	57                   	push   %edi
80105046:	ff 70 04             	pushl  0x4(%eax)
80105049:	e8 4b 0e 00 00       	call   80105e99 <mappages>
8010504e:	83 c4 20             	add    $0x20,%esp
80105051:	85 c0                	test   %eax,%eax
80105053:	0f 89 87 fe ff ff    	jns    80104ee0 <trap+0x66>
        cprintf("trap: out of memory (2)\n");
80105059:	83 ec 0c             	sub    $0xc,%esp
8010505c:	68 2b 6d 10 80       	push   $0x80106d2b
80105061:	e8 a5 b5 ff ff       	call   8010060b <cprintf>
        kfree(mem);
80105066:	89 34 24             	mov    %esi,(%esp)
80105069:	e8 36 cf ff ff       	call   80101fa4 <kfree>
        myproc()->killed = 1;
8010506e:	e8 83 e1 ff ff       	call   801031f6 <myproc>
80105073:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
        return;
8010507a:	83 c4 10             	add    $0x10,%esp
8010507d:	e9 c0 fe ff ff       	jmp    80104f42 <trap+0xc8>
80105082:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105085:	8b 73 38             	mov    0x38(%ebx),%esi
80105088:	e8 4e e1 ff ff       	call   801031db <cpuid>
8010508d:	83 ec 0c             	sub    $0xc,%esp
80105090:	57                   	push   %edi
80105091:	56                   	push   %esi
80105092:	50                   	push   %eax
80105093:	ff 73 30             	pushl  0x30(%ebx)
80105096:	68 68 6d 10 80       	push   $0x80106d68
8010509b:	e8 6b b5 ff ff       	call   8010060b <cprintf>
      panic("trap");
801050a0:	83 c4 14             	add    $0x14,%esp
801050a3:	68 26 6d 10 80       	push   $0x80106d26
801050a8:	e8 9b b2 ff ff       	call   80100348 <panic>
        myproc()->killed = 1;
801050ad:	e8 44 e1 ff ff       	call   801031f6 <myproc>
801050b2:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
        return;
801050b9:	e9 84 fe ff ff       	jmp    80104f42 <trap+0xc8>
801050be:	0f 20 d7             	mov    %cr2,%edi
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801050c1:	8b 43 38             	mov    0x38(%ebx),%eax
801050c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801050c7:	e8 0f e1 ff ff       	call   801031db <cpuid>
801050cc:	89 45 e0             	mov    %eax,-0x20(%ebp)
801050cf:	8b 4b 34             	mov    0x34(%ebx),%ecx
801050d2:	89 4d dc             	mov    %ecx,-0x24(%ebp)
801050d5:	8b 73 30             	mov    0x30(%ebx),%esi
            myproc()->pid, myproc()->name, tf->trapno,
801050d8:	e8 19 e1 ff ff       	call   801031f6 <myproc>
801050dd:	8d 50 6c             	lea    0x6c(%eax),%edx
801050e0:	89 55 d8             	mov    %edx,-0x28(%ebp)
801050e3:	e8 0e e1 ff ff       	call   801031f6 <myproc>
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801050e8:	57                   	push   %edi
801050e9:	ff 75 e4             	pushl  -0x1c(%ebp)
801050ec:	ff 75 e0             	pushl  -0x20(%ebp)
801050ef:	ff 75 dc             	pushl  -0x24(%ebp)
801050f2:	56                   	push   %esi
801050f3:	ff 75 d8             	pushl  -0x28(%ebp)
801050f6:	ff 70 10             	pushl  0x10(%eax)
801050f9:	68 9c 6d 10 80       	push   $0x80106d9c
801050fe:	e8 08 b5 ff ff       	call   8010060b <cprintf>
        myproc()->killed = 1;
80105103:	83 c4 20             	add    $0x20,%esp
80105106:	e8 eb e0 ff ff       	call   801031f6 <myproc>
8010510b:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80105112:	e9 c9 fd ff ff       	jmp    80104ee0 <trap+0x66>
    exit();
80105117:	e8 86 e4 ff ff       	call   801035a2 <exit>
8010511c:	e9 e4 fd ff ff       	jmp    80104f05 <trap+0x8b>
  if(myproc() && myproc()->state == RUNNING &&
80105121:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105125:	0f 85 f2 fd ff ff    	jne    80104f1d <trap+0xa3>
    yield();
8010512b:	e8 38 e5 ff ff       	call   80103668 <yield>
80105130:	e9 e8 fd ff ff       	jmp    80104f1d <trap+0xa3>
    exit();
80105135:	e8 68 e4 ff ff       	call   801035a2 <exit>
8010513a:	e9 03 fe ff ff       	jmp    80104f42 <trap+0xc8>

8010513f <uartgetc>:
8010513f:	55                   	push   %ebp
80105140:	89 e5                	mov    %esp,%ebp
80105142:	83 3d bc 95 10 80 00 	cmpl   $0x0,0x801095bc
80105149:	74 15                	je     80105160 <uartgetc+0x21>
8010514b:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105150:	ec                   	in     (%dx),%al
80105151:	a8 01                	test   $0x1,%al
80105153:	74 12                	je     80105167 <uartgetc+0x28>
80105155:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010515a:	ec                   	in     (%dx),%al
8010515b:	0f b6 c0             	movzbl %al,%eax
8010515e:	5d                   	pop    %ebp
8010515f:	c3                   	ret    
80105160:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105165:	eb f7                	jmp    8010515e <uartgetc+0x1f>
80105167:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010516c:	eb f0                	jmp    8010515e <uartgetc+0x1f>

8010516e <uartputc>:
8010516e:	83 3d bc 95 10 80 00 	cmpl   $0x0,0x801095bc
80105175:	74 3b                	je     801051b2 <uartputc+0x44>
80105177:	55                   	push   %ebp
80105178:	89 e5                	mov    %esp,%ebp
8010517a:	53                   	push   %ebx
8010517b:	83 ec 04             	sub    $0x4,%esp
8010517e:	bb 00 00 00 00       	mov    $0x0,%ebx
80105183:	eb 10                	jmp    80105195 <uartputc+0x27>
80105185:	83 ec 0c             	sub    $0xc,%esp
80105188:	6a 0a                	push   $0xa
8010518a:	e8 29 d2 ff ff       	call   801023b8 <microdelay>
8010518f:	83 c3 01             	add    $0x1,%ebx
80105192:	83 c4 10             	add    $0x10,%esp
80105195:	83 fb 7f             	cmp    $0x7f,%ebx
80105198:	7f 0a                	jg     801051a4 <uartputc+0x36>
8010519a:	ba fd 03 00 00       	mov    $0x3fd,%edx
8010519f:	ec                   	in     (%dx),%al
801051a0:	a8 20                	test   $0x20,%al
801051a2:	74 e1                	je     80105185 <uartputc+0x17>
801051a4:	8b 45 08             	mov    0x8(%ebp),%eax
801051a7:	ba f8 03 00 00       	mov    $0x3f8,%edx
801051ac:	ee                   	out    %al,(%dx)
801051ad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801051b0:	c9                   	leave  
801051b1:	c3                   	ret    
801051b2:	f3 c3                	repz ret 

801051b4 <uartinit>:
801051b4:	55                   	push   %ebp
801051b5:	89 e5                	mov    %esp,%ebp
801051b7:	56                   	push   %esi
801051b8:	53                   	push   %ebx
801051b9:	b9 00 00 00 00       	mov    $0x0,%ecx
801051be:	ba fa 03 00 00       	mov    $0x3fa,%edx
801051c3:	89 c8                	mov    %ecx,%eax
801051c5:	ee                   	out    %al,(%dx)
801051c6:	be fb 03 00 00       	mov    $0x3fb,%esi
801051cb:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
801051d0:	89 f2                	mov    %esi,%edx
801051d2:	ee                   	out    %al,(%dx)
801051d3:	b8 0c 00 00 00       	mov    $0xc,%eax
801051d8:	ba f8 03 00 00       	mov    $0x3f8,%edx
801051dd:	ee                   	out    %al,(%dx)
801051de:	bb f9 03 00 00       	mov    $0x3f9,%ebx
801051e3:	89 c8                	mov    %ecx,%eax
801051e5:	89 da                	mov    %ebx,%edx
801051e7:	ee                   	out    %al,(%dx)
801051e8:	b8 03 00 00 00       	mov    $0x3,%eax
801051ed:	89 f2                	mov    %esi,%edx
801051ef:	ee                   	out    %al,(%dx)
801051f0:	ba fc 03 00 00       	mov    $0x3fc,%edx
801051f5:	89 c8                	mov    %ecx,%eax
801051f7:	ee                   	out    %al,(%dx)
801051f8:	b8 01 00 00 00       	mov    $0x1,%eax
801051fd:	89 da                	mov    %ebx,%edx
801051ff:	ee                   	out    %al,(%dx)
80105200:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105205:	ec                   	in     (%dx),%al
80105206:	3c ff                	cmp    $0xff,%al
80105208:	74 45                	je     8010524f <uartinit+0x9b>
8010520a:	c7 05 bc 95 10 80 01 	movl   $0x1,0x801095bc
80105211:	00 00 00 
80105214:	ba fa 03 00 00       	mov    $0x3fa,%edx
80105219:	ec                   	in     (%dx),%al
8010521a:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010521f:	ec                   	in     (%dx),%al
80105220:	83 ec 08             	sub    $0x8,%esp
80105223:	6a 00                	push   $0x0
80105225:	6a 04                	push   $0x4
80105227:	e8 52 cd ff ff       	call   80101f7e <ioapicenable>
8010522c:	83 c4 10             	add    $0x10,%esp
8010522f:	bb 60 6e 10 80       	mov    $0x80106e60,%ebx
80105234:	eb 12                	jmp    80105248 <uartinit+0x94>
80105236:	83 ec 0c             	sub    $0xc,%esp
80105239:	0f be c0             	movsbl %al,%eax
8010523c:	50                   	push   %eax
8010523d:	e8 2c ff ff ff       	call   8010516e <uartputc>
80105242:	83 c3 01             	add    $0x1,%ebx
80105245:	83 c4 10             	add    $0x10,%esp
80105248:	0f b6 03             	movzbl (%ebx),%eax
8010524b:	84 c0                	test   %al,%al
8010524d:	75 e7                	jne    80105236 <uartinit+0x82>
8010524f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105252:	5b                   	pop    %ebx
80105253:	5e                   	pop    %esi
80105254:	5d                   	pop    %ebp
80105255:	c3                   	ret    

80105256 <uartintr>:
80105256:	55                   	push   %ebp
80105257:	89 e5                	mov    %esp,%ebp
80105259:	83 ec 14             	sub    $0x14,%esp
8010525c:	68 3f 51 10 80       	push   $0x8010513f
80105261:	e8 d8 b4 ff ff       	call   8010073e <consoleintr>
80105266:	83 c4 10             	add    $0x10,%esp
80105269:	c9                   	leave  
8010526a:	c3                   	ret    

8010526b <vector0>:
8010526b:	6a 00                	push   $0x0
8010526d:	6a 00                	push   $0x0
8010526f:	e9 0e fb ff ff       	jmp    80104d82 <alltraps>

80105274 <vector1>:
80105274:	6a 00                	push   $0x0
80105276:	6a 01                	push   $0x1
80105278:	e9 05 fb ff ff       	jmp    80104d82 <alltraps>

8010527d <vector2>:
8010527d:	6a 00                	push   $0x0
8010527f:	6a 02                	push   $0x2
80105281:	e9 fc fa ff ff       	jmp    80104d82 <alltraps>

80105286 <vector3>:
80105286:	6a 00                	push   $0x0
80105288:	6a 03                	push   $0x3
8010528a:	e9 f3 fa ff ff       	jmp    80104d82 <alltraps>

8010528f <vector4>:
8010528f:	6a 00                	push   $0x0
80105291:	6a 04                	push   $0x4
80105293:	e9 ea fa ff ff       	jmp    80104d82 <alltraps>

80105298 <vector5>:
80105298:	6a 00                	push   $0x0
8010529a:	6a 05                	push   $0x5
8010529c:	e9 e1 fa ff ff       	jmp    80104d82 <alltraps>

801052a1 <vector6>:
801052a1:	6a 00                	push   $0x0
801052a3:	6a 06                	push   $0x6
801052a5:	e9 d8 fa ff ff       	jmp    80104d82 <alltraps>

801052aa <vector7>:
801052aa:	6a 00                	push   $0x0
801052ac:	6a 07                	push   $0x7
801052ae:	e9 cf fa ff ff       	jmp    80104d82 <alltraps>

801052b3 <vector8>:
801052b3:	6a 08                	push   $0x8
801052b5:	e9 c8 fa ff ff       	jmp    80104d82 <alltraps>

801052ba <vector9>:
801052ba:	6a 00                	push   $0x0
801052bc:	6a 09                	push   $0x9
801052be:	e9 bf fa ff ff       	jmp    80104d82 <alltraps>

801052c3 <vector10>:
801052c3:	6a 0a                	push   $0xa
801052c5:	e9 b8 fa ff ff       	jmp    80104d82 <alltraps>

801052ca <vector11>:
801052ca:	6a 0b                	push   $0xb
801052cc:	e9 b1 fa ff ff       	jmp    80104d82 <alltraps>

801052d1 <vector12>:
801052d1:	6a 0c                	push   $0xc
801052d3:	e9 aa fa ff ff       	jmp    80104d82 <alltraps>

801052d8 <vector13>:
801052d8:	6a 0d                	push   $0xd
801052da:	e9 a3 fa ff ff       	jmp    80104d82 <alltraps>

801052df <vector14>:
801052df:	6a 0e                	push   $0xe
801052e1:	e9 9c fa ff ff       	jmp    80104d82 <alltraps>

801052e6 <vector15>:
801052e6:	6a 00                	push   $0x0
801052e8:	6a 0f                	push   $0xf
801052ea:	e9 93 fa ff ff       	jmp    80104d82 <alltraps>

801052ef <vector16>:
801052ef:	6a 00                	push   $0x0
801052f1:	6a 10                	push   $0x10
801052f3:	e9 8a fa ff ff       	jmp    80104d82 <alltraps>

801052f8 <vector17>:
801052f8:	6a 11                	push   $0x11
801052fa:	e9 83 fa ff ff       	jmp    80104d82 <alltraps>

801052ff <vector18>:
801052ff:	6a 00                	push   $0x0
80105301:	6a 12                	push   $0x12
80105303:	e9 7a fa ff ff       	jmp    80104d82 <alltraps>

80105308 <vector19>:
80105308:	6a 00                	push   $0x0
8010530a:	6a 13                	push   $0x13
8010530c:	e9 71 fa ff ff       	jmp    80104d82 <alltraps>

80105311 <vector20>:
80105311:	6a 00                	push   $0x0
80105313:	6a 14                	push   $0x14
80105315:	e9 68 fa ff ff       	jmp    80104d82 <alltraps>

8010531a <vector21>:
8010531a:	6a 00                	push   $0x0
8010531c:	6a 15                	push   $0x15
8010531e:	e9 5f fa ff ff       	jmp    80104d82 <alltraps>

80105323 <vector22>:
80105323:	6a 00                	push   $0x0
80105325:	6a 16                	push   $0x16
80105327:	e9 56 fa ff ff       	jmp    80104d82 <alltraps>

8010532c <vector23>:
8010532c:	6a 00                	push   $0x0
8010532e:	6a 17                	push   $0x17
80105330:	e9 4d fa ff ff       	jmp    80104d82 <alltraps>

80105335 <vector24>:
80105335:	6a 00                	push   $0x0
80105337:	6a 18                	push   $0x18
80105339:	e9 44 fa ff ff       	jmp    80104d82 <alltraps>

8010533e <vector25>:
8010533e:	6a 00                	push   $0x0
80105340:	6a 19                	push   $0x19
80105342:	e9 3b fa ff ff       	jmp    80104d82 <alltraps>

80105347 <vector26>:
80105347:	6a 00                	push   $0x0
80105349:	6a 1a                	push   $0x1a
8010534b:	e9 32 fa ff ff       	jmp    80104d82 <alltraps>

80105350 <vector27>:
80105350:	6a 00                	push   $0x0
80105352:	6a 1b                	push   $0x1b
80105354:	e9 29 fa ff ff       	jmp    80104d82 <alltraps>

80105359 <vector28>:
80105359:	6a 00                	push   $0x0
8010535b:	6a 1c                	push   $0x1c
8010535d:	e9 20 fa ff ff       	jmp    80104d82 <alltraps>

80105362 <vector29>:
80105362:	6a 00                	push   $0x0
80105364:	6a 1d                	push   $0x1d
80105366:	e9 17 fa ff ff       	jmp    80104d82 <alltraps>

8010536b <vector30>:
8010536b:	6a 00                	push   $0x0
8010536d:	6a 1e                	push   $0x1e
8010536f:	e9 0e fa ff ff       	jmp    80104d82 <alltraps>

80105374 <vector31>:
80105374:	6a 00                	push   $0x0
80105376:	6a 1f                	push   $0x1f
80105378:	e9 05 fa ff ff       	jmp    80104d82 <alltraps>

8010537d <vector32>:
8010537d:	6a 00                	push   $0x0
8010537f:	6a 20                	push   $0x20
80105381:	e9 fc f9 ff ff       	jmp    80104d82 <alltraps>

80105386 <vector33>:
80105386:	6a 00                	push   $0x0
80105388:	6a 21                	push   $0x21
8010538a:	e9 f3 f9 ff ff       	jmp    80104d82 <alltraps>

8010538f <vector34>:
8010538f:	6a 00                	push   $0x0
80105391:	6a 22                	push   $0x22
80105393:	e9 ea f9 ff ff       	jmp    80104d82 <alltraps>

80105398 <vector35>:
80105398:	6a 00                	push   $0x0
8010539a:	6a 23                	push   $0x23
8010539c:	e9 e1 f9 ff ff       	jmp    80104d82 <alltraps>

801053a1 <vector36>:
801053a1:	6a 00                	push   $0x0
801053a3:	6a 24                	push   $0x24
801053a5:	e9 d8 f9 ff ff       	jmp    80104d82 <alltraps>

801053aa <vector37>:
801053aa:	6a 00                	push   $0x0
801053ac:	6a 25                	push   $0x25
801053ae:	e9 cf f9 ff ff       	jmp    80104d82 <alltraps>

801053b3 <vector38>:
801053b3:	6a 00                	push   $0x0
801053b5:	6a 26                	push   $0x26
801053b7:	e9 c6 f9 ff ff       	jmp    80104d82 <alltraps>

801053bc <vector39>:
801053bc:	6a 00                	push   $0x0
801053be:	6a 27                	push   $0x27
801053c0:	e9 bd f9 ff ff       	jmp    80104d82 <alltraps>

801053c5 <vector40>:
801053c5:	6a 00                	push   $0x0
801053c7:	6a 28                	push   $0x28
801053c9:	e9 b4 f9 ff ff       	jmp    80104d82 <alltraps>

801053ce <vector41>:
801053ce:	6a 00                	push   $0x0
801053d0:	6a 29                	push   $0x29
801053d2:	e9 ab f9 ff ff       	jmp    80104d82 <alltraps>

801053d7 <vector42>:
801053d7:	6a 00                	push   $0x0
801053d9:	6a 2a                	push   $0x2a
801053db:	e9 a2 f9 ff ff       	jmp    80104d82 <alltraps>

801053e0 <vector43>:
801053e0:	6a 00                	push   $0x0
801053e2:	6a 2b                	push   $0x2b
801053e4:	e9 99 f9 ff ff       	jmp    80104d82 <alltraps>

801053e9 <vector44>:
801053e9:	6a 00                	push   $0x0
801053eb:	6a 2c                	push   $0x2c
801053ed:	e9 90 f9 ff ff       	jmp    80104d82 <alltraps>

801053f2 <vector45>:
801053f2:	6a 00                	push   $0x0
801053f4:	6a 2d                	push   $0x2d
801053f6:	e9 87 f9 ff ff       	jmp    80104d82 <alltraps>

801053fb <vector46>:
801053fb:	6a 00                	push   $0x0
801053fd:	6a 2e                	push   $0x2e
801053ff:	e9 7e f9 ff ff       	jmp    80104d82 <alltraps>

80105404 <vector47>:
80105404:	6a 00                	push   $0x0
80105406:	6a 2f                	push   $0x2f
80105408:	e9 75 f9 ff ff       	jmp    80104d82 <alltraps>

8010540d <vector48>:
8010540d:	6a 00                	push   $0x0
8010540f:	6a 30                	push   $0x30
80105411:	e9 6c f9 ff ff       	jmp    80104d82 <alltraps>

80105416 <vector49>:
80105416:	6a 00                	push   $0x0
80105418:	6a 31                	push   $0x31
8010541a:	e9 63 f9 ff ff       	jmp    80104d82 <alltraps>

8010541f <vector50>:
8010541f:	6a 00                	push   $0x0
80105421:	6a 32                	push   $0x32
80105423:	e9 5a f9 ff ff       	jmp    80104d82 <alltraps>

80105428 <vector51>:
80105428:	6a 00                	push   $0x0
8010542a:	6a 33                	push   $0x33
8010542c:	e9 51 f9 ff ff       	jmp    80104d82 <alltraps>

80105431 <vector52>:
80105431:	6a 00                	push   $0x0
80105433:	6a 34                	push   $0x34
80105435:	e9 48 f9 ff ff       	jmp    80104d82 <alltraps>

8010543a <vector53>:
8010543a:	6a 00                	push   $0x0
8010543c:	6a 35                	push   $0x35
8010543e:	e9 3f f9 ff ff       	jmp    80104d82 <alltraps>

80105443 <vector54>:
80105443:	6a 00                	push   $0x0
80105445:	6a 36                	push   $0x36
80105447:	e9 36 f9 ff ff       	jmp    80104d82 <alltraps>

8010544c <vector55>:
8010544c:	6a 00                	push   $0x0
8010544e:	6a 37                	push   $0x37
80105450:	e9 2d f9 ff ff       	jmp    80104d82 <alltraps>

80105455 <vector56>:
80105455:	6a 00                	push   $0x0
80105457:	6a 38                	push   $0x38
80105459:	e9 24 f9 ff ff       	jmp    80104d82 <alltraps>

8010545e <vector57>:
8010545e:	6a 00                	push   $0x0
80105460:	6a 39                	push   $0x39
80105462:	e9 1b f9 ff ff       	jmp    80104d82 <alltraps>

80105467 <vector58>:
80105467:	6a 00                	push   $0x0
80105469:	6a 3a                	push   $0x3a
8010546b:	e9 12 f9 ff ff       	jmp    80104d82 <alltraps>

80105470 <vector59>:
80105470:	6a 00                	push   $0x0
80105472:	6a 3b                	push   $0x3b
80105474:	e9 09 f9 ff ff       	jmp    80104d82 <alltraps>

80105479 <vector60>:
80105479:	6a 00                	push   $0x0
8010547b:	6a 3c                	push   $0x3c
8010547d:	e9 00 f9 ff ff       	jmp    80104d82 <alltraps>

80105482 <vector61>:
80105482:	6a 00                	push   $0x0
80105484:	6a 3d                	push   $0x3d
80105486:	e9 f7 f8 ff ff       	jmp    80104d82 <alltraps>

8010548b <vector62>:
8010548b:	6a 00                	push   $0x0
8010548d:	6a 3e                	push   $0x3e
8010548f:	e9 ee f8 ff ff       	jmp    80104d82 <alltraps>

80105494 <vector63>:
80105494:	6a 00                	push   $0x0
80105496:	6a 3f                	push   $0x3f
80105498:	e9 e5 f8 ff ff       	jmp    80104d82 <alltraps>

8010549d <vector64>:
8010549d:	6a 00                	push   $0x0
8010549f:	6a 40                	push   $0x40
801054a1:	e9 dc f8 ff ff       	jmp    80104d82 <alltraps>

801054a6 <vector65>:
801054a6:	6a 00                	push   $0x0
801054a8:	6a 41                	push   $0x41
801054aa:	e9 d3 f8 ff ff       	jmp    80104d82 <alltraps>

801054af <vector66>:
801054af:	6a 00                	push   $0x0
801054b1:	6a 42                	push   $0x42
801054b3:	e9 ca f8 ff ff       	jmp    80104d82 <alltraps>

801054b8 <vector67>:
801054b8:	6a 00                	push   $0x0
801054ba:	6a 43                	push   $0x43
801054bc:	e9 c1 f8 ff ff       	jmp    80104d82 <alltraps>

801054c1 <vector68>:
801054c1:	6a 00                	push   $0x0
801054c3:	6a 44                	push   $0x44
801054c5:	e9 b8 f8 ff ff       	jmp    80104d82 <alltraps>

801054ca <vector69>:
801054ca:	6a 00                	push   $0x0
801054cc:	6a 45                	push   $0x45
801054ce:	e9 af f8 ff ff       	jmp    80104d82 <alltraps>

801054d3 <vector70>:
801054d3:	6a 00                	push   $0x0
801054d5:	6a 46                	push   $0x46
801054d7:	e9 a6 f8 ff ff       	jmp    80104d82 <alltraps>

801054dc <vector71>:
801054dc:	6a 00                	push   $0x0
801054de:	6a 47                	push   $0x47
801054e0:	e9 9d f8 ff ff       	jmp    80104d82 <alltraps>

801054e5 <vector72>:
801054e5:	6a 00                	push   $0x0
801054e7:	6a 48                	push   $0x48
801054e9:	e9 94 f8 ff ff       	jmp    80104d82 <alltraps>

801054ee <vector73>:
801054ee:	6a 00                	push   $0x0
801054f0:	6a 49                	push   $0x49
801054f2:	e9 8b f8 ff ff       	jmp    80104d82 <alltraps>

801054f7 <vector74>:
801054f7:	6a 00                	push   $0x0
801054f9:	6a 4a                	push   $0x4a
801054fb:	e9 82 f8 ff ff       	jmp    80104d82 <alltraps>

80105500 <vector75>:
80105500:	6a 00                	push   $0x0
80105502:	6a 4b                	push   $0x4b
80105504:	e9 79 f8 ff ff       	jmp    80104d82 <alltraps>

80105509 <vector76>:
80105509:	6a 00                	push   $0x0
8010550b:	6a 4c                	push   $0x4c
8010550d:	e9 70 f8 ff ff       	jmp    80104d82 <alltraps>

80105512 <vector77>:
80105512:	6a 00                	push   $0x0
80105514:	6a 4d                	push   $0x4d
80105516:	e9 67 f8 ff ff       	jmp    80104d82 <alltraps>

8010551b <vector78>:
8010551b:	6a 00                	push   $0x0
8010551d:	6a 4e                	push   $0x4e
8010551f:	e9 5e f8 ff ff       	jmp    80104d82 <alltraps>

80105524 <vector79>:
80105524:	6a 00                	push   $0x0
80105526:	6a 4f                	push   $0x4f
80105528:	e9 55 f8 ff ff       	jmp    80104d82 <alltraps>

8010552d <vector80>:
8010552d:	6a 00                	push   $0x0
8010552f:	6a 50                	push   $0x50
80105531:	e9 4c f8 ff ff       	jmp    80104d82 <alltraps>

80105536 <vector81>:
80105536:	6a 00                	push   $0x0
80105538:	6a 51                	push   $0x51
8010553a:	e9 43 f8 ff ff       	jmp    80104d82 <alltraps>

8010553f <vector82>:
8010553f:	6a 00                	push   $0x0
80105541:	6a 52                	push   $0x52
80105543:	e9 3a f8 ff ff       	jmp    80104d82 <alltraps>

80105548 <vector83>:
80105548:	6a 00                	push   $0x0
8010554a:	6a 53                	push   $0x53
8010554c:	e9 31 f8 ff ff       	jmp    80104d82 <alltraps>

80105551 <vector84>:
80105551:	6a 00                	push   $0x0
80105553:	6a 54                	push   $0x54
80105555:	e9 28 f8 ff ff       	jmp    80104d82 <alltraps>

8010555a <vector85>:
8010555a:	6a 00                	push   $0x0
8010555c:	6a 55                	push   $0x55
8010555e:	e9 1f f8 ff ff       	jmp    80104d82 <alltraps>

80105563 <vector86>:
80105563:	6a 00                	push   $0x0
80105565:	6a 56                	push   $0x56
80105567:	e9 16 f8 ff ff       	jmp    80104d82 <alltraps>

8010556c <vector87>:
8010556c:	6a 00                	push   $0x0
8010556e:	6a 57                	push   $0x57
80105570:	e9 0d f8 ff ff       	jmp    80104d82 <alltraps>

80105575 <vector88>:
80105575:	6a 00                	push   $0x0
80105577:	6a 58                	push   $0x58
80105579:	e9 04 f8 ff ff       	jmp    80104d82 <alltraps>

8010557e <vector89>:
8010557e:	6a 00                	push   $0x0
80105580:	6a 59                	push   $0x59
80105582:	e9 fb f7 ff ff       	jmp    80104d82 <alltraps>

80105587 <vector90>:
80105587:	6a 00                	push   $0x0
80105589:	6a 5a                	push   $0x5a
8010558b:	e9 f2 f7 ff ff       	jmp    80104d82 <alltraps>

80105590 <vector91>:
80105590:	6a 00                	push   $0x0
80105592:	6a 5b                	push   $0x5b
80105594:	e9 e9 f7 ff ff       	jmp    80104d82 <alltraps>

80105599 <vector92>:
80105599:	6a 00                	push   $0x0
8010559b:	6a 5c                	push   $0x5c
8010559d:	e9 e0 f7 ff ff       	jmp    80104d82 <alltraps>

801055a2 <vector93>:
801055a2:	6a 00                	push   $0x0
801055a4:	6a 5d                	push   $0x5d
801055a6:	e9 d7 f7 ff ff       	jmp    80104d82 <alltraps>

801055ab <vector94>:
801055ab:	6a 00                	push   $0x0
801055ad:	6a 5e                	push   $0x5e
801055af:	e9 ce f7 ff ff       	jmp    80104d82 <alltraps>

801055b4 <vector95>:
801055b4:	6a 00                	push   $0x0
801055b6:	6a 5f                	push   $0x5f
801055b8:	e9 c5 f7 ff ff       	jmp    80104d82 <alltraps>

801055bd <vector96>:
801055bd:	6a 00                	push   $0x0
801055bf:	6a 60                	push   $0x60
801055c1:	e9 bc f7 ff ff       	jmp    80104d82 <alltraps>

801055c6 <vector97>:
801055c6:	6a 00                	push   $0x0
801055c8:	6a 61                	push   $0x61
801055ca:	e9 b3 f7 ff ff       	jmp    80104d82 <alltraps>

801055cf <vector98>:
801055cf:	6a 00                	push   $0x0
801055d1:	6a 62                	push   $0x62
801055d3:	e9 aa f7 ff ff       	jmp    80104d82 <alltraps>

801055d8 <vector99>:
801055d8:	6a 00                	push   $0x0
801055da:	6a 63                	push   $0x63
801055dc:	e9 a1 f7 ff ff       	jmp    80104d82 <alltraps>

801055e1 <vector100>:
801055e1:	6a 00                	push   $0x0
801055e3:	6a 64                	push   $0x64
801055e5:	e9 98 f7 ff ff       	jmp    80104d82 <alltraps>

801055ea <vector101>:
801055ea:	6a 00                	push   $0x0
801055ec:	6a 65                	push   $0x65
801055ee:	e9 8f f7 ff ff       	jmp    80104d82 <alltraps>

801055f3 <vector102>:
801055f3:	6a 00                	push   $0x0
801055f5:	6a 66                	push   $0x66
801055f7:	e9 86 f7 ff ff       	jmp    80104d82 <alltraps>

801055fc <vector103>:
801055fc:	6a 00                	push   $0x0
801055fe:	6a 67                	push   $0x67
80105600:	e9 7d f7 ff ff       	jmp    80104d82 <alltraps>

80105605 <vector104>:
80105605:	6a 00                	push   $0x0
80105607:	6a 68                	push   $0x68
80105609:	e9 74 f7 ff ff       	jmp    80104d82 <alltraps>

8010560e <vector105>:
8010560e:	6a 00                	push   $0x0
80105610:	6a 69                	push   $0x69
80105612:	e9 6b f7 ff ff       	jmp    80104d82 <alltraps>

80105617 <vector106>:
80105617:	6a 00                	push   $0x0
80105619:	6a 6a                	push   $0x6a
8010561b:	e9 62 f7 ff ff       	jmp    80104d82 <alltraps>

80105620 <vector107>:
80105620:	6a 00                	push   $0x0
80105622:	6a 6b                	push   $0x6b
80105624:	e9 59 f7 ff ff       	jmp    80104d82 <alltraps>

80105629 <vector108>:
80105629:	6a 00                	push   $0x0
8010562b:	6a 6c                	push   $0x6c
8010562d:	e9 50 f7 ff ff       	jmp    80104d82 <alltraps>

80105632 <vector109>:
80105632:	6a 00                	push   $0x0
80105634:	6a 6d                	push   $0x6d
80105636:	e9 47 f7 ff ff       	jmp    80104d82 <alltraps>

8010563b <vector110>:
8010563b:	6a 00                	push   $0x0
8010563d:	6a 6e                	push   $0x6e
8010563f:	e9 3e f7 ff ff       	jmp    80104d82 <alltraps>

80105644 <vector111>:
80105644:	6a 00                	push   $0x0
80105646:	6a 6f                	push   $0x6f
80105648:	e9 35 f7 ff ff       	jmp    80104d82 <alltraps>

8010564d <vector112>:
8010564d:	6a 00                	push   $0x0
8010564f:	6a 70                	push   $0x70
80105651:	e9 2c f7 ff ff       	jmp    80104d82 <alltraps>

80105656 <vector113>:
80105656:	6a 00                	push   $0x0
80105658:	6a 71                	push   $0x71
8010565a:	e9 23 f7 ff ff       	jmp    80104d82 <alltraps>

8010565f <vector114>:
8010565f:	6a 00                	push   $0x0
80105661:	6a 72                	push   $0x72
80105663:	e9 1a f7 ff ff       	jmp    80104d82 <alltraps>

80105668 <vector115>:
80105668:	6a 00                	push   $0x0
8010566a:	6a 73                	push   $0x73
8010566c:	e9 11 f7 ff ff       	jmp    80104d82 <alltraps>

80105671 <vector116>:
80105671:	6a 00                	push   $0x0
80105673:	6a 74                	push   $0x74
80105675:	e9 08 f7 ff ff       	jmp    80104d82 <alltraps>

8010567a <vector117>:
8010567a:	6a 00                	push   $0x0
8010567c:	6a 75                	push   $0x75
8010567e:	e9 ff f6 ff ff       	jmp    80104d82 <alltraps>

80105683 <vector118>:
80105683:	6a 00                	push   $0x0
80105685:	6a 76                	push   $0x76
80105687:	e9 f6 f6 ff ff       	jmp    80104d82 <alltraps>

8010568c <vector119>:
8010568c:	6a 00                	push   $0x0
8010568e:	6a 77                	push   $0x77
80105690:	e9 ed f6 ff ff       	jmp    80104d82 <alltraps>

80105695 <vector120>:
80105695:	6a 00                	push   $0x0
80105697:	6a 78                	push   $0x78
80105699:	e9 e4 f6 ff ff       	jmp    80104d82 <alltraps>

8010569e <vector121>:
8010569e:	6a 00                	push   $0x0
801056a0:	6a 79                	push   $0x79
801056a2:	e9 db f6 ff ff       	jmp    80104d82 <alltraps>

801056a7 <vector122>:
801056a7:	6a 00                	push   $0x0
801056a9:	6a 7a                	push   $0x7a
801056ab:	e9 d2 f6 ff ff       	jmp    80104d82 <alltraps>

801056b0 <vector123>:
801056b0:	6a 00                	push   $0x0
801056b2:	6a 7b                	push   $0x7b
801056b4:	e9 c9 f6 ff ff       	jmp    80104d82 <alltraps>

801056b9 <vector124>:
801056b9:	6a 00                	push   $0x0
801056bb:	6a 7c                	push   $0x7c
801056bd:	e9 c0 f6 ff ff       	jmp    80104d82 <alltraps>

801056c2 <vector125>:
801056c2:	6a 00                	push   $0x0
801056c4:	6a 7d                	push   $0x7d
801056c6:	e9 b7 f6 ff ff       	jmp    80104d82 <alltraps>

801056cb <vector126>:
801056cb:	6a 00                	push   $0x0
801056cd:	6a 7e                	push   $0x7e
801056cf:	e9 ae f6 ff ff       	jmp    80104d82 <alltraps>

801056d4 <vector127>:
801056d4:	6a 00                	push   $0x0
801056d6:	6a 7f                	push   $0x7f
801056d8:	e9 a5 f6 ff ff       	jmp    80104d82 <alltraps>

801056dd <vector128>:
801056dd:	6a 00                	push   $0x0
801056df:	68 80 00 00 00       	push   $0x80
801056e4:	e9 99 f6 ff ff       	jmp    80104d82 <alltraps>

801056e9 <vector129>:
801056e9:	6a 00                	push   $0x0
801056eb:	68 81 00 00 00       	push   $0x81
801056f0:	e9 8d f6 ff ff       	jmp    80104d82 <alltraps>

801056f5 <vector130>:
801056f5:	6a 00                	push   $0x0
801056f7:	68 82 00 00 00       	push   $0x82
801056fc:	e9 81 f6 ff ff       	jmp    80104d82 <alltraps>

80105701 <vector131>:
80105701:	6a 00                	push   $0x0
80105703:	68 83 00 00 00       	push   $0x83
80105708:	e9 75 f6 ff ff       	jmp    80104d82 <alltraps>

8010570d <vector132>:
8010570d:	6a 00                	push   $0x0
8010570f:	68 84 00 00 00       	push   $0x84
80105714:	e9 69 f6 ff ff       	jmp    80104d82 <alltraps>

80105719 <vector133>:
80105719:	6a 00                	push   $0x0
8010571b:	68 85 00 00 00       	push   $0x85
80105720:	e9 5d f6 ff ff       	jmp    80104d82 <alltraps>

80105725 <vector134>:
80105725:	6a 00                	push   $0x0
80105727:	68 86 00 00 00       	push   $0x86
8010572c:	e9 51 f6 ff ff       	jmp    80104d82 <alltraps>

80105731 <vector135>:
80105731:	6a 00                	push   $0x0
80105733:	68 87 00 00 00       	push   $0x87
80105738:	e9 45 f6 ff ff       	jmp    80104d82 <alltraps>

8010573d <vector136>:
8010573d:	6a 00                	push   $0x0
8010573f:	68 88 00 00 00       	push   $0x88
80105744:	e9 39 f6 ff ff       	jmp    80104d82 <alltraps>

80105749 <vector137>:
80105749:	6a 00                	push   $0x0
8010574b:	68 89 00 00 00       	push   $0x89
80105750:	e9 2d f6 ff ff       	jmp    80104d82 <alltraps>

80105755 <vector138>:
80105755:	6a 00                	push   $0x0
80105757:	68 8a 00 00 00       	push   $0x8a
8010575c:	e9 21 f6 ff ff       	jmp    80104d82 <alltraps>

80105761 <vector139>:
80105761:	6a 00                	push   $0x0
80105763:	68 8b 00 00 00       	push   $0x8b
80105768:	e9 15 f6 ff ff       	jmp    80104d82 <alltraps>

8010576d <vector140>:
8010576d:	6a 00                	push   $0x0
8010576f:	68 8c 00 00 00       	push   $0x8c
80105774:	e9 09 f6 ff ff       	jmp    80104d82 <alltraps>

80105779 <vector141>:
80105779:	6a 00                	push   $0x0
8010577b:	68 8d 00 00 00       	push   $0x8d
80105780:	e9 fd f5 ff ff       	jmp    80104d82 <alltraps>

80105785 <vector142>:
80105785:	6a 00                	push   $0x0
80105787:	68 8e 00 00 00       	push   $0x8e
8010578c:	e9 f1 f5 ff ff       	jmp    80104d82 <alltraps>

80105791 <vector143>:
80105791:	6a 00                	push   $0x0
80105793:	68 8f 00 00 00       	push   $0x8f
80105798:	e9 e5 f5 ff ff       	jmp    80104d82 <alltraps>

8010579d <vector144>:
8010579d:	6a 00                	push   $0x0
8010579f:	68 90 00 00 00       	push   $0x90
801057a4:	e9 d9 f5 ff ff       	jmp    80104d82 <alltraps>

801057a9 <vector145>:
801057a9:	6a 00                	push   $0x0
801057ab:	68 91 00 00 00       	push   $0x91
801057b0:	e9 cd f5 ff ff       	jmp    80104d82 <alltraps>

801057b5 <vector146>:
801057b5:	6a 00                	push   $0x0
801057b7:	68 92 00 00 00       	push   $0x92
801057bc:	e9 c1 f5 ff ff       	jmp    80104d82 <alltraps>

801057c1 <vector147>:
801057c1:	6a 00                	push   $0x0
801057c3:	68 93 00 00 00       	push   $0x93
801057c8:	e9 b5 f5 ff ff       	jmp    80104d82 <alltraps>

801057cd <vector148>:
801057cd:	6a 00                	push   $0x0
801057cf:	68 94 00 00 00       	push   $0x94
801057d4:	e9 a9 f5 ff ff       	jmp    80104d82 <alltraps>

801057d9 <vector149>:
801057d9:	6a 00                	push   $0x0
801057db:	68 95 00 00 00       	push   $0x95
801057e0:	e9 9d f5 ff ff       	jmp    80104d82 <alltraps>

801057e5 <vector150>:
801057e5:	6a 00                	push   $0x0
801057e7:	68 96 00 00 00       	push   $0x96
801057ec:	e9 91 f5 ff ff       	jmp    80104d82 <alltraps>

801057f1 <vector151>:
801057f1:	6a 00                	push   $0x0
801057f3:	68 97 00 00 00       	push   $0x97
801057f8:	e9 85 f5 ff ff       	jmp    80104d82 <alltraps>

801057fd <vector152>:
801057fd:	6a 00                	push   $0x0
801057ff:	68 98 00 00 00       	push   $0x98
80105804:	e9 79 f5 ff ff       	jmp    80104d82 <alltraps>

80105809 <vector153>:
80105809:	6a 00                	push   $0x0
8010580b:	68 99 00 00 00       	push   $0x99
80105810:	e9 6d f5 ff ff       	jmp    80104d82 <alltraps>

80105815 <vector154>:
80105815:	6a 00                	push   $0x0
80105817:	68 9a 00 00 00       	push   $0x9a
8010581c:	e9 61 f5 ff ff       	jmp    80104d82 <alltraps>

80105821 <vector155>:
80105821:	6a 00                	push   $0x0
80105823:	68 9b 00 00 00       	push   $0x9b
80105828:	e9 55 f5 ff ff       	jmp    80104d82 <alltraps>

8010582d <vector156>:
8010582d:	6a 00                	push   $0x0
8010582f:	68 9c 00 00 00       	push   $0x9c
80105834:	e9 49 f5 ff ff       	jmp    80104d82 <alltraps>

80105839 <vector157>:
80105839:	6a 00                	push   $0x0
8010583b:	68 9d 00 00 00       	push   $0x9d
80105840:	e9 3d f5 ff ff       	jmp    80104d82 <alltraps>

80105845 <vector158>:
80105845:	6a 00                	push   $0x0
80105847:	68 9e 00 00 00       	push   $0x9e
8010584c:	e9 31 f5 ff ff       	jmp    80104d82 <alltraps>

80105851 <vector159>:
80105851:	6a 00                	push   $0x0
80105853:	68 9f 00 00 00       	push   $0x9f
80105858:	e9 25 f5 ff ff       	jmp    80104d82 <alltraps>

8010585d <vector160>:
8010585d:	6a 00                	push   $0x0
8010585f:	68 a0 00 00 00       	push   $0xa0
80105864:	e9 19 f5 ff ff       	jmp    80104d82 <alltraps>

80105869 <vector161>:
80105869:	6a 00                	push   $0x0
8010586b:	68 a1 00 00 00       	push   $0xa1
80105870:	e9 0d f5 ff ff       	jmp    80104d82 <alltraps>

80105875 <vector162>:
80105875:	6a 00                	push   $0x0
80105877:	68 a2 00 00 00       	push   $0xa2
8010587c:	e9 01 f5 ff ff       	jmp    80104d82 <alltraps>

80105881 <vector163>:
80105881:	6a 00                	push   $0x0
80105883:	68 a3 00 00 00       	push   $0xa3
80105888:	e9 f5 f4 ff ff       	jmp    80104d82 <alltraps>

8010588d <vector164>:
8010588d:	6a 00                	push   $0x0
8010588f:	68 a4 00 00 00       	push   $0xa4
80105894:	e9 e9 f4 ff ff       	jmp    80104d82 <alltraps>

80105899 <vector165>:
80105899:	6a 00                	push   $0x0
8010589b:	68 a5 00 00 00       	push   $0xa5
801058a0:	e9 dd f4 ff ff       	jmp    80104d82 <alltraps>

801058a5 <vector166>:
801058a5:	6a 00                	push   $0x0
801058a7:	68 a6 00 00 00       	push   $0xa6
801058ac:	e9 d1 f4 ff ff       	jmp    80104d82 <alltraps>

801058b1 <vector167>:
801058b1:	6a 00                	push   $0x0
801058b3:	68 a7 00 00 00       	push   $0xa7
801058b8:	e9 c5 f4 ff ff       	jmp    80104d82 <alltraps>

801058bd <vector168>:
801058bd:	6a 00                	push   $0x0
801058bf:	68 a8 00 00 00       	push   $0xa8
801058c4:	e9 b9 f4 ff ff       	jmp    80104d82 <alltraps>

801058c9 <vector169>:
801058c9:	6a 00                	push   $0x0
801058cb:	68 a9 00 00 00       	push   $0xa9
801058d0:	e9 ad f4 ff ff       	jmp    80104d82 <alltraps>

801058d5 <vector170>:
801058d5:	6a 00                	push   $0x0
801058d7:	68 aa 00 00 00       	push   $0xaa
801058dc:	e9 a1 f4 ff ff       	jmp    80104d82 <alltraps>

801058e1 <vector171>:
801058e1:	6a 00                	push   $0x0
801058e3:	68 ab 00 00 00       	push   $0xab
801058e8:	e9 95 f4 ff ff       	jmp    80104d82 <alltraps>

801058ed <vector172>:
801058ed:	6a 00                	push   $0x0
801058ef:	68 ac 00 00 00       	push   $0xac
801058f4:	e9 89 f4 ff ff       	jmp    80104d82 <alltraps>

801058f9 <vector173>:
801058f9:	6a 00                	push   $0x0
801058fb:	68 ad 00 00 00       	push   $0xad
80105900:	e9 7d f4 ff ff       	jmp    80104d82 <alltraps>

80105905 <vector174>:
80105905:	6a 00                	push   $0x0
80105907:	68 ae 00 00 00       	push   $0xae
8010590c:	e9 71 f4 ff ff       	jmp    80104d82 <alltraps>

80105911 <vector175>:
80105911:	6a 00                	push   $0x0
80105913:	68 af 00 00 00       	push   $0xaf
80105918:	e9 65 f4 ff ff       	jmp    80104d82 <alltraps>

8010591d <vector176>:
8010591d:	6a 00                	push   $0x0
8010591f:	68 b0 00 00 00       	push   $0xb0
80105924:	e9 59 f4 ff ff       	jmp    80104d82 <alltraps>

80105929 <vector177>:
80105929:	6a 00                	push   $0x0
8010592b:	68 b1 00 00 00       	push   $0xb1
80105930:	e9 4d f4 ff ff       	jmp    80104d82 <alltraps>

80105935 <vector178>:
80105935:	6a 00                	push   $0x0
80105937:	68 b2 00 00 00       	push   $0xb2
8010593c:	e9 41 f4 ff ff       	jmp    80104d82 <alltraps>

80105941 <vector179>:
80105941:	6a 00                	push   $0x0
80105943:	68 b3 00 00 00       	push   $0xb3
80105948:	e9 35 f4 ff ff       	jmp    80104d82 <alltraps>

8010594d <vector180>:
8010594d:	6a 00                	push   $0x0
8010594f:	68 b4 00 00 00       	push   $0xb4
80105954:	e9 29 f4 ff ff       	jmp    80104d82 <alltraps>

80105959 <vector181>:
80105959:	6a 00                	push   $0x0
8010595b:	68 b5 00 00 00       	push   $0xb5
80105960:	e9 1d f4 ff ff       	jmp    80104d82 <alltraps>

80105965 <vector182>:
80105965:	6a 00                	push   $0x0
80105967:	68 b6 00 00 00       	push   $0xb6
8010596c:	e9 11 f4 ff ff       	jmp    80104d82 <alltraps>

80105971 <vector183>:
80105971:	6a 00                	push   $0x0
80105973:	68 b7 00 00 00       	push   $0xb7
80105978:	e9 05 f4 ff ff       	jmp    80104d82 <alltraps>

8010597d <vector184>:
8010597d:	6a 00                	push   $0x0
8010597f:	68 b8 00 00 00       	push   $0xb8
80105984:	e9 f9 f3 ff ff       	jmp    80104d82 <alltraps>

80105989 <vector185>:
80105989:	6a 00                	push   $0x0
8010598b:	68 b9 00 00 00       	push   $0xb9
80105990:	e9 ed f3 ff ff       	jmp    80104d82 <alltraps>

80105995 <vector186>:
80105995:	6a 00                	push   $0x0
80105997:	68 ba 00 00 00       	push   $0xba
8010599c:	e9 e1 f3 ff ff       	jmp    80104d82 <alltraps>

801059a1 <vector187>:
801059a1:	6a 00                	push   $0x0
801059a3:	68 bb 00 00 00       	push   $0xbb
801059a8:	e9 d5 f3 ff ff       	jmp    80104d82 <alltraps>

801059ad <vector188>:
801059ad:	6a 00                	push   $0x0
801059af:	68 bc 00 00 00       	push   $0xbc
801059b4:	e9 c9 f3 ff ff       	jmp    80104d82 <alltraps>

801059b9 <vector189>:
801059b9:	6a 00                	push   $0x0
801059bb:	68 bd 00 00 00       	push   $0xbd
801059c0:	e9 bd f3 ff ff       	jmp    80104d82 <alltraps>

801059c5 <vector190>:
801059c5:	6a 00                	push   $0x0
801059c7:	68 be 00 00 00       	push   $0xbe
801059cc:	e9 b1 f3 ff ff       	jmp    80104d82 <alltraps>

801059d1 <vector191>:
801059d1:	6a 00                	push   $0x0
801059d3:	68 bf 00 00 00       	push   $0xbf
801059d8:	e9 a5 f3 ff ff       	jmp    80104d82 <alltraps>

801059dd <vector192>:
801059dd:	6a 00                	push   $0x0
801059df:	68 c0 00 00 00       	push   $0xc0
801059e4:	e9 99 f3 ff ff       	jmp    80104d82 <alltraps>

801059e9 <vector193>:
801059e9:	6a 00                	push   $0x0
801059eb:	68 c1 00 00 00       	push   $0xc1
801059f0:	e9 8d f3 ff ff       	jmp    80104d82 <alltraps>

801059f5 <vector194>:
801059f5:	6a 00                	push   $0x0
801059f7:	68 c2 00 00 00       	push   $0xc2
801059fc:	e9 81 f3 ff ff       	jmp    80104d82 <alltraps>

80105a01 <vector195>:
80105a01:	6a 00                	push   $0x0
80105a03:	68 c3 00 00 00       	push   $0xc3
80105a08:	e9 75 f3 ff ff       	jmp    80104d82 <alltraps>

80105a0d <vector196>:
80105a0d:	6a 00                	push   $0x0
80105a0f:	68 c4 00 00 00       	push   $0xc4
80105a14:	e9 69 f3 ff ff       	jmp    80104d82 <alltraps>

80105a19 <vector197>:
80105a19:	6a 00                	push   $0x0
80105a1b:	68 c5 00 00 00       	push   $0xc5
80105a20:	e9 5d f3 ff ff       	jmp    80104d82 <alltraps>

80105a25 <vector198>:
80105a25:	6a 00                	push   $0x0
80105a27:	68 c6 00 00 00       	push   $0xc6
80105a2c:	e9 51 f3 ff ff       	jmp    80104d82 <alltraps>

80105a31 <vector199>:
80105a31:	6a 00                	push   $0x0
80105a33:	68 c7 00 00 00       	push   $0xc7
80105a38:	e9 45 f3 ff ff       	jmp    80104d82 <alltraps>

80105a3d <vector200>:
80105a3d:	6a 00                	push   $0x0
80105a3f:	68 c8 00 00 00       	push   $0xc8
80105a44:	e9 39 f3 ff ff       	jmp    80104d82 <alltraps>

80105a49 <vector201>:
80105a49:	6a 00                	push   $0x0
80105a4b:	68 c9 00 00 00       	push   $0xc9
80105a50:	e9 2d f3 ff ff       	jmp    80104d82 <alltraps>

80105a55 <vector202>:
80105a55:	6a 00                	push   $0x0
80105a57:	68 ca 00 00 00       	push   $0xca
80105a5c:	e9 21 f3 ff ff       	jmp    80104d82 <alltraps>

80105a61 <vector203>:
80105a61:	6a 00                	push   $0x0
80105a63:	68 cb 00 00 00       	push   $0xcb
80105a68:	e9 15 f3 ff ff       	jmp    80104d82 <alltraps>

80105a6d <vector204>:
80105a6d:	6a 00                	push   $0x0
80105a6f:	68 cc 00 00 00       	push   $0xcc
80105a74:	e9 09 f3 ff ff       	jmp    80104d82 <alltraps>

80105a79 <vector205>:
80105a79:	6a 00                	push   $0x0
80105a7b:	68 cd 00 00 00       	push   $0xcd
80105a80:	e9 fd f2 ff ff       	jmp    80104d82 <alltraps>

80105a85 <vector206>:
80105a85:	6a 00                	push   $0x0
80105a87:	68 ce 00 00 00       	push   $0xce
80105a8c:	e9 f1 f2 ff ff       	jmp    80104d82 <alltraps>

80105a91 <vector207>:
80105a91:	6a 00                	push   $0x0
80105a93:	68 cf 00 00 00       	push   $0xcf
80105a98:	e9 e5 f2 ff ff       	jmp    80104d82 <alltraps>

80105a9d <vector208>:
80105a9d:	6a 00                	push   $0x0
80105a9f:	68 d0 00 00 00       	push   $0xd0
80105aa4:	e9 d9 f2 ff ff       	jmp    80104d82 <alltraps>

80105aa9 <vector209>:
80105aa9:	6a 00                	push   $0x0
80105aab:	68 d1 00 00 00       	push   $0xd1
80105ab0:	e9 cd f2 ff ff       	jmp    80104d82 <alltraps>

80105ab5 <vector210>:
80105ab5:	6a 00                	push   $0x0
80105ab7:	68 d2 00 00 00       	push   $0xd2
80105abc:	e9 c1 f2 ff ff       	jmp    80104d82 <alltraps>

80105ac1 <vector211>:
80105ac1:	6a 00                	push   $0x0
80105ac3:	68 d3 00 00 00       	push   $0xd3
80105ac8:	e9 b5 f2 ff ff       	jmp    80104d82 <alltraps>

80105acd <vector212>:
80105acd:	6a 00                	push   $0x0
80105acf:	68 d4 00 00 00       	push   $0xd4
80105ad4:	e9 a9 f2 ff ff       	jmp    80104d82 <alltraps>

80105ad9 <vector213>:
80105ad9:	6a 00                	push   $0x0
80105adb:	68 d5 00 00 00       	push   $0xd5
80105ae0:	e9 9d f2 ff ff       	jmp    80104d82 <alltraps>

80105ae5 <vector214>:
80105ae5:	6a 00                	push   $0x0
80105ae7:	68 d6 00 00 00       	push   $0xd6
80105aec:	e9 91 f2 ff ff       	jmp    80104d82 <alltraps>

80105af1 <vector215>:
80105af1:	6a 00                	push   $0x0
80105af3:	68 d7 00 00 00       	push   $0xd7
80105af8:	e9 85 f2 ff ff       	jmp    80104d82 <alltraps>

80105afd <vector216>:
80105afd:	6a 00                	push   $0x0
80105aff:	68 d8 00 00 00       	push   $0xd8
80105b04:	e9 79 f2 ff ff       	jmp    80104d82 <alltraps>

80105b09 <vector217>:
80105b09:	6a 00                	push   $0x0
80105b0b:	68 d9 00 00 00       	push   $0xd9
80105b10:	e9 6d f2 ff ff       	jmp    80104d82 <alltraps>

80105b15 <vector218>:
80105b15:	6a 00                	push   $0x0
80105b17:	68 da 00 00 00       	push   $0xda
80105b1c:	e9 61 f2 ff ff       	jmp    80104d82 <alltraps>

80105b21 <vector219>:
80105b21:	6a 00                	push   $0x0
80105b23:	68 db 00 00 00       	push   $0xdb
80105b28:	e9 55 f2 ff ff       	jmp    80104d82 <alltraps>

80105b2d <vector220>:
80105b2d:	6a 00                	push   $0x0
80105b2f:	68 dc 00 00 00       	push   $0xdc
80105b34:	e9 49 f2 ff ff       	jmp    80104d82 <alltraps>

80105b39 <vector221>:
80105b39:	6a 00                	push   $0x0
80105b3b:	68 dd 00 00 00       	push   $0xdd
80105b40:	e9 3d f2 ff ff       	jmp    80104d82 <alltraps>

80105b45 <vector222>:
80105b45:	6a 00                	push   $0x0
80105b47:	68 de 00 00 00       	push   $0xde
80105b4c:	e9 31 f2 ff ff       	jmp    80104d82 <alltraps>

80105b51 <vector223>:
80105b51:	6a 00                	push   $0x0
80105b53:	68 df 00 00 00       	push   $0xdf
80105b58:	e9 25 f2 ff ff       	jmp    80104d82 <alltraps>

80105b5d <vector224>:
80105b5d:	6a 00                	push   $0x0
80105b5f:	68 e0 00 00 00       	push   $0xe0
80105b64:	e9 19 f2 ff ff       	jmp    80104d82 <alltraps>

80105b69 <vector225>:
80105b69:	6a 00                	push   $0x0
80105b6b:	68 e1 00 00 00       	push   $0xe1
80105b70:	e9 0d f2 ff ff       	jmp    80104d82 <alltraps>

80105b75 <vector226>:
80105b75:	6a 00                	push   $0x0
80105b77:	68 e2 00 00 00       	push   $0xe2
80105b7c:	e9 01 f2 ff ff       	jmp    80104d82 <alltraps>

80105b81 <vector227>:
80105b81:	6a 00                	push   $0x0
80105b83:	68 e3 00 00 00       	push   $0xe3
80105b88:	e9 f5 f1 ff ff       	jmp    80104d82 <alltraps>

80105b8d <vector228>:
80105b8d:	6a 00                	push   $0x0
80105b8f:	68 e4 00 00 00       	push   $0xe4
80105b94:	e9 e9 f1 ff ff       	jmp    80104d82 <alltraps>

80105b99 <vector229>:
80105b99:	6a 00                	push   $0x0
80105b9b:	68 e5 00 00 00       	push   $0xe5
80105ba0:	e9 dd f1 ff ff       	jmp    80104d82 <alltraps>

80105ba5 <vector230>:
80105ba5:	6a 00                	push   $0x0
80105ba7:	68 e6 00 00 00       	push   $0xe6
80105bac:	e9 d1 f1 ff ff       	jmp    80104d82 <alltraps>

80105bb1 <vector231>:
80105bb1:	6a 00                	push   $0x0
80105bb3:	68 e7 00 00 00       	push   $0xe7
80105bb8:	e9 c5 f1 ff ff       	jmp    80104d82 <alltraps>

80105bbd <vector232>:
80105bbd:	6a 00                	push   $0x0
80105bbf:	68 e8 00 00 00       	push   $0xe8
80105bc4:	e9 b9 f1 ff ff       	jmp    80104d82 <alltraps>

80105bc9 <vector233>:
80105bc9:	6a 00                	push   $0x0
80105bcb:	68 e9 00 00 00       	push   $0xe9
80105bd0:	e9 ad f1 ff ff       	jmp    80104d82 <alltraps>

80105bd5 <vector234>:
80105bd5:	6a 00                	push   $0x0
80105bd7:	68 ea 00 00 00       	push   $0xea
80105bdc:	e9 a1 f1 ff ff       	jmp    80104d82 <alltraps>

80105be1 <vector235>:
80105be1:	6a 00                	push   $0x0
80105be3:	68 eb 00 00 00       	push   $0xeb
80105be8:	e9 95 f1 ff ff       	jmp    80104d82 <alltraps>

80105bed <vector236>:
80105bed:	6a 00                	push   $0x0
80105bef:	68 ec 00 00 00       	push   $0xec
80105bf4:	e9 89 f1 ff ff       	jmp    80104d82 <alltraps>

80105bf9 <vector237>:
80105bf9:	6a 00                	push   $0x0
80105bfb:	68 ed 00 00 00       	push   $0xed
80105c00:	e9 7d f1 ff ff       	jmp    80104d82 <alltraps>

80105c05 <vector238>:
80105c05:	6a 00                	push   $0x0
80105c07:	68 ee 00 00 00       	push   $0xee
80105c0c:	e9 71 f1 ff ff       	jmp    80104d82 <alltraps>

80105c11 <vector239>:
80105c11:	6a 00                	push   $0x0
80105c13:	68 ef 00 00 00       	push   $0xef
80105c18:	e9 65 f1 ff ff       	jmp    80104d82 <alltraps>

80105c1d <vector240>:
80105c1d:	6a 00                	push   $0x0
80105c1f:	68 f0 00 00 00       	push   $0xf0
80105c24:	e9 59 f1 ff ff       	jmp    80104d82 <alltraps>

80105c29 <vector241>:
80105c29:	6a 00                	push   $0x0
80105c2b:	68 f1 00 00 00       	push   $0xf1
80105c30:	e9 4d f1 ff ff       	jmp    80104d82 <alltraps>

80105c35 <vector242>:
80105c35:	6a 00                	push   $0x0
80105c37:	68 f2 00 00 00       	push   $0xf2
80105c3c:	e9 41 f1 ff ff       	jmp    80104d82 <alltraps>

80105c41 <vector243>:
80105c41:	6a 00                	push   $0x0
80105c43:	68 f3 00 00 00       	push   $0xf3
80105c48:	e9 35 f1 ff ff       	jmp    80104d82 <alltraps>

80105c4d <vector244>:
80105c4d:	6a 00                	push   $0x0
80105c4f:	68 f4 00 00 00       	push   $0xf4
80105c54:	e9 29 f1 ff ff       	jmp    80104d82 <alltraps>

80105c59 <vector245>:
80105c59:	6a 00                	push   $0x0
80105c5b:	68 f5 00 00 00       	push   $0xf5
80105c60:	e9 1d f1 ff ff       	jmp    80104d82 <alltraps>

80105c65 <vector246>:
80105c65:	6a 00                	push   $0x0
80105c67:	68 f6 00 00 00       	push   $0xf6
80105c6c:	e9 11 f1 ff ff       	jmp    80104d82 <alltraps>

80105c71 <vector247>:
80105c71:	6a 00                	push   $0x0
80105c73:	68 f7 00 00 00       	push   $0xf7
80105c78:	e9 05 f1 ff ff       	jmp    80104d82 <alltraps>

80105c7d <vector248>:
80105c7d:	6a 00                	push   $0x0
80105c7f:	68 f8 00 00 00       	push   $0xf8
80105c84:	e9 f9 f0 ff ff       	jmp    80104d82 <alltraps>

80105c89 <vector249>:
80105c89:	6a 00                	push   $0x0
80105c8b:	68 f9 00 00 00       	push   $0xf9
80105c90:	e9 ed f0 ff ff       	jmp    80104d82 <alltraps>

80105c95 <vector250>:
80105c95:	6a 00                	push   $0x0
80105c97:	68 fa 00 00 00       	push   $0xfa
80105c9c:	e9 e1 f0 ff ff       	jmp    80104d82 <alltraps>

80105ca1 <vector251>:
80105ca1:	6a 00                	push   $0x0
80105ca3:	68 fb 00 00 00       	push   $0xfb
80105ca8:	e9 d5 f0 ff ff       	jmp    80104d82 <alltraps>

80105cad <vector252>:
80105cad:	6a 00                	push   $0x0
80105caf:	68 fc 00 00 00       	push   $0xfc
80105cb4:	e9 c9 f0 ff ff       	jmp    80104d82 <alltraps>

80105cb9 <vector253>:
80105cb9:	6a 00                	push   $0x0
80105cbb:	68 fd 00 00 00       	push   $0xfd
80105cc0:	e9 bd f0 ff ff       	jmp    80104d82 <alltraps>

80105cc5 <vector254>:
80105cc5:	6a 00                	push   $0x0
80105cc7:	68 fe 00 00 00       	push   $0xfe
80105ccc:	e9 b1 f0 ff ff       	jmp    80104d82 <alltraps>

80105cd1 <vector255>:
80105cd1:	6a 00                	push   $0x0
80105cd3:	68 ff 00 00 00       	push   $0xff
80105cd8:	e9 a5 f0 ff ff       	jmp    80104d82 <alltraps>

80105cdd <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80105cdd:	55                   	push   %ebp
80105cde:	89 e5                	mov    %esp,%ebp
80105ce0:	57                   	push   %edi
80105ce1:	56                   	push   %esi
80105ce2:	53                   	push   %ebx
80105ce3:	83 ec 0c             	sub    $0xc,%esp
80105ce6:	89 d6                	mov    %edx,%esi
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80105ce8:	c1 ea 16             	shr    $0x16,%edx
80105ceb:	8d 3c 90             	lea    (%eax,%edx,4),%edi
  if(*pde & PTE_P){
80105cee:	8b 1f                	mov    (%edi),%ebx
80105cf0:	f6 c3 01             	test   $0x1,%bl
80105cf3:	74 22                	je     80105d17 <walkpgdir+0x3a>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80105cf5:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80105cfb:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80105d01:	c1 ee 0c             	shr    $0xc,%esi
80105d04:	81 e6 ff 03 00 00    	and    $0x3ff,%esi
80105d0a:	8d 1c b3             	lea    (%ebx,%esi,4),%ebx
}
80105d0d:	89 d8                	mov    %ebx,%eax
80105d0f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105d12:	5b                   	pop    %ebx
80105d13:	5e                   	pop    %esi
80105d14:	5f                   	pop    %edi
80105d15:	5d                   	pop    %ebp
80105d16:	c3                   	ret    
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80105d17:	85 c9                	test   %ecx,%ecx
80105d19:	74 2b                	je     80105d46 <walkpgdir+0x69>
80105d1b:	e8 9b c3 ff ff       	call   801020bb <kalloc>
80105d20:	89 c3                	mov    %eax,%ebx
80105d22:	85 c0                	test   %eax,%eax
80105d24:	74 e7                	je     80105d0d <walkpgdir+0x30>
    memset(pgtab, 0, PGSIZE);
80105d26:	83 ec 04             	sub    $0x4,%esp
80105d29:	68 00 10 00 00       	push   $0x1000
80105d2e:	6a 00                	push   $0x0
80105d30:	50                   	push   %eax
80105d31:	e8 0b df ff ff       	call   80103c41 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80105d36:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80105d3c:	83 c8 07             	or     $0x7,%eax
80105d3f:	89 07                	mov    %eax,(%edi)
80105d41:	83 c4 10             	add    $0x10,%esp
80105d44:	eb bb                	jmp    80105d01 <walkpgdir+0x24>
      return 0;
80105d46:	bb 00 00 00 00       	mov    $0x0,%ebx
80105d4b:	eb c0                	jmp    80105d0d <walkpgdir+0x30>

80105d4d <seginit>:
{
80105d4d:	55                   	push   %ebp
80105d4e:	89 e5                	mov    %esp,%ebp
80105d50:	53                   	push   %ebx
80105d51:	83 ec 14             	sub    $0x14,%esp
  c = &cpus[cpuid()];
80105d54:	e8 82 d4 ff ff       	call   801031db <cpuid>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80105d59:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80105d5f:	66 c7 80 f8 17 11 80 	movw   $0xffff,-0x7feee808(%eax)
80105d66:	ff ff 
80105d68:	66 c7 80 fa 17 11 80 	movw   $0x0,-0x7feee806(%eax)
80105d6f:	00 00 
80105d71:	c6 80 fc 17 11 80 00 	movb   $0x0,-0x7feee804(%eax)
80105d78:	0f b6 88 fd 17 11 80 	movzbl -0x7feee803(%eax),%ecx
80105d7f:	83 e1 f0             	and    $0xfffffff0,%ecx
80105d82:	83 c9 1a             	or     $0x1a,%ecx
80105d85:	83 e1 9f             	and    $0xffffff9f,%ecx
80105d88:	83 c9 80             	or     $0xffffff80,%ecx
80105d8b:	88 88 fd 17 11 80    	mov    %cl,-0x7feee803(%eax)
80105d91:	0f b6 88 fe 17 11 80 	movzbl -0x7feee802(%eax),%ecx
80105d98:	83 c9 0f             	or     $0xf,%ecx
80105d9b:	83 e1 cf             	and    $0xffffffcf,%ecx
80105d9e:	83 c9 c0             	or     $0xffffffc0,%ecx
80105da1:	88 88 fe 17 11 80    	mov    %cl,-0x7feee802(%eax)
80105da7:	c6 80 ff 17 11 80 00 	movb   $0x0,-0x7feee801(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80105dae:	66 c7 80 00 18 11 80 	movw   $0xffff,-0x7feee800(%eax)
80105db5:	ff ff 
80105db7:	66 c7 80 02 18 11 80 	movw   $0x0,-0x7feee7fe(%eax)
80105dbe:	00 00 
80105dc0:	c6 80 04 18 11 80 00 	movb   $0x0,-0x7feee7fc(%eax)
80105dc7:	0f b6 88 05 18 11 80 	movzbl -0x7feee7fb(%eax),%ecx
80105dce:	83 e1 f0             	and    $0xfffffff0,%ecx
80105dd1:	83 c9 12             	or     $0x12,%ecx
80105dd4:	83 e1 9f             	and    $0xffffff9f,%ecx
80105dd7:	83 c9 80             	or     $0xffffff80,%ecx
80105dda:	88 88 05 18 11 80    	mov    %cl,-0x7feee7fb(%eax)
80105de0:	0f b6 88 06 18 11 80 	movzbl -0x7feee7fa(%eax),%ecx
80105de7:	83 c9 0f             	or     $0xf,%ecx
80105dea:	83 e1 cf             	and    $0xffffffcf,%ecx
80105ded:	83 c9 c0             	or     $0xffffffc0,%ecx
80105df0:	88 88 06 18 11 80    	mov    %cl,-0x7feee7fa(%eax)
80105df6:	c6 80 07 18 11 80 00 	movb   $0x0,-0x7feee7f9(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80105dfd:	66 c7 80 08 18 11 80 	movw   $0xffff,-0x7feee7f8(%eax)
80105e04:	ff ff 
80105e06:	66 c7 80 0a 18 11 80 	movw   $0x0,-0x7feee7f6(%eax)
80105e0d:	00 00 
80105e0f:	c6 80 0c 18 11 80 00 	movb   $0x0,-0x7feee7f4(%eax)
80105e16:	c6 80 0d 18 11 80 fa 	movb   $0xfa,-0x7feee7f3(%eax)
80105e1d:	0f b6 88 0e 18 11 80 	movzbl -0x7feee7f2(%eax),%ecx
80105e24:	83 c9 0f             	or     $0xf,%ecx
80105e27:	83 e1 cf             	and    $0xffffffcf,%ecx
80105e2a:	83 c9 c0             	or     $0xffffffc0,%ecx
80105e2d:	88 88 0e 18 11 80    	mov    %cl,-0x7feee7f2(%eax)
80105e33:	c6 80 0f 18 11 80 00 	movb   $0x0,-0x7feee7f1(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80105e3a:	66 c7 80 10 18 11 80 	movw   $0xffff,-0x7feee7f0(%eax)
80105e41:	ff ff 
80105e43:	66 c7 80 12 18 11 80 	movw   $0x0,-0x7feee7ee(%eax)
80105e4a:	00 00 
80105e4c:	c6 80 14 18 11 80 00 	movb   $0x0,-0x7feee7ec(%eax)
80105e53:	c6 80 15 18 11 80 f2 	movb   $0xf2,-0x7feee7eb(%eax)
80105e5a:	0f b6 88 16 18 11 80 	movzbl -0x7feee7ea(%eax),%ecx
80105e61:	83 c9 0f             	or     $0xf,%ecx
80105e64:	83 e1 cf             	and    $0xffffffcf,%ecx
80105e67:	83 c9 c0             	or     $0xffffffc0,%ecx
80105e6a:	88 88 16 18 11 80    	mov    %cl,-0x7feee7ea(%eax)
80105e70:	c6 80 17 18 11 80 00 	movb   $0x0,-0x7feee7e9(%eax)
  lgdt(c->gdt, sizeof(c->gdt));
80105e77:	05 f0 17 11 80       	add    $0x801117f0,%eax
  pd[0] = size-1;
80105e7c:	66 c7 45 f2 2f 00    	movw   $0x2f,-0xe(%ebp)
  pd[1] = (uint)p;
80105e82:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80105e86:	c1 e8 10             	shr    $0x10,%eax
80105e89:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80105e8d:	8d 45 f2             	lea    -0xe(%ebp),%eax
80105e90:	0f 01 10             	lgdtl  (%eax)
}
80105e93:	83 c4 14             	add    $0x14,%esp
80105e96:	5b                   	pop    %ebx
80105e97:	5d                   	pop    %ebp
80105e98:	c3                   	ret    

80105e99 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80105e99:	55                   	push   %ebp
80105e9a:	89 e5                	mov    %esp,%ebp
80105e9c:	57                   	push   %edi
80105e9d:	56                   	push   %esi
80105e9e:	53                   	push   %ebx
80105e9f:	83 ec 0c             	sub    $0xc,%esp
80105ea2:	8b 7d 0c             	mov    0xc(%ebp),%edi
80105ea5:	8b 75 14             	mov    0x14(%ebp),%esi
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80105ea8:	89 fb                	mov    %edi,%ebx
80105eaa:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80105eb0:	03 7d 10             	add    0x10(%ebp),%edi
80105eb3:	83 ef 01             	sub    $0x1,%edi
80105eb6:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80105ebc:	b9 01 00 00 00       	mov    $0x1,%ecx
80105ec1:	89 da                	mov    %ebx,%edx
80105ec3:	8b 45 08             	mov    0x8(%ebp),%eax
80105ec6:	e8 12 fe ff ff       	call   80105cdd <walkpgdir>
80105ecb:	85 c0                	test   %eax,%eax
80105ecd:	74 2e                	je     80105efd <mappages+0x64>
      return -1;
    if(*pte & PTE_P)
80105ecf:	f6 00 01             	testb  $0x1,(%eax)
80105ed2:	75 1c                	jne    80105ef0 <mappages+0x57>
      panic("remap");
    *pte = pa | perm | PTE_P;
80105ed4:	89 f2                	mov    %esi,%edx
80105ed6:	0b 55 18             	or     0x18(%ebp),%edx
80105ed9:	83 ca 01             	or     $0x1,%edx
80105edc:	89 10                	mov    %edx,(%eax)
    if(a == last)
80105ede:	39 fb                	cmp    %edi,%ebx
80105ee0:	74 28                	je     80105f0a <mappages+0x71>
      break;
    a += PGSIZE;
80105ee2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    pa += PGSIZE;
80105ee8:	81 c6 00 10 00 00    	add    $0x1000,%esi
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80105eee:	eb cc                	jmp    80105ebc <mappages+0x23>
      panic("remap");
80105ef0:	83 ec 0c             	sub    $0xc,%esp
80105ef3:	68 68 6e 10 80       	push   $0x80106e68
80105ef8:	e8 4b a4 ff ff       	call   80100348 <panic>
      return -1;
80105efd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80105f02:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105f05:	5b                   	pop    %ebx
80105f06:	5e                   	pop    %esi
80105f07:	5f                   	pop    %edi
80105f08:	5d                   	pop    %ebp
80105f09:	c3                   	ret    
  return 0;
80105f0a:	b8 00 00 00 00       	mov    $0x0,%eax
80105f0f:	eb f1                	jmp    80105f02 <mappages+0x69>

80105f11 <switchkvm>:

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80105f11:	55                   	push   %ebp
80105f12:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80105f14:	a1 a4 44 11 80       	mov    0x801144a4,%eax
80105f19:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80105f1e:	0f 22 d8             	mov    %eax,%cr3
}
80105f21:	5d                   	pop    %ebp
80105f22:	c3                   	ret    

80105f23 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80105f23:	55                   	push   %ebp
80105f24:	89 e5                	mov    %esp,%ebp
80105f26:	57                   	push   %edi
80105f27:	56                   	push   %esi
80105f28:	53                   	push   %ebx
80105f29:	83 ec 1c             	sub    $0x1c,%esp
80105f2c:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
80105f2f:	85 f6                	test   %esi,%esi
80105f31:	0f 84 dd 00 00 00    	je     80106014 <switchuvm+0xf1>
    panic("switchuvm: no process");
  if(p->kstack == 0)
80105f37:	83 7e 08 00          	cmpl   $0x0,0x8(%esi)
80105f3b:	0f 84 e0 00 00 00    	je     80106021 <switchuvm+0xfe>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
80105f41:	83 7e 04 00          	cmpl   $0x0,0x4(%esi)
80105f45:	0f 84 e3 00 00 00    	je     8010602e <switchuvm+0x10b>
    panic("switchuvm: no pgdir");

  pushcli();
80105f4b:	e8 68 db ff ff       	call   80103ab8 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80105f50:	e8 2a d2 ff ff       	call   8010317f <mycpu>
80105f55:	89 c3                	mov    %eax,%ebx
80105f57:	e8 23 d2 ff ff       	call   8010317f <mycpu>
80105f5c:	8d 78 08             	lea    0x8(%eax),%edi
80105f5f:	e8 1b d2 ff ff       	call   8010317f <mycpu>
80105f64:	83 c0 08             	add    $0x8,%eax
80105f67:	c1 e8 10             	shr    $0x10,%eax
80105f6a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105f6d:	e8 0d d2 ff ff       	call   8010317f <mycpu>
80105f72:	83 c0 08             	add    $0x8,%eax
80105f75:	c1 e8 18             	shr    $0x18,%eax
80105f78:	66 c7 83 98 00 00 00 	movw   $0x67,0x98(%ebx)
80105f7f:	67 00 
80105f81:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80105f88:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
80105f8c:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
80105f92:	0f b6 93 9d 00 00 00 	movzbl 0x9d(%ebx),%edx
80105f99:	83 e2 f0             	and    $0xfffffff0,%edx
80105f9c:	83 ca 19             	or     $0x19,%edx
80105f9f:	83 e2 9f             	and    $0xffffff9f,%edx
80105fa2:	83 ca 80             	or     $0xffffff80,%edx
80105fa5:	88 93 9d 00 00 00    	mov    %dl,0x9d(%ebx)
80105fab:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
80105fb2:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
                                sizeof(mycpu()->ts)-1, 0);
  mycpu()->gdt[SEG_TSS].s = 0;
80105fb8:	e8 c2 d1 ff ff       	call   8010317f <mycpu>
80105fbd:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
80105fc4:	83 e2 ef             	and    $0xffffffef,%edx
80105fc7:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80105fcd:	e8 ad d1 ff ff       	call   8010317f <mycpu>
80105fd2:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80105fd8:	8b 5e 08             	mov    0x8(%esi),%ebx
80105fdb:	e8 9f d1 ff ff       	call   8010317f <mycpu>
80105fe0:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80105fe6:	89 58 0c             	mov    %ebx,0xc(%eax)
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80105fe9:	e8 91 d1 ff ff       	call   8010317f <mycpu>
80105fee:	66 c7 40 6e ff ff    	movw   $0xffff,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80105ff4:	b8 28 00 00 00       	mov    $0x28,%eax
80105ff9:	0f 00 d8             	ltr    %ax
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
80105ffc:	8b 46 04             	mov    0x4(%esi),%eax
80105fff:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106004:	0f 22 d8             	mov    %eax,%cr3
  popcli();
80106007:	e8 e9 da ff ff       	call   80103af5 <popcli>
}
8010600c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010600f:	5b                   	pop    %ebx
80106010:	5e                   	pop    %esi
80106011:	5f                   	pop    %edi
80106012:	5d                   	pop    %ebp
80106013:	c3                   	ret    
    panic("switchuvm: no process");
80106014:	83 ec 0c             	sub    $0xc,%esp
80106017:	68 6e 6e 10 80       	push   $0x80106e6e
8010601c:	e8 27 a3 ff ff       	call   80100348 <panic>
    panic("switchuvm: no kstack");
80106021:	83 ec 0c             	sub    $0xc,%esp
80106024:	68 84 6e 10 80       	push   $0x80106e84
80106029:	e8 1a a3 ff ff       	call   80100348 <panic>
    panic("switchuvm: no pgdir");
8010602e:	83 ec 0c             	sub    $0xc,%esp
80106031:	68 99 6e 10 80       	push   $0x80106e99
80106036:	e8 0d a3 ff ff       	call   80100348 <panic>

8010603b <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
8010603b:	55                   	push   %ebp
8010603c:	89 e5                	mov    %esp,%ebp
8010603e:	56                   	push   %esi
8010603f:	53                   	push   %ebx
80106040:	8b 75 10             	mov    0x10(%ebp),%esi
  char *mem;

  if(sz >= PGSIZE)
80106043:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106049:	77 4b                	ja     80106096 <inituvm+0x5b>
    panic("inituvm: more than a page");
  mem = kalloc();
8010604b:	e8 6b c0 ff ff       	call   801020bb <kalloc>
80106050:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106052:	83 ec 04             	sub    $0x4,%esp
80106055:	68 00 10 00 00       	push   $0x1000
8010605a:	6a 00                	push   $0x0
8010605c:	50                   	push   %eax
8010605d:	e8 df db ff ff       	call   80103c41 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106062:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
80106069:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
8010606f:	50                   	push   %eax
80106070:	68 00 10 00 00       	push   $0x1000
80106075:	6a 00                	push   $0x0
80106077:	ff 75 08             	pushl  0x8(%ebp)
8010607a:	e8 1a fe ff ff       	call   80105e99 <mappages>
  memmove(mem, init, sz);
8010607f:	83 c4 1c             	add    $0x1c,%esp
80106082:	56                   	push   %esi
80106083:	ff 75 0c             	pushl  0xc(%ebp)
80106086:	53                   	push   %ebx
80106087:	e8 30 dc ff ff       	call   80103cbc <memmove>
}
8010608c:	83 c4 10             	add    $0x10,%esp
8010608f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106092:	5b                   	pop    %ebx
80106093:	5e                   	pop    %esi
80106094:	5d                   	pop    %ebp
80106095:	c3                   	ret    
    panic("inituvm: more than a page");
80106096:	83 ec 0c             	sub    $0xc,%esp
80106099:	68 ad 6e 10 80       	push   $0x80106ead
8010609e:	e8 a5 a2 ff ff       	call   80100348 <panic>

801060a3 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
801060a3:	55                   	push   %ebp
801060a4:	89 e5                	mov    %esp,%ebp
801060a6:	57                   	push   %edi
801060a7:	56                   	push   %esi
801060a8:	53                   	push   %ebx
801060a9:	83 ec 0c             	sub    $0xc,%esp
801060ac:	8b 7d 18             	mov    0x18(%ebp),%edi
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
801060af:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
801060b6:	75 07                	jne    801060bf <loaduvm+0x1c>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
801060b8:	bb 00 00 00 00       	mov    $0x0,%ebx
801060bd:	eb 3c                	jmp    801060fb <loaduvm+0x58>
    panic("loaduvm: addr must be page aligned");
801060bf:	83 ec 0c             	sub    $0xc,%esp
801060c2:	68 68 6f 10 80       	push   $0x80106f68
801060c7:	e8 7c a2 ff ff       	call   80100348 <panic>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
801060cc:	83 ec 0c             	sub    $0xc,%esp
801060cf:	68 c7 6e 10 80       	push   $0x80106ec7
801060d4:	e8 6f a2 ff ff       	call   80100348 <panic>
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
801060d9:	05 00 00 00 80       	add    $0x80000000,%eax
801060de:	56                   	push   %esi
801060df:	89 da                	mov    %ebx,%edx
801060e1:	03 55 14             	add    0x14(%ebp),%edx
801060e4:	52                   	push   %edx
801060e5:	50                   	push   %eax
801060e6:	ff 75 10             	pushl  0x10(%ebp)
801060e9:	e8 85 b6 ff ff       	call   80101773 <readi>
801060ee:	83 c4 10             	add    $0x10,%esp
801060f1:	39 f0                	cmp    %esi,%eax
801060f3:	75 47                	jne    8010613c <loaduvm+0x99>
  for(i = 0; i < sz; i += PGSIZE){
801060f5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801060fb:	39 fb                	cmp    %edi,%ebx
801060fd:	73 30                	jae    8010612f <loaduvm+0x8c>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
801060ff:	89 da                	mov    %ebx,%edx
80106101:	03 55 0c             	add    0xc(%ebp),%edx
80106104:	b9 00 00 00 00       	mov    $0x0,%ecx
80106109:	8b 45 08             	mov    0x8(%ebp),%eax
8010610c:	e8 cc fb ff ff       	call   80105cdd <walkpgdir>
80106111:	85 c0                	test   %eax,%eax
80106113:	74 b7                	je     801060cc <loaduvm+0x29>
    pa = PTE_ADDR(*pte);
80106115:	8b 00                	mov    (%eax),%eax
80106117:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
8010611c:	89 fe                	mov    %edi,%esi
8010611e:	29 de                	sub    %ebx,%esi
80106120:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106126:	76 b1                	jbe    801060d9 <loaduvm+0x36>
      n = PGSIZE;
80106128:	be 00 10 00 00       	mov    $0x1000,%esi
8010612d:	eb aa                	jmp    801060d9 <loaduvm+0x36>
      return -1;
  }
  return 0;
8010612f:	b8 00 00 00 00       	mov    $0x0,%eax
}
80106134:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106137:	5b                   	pop    %ebx
80106138:	5e                   	pop    %esi
80106139:	5f                   	pop    %edi
8010613a:	5d                   	pop    %ebp
8010613b:	c3                   	ret    
      return -1;
8010613c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106141:	eb f1                	jmp    80106134 <loaduvm+0x91>

80106143 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106143:	55                   	push   %ebp
80106144:	89 e5                	mov    %esp,%ebp
80106146:	57                   	push   %edi
80106147:	56                   	push   %esi
80106148:	53                   	push   %ebx
80106149:	83 ec 0c             	sub    $0xc,%esp
8010614c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
8010614f:	39 7d 10             	cmp    %edi,0x10(%ebp)
80106152:	73 11                	jae    80106165 <deallocuvm+0x22>
    return oldsz;

  a = PGROUNDUP(newsz);
80106154:	8b 45 10             	mov    0x10(%ebp),%eax
80106157:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
8010615d:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106163:	eb 19                	jmp    8010617e <deallocuvm+0x3b>
    return oldsz;
80106165:	89 f8                	mov    %edi,%eax
80106167:	eb 64                	jmp    801061cd <deallocuvm+0x8a>
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106169:	c1 eb 16             	shr    $0x16,%ebx
8010616c:	83 c3 01             	add    $0x1,%ebx
8010616f:	c1 e3 16             	shl    $0x16,%ebx
80106172:	81 eb 00 10 00 00    	sub    $0x1000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106178:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010617e:	39 fb                	cmp    %edi,%ebx
80106180:	73 48                	jae    801061ca <deallocuvm+0x87>
    pte = walkpgdir(pgdir, (char*)a, 0);
80106182:	b9 00 00 00 00       	mov    $0x0,%ecx
80106187:	89 da                	mov    %ebx,%edx
80106189:	8b 45 08             	mov    0x8(%ebp),%eax
8010618c:	e8 4c fb ff ff       	call   80105cdd <walkpgdir>
80106191:	89 c6                	mov    %eax,%esi
    if(!pte)
80106193:	85 c0                	test   %eax,%eax
80106195:	74 d2                	je     80106169 <deallocuvm+0x26>
    else if((*pte & PTE_P) != 0){
80106197:	8b 00                	mov    (%eax),%eax
80106199:	a8 01                	test   $0x1,%al
8010619b:	74 db                	je     80106178 <deallocuvm+0x35>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
8010619d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801061a2:	74 19                	je     801061bd <deallocuvm+0x7a>
        panic("kfree");
      char *v = P2V(pa);
801061a4:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
801061a9:	83 ec 0c             	sub    $0xc,%esp
801061ac:	50                   	push   %eax
801061ad:	e8 f2 bd ff ff       	call   80101fa4 <kfree>
      *pte = 0;
801061b2:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
801061b8:	83 c4 10             	add    $0x10,%esp
801061bb:	eb bb                	jmp    80106178 <deallocuvm+0x35>
        panic("kfree");
801061bd:	83 ec 0c             	sub    $0xc,%esp
801061c0:	68 e6 67 10 80       	push   $0x801067e6
801061c5:	e8 7e a1 ff ff       	call   80100348 <panic>
    }
  }
  return newsz;
801061ca:	8b 45 10             	mov    0x10(%ebp),%eax
}
801061cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801061d0:	5b                   	pop    %ebx
801061d1:	5e                   	pop    %esi
801061d2:	5f                   	pop    %edi
801061d3:	5d                   	pop    %ebp
801061d4:	c3                   	ret    

801061d5 <allocuvm>:
{
801061d5:	55                   	push   %ebp
801061d6:	89 e5                	mov    %esp,%ebp
801061d8:	57                   	push   %edi
801061d9:	56                   	push   %esi
801061da:	53                   	push   %ebx
801061db:	83 ec 1c             	sub    $0x1c,%esp
801061de:	8b 7d 10             	mov    0x10(%ebp),%edi
  if(newsz >= KERNBASE)
801061e1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801061e4:	85 ff                	test   %edi,%edi
801061e6:	0f 88 c2 00 00 00    	js     801062ae <allocuvm+0xd9>
  if(newsz < oldsz)
801061ec:	3b 7d 0c             	cmp    0xc(%ebp),%edi
801061ef:	72 5d                	jb     8010624e <allocuvm+0x79>
  a = PGROUNDUP(oldsz);
801061f1:	8b 45 0c             	mov    0xc(%ebp),%eax
801061f4:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801061fa:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106200:	39 fb                	cmp    %edi,%ebx
80106202:	0f 83 ad 00 00 00    	jae    801062b5 <allocuvm+0xe0>
    mem = kalloc();
80106208:	e8 ae be ff ff       	call   801020bb <kalloc>
8010620d:	89 c6                	mov    %eax,%esi
    if(mem == 0){
8010620f:	85 c0                	test   %eax,%eax
80106211:	74 43                	je     80106256 <allocuvm+0x81>
    memset(mem, 0, PGSIZE);
80106213:	83 ec 04             	sub    $0x4,%esp
80106216:	68 00 10 00 00       	push   $0x1000
8010621b:	6a 00                	push   $0x0
8010621d:	50                   	push   %eax
8010621e:	e8 1e da ff ff       	call   80103c41 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106223:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
8010622a:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106230:	50                   	push   %eax
80106231:	68 00 10 00 00       	push   $0x1000
80106236:	53                   	push   %ebx
80106237:	ff 75 08             	pushl  0x8(%ebp)
8010623a:	e8 5a fc ff ff       	call   80105e99 <mappages>
8010623f:	83 c4 20             	add    $0x20,%esp
80106242:	85 c0                	test   %eax,%eax
80106244:	78 38                	js     8010627e <allocuvm+0xa9>
  for(; a < newsz; a += PGSIZE){
80106246:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010624c:	eb b2                	jmp    80106200 <allocuvm+0x2b>
    return oldsz;
8010624e:	8b 45 0c             	mov    0xc(%ebp),%eax
80106251:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106254:	eb 5f                	jmp    801062b5 <allocuvm+0xe0>
      cprintf("allocuvm out of memory\n");
80106256:	83 ec 0c             	sub    $0xc,%esp
80106259:	68 e5 6e 10 80       	push   $0x80106ee5
8010625e:	e8 a8 a3 ff ff       	call   8010060b <cprintf>
      deallocuvm(pgdir, newsz, oldsz);
80106263:	83 c4 0c             	add    $0xc,%esp
80106266:	ff 75 0c             	pushl  0xc(%ebp)
80106269:	57                   	push   %edi
8010626a:	ff 75 08             	pushl  0x8(%ebp)
8010626d:	e8 d1 fe ff ff       	call   80106143 <deallocuvm>
      return 0;
80106272:	83 c4 10             	add    $0x10,%esp
80106275:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
8010627c:	eb 37                	jmp    801062b5 <allocuvm+0xe0>
      cprintf("allocuvm out of memory (2)\n");
8010627e:	83 ec 0c             	sub    $0xc,%esp
80106281:	68 fd 6e 10 80       	push   $0x80106efd
80106286:	e8 80 a3 ff ff       	call   8010060b <cprintf>
      deallocuvm(pgdir, newsz, oldsz);
8010628b:	83 c4 0c             	add    $0xc,%esp
8010628e:	ff 75 0c             	pushl  0xc(%ebp)
80106291:	57                   	push   %edi
80106292:	ff 75 08             	pushl  0x8(%ebp)
80106295:	e8 a9 fe ff ff       	call   80106143 <deallocuvm>
      kfree(mem);
8010629a:	89 34 24             	mov    %esi,(%esp)
8010629d:	e8 02 bd ff ff       	call   80101fa4 <kfree>
      return 0;
801062a2:	83 c4 10             	add    $0x10,%esp
801062a5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
801062ac:	eb 07                	jmp    801062b5 <allocuvm+0xe0>
    return 0;
801062ae:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
}
801062b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801062b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801062bb:	5b                   	pop    %ebx
801062bc:	5e                   	pop    %esi
801062bd:	5f                   	pop    %edi
801062be:	5d                   	pop    %ebp
801062bf:	c3                   	ret    

801062c0 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
801062c0:	55                   	push   %ebp
801062c1:	89 e5                	mov    %esp,%ebp
801062c3:	56                   	push   %esi
801062c4:	53                   	push   %ebx
801062c5:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
801062c8:	85 f6                	test   %esi,%esi
801062ca:	74 1a                	je     801062e6 <freevm+0x26>
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
801062cc:	83 ec 04             	sub    $0x4,%esp
801062cf:	6a 00                	push   $0x0
801062d1:	68 00 00 00 80       	push   $0x80000000
801062d6:	56                   	push   %esi
801062d7:	e8 67 fe ff ff       	call   80106143 <deallocuvm>
  for(i = 0; i < NPDENTRIES; i++){
801062dc:	83 c4 10             	add    $0x10,%esp
801062df:	bb 00 00 00 00       	mov    $0x0,%ebx
801062e4:	eb 10                	jmp    801062f6 <freevm+0x36>
    panic("freevm: no pgdir");
801062e6:	83 ec 0c             	sub    $0xc,%esp
801062e9:	68 19 6f 10 80       	push   $0x80106f19
801062ee:	e8 55 a0 ff ff       	call   80100348 <panic>
  for(i = 0; i < NPDENTRIES; i++){
801062f3:	83 c3 01             	add    $0x1,%ebx
801062f6:	81 fb ff 03 00 00    	cmp    $0x3ff,%ebx
801062fc:	77 1f                	ja     8010631d <freevm+0x5d>
    if(pgdir[i] & PTE_P){
801062fe:	8b 04 9e             	mov    (%esi,%ebx,4),%eax
80106301:	a8 01                	test   $0x1,%al
80106303:	74 ee                	je     801062f3 <freevm+0x33>
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106305:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010630a:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
8010630f:	83 ec 0c             	sub    $0xc,%esp
80106312:	50                   	push   %eax
80106313:	e8 8c bc ff ff       	call   80101fa4 <kfree>
80106318:	83 c4 10             	add    $0x10,%esp
8010631b:	eb d6                	jmp    801062f3 <freevm+0x33>
    }
  }
  kfree((char*)pgdir);
8010631d:	83 ec 0c             	sub    $0xc,%esp
80106320:	56                   	push   %esi
80106321:	e8 7e bc ff ff       	call   80101fa4 <kfree>
}
80106326:	83 c4 10             	add    $0x10,%esp
80106329:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010632c:	5b                   	pop    %ebx
8010632d:	5e                   	pop    %esi
8010632e:	5d                   	pop    %ebp
8010632f:	c3                   	ret    

80106330 <setupkvm>:
{
80106330:	55                   	push   %ebp
80106331:	89 e5                	mov    %esp,%ebp
80106333:	56                   	push   %esi
80106334:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
80106335:	e8 81 bd ff ff       	call   801020bb <kalloc>
8010633a:	89 c6                	mov    %eax,%esi
8010633c:	85 c0                	test   %eax,%eax
8010633e:	74 55                	je     80106395 <setupkvm+0x65>
  memset(pgdir, 0, PGSIZE);
80106340:	83 ec 04             	sub    $0x4,%esp
80106343:	68 00 10 00 00       	push   $0x1000
80106348:	6a 00                	push   $0x0
8010634a:	50                   	push   %eax
8010634b:	e8 f1 d8 ff ff       	call   80103c41 <memset>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106350:	83 c4 10             	add    $0x10,%esp
80106353:	bb 20 94 10 80       	mov    $0x80109420,%ebx
80106358:	81 fb 60 94 10 80    	cmp    $0x80109460,%ebx
8010635e:	73 35                	jae    80106395 <setupkvm+0x65>
                (uint)k->phys_start, k->perm) < 0) {
80106360:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106363:	83 ec 0c             	sub    $0xc,%esp
80106366:	ff 73 0c             	pushl  0xc(%ebx)
80106369:	50                   	push   %eax
8010636a:	8b 53 08             	mov    0x8(%ebx),%edx
8010636d:	29 c2                	sub    %eax,%edx
8010636f:	52                   	push   %edx
80106370:	ff 33                	pushl  (%ebx)
80106372:	56                   	push   %esi
80106373:	e8 21 fb ff ff       	call   80105e99 <mappages>
80106378:	83 c4 20             	add    $0x20,%esp
8010637b:	85 c0                	test   %eax,%eax
8010637d:	78 05                	js     80106384 <setupkvm+0x54>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
8010637f:	83 c3 10             	add    $0x10,%ebx
80106382:	eb d4                	jmp    80106358 <setupkvm+0x28>
      freevm(pgdir);
80106384:	83 ec 0c             	sub    $0xc,%esp
80106387:	56                   	push   %esi
80106388:	e8 33 ff ff ff       	call   801062c0 <freevm>
      return 0;
8010638d:	83 c4 10             	add    $0x10,%esp
80106390:	be 00 00 00 00       	mov    $0x0,%esi
}
80106395:	89 f0                	mov    %esi,%eax
80106397:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010639a:	5b                   	pop    %ebx
8010639b:	5e                   	pop    %esi
8010639c:	5d                   	pop    %ebp
8010639d:	c3                   	ret    

8010639e <kvmalloc>:
{
8010639e:	55                   	push   %ebp
8010639f:	89 e5                	mov    %esp,%ebp
801063a1:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
801063a4:	e8 87 ff ff ff       	call   80106330 <setupkvm>
801063a9:	a3 a4 44 11 80       	mov    %eax,0x801144a4
  switchkvm();
801063ae:	e8 5e fb ff ff       	call   80105f11 <switchkvm>
}
801063b3:	c9                   	leave  
801063b4:	c3                   	ret    

801063b5 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
801063b5:	55                   	push   %ebp
801063b6:	89 e5                	mov    %esp,%ebp
801063b8:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801063bb:	b9 00 00 00 00       	mov    $0x0,%ecx
801063c0:	8b 55 0c             	mov    0xc(%ebp),%edx
801063c3:	8b 45 08             	mov    0x8(%ebp),%eax
801063c6:	e8 12 f9 ff ff       	call   80105cdd <walkpgdir>
  if(pte == 0)
801063cb:	85 c0                	test   %eax,%eax
801063cd:	74 05                	je     801063d4 <clearpteu+0x1f>
    panic("clearpteu");
  *pte &= ~PTE_U;
801063cf:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
801063d2:	c9                   	leave  
801063d3:	c3                   	ret    
    panic("clearpteu");
801063d4:	83 ec 0c             	sub    $0xc,%esp
801063d7:	68 2a 6f 10 80       	push   $0x80106f2a
801063dc:	e8 67 9f ff ff       	call   80100348 <panic>

801063e1 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
801063e1:	55                   	push   %ebp
801063e2:	89 e5                	mov    %esp,%ebp
801063e4:	57                   	push   %edi
801063e5:	56                   	push   %esi
801063e6:	53                   	push   %ebx
801063e7:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
801063ea:	e8 41 ff ff ff       	call   80106330 <setupkvm>
801063ef:	89 45 dc             	mov    %eax,-0x24(%ebp)
801063f2:	85 c0                	test   %eax,%eax
801063f4:	0f 84 c4 00 00 00    	je     801064be <copyuvm+0xdd>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
801063fa:	bf 00 00 00 00       	mov    $0x0,%edi
801063ff:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106402:	0f 83 b6 00 00 00    	jae    801064be <copyuvm+0xdd>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106408:	89 7d e4             	mov    %edi,-0x1c(%ebp)
8010640b:	b9 00 00 00 00       	mov    $0x0,%ecx
80106410:	89 fa                	mov    %edi,%edx
80106412:	8b 45 08             	mov    0x8(%ebp),%eax
80106415:	e8 c3 f8 ff ff       	call   80105cdd <walkpgdir>
8010641a:	85 c0                	test   %eax,%eax
8010641c:	74 65                	je     80106483 <copyuvm+0xa2>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
8010641e:	8b 00                	mov    (%eax),%eax
80106420:	a8 01                	test   $0x1,%al
80106422:	74 6c                	je     80106490 <copyuvm+0xaf>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106424:	89 c6                	mov    %eax,%esi
80106426:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    flags = PTE_FLAGS(*pte);
8010642c:	25 ff 0f 00 00       	and    $0xfff,%eax
80106431:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if((mem = kalloc()) == 0)
80106434:	e8 82 bc ff ff       	call   801020bb <kalloc>
80106439:	89 c3                	mov    %eax,%ebx
8010643b:	85 c0                	test   %eax,%eax
8010643d:	74 6a                	je     801064a9 <copyuvm+0xc8>
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
8010643f:	81 c6 00 00 00 80    	add    $0x80000000,%esi
80106445:	83 ec 04             	sub    $0x4,%esp
80106448:	68 00 10 00 00       	push   $0x1000
8010644d:	56                   	push   %esi
8010644e:	50                   	push   %eax
8010644f:	e8 68 d8 ff ff       	call   80103cbc <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80106454:	83 c4 04             	add    $0x4,%esp
80106457:	ff 75 e0             	pushl  -0x20(%ebp)
8010645a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106460:	50                   	push   %eax
80106461:	68 00 10 00 00       	push   $0x1000
80106466:	ff 75 e4             	pushl  -0x1c(%ebp)
80106469:	ff 75 dc             	pushl  -0x24(%ebp)
8010646c:	e8 28 fa ff ff       	call   80105e99 <mappages>
80106471:	83 c4 20             	add    $0x20,%esp
80106474:	85 c0                	test   %eax,%eax
80106476:	78 25                	js     8010649d <copyuvm+0xbc>
  for(i = 0; i < sz; i += PGSIZE){
80106478:	81 c7 00 10 00 00    	add    $0x1000,%edi
8010647e:	e9 7c ff ff ff       	jmp    801063ff <copyuvm+0x1e>
      panic("copyuvm: pte should exist");
80106483:	83 ec 0c             	sub    $0xc,%esp
80106486:	68 34 6f 10 80       	push   $0x80106f34
8010648b:	e8 b8 9e ff ff       	call   80100348 <panic>
      panic("copyuvm: page not present");
80106490:	83 ec 0c             	sub    $0xc,%esp
80106493:	68 4e 6f 10 80       	push   $0x80106f4e
80106498:	e8 ab 9e ff ff       	call   80100348 <panic>
      kfree(mem);
8010649d:	83 ec 0c             	sub    $0xc,%esp
801064a0:	53                   	push   %ebx
801064a1:	e8 fe ba ff ff       	call   80101fa4 <kfree>
      goto bad;
801064a6:	83 c4 10             	add    $0x10,%esp
    }
  }
  return d;

bad:
  freevm(d);
801064a9:	83 ec 0c             	sub    $0xc,%esp
801064ac:	ff 75 dc             	pushl  -0x24(%ebp)
801064af:	e8 0c fe ff ff       	call   801062c0 <freevm>
  return 0;
801064b4:	83 c4 10             	add    $0x10,%esp
801064b7:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
}
801064be:	8b 45 dc             	mov    -0x24(%ebp),%eax
801064c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801064c4:	5b                   	pop    %ebx
801064c5:	5e                   	pop    %esi
801064c6:	5f                   	pop    %edi
801064c7:	5d                   	pop    %ebp
801064c8:	c3                   	ret    

801064c9 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
801064c9:	55                   	push   %ebp
801064ca:	89 e5                	mov    %esp,%ebp
801064cc:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801064cf:	b9 00 00 00 00       	mov    $0x0,%ecx
801064d4:	8b 55 0c             	mov    0xc(%ebp),%edx
801064d7:	8b 45 08             	mov    0x8(%ebp),%eax
801064da:	e8 fe f7 ff ff       	call   80105cdd <walkpgdir>
  if((*pte & PTE_P) == 0)
801064df:	8b 00                	mov    (%eax),%eax
801064e1:	a8 01                	test   $0x1,%al
801064e3:	74 10                	je     801064f5 <uva2ka+0x2c>
    return 0;
  if((*pte & PTE_U) == 0)
801064e5:	a8 04                	test   $0x4,%al
801064e7:	74 13                	je     801064fc <uva2ka+0x33>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
801064e9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801064ee:	05 00 00 00 80       	add    $0x80000000,%eax
}
801064f3:	c9                   	leave  
801064f4:	c3                   	ret    
    return 0;
801064f5:	b8 00 00 00 00       	mov    $0x0,%eax
801064fa:	eb f7                	jmp    801064f3 <uva2ka+0x2a>
    return 0;
801064fc:	b8 00 00 00 00       	mov    $0x0,%eax
80106501:	eb f0                	jmp    801064f3 <uva2ka+0x2a>

80106503 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80106503:	55                   	push   %ebp
80106504:	89 e5                	mov    %esp,%ebp
80106506:	57                   	push   %edi
80106507:	56                   	push   %esi
80106508:	53                   	push   %ebx
80106509:	83 ec 0c             	sub    $0xc,%esp
8010650c:	8b 7d 14             	mov    0x14(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
8010650f:	eb 25                	jmp    80106536 <copyout+0x33>
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106511:	8b 55 0c             	mov    0xc(%ebp),%edx
80106514:	29 f2                	sub    %esi,%edx
80106516:	01 d0                	add    %edx,%eax
80106518:	83 ec 04             	sub    $0x4,%esp
8010651b:	53                   	push   %ebx
8010651c:	ff 75 10             	pushl  0x10(%ebp)
8010651f:	50                   	push   %eax
80106520:	e8 97 d7 ff ff       	call   80103cbc <memmove>
    len -= n;
80106525:	29 df                	sub    %ebx,%edi
    buf += n;
80106527:	01 5d 10             	add    %ebx,0x10(%ebp)
    va = va0 + PGSIZE;
8010652a:	8d 86 00 10 00 00    	lea    0x1000(%esi),%eax
80106530:	89 45 0c             	mov    %eax,0xc(%ebp)
80106533:	83 c4 10             	add    $0x10,%esp
  while(len > 0){
80106536:	85 ff                	test   %edi,%edi
80106538:	74 2f                	je     80106569 <copyout+0x66>
    va0 = (uint)PGROUNDDOWN(va);
8010653a:	8b 75 0c             	mov    0xc(%ebp),%esi
8010653d:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80106543:	83 ec 08             	sub    $0x8,%esp
80106546:	56                   	push   %esi
80106547:	ff 75 08             	pushl  0x8(%ebp)
8010654a:	e8 7a ff ff ff       	call   801064c9 <uva2ka>
    if(pa0 == 0)
8010654f:	83 c4 10             	add    $0x10,%esp
80106552:	85 c0                	test   %eax,%eax
80106554:	74 20                	je     80106576 <copyout+0x73>
    n = PGSIZE - (va - va0);
80106556:	89 f3                	mov    %esi,%ebx
80106558:	2b 5d 0c             	sub    0xc(%ebp),%ebx
8010655b:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if(n > len)
80106561:	39 df                	cmp    %ebx,%edi
80106563:	73 ac                	jae    80106511 <copyout+0xe>
      n = len;
80106565:	89 fb                	mov    %edi,%ebx
80106567:	eb a8                	jmp    80106511 <copyout+0xe>
  }
  return 0;
80106569:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010656e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106571:	5b                   	pop    %ebx
80106572:	5e                   	pop    %esi
80106573:	5f                   	pop    %edi
80106574:	5d                   	pop    %ebp
80106575:	c3                   	ret    
      return -1;
80106576:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010657b:	eb f1                	jmp    8010656e <copyout+0x6b>
