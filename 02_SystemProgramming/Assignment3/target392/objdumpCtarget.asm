
ctarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000400c08 <_init>:
  400c08:	48 83 ec 08          	sub    $0x8,%rsp
  400c0c:	48 8b 05 e5 33 20 00 	mov    0x2033e5(%rip),%rax        # 603ff8 <_DYNAMIC+0x1d0>
  400c13:	48 85 c0             	test   %rax,%rax
  400c16:	74 05                	je     400c1d <_init+0x15>
  400c18:	e8 33 02 00 00       	callq  400e50 <socket@plt+0x10>
  400c1d:	48 83 c4 08          	add    $0x8,%rsp
  400c21:	c3                   	retq   

Disassembly of section .plt:

0000000000400c30 <__errno_location@plt-0x10>:
  400c30:	ff 35 d2 33 20 00    	pushq  0x2033d2(%rip)        # 604008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400c36:	ff 25 d4 33 20 00    	jmpq   *0x2033d4(%rip)        # 604010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400c3c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400c40 <__errno_location@plt>:
  400c40:	ff 25 d2 33 20 00    	jmpq   *0x2033d2(%rip)        # 604018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400c46:	68 00 00 00 00       	pushq  $0x0
  400c4b:	e9 e0 ff ff ff       	jmpq   400c30 <_init+0x28>

0000000000400c50 <srandom@plt>:
  400c50:	ff 25 ca 33 20 00    	jmpq   *0x2033ca(%rip)        # 604020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400c56:	68 01 00 00 00       	pushq  $0x1
  400c5b:	e9 d0 ff ff ff       	jmpq   400c30 <_init+0x28>

0000000000400c60 <strncmp@plt>:
  400c60:	ff 25 c2 33 20 00    	jmpq   *0x2033c2(%rip)        # 604028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400c66:	68 02 00 00 00       	pushq  $0x2
  400c6b:	e9 c0 ff ff ff       	jmpq   400c30 <_init+0x28>

0000000000400c70 <strcpy@plt>:
  400c70:	ff 25 ba 33 20 00    	jmpq   *0x2033ba(%rip)        # 604030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400c76:	68 03 00 00 00       	pushq  $0x3
  400c7b:	e9 b0 ff ff ff       	jmpq   400c30 <_init+0x28>

0000000000400c80 <puts@plt>:
  400c80:	ff 25 b2 33 20 00    	jmpq   *0x2033b2(%rip)        # 604038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400c86:	68 04 00 00 00       	pushq  $0x4
  400c8b:	e9 a0 ff ff ff       	jmpq   400c30 <_init+0x28>

0000000000400c90 <write@plt>:
  400c90:	ff 25 aa 33 20 00    	jmpq   *0x2033aa(%rip)        # 604040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400c96:	68 05 00 00 00       	pushq  $0x5
  400c9b:	e9 90 ff ff ff       	jmpq   400c30 <_init+0x28>

0000000000400ca0 <__stack_chk_fail@plt>:
  400ca0:	ff 25 a2 33 20 00    	jmpq   *0x2033a2(%rip)        # 604048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400ca6:	68 06 00 00 00       	pushq  $0x6
  400cab:	e9 80 ff ff ff       	jmpq   400c30 <_init+0x28>

0000000000400cb0 <mmap@plt>:
  400cb0:	ff 25 9a 33 20 00    	jmpq   *0x20339a(%rip)        # 604050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400cb6:	68 07 00 00 00       	pushq  $0x7
  400cbb:	e9 70 ff ff ff       	jmpq   400c30 <_init+0x28>

0000000000400cc0 <memset@plt>:
  400cc0:	ff 25 92 33 20 00    	jmpq   *0x203392(%rip)        # 604058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400cc6:	68 08 00 00 00       	pushq  $0x8
  400ccb:	e9 60 ff ff ff       	jmpq   400c30 <_init+0x28>

0000000000400cd0 <alarm@plt>:
  400cd0:	ff 25 8a 33 20 00    	jmpq   *0x20338a(%rip)        # 604060 <_GLOBAL_OFFSET_TABLE_+0x60>
  400cd6:	68 09 00 00 00       	pushq  $0x9
  400cdb:	e9 50 ff ff ff       	jmpq   400c30 <_init+0x28>

0000000000400ce0 <close@plt>:
  400ce0:	ff 25 82 33 20 00    	jmpq   *0x203382(%rip)        # 604068 <_GLOBAL_OFFSET_TABLE_+0x68>
  400ce6:	68 0a 00 00 00       	pushq  $0xa
  400ceb:	e9 40 ff ff ff       	jmpq   400c30 <_init+0x28>

0000000000400cf0 <read@plt>:
  400cf0:	ff 25 7a 33 20 00    	jmpq   *0x20337a(%rip)        # 604070 <_GLOBAL_OFFSET_TABLE_+0x70>
  400cf6:	68 0b 00 00 00       	pushq  $0xb
  400cfb:	e9 30 ff ff ff       	jmpq   400c30 <_init+0x28>

0000000000400d00 <__libc_start_main@plt>:
  400d00:	ff 25 72 33 20 00    	jmpq   *0x203372(%rip)        # 604078 <_GLOBAL_OFFSET_TABLE_+0x78>
  400d06:	68 0c 00 00 00       	pushq  $0xc
  400d0b:	e9 20 ff ff ff       	jmpq   400c30 <_init+0x28>

0000000000400d10 <signal@plt>:
  400d10:	ff 25 6a 33 20 00    	jmpq   *0x20336a(%rip)        # 604080 <_GLOBAL_OFFSET_TABLE_+0x80>
  400d16:	68 0d 00 00 00       	pushq  $0xd
  400d1b:	e9 10 ff ff ff       	jmpq   400c30 <_init+0x28>

0000000000400d20 <gethostbyname@plt>:
  400d20:	ff 25 62 33 20 00    	jmpq   *0x203362(%rip)        # 604088 <_GLOBAL_OFFSET_TABLE_+0x88>
  400d26:	68 0e 00 00 00       	pushq  $0xe
  400d2b:	e9 00 ff ff ff       	jmpq   400c30 <_init+0x28>

0000000000400d30 <__memmove_chk@plt>:
  400d30:	ff 25 5a 33 20 00    	jmpq   *0x20335a(%rip)        # 604090 <_GLOBAL_OFFSET_TABLE_+0x90>
  400d36:	68 0f 00 00 00       	pushq  $0xf
  400d3b:	e9 f0 fe ff ff       	jmpq   400c30 <_init+0x28>

0000000000400d40 <strtol@plt>:
  400d40:	ff 25 52 33 20 00    	jmpq   *0x203352(%rip)        # 604098 <_GLOBAL_OFFSET_TABLE_+0x98>
  400d46:	68 10 00 00 00       	pushq  $0x10
  400d4b:	e9 e0 fe ff ff       	jmpq   400c30 <_init+0x28>

0000000000400d50 <memcpy@plt>:
  400d50:	ff 25 4a 33 20 00    	jmpq   *0x20334a(%rip)        # 6040a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400d56:	68 11 00 00 00       	pushq  $0x11
  400d5b:	e9 d0 fe ff ff       	jmpq   400c30 <_init+0x28>

0000000000400d60 <time@plt>:
  400d60:	ff 25 42 33 20 00    	jmpq   *0x203342(%rip)        # 6040a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400d66:	68 12 00 00 00       	pushq  $0x12
  400d6b:	e9 c0 fe ff ff       	jmpq   400c30 <_init+0x28>

0000000000400d70 <random@plt>:
  400d70:	ff 25 3a 33 20 00    	jmpq   *0x20333a(%rip)        # 6040b0 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400d76:	68 13 00 00 00       	pushq  $0x13
  400d7b:	e9 b0 fe ff ff       	jmpq   400c30 <_init+0x28>

0000000000400d80 <_IO_getc@plt>:
  400d80:	ff 25 32 33 20 00    	jmpq   *0x203332(%rip)        # 6040b8 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400d86:	68 14 00 00 00       	pushq  $0x14
  400d8b:	e9 a0 fe ff ff       	jmpq   400c30 <_init+0x28>

0000000000400d90 <__isoc99_sscanf@plt>:
  400d90:	ff 25 2a 33 20 00    	jmpq   *0x20332a(%rip)        # 6040c0 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400d96:	68 15 00 00 00       	pushq  $0x15
  400d9b:	e9 90 fe ff ff       	jmpq   400c30 <_init+0x28>

0000000000400da0 <munmap@plt>:
  400da0:	ff 25 22 33 20 00    	jmpq   *0x203322(%rip)        # 6040c8 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400da6:	68 16 00 00 00       	pushq  $0x16
  400dab:	e9 80 fe ff ff       	jmpq   400c30 <_init+0x28>

0000000000400db0 <__printf_chk@plt>:
  400db0:	ff 25 1a 33 20 00    	jmpq   *0x20331a(%rip)        # 6040d0 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400db6:	68 17 00 00 00       	pushq  $0x17
  400dbb:	e9 70 fe ff ff       	jmpq   400c30 <_init+0x28>

0000000000400dc0 <fopen@plt>:
  400dc0:	ff 25 12 33 20 00    	jmpq   *0x203312(%rip)        # 6040d8 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400dc6:	68 18 00 00 00       	pushq  $0x18
  400dcb:	e9 60 fe ff ff       	jmpq   400c30 <_init+0x28>

0000000000400dd0 <getopt@plt>:
  400dd0:	ff 25 0a 33 20 00    	jmpq   *0x20330a(%rip)        # 6040e0 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400dd6:	68 19 00 00 00       	pushq  $0x19
  400ddb:	e9 50 fe ff ff       	jmpq   400c30 <_init+0x28>

0000000000400de0 <strtoul@plt>:
  400de0:	ff 25 02 33 20 00    	jmpq   *0x203302(%rip)        # 6040e8 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400de6:	68 1a 00 00 00       	pushq  $0x1a
  400deb:	e9 40 fe ff ff       	jmpq   400c30 <_init+0x28>

0000000000400df0 <gethostname@plt>:
  400df0:	ff 25 fa 32 20 00    	jmpq   *0x2032fa(%rip)        # 6040f0 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400df6:	68 1b 00 00 00       	pushq  $0x1b
  400dfb:	e9 30 fe ff ff       	jmpq   400c30 <_init+0x28>

0000000000400e00 <exit@plt>:
  400e00:	ff 25 f2 32 20 00    	jmpq   *0x2032f2(%rip)        # 6040f8 <_GLOBAL_OFFSET_TABLE_+0xf8>
  400e06:	68 1c 00 00 00       	pushq  $0x1c
  400e0b:	e9 20 fe ff ff       	jmpq   400c30 <_init+0x28>

0000000000400e10 <connect@plt>:
  400e10:	ff 25 ea 32 20 00    	jmpq   *0x2032ea(%rip)        # 604100 <_GLOBAL_OFFSET_TABLE_+0x100>
  400e16:	68 1d 00 00 00       	pushq  $0x1d
  400e1b:	e9 10 fe ff ff       	jmpq   400c30 <_init+0x28>

0000000000400e20 <__fprintf_chk@plt>:
  400e20:	ff 25 e2 32 20 00    	jmpq   *0x2032e2(%rip)        # 604108 <_GLOBAL_OFFSET_TABLE_+0x108>
  400e26:	68 1e 00 00 00       	pushq  $0x1e
  400e2b:	e9 00 fe ff ff       	jmpq   400c30 <_init+0x28>

0000000000400e30 <__sprintf_chk@plt>:
  400e30:	ff 25 da 32 20 00    	jmpq   *0x2032da(%rip)        # 604110 <_GLOBAL_OFFSET_TABLE_+0x110>
  400e36:	68 1f 00 00 00       	pushq  $0x1f
  400e3b:	e9 f0 fd ff ff       	jmpq   400c30 <_init+0x28>

0000000000400e40 <socket@plt>:
  400e40:	ff 25 d2 32 20 00    	jmpq   *0x2032d2(%rip)        # 604118 <_GLOBAL_OFFSET_TABLE_+0x118>
  400e46:	68 20 00 00 00       	pushq  $0x20
  400e4b:	e9 e0 fd ff ff       	jmpq   400c30 <_init+0x28>

Disassembly of section .plt.got:

0000000000400e50 <.plt.got>:
  400e50:	ff 25 a2 31 20 00    	jmpq   *0x2031a2(%rip)        # 603ff8 <_DYNAMIC+0x1d0>
  400e56:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400e60 <_start>:
  400e60:	31 ed                	xor    %ebp,%ebp
  400e62:	49 89 d1             	mov    %rdx,%r9
  400e65:	5e                   	pop    %rsi
  400e66:	48 89 e2             	mov    %rsp,%rdx
  400e69:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400e6d:	50                   	push   %rax
  400e6e:	54                   	push   %rsp
  400e6f:	49 c7 c0 70 2d 40 00 	mov    $0x402d70,%r8
  400e76:	48 c7 c1 00 2d 40 00 	mov    $0x402d00,%rcx
  400e7d:	48 c7 c7 0b 11 40 00 	mov    $0x40110b,%rdi
  400e84:	e8 77 fe ff ff       	callq  400d00 <__libc_start_main@plt>
  400e89:	f4                   	hlt    
  400e8a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400e90 <deregister_tm_clones>:
  400e90:	b8 67 41 60 00       	mov    $0x604167,%eax
  400e95:	55                   	push   %rbp
  400e96:	48 2d 60 41 60 00    	sub    $0x604160,%rax
  400e9c:	48 83 f8 0e          	cmp    $0xe,%rax
  400ea0:	48 89 e5             	mov    %rsp,%rbp
  400ea3:	76 1b                	jbe    400ec0 <deregister_tm_clones+0x30>
  400ea5:	b8 00 00 00 00       	mov    $0x0,%eax
  400eaa:	48 85 c0             	test   %rax,%rax
  400ead:	74 11                	je     400ec0 <deregister_tm_clones+0x30>
  400eaf:	5d                   	pop    %rbp
  400eb0:	bf 60 41 60 00       	mov    $0x604160,%edi
  400eb5:	ff e0                	jmpq   *%rax
  400eb7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400ebe:	00 00 
  400ec0:	5d                   	pop    %rbp
  400ec1:	c3                   	retq   
  400ec2:	0f 1f 40 00          	nopl   0x0(%rax)
  400ec6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400ecd:	00 00 00 

0000000000400ed0 <register_tm_clones>:
  400ed0:	be 60 41 60 00       	mov    $0x604160,%esi
  400ed5:	55                   	push   %rbp
  400ed6:	48 81 ee 60 41 60 00 	sub    $0x604160,%rsi
  400edd:	48 c1 fe 03          	sar    $0x3,%rsi
  400ee1:	48 89 e5             	mov    %rsp,%rbp
  400ee4:	48 89 f0             	mov    %rsi,%rax
  400ee7:	48 c1 e8 3f          	shr    $0x3f,%rax
  400eeb:	48 01 c6             	add    %rax,%rsi
  400eee:	48 d1 fe             	sar    %rsi
  400ef1:	74 15                	je     400f08 <register_tm_clones+0x38>
  400ef3:	b8 00 00 00 00       	mov    $0x0,%eax
  400ef8:	48 85 c0             	test   %rax,%rax
  400efb:	74 0b                	je     400f08 <register_tm_clones+0x38>
  400efd:	5d                   	pop    %rbp
  400efe:	bf 60 41 60 00       	mov    $0x604160,%edi
  400f03:	ff e0                	jmpq   *%rax
  400f05:	0f 1f 00             	nopl   (%rax)
  400f08:	5d                   	pop    %rbp
  400f09:	c3                   	retq   
  400f0a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400f10 <__do_global_dtors_aux>:
  400f10:	80 3d 71 32 20 00 00 	cmpb   $0x0,0x203271(%rip)        # 604188 <completed.7594>
  400f17:	75 11                	jne    400f2a <__do_global_dtors_aux+0x1a>
  400f19:	55                   	push   %rbp
  400f1a:	48 89 e5             	mov    %rsp,%rbp
  400f1d:	e8 6e ff ff ff       	callq  400e90 <deregister_tm_clones>
  400f22:	5d                   	pop    %rbp
  400f23:	c6 05 5e 32 20 00 01 	movb   $0x1,0x20325e(%rip)        # 604188 <completed.7594>
  400f2a:	f3 c3                	repz retq 
  400f2c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400f30 <frame_dummy>:
  400f30:	bf 20 3e 60 00       	mov    $0x603e20,%edi
  400f35:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400f39:	75 05                	jne    400f40 <frame_dummy+0x10>
  400f3b:	eb 93                	jmp    400ed0 <register_tm_clones>
  400f3d:	0f 1f 00             	nopl   (%rax)
  400f40:	b8 00 00 00 00       	mov    $0x0,%eax
  400f45:	48 85 c0             	test   %rax,%rax
  400f48:	74 f1                	je     400f3b <frame_dummy+0xb>
  400f4a:	55                   	push   %rbp
  400f4b:	48 89 e5             	mov    %rsp,%rbp
  400f4e:	ff d0                	callq  *%rax
  400f50:	5d                   	pop    %rbp
  400f51:	e9 7a ff ff ff       	jmpq   400ed0 <register_tm_clones>

0000000000400f56 <usage>:
  400f56:	48 83 ec 08          	sub    $0x8,%rsp
  400f5a:	48 89 fa             	mov    %rdi,%rdx
  400f5d:	83 3d 84 35 20 00 00 	cmpl   $0x0,0x203584(%rip)        # 6044e8 <is_checker>
  400f64:	74 3e                	je     400fa4 <usage+0x4e>
  400f66:	be 88 2d 40 00       	mov    $0x402d88,%esi
  400f6b:	bf 01 00 00 00       	mov    $0x1,%edi
  400f70:	b8 00 00 00 00       	mov    $0x0,%eax
  400f75:	e8 36 fe ff ff       	callq  400db0 <__printf_chk@plt>
  400f7a:	bf c0 2d 40 00       	mov    $0x402dc0,%edi
  400f7f:	e8 fc fc ff ff       	callq  400c80 <puts@plt>
  400f84:	bf f8 2e 40 00       	mov    $0x402ef8,%edi
  400f89:	e8 f2 fc ff ff       	callq  400c80 <puts@plt>
  400f8e:	bf e8 2d 40 00       	mov    $0x402de8,%edi
  400f93:	e8 e8 fc ff ff       	callq  400c80 <puts@plt>
  400f98:	bf 12 2f 40 00       	mov    $0x402f12,%edi
  400f9d:	e8 de fc ff ff       	callq  400c80 <puts@plt>
  400fa2:	eb 32                	jmp    400fd6 <usage+0x80>
  400fa4:	be 2e 2f 40 00       	mov    $0x402f2e,%esi
  400fa9:	bf 01 00 00 00       	mov    $0x1,%edi
  400fae:	b8 00 00 00 00       	mov    $0x0,%eax
  400fb3:	e8 f8 fd ff ff       	callq  400db0 <__printf_chk@plt>
  400fb8:	bf 10 2e 40 00       	mov    $0x402e10,%edi
  400fbd:	e8 be fc ff ff       	callq  400c80 <puts@plt>
  400fc2:	bf 38 2e 40 00       	mov    $0x402e38,%edi
  400fc7:	e8 b4 fc ff ff       	callq  400c80 <puts@plt>
  400fcc:	bf 4c 2f 40 00       	mov    $0x402f4c,%edi
  400fd1:	e8 aa fc ff ff       	callq  400c80 <puts@plt>
  400fd6:	bf 00 00 00 00       	mov    $0x0,%edi
  400fdb:	e8 20 fe ff ff       	callq  400e00 <exit@plt>

0000000000400fe0 <initialize_target>:
  400fe0:	55                   	push   %rbp
  400fe1:	53                   	push   %rbx
  400fe2:	48 81 ec 18 21 00 00 	sub    $0x2118,%rsp
  400fe9:	89 f5                	mov    %esi,%ebp
  400feb:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  400ff2:	00 00 
  400ff4:	48 89 84 24 08 21 00 	mov    %rax,0x2108(%rsp)
  400ffb:	00 
  400ffc:	31 c0                	xor    %eax,%eax
  400ffe:	89 3d d4 34 20 00    	mov    %edi,0x2034d4(%rip)        # 6044d8 <check_level>
  401004:	8b 3d 2e 31 20 00    	mov    0x20312e(%rip),%edi        # 604138 <target_id>
  40100a:	e8 c4 1c 00 00       	callq  402cd3 <gencookie>
  40100f:	89 05 cf 34 20 00    	mov    %eax,0x2034cf(%rip)        # 6044e4 <cookie>
  401015:	89 c7                	mov    %eax,%edi
  401017:	e8 b7 1c 00 00       	callq  402cd3 <gencookie>
  40101c:	89 05 be 34 20 00    	mov    %eax,0x2034be(%rip)        # 6044e0 <authkey>
  401022:	8b 05 10 31 20 00    	mov    0x203110(%rip),%eax        # 604138 <target_id>
  401028:	8d 78 01             	lea    0x1(%rax),%edi
  40102b:	e8 20 fc ff ff       	callq  400c50 <srandom@plt>
  401030:	e8 3b fd ff ff       	callq  400d70 <random@plt>
  401035:	89 c7                	mov    %eax,%edi
  401037:	e8 a9 02 00 00       	callq  4012e5 <scramble>
  40103c:	89 c3                	mov    %eax,%ebx
  40103e:	85 ed                	test   %ebp,%ebp
  401040:	74 18                	je     40105a <initialize_target+0x7a>
  401042:	bf 00 00 00 00       	mov    $0x0,%edi
  401047:	e8 14 fd ff ff       	callq  400d60 <time@plt>
  40104c:	89 c7                	mov    %eax,%edi
  40104e:	e8 fd fb ff ff       	callq  400c50 <srandom@plt>
  401053:	e8 18 fd ff ff       	callq  400d70 <random@plt>
  401058:	eb 05                	jmp    40105f <initialize_target+0x7f>
  40105a:	b8 00 00 00 00       	mov    $0x0,%eax
  40105f:	01 c3                	add    %eax,%ebx
  401061:	0f b7 db             	movzwl %bx,%ebx
  401064:	8d 04 dd 00 01 00 00 	lea    0x100(,%rbx,8),%eax
  40106b:	89 c0                	mov    %eax,%eax
  40106d:	48 89 05 dc 30 20 00 	mov    %rax,0x2030dc(%rip)        # 604150 <buf_offset>
  401074:	c6 05 8d 40 20 00 63 	movb   $0x63,0x20408d(%rip)        # 605108 <target_prefix>
  40107b:	83 3d d6 30 20 00 00 	cmpl   $0x0,0x2030d6(%rip)        # 604158 <notify>
  401082:	74 65                	je     4010e9 <initialize_target+0x109>
  401084:	83 3d 5d 34 20 00 00 	cmpl   $0x0,0x20345d(%rip)        # 6044e8 <is_checker>
  40108b:	75 5c                	jne    4010e9 <initialize_target+0x109>
  40108d:	be 00 01 00 00       	mov    $0x100,%esi
  401092:	48 89 e7             	mov    %rsp,%rdi
  401095:	e8 56 fd ff ff       	callq  400df0 <gethostname@plt>
  40109a:	85 c0                	test   %eax,%eax
  40109c:	74 14                	je     4010b2 <initialize_target+0xd2>
  40109e:	bf 68 2e 40 00       	mov    $0x402e68,%edi
  4010a3:	e8 d8 fb ff ff       	callq  400c80 <puts@plt>
  4010a8:	bf 08 00 00 00       	mov    $0x8,%edi
  4010ad:	e8 4e fd ff ff       	callq  400e00 <exit@plt>
  4010b2:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  4010b9:	00 
  4010ba:	e8 7e 19 00 00       	callq  402a3d <init_driver>
  4010bf:	85 c0                	test   %eax,%eax
  4010c1:	79 26                	jns    4010e9 <initialize_target+0x109>
  4010c3:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
  4010ca:	00 
  4010cb:	be a0 2e 40 00       	mov    $0x402ea0,%esi
  4010d0:	bf 01 00 00 00       	mov    $0x1,%edi
  4010d5:	b8 00 00 00 00       	mov    $0x0,%eax
  4010da:	e8 d1 fc ff ff       	callq  400db0 <__printf_chk@plt>
  4010df:	bf 08 00 00 00       	mov    $0x8,%edi
  4010e4:	e8 17 fd ff ff       	callq  400e00 <exit@plt>
  4010e9:	48 8b 84 24 08 21 00 	mov    0x2108(%rsp),%rax
  4010f0:	00 
  4010f1:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4010f8:	00 00 
  4010fa:	74 05                	je     401101 <initialize_target+0x121>
  4010fc:	e8 9f fb ff ff       	callq  400ca0 <__stack_chk_fail@plt>
  401101:	48 81 c4 18 21 00 00 	add    $0x2118,%rsp
  401108:	5b                   	pop    %rbx
  401109:	5d                   	pop    %rbp
  40110a:	c3                   	retq   

000000000040110b <main>:
  40110b:	41 56                	push   %r14
  40110d:	41 55                	push   %r13
  40110f:	41 54                	push   %r12
  401111:	55                   	push   %rbp
  401112:	53                   	push   %rbx
  401113:	41 89 fc             	mov    %edi,%r12d
  401116:	48 89 f3             	mov    %rsi,%rbx
  401119:	be 78 1d 40 00       	mov    $0x401d78,%esi
  40111e:	bf 0b 00 00 00       	mov    $0xb,%edi
  401123:	e8 e8 fb ff ff       	callq  400d10 <signal@plt>
  401128:	be 2a 1d 40 00       	mov    $0x401d2a,%esi
  40112d:	bf 07 00 00 00       	mov    $0x7,%edi
  401132:	e8 d9 fb ff ff       	callq  400d10 <signal@plt>
  401137:	be c6 1d 40 00       	mov    $0x401dc6,%esi
  40113c:	bf 04 00 00 00       	mov    $0x4,%edi
  401141:	e8 ca fb ff ff       	callq  400d10 <signal@plt>
  401146:	83 3d 9b 33 20 00 00 	cmpl   $0x0,0x20339b(%rip)        # 6044e8 <is_checker>
  40114d:	74 20                	je     40116f <main+0x64>
  40114f:	be 14 1e 40 00       	mov    $0x401e14,%esi
  401154:	bf 0e 00 00 00       	mov    $0xe,%edi
  401159:	e8 b2 fb ff ff       	callq  400d10 <signal@plt>
  40115e:	bf 05 00 00 00       	mov    $0x5,%edi
  401163:	e8 68 fb ff ff       	callq  400cd0 <alarm@plt>
  401168:	bd 6a 2f 40 00       	mov    $0x402f6a,%ebp
  40116d:	eb 05                	jmp    401174 <main+0x69>
  40116f:	bd 65 2f 40 00       	mov    $0x402f65,%ebp
  401174:	48 8b 05 e5 2f 20 00 	mov    0x202fe5(%rip),%rax        # 604160 <__TMC_END__>
  40117b:	48 89 05 4e 33 20 00 	mov    %rax,0x20334e(%rip)        # 6044d0 <infile>
  401182:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  401188:	41 be 00 00 00 00    	mov    $0x0,%r14d
  40118e:	e9 c6 00 00 00       	jmpq   401259 <main+0x14e>
  401193:	83 e8 61             	sub    $0x61,%eax
  401196:	3c 10                	cmp    $0x10,%al
  401198:	0f 87 9c 00 00 00    	ja     40123a <main+0x12f>
  40119e:	0f b6 c0             	movzbl %al,%eax
  4011a1:	ff 24 c5 b0 2f 40 00 	jmpq   *0x402fb0(,%rax,8)
  4011a8:	48 8b 3b             	mov    (%rbx),%rdi
  4011ab:	e8 a6 fd ff ff       	callq  400f56 <usage>
  4011b0:	be 05 32 40 00       	mov    $0x403205,%esi
  4011b5:	48 8b 3d ac 2f 20 00 	mov    0x202fac(%rip),%rdi        # 604168 <optarg@@GLIBC_2.2.5>
  4011bc:	e8 ff fb ff ff       	callq  400dc0 <fopen@plt>
  4011c1:	48 89 05 08 33 20 00 	mov    %rax,0x203308(%rip)        # 6044d0 <infile>
  4011c8:	48 85 c0             	test   %rax,%rax
  4011cb:	0f 85 88 00 00 00    	jne    401259 <main+0x14e>
  4011d1:	48 8b 0d 90 2f 20 00 	mov    0x202f90(%rip),%rcx        # 604168 <optarg@@GLIBC_2.2.5>
  4011d8:	ba 72 2f 40 00       	mov    $0x402f72,%edx
  4011dd:	be 01 00 00 00       	mov    $0x1,%esi
  4011e2:	48 8b 3d 97 2f 20 00 	mov    0x202f97(%rip),%rdi        # 604180 <stderr@@GLIBC_2.2.5>
  4011e9:	e8 32 fc ff ff       	callq  400e20 <__fprintf_chk@plt>
  4011ee:	b8 01 00 00 00       	mov    $0x1,%eax
  4011f3:	e9 e4 00 00 00       	jmpq   4012dc <main+0x1d1>
  4011f8:	ba 10 00 00 00       	mov    $0x10,%edx
  4011fd:	be 00 00 00 00       	mov    $0x0,%esi
  401202:	48 8b 3d 5f 2f 20 00 	mov    0x202f5f(%rip),%rdi        # 604168 <optarg@@GLIBC_2.2.5>
  401209:	e8 d2 fb ff ff       	callq  400de0 <strtoul@plt>
  40120e:	41 89 c6             	mov    %eax,%r14d
  401211:	eb 46                	jmp    401259 <main+0x14e>
  401213:	ba 0a 00 00 00       	mov    $0xa,%edx
  401218:	be 00 00 00 00       	mov    $0x0,%esi
  40121d:	48 8b 3d 44 2f 20 00 	mov    0x202f44(%rip),%rdi        # 604168 <optarg@@GLIBC_2.2.5>
  401224:	e8 17 fb ff ff       	callq  400d40 <strtol@plt>
  401229:	41 89 c5             	mov    %eax,%r13d
  40122c:	eb 2b                	jmp    401259 <main+0x14e>
  40122e:	c7 05 20 2f 20 00 00 	movl   $0x0,0x202f20(%rip)        # 604158 <notify>
  401235:	00 00 00 
  401238:	eb 1f                	jmp    401259 <main+0x14e>
  40123a:	0f be d2             	movsbl %dl,%edx
  40123d:	be 8f 2f 40 00       	mov    $0x402f8f,%esi
  401242:	bf 01 00 00 00       	mov    $0x1,%edi
  401247:	b8 00 00 00 00       	mov    $0x0,%eax
  40124c:	e8 5f fb ff ff       	callq  400db0 <__printf_chk@plt>
  401251:	48 8b 3b             	mov    (%rbx),%rdi
  401254:	e8 fd fc ff ff       	callq  400f56 <usage>
  401259:	48 89 ea             	mov    %rbp,%rdx
  40125c:	48 89 de             	mov    %rbx,%rsi
  40125f:	44 89 e7             	mov    %r12d,%edi
  401262:	e8 69 fb ff ff       	callq  400dd0 <getopt@plt>
  401267:	89 c2                	mov    %eax,%edx
  401269:	3c ff                	cmp    $0xff,%al
  40126b:	0f 85 22 ff ff ff    	jne    401193 <main+0x88>
  401271:	be 00 00 00 00       	mov    $0x0,%esi
  401276:	44 89 ef             	mov    %r13d,%edi
  401279:	e8 62 fd ff ff       	callq  400fe0 <initialize_target>
  40127e:	83 3d 63 32 20 00 00 	cmpl   $0x0,0x203263(%rip)        # 6044e8 <is_checker>
  401285:	74 2a                	je     4012b1 <main+0x1a6>
  401287:	44 3b 35 52 32 20 00 	cmp    0x203252(%rip),%r14d        # 6044e0 <authkey>
  40128e:	74 21                	je     4012b1 <main+0x1a6>
  401290:	44 89 f2             	mov    %r14d,%edx
  401293:	be c8 2e 40 00       	mov    $0x402ec8,%esi
  401298:	bf 01 00 00 00       	mov    $0x1,%edi
  40129d:	b8 00 00 00 00       	mov    $0x0,%eax
  4012a2:	e8 09 fb ff ff       	callq  400db0 <__printf_chk@plt>
  4012a7:	b8 00 00 00 00       	mov    $0x0,%eax
  4012ac:	e8 15 07 00 00       	callq  4019c6 <check_fail>
  4012b1:	8b 15 2d 32 20 00    	mov    0x20322d(%rip),%edx        # 6044e4 <cookie>
  4012b7:	be a2 2f 40 00       	mov    $0x402fa2,%esi
  4012bc:	bf 01 00 00 00       	mov    $0x1,%edi
  4012c1:	b8 00 00 00 00       	mov    $0x0,%eax
  4012c6:	e8 e5 fa ff ff       	callq  400db0 <__printf_chk@plt>
  4012cb:	48 8b 3d 7e 2e 20 00 	mov    0x202e7e(%rip),%rdi        # 604150 <buf_offset>
  4012d2:	e8 3d 0c 00 00       	callq  401f14 <stable_launch>
  4012d7:	b8 00 00 00 00       	mov    $0x0,%eax
  4012dc:	5b                   	pop    %rbx
  4012dd:	5d                   	pop    %rbp
  4012de:	41 5c                	pop    %r12
  4012e0:	41 5d                	pop    %r13
  4012e2:	41 5e                	pop    %r14
  4012e4:	c3                   	retq   

00000000004012e5 <scramble>:
  4012e5:	48 83 ec 38          	sub    $0x38,%rsp
  4012e9:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4012f0:	00 00 
  4012f2:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  4012f7:	31 c0                	xor    %eax,%eax
  4012f9:	eb 10                	jmp    40130b <scramble+0x26>
  4012fb:	69 d0 19 a3 00 00    	imul   $0xa319,%eax,%edx
  401301:	01 fa                	add    %edi,%edx
  401303:	89 c1                	mov    %eax,%ecx
  401305:	89 14 8c             	mov    %edx,(%rsp,%rcx,4)
  401308:	83 c0 01             	add    $0x1,%eax
  40130b:	83 f8 09             	cmp    $0x9,%eax
  40130e:	76 eb                	jbe    4012fb <scramble+0x16>
  401310:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401314:	69 c0 2c 74 00 00    	imul   $0x742c,%eax,%eax
  40131a:	89 44 24 14          	mov    %eax,0x14(%rsp)
  40131e:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401322:	69 c0 0e 21 00 00    	imul   $0x210e,%eax,%eax
  401328:	89 44 24 14          	mov    %eax,0x14(%rsp)
  40132c:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401330:	69 c0 ae 3c 00 00    	imul   $0x3cae,%eax,%eax
  401336:	89 44 24 04          	mov    %eax,0x4(%rsp)
  40133a:	8b 44 24 04          	mov    0x4(%rsp),%eax
  40133e:	69 c0 2f a8 00 00    	imul   $0xa82f,%eax,%eax
  401344:	89 44 24 04          	mov    %eax,0x4(%rsp)
  401348:	8b 44 24 14          	mov    0x14(%rsp),%eax
  40134c:	69 c0 05 f9 00 00    	imul   $0xf905,%eax,%eax
  401352:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401356:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  40135a:	69 c0 1f a1 00 00    	imul   $0xa11f,%eax,%eax
  401360:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401364:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401368:	69 c0 53 dc 00 00    	imul   $0xdc53,%eax,%eax
  40136e:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401372:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401376:	69 c0 4b 83 00 00    	imul   $0x834b,%eax,%eax
  40137c:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401380:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401384:	69 c0 41 bc 00 00    	imul   $0xbc41,%eax,%eax
  40138a:	89 44 24 24          	mov    %eax,0x24(%rsp)
  40138e:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401392:	69 c0 35 59 00 00    	imul   $0x5935,%eax,%eax
  401398:	89 44 24 14          	mov    %eax,0x14(%rsp)
  40139c:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4013a0:	69 c0 fc d3 00 00    	imul   $0xd3fc,%eax,%eax
  4013a6:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4013aa:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4013ae:	69 c0 86 20 00 00    	imul   $0x2086,%eax,%eax
  4013b4:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4013b8:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4013bc:	69 c0 9a fe 00 00    	imul   $0xfe9a,%eax,%eax
  4013c2:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4013c6:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4013ca:	69 c0 0d 15 00 00    	imul   $0x150d,%eax,%eax
  4013d0:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4013d4:	8b 04 24             	mov    (%rsp),%eax
  4013d7:	69 c0 58 ba 00 00    	imul   $0xba58,%eax,%eax
  4013dd:	89 04 24             	mov    %eax,(%rsp)
  4013e0:	8b 04 24             	mov    (%rsp),%eax
  4013e3:	69 c0 a4 92 00 00    	imul   $0x92a4,%eax,%eax
  4013e9:	89 04 24             	mov    %eax,(%rsp)
  4013ec:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4013f0:	69 c0 47 8f 00 00    	imul   $0x8f47,%eax,%eax
  4013f6:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4013fa:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4013fe:	69 c0 16 06 00 00    	imul   $0x616,%eax,%eax
  401404:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401408:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  40140c:	69 c0 8b ac 00 00    	imul   $0xac8b,%eax,%eax
  401412:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401416:	8b 44 24 14          	mov    0x14(%rsp),%eax
  40141a:	69 c0 ab 7d 00 00    	imul   $0x7dab,%eax,%eax
  401420:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401424:	8b 44 24 10          	mov    0x10(%rsp),%eax
  401428:	69 c0 72 31 00 00    	imul   $0x3172,%eax,%eax
  40142e:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401432:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401436:	69 c0 6e 36 00 00    	imul   $0x366e,%eax,%eax
  40143c:	89 44 24 04          	mov    %eax,0x4(%rsp)
  401440:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401444:	69 c0 92 65 00 00    	imul   $0x6592,%eax,%eax
  40144a:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  40144e:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401452:	69 c0 a9 65 00 00    	imul   $0x65a9,%eax,%eax
  401458:	89 44 24 24          	mov    %eax,0x24(%rsp)
  40145c:	8b 04 24             	mov    (%rsp),%eax
  40145f:	69 c0 35 44 00 00    	imul   $0x4435,%eax,%eax
  401465:	89 04 24             	mov    %eax,(%rsp)
  401468:	8b 44 24 24          	mov    0x24(%rsp),%eax
  40146c:	69 c0 80 c0 00 00    	imul   $0xc080,%eax,%eax
  401472:	89 44 24 24          	mov    %eax,0x24(%rsp)
  401476:	8b 44 24 18          	mov    0x18(%rsp),%eax
  40147a:	69 c0 28 e3 00 00    	imul   $0xe328,%eax,%eax
  401480:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401484:	8b 04 24             	mov    (%rsp),%eax
  401487:	69 c0 cc f6 00 00    	imul   $0xf6cc,%eax,%eax
  40148d:	89 04 24             	mov    %eax,(%rsp)
  401490:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401494:	69 c0 b2 43 00 00    	imul   $0x43b2,%eax,%eax
  40149a:	89 44 24 14          	mov    %eax,0x14(%rsp)
  40149e:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4014a2:	69 c0 4d d1 00 00    	imul   $0xd14d,%eax,%eax
  4014a8:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4014ac:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4014b0:	69 c0 62 94 00 00    	imul   $0x9462,%eax,%eax
  4014b6:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4014ba:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4014be:	69 c0 8f 2c 00 00    	imul   $0x2c8f,%eax,%eax
  4014c4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4014c8:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4014cc:	69 c0 a4 17 00 00    	imul   $0x17a4,%eax,%eax
  4014d2:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4014d6:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4014da:	69 c0 9f ef 00 00    	imul   $0xef9f,%eax,%eax
  4014e0:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4014e4:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4014e8:	69 c0 eb e0 00 00    	imul   $0xe0eb,%eax,%eax
  4014ee:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4014f2:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  4014f6:	69 c0 c1 69 00 00    	imul   $0x69c1,%eax,%eax
  4014fc:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401500:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401504:	69 c0 14 8c 00 00    	imul   $0x8c14,%eax,%eax
  40150a:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  40150e:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401512:	69 c0 23 20 00 00    	imul   $0x2023,%eax,%eax
  401518:	89 44 24 04          	mov    %eax,0x4(%rsp)
  40151c:	8b 04 24             	mov    (%rsp),%eax
  40151f:	69 c0 e9 59 00 00    	imul   $0x59e9,%eax,%eax
  401525:	89 04 24             	mov    %eax,(%rsp)
  401528:	8b 44 24 18          	mov    0x18(%rsp),%eax
  40152c:	69 c0 7a 13 00 00    	imul   $0x137a,%eax,%eax
  401532:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401536:	8b 44 24 14          	mov    0x14(%rsp),%eax
  40153a:	69 c0 aa 44 00 00    	imul   $0x44aa,%eax,%eax
  401540:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401544:	8b 04 24             	mov    (%rsp),%eax
  401547:	69 c0 4f b6 00 00    	imul   $0xb64f,%eax,%eax
  40154d:	89 04 24             	mov    %eax,(%rsp)
  401550:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401554:	69 c0 01 b5 00 00    	imul   $0xb501,%eax,%eax
  40155a:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  40155e:	8b 04 24             	mov    (%rsp),%eax
  401561:	69 c0 94 09 00 00    	imul   $0x994,%eax,%eax
  401567:	89 04 24             	mov    %eax,(%rsp)
  40156a:	8b 44 24 18          	mov    0x18(%rsp),%eax
  40156e:	69 c0 f5 b8 00 00    	imul   $0xb8f5,%eax,%eax
  401574:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401578:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  40157c:	69 c0 bf f6 00 00    	imul   $0xf6bf,%eax,%eax
  401582:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401586:	8b 44 24 08          	mov    0x8(%rsp),%eax
  40158a:	69 c0 d4 3e 00 00    	imul   $0x3ed4,%eax,%eax
  401590:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401594:	8b 44 24 10          	mov    0x10(%rsp),%eax
  401598:	69 c0 00 71 00 00    	imul   $0x7100,%eax,%eax
  40159e:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4015a2:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4015a6:	69 c0 f4 55 00 00    	imul   $0x55f4,%eax,%eax
  4015ac:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4015b0:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4015b4:	69 c0 a8 1a 00 00    	imul   $0x1aa8,%eax,%eax
  4015ba:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4015be:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  4015c2:	69 c0 ea cd 00 00    	imul   $0xcdea,%eax,%eax
  4015c8:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  4015cc:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4015d0:	69 c0 3c 49 00 00    	imul   $0x493c,%eax,%eax
  4015d6:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4015da:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4015de:	69 c0 99 24 00 00    	imul   $0x2499,%eax,%eax
  4015e4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4015e8:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4015ec:	69 c0 a6 4b 00 00    	imul   $0x4ba6,%eax,%eax
  4015f2:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4015f6:	8b 04 24             	mov    (%rsp),%eax
  4015f9:	69 c0 2b ef 00 00    	imul   $0xef2b,%eax,%eax
  4015ff:	89 04 24             	mov    %eax,(%rsp)
  401602:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401606:	69 c0 a0 1c 00 00    	imul   $0x1ca0,%eax,%eax
  40160c:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401610:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401614:	69 c0 1b 33 00 00    	imul   $0x331b,%eax,%eax
  40161a:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  40161e:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401622:	69 c0 a7 5b 00 00    	imul   $0x5ba7,%eax,%eax
  401628:	89 44 24 04          	mov    %eax,0x4(%rsp)
  40162c:	8b 44 24 10          	mov    0x10(%rsp),%eax
  401630:	69 c0 0b 80 00 00    	imul   $0x800b,%eax,%eax
  401636:	89 44 24 10          	mov    %eax,0x10(%rsp)
  40163a:	8b 44 24 08          	mov    0x8(%rsp),%eax
  40163e:	69 c0 d1 e0 00 00    	imul   $0xe0d1,%eax,%eax
  401644:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401648:	8b 44 24 20          	mov    0x20(%rsp),%eax
  40164c:	69 c0 1e 40 00 00    	imul   $0x401e,%eax,%eax
  401652:	89 44 24 20          	mov    %eax,0x20(%rsp)
  401656:	8b 44 24 18          	mov    0x18(%rsp),%eax
  40165a:	69 c0 57 86 00 00    	imul   $0x8657,%eax,%eax
  401660:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401664:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401668:	69 c0 de fa 00 00    	imul   $0xfade,%eax,%eax
  40166e:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401672:	8b 44 24 20          	mov    0x20(%rsp),%eax
  401676:	69 c0 6a d5 00 00    	imul   $0xd56a,%eax,%eax
  40167c:	89 44 24 20          	mov    %eax,0x20(%rsp)
  401680:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401684:	69 c0 f7 57 00 00    	imul   $0x57f7,%eax,%eax
  40168a:	89 44 24 14          	mov    %eax,0x14(%rsp)
  40168e:	8b 04 24             	mov    (%rsp),%eax
  401691:	69 c0 b1 87 00 00    	imul   $0x87b1,%eax,%eax
  401697:	89 04 24             	mov    %eax,(%rsp)
  40169a:	8b 04 24             	mov    (%rsp),%eax
  40169d:	69 c0 7c 74 00 00    	imul   $0x747c,%eax,%eax
  4016a3:	89 04 24             	mov    %eax,(%rsp)
  4016a6:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4016aa:	69 c0 e1 7f 00 00    	imul   $0x7fe1,%eax,%eax
  4016b0:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4016b4:	8b 44 24 04          	mov    0x4(%rsp),%eax
  4016b8:	69 c0 4d 3a 00 00    	imul   $0x3a4d,%eax,%eax
  4016be:	89 44 24 04          	mov    %eax,0x4(%rsp)
  4016c2:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4016c6:	69 c0 97 17 00 00    	imul   $0x1797,%eax,%eax
  4016cc:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4016d0:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4016d4:	69 c0 a7 2a 00 00    	imul   $0x2aa7,%eax,%eax
  4016da:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4016de:	8b 44 24 04          	mov    0x4(%rsp),%eax
  4016e2:	69 c0 4e 5d 00 00    	imul   $0x5d4e,%eax,%eax
  4016e8:	89 44 24 04          	mov    %eax,0x4(%rsp)
  4016ec:	8b 04 24             	mov    (%rsp),%eax
  4016ef:	69 c0 27 07 00 00    	imul   $0x727,%eax,%eax
  4016f5:	89 04 24             	mov    %eax,(%rsp)
  4016f8:	8b 04 24             	mov    (%rsp),%eax
  4016fb:	69 c0 e0 45 00 00    	imul   $0x45e0,%eax,%eax
  401701:	89 04 24             	mov    %eax,(%rsp)
  401704:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401708:	69 c0 32 1e 00 00    	imul   $0x1e32,%eax,%eax
  40170e:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401712:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401716:	69 c0 32 c0 00 00    	imul   $0xc032,%eax,%eax
  40171c:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401720:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401724:	69 c0 41 fe 00 00    	imul   $0xfe41,%eax,%eax
  40172a:	89 44 24 24          	mov    %eax,0x24(%rsp)
  40172e:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401732:	69 c0 42 dd 00 00    	imul   $0xdd42,%eax,%eax
  401738:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  40173c:	ba 00 00 00 00       	mov    $0x0,%edx
  401741:	b8 00 00 00 00       	mov    $0x0,%eax
  401746:	eb 0a                	jmp    401752 <scramble+0x46d>
  401748:	89 d1                	mov    %edx,%ecx
  40174a:	8b 0c 8c             	mov    (%rsp,%rcx,4),%ecx
  40174d:	01 c8                	add    %ecx,%eax
  40174f:	83 c2 01             	add    $0x1,%edx
  401752:	83 fa 09             	cmp    $0x9,%edx
  401755:	76 f1                	jbe    401748 <scramble+0x463>
  401757:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  40175c:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  401763:	00 00 
  401765:	74 05                	je     40176c <scramble+0x487>
  401767:	e8 34 f5 ff ff       	callq  400ca0 <__stack_chk_fail@plt>
  40176c:	48 83 c4 38          	add    $0x38,%rsp
  401770:	c3                   	retq   

0000000000401771 <getbuf>:
  401771:	48 83 ec 38          	sub    $0x38,%rsp # 56 in decimal
  401775:	48 89 e7             	mov    %rsp,%rdi
  401778:	e8 7e 02 00 00       	callq  4019fb <Gets>
  40177d:	b8 01 00 00 00       	mov    $0x1,%eax
  401782:	48 83 c4 38          	add    $0x38,%rsp
  401786:	c3                   	retq   

0000000000401787 <touch1>:
  401787:	48 83 ec 08          	sub    $0x8,%rsp
  40178b:	c7 05 47 2d 20 00 01 	movl   $0x1,0x202d47(%rip)        # 6044dc <vlevel>
  401792:	00 00 00 
  401795:	bf 57 30 40 00       	mov    $0x403057,%edi
  40179a:	e8 e1 f4 ff ff       	callq  400c80 <puts@plt>
  40179f:	bf 01 00 00 00       	mov    $0x1,%edi
  4017a4:	e8 97 04 00 00       	callq  401c40 <validate>
  4017a9:	bf 00 00 00 00       	mov    $0x0,%edi
  4017ae:	e8 4d f6 ff ff       	callq  400e00 <exit@plt>

00000000004017b3 <touch2>:
  4017b3:	48 83 ec 08          	sub    $0x8,%rsp
  4017b7:	89 fa                	mov    %edi,%edx
  4017b9:	c7 05 19 2d 20 00 02 	movl   $0x2,0x202d19(%rip)        # 6044dc <vlevel>
  4017c0:	00 00 00 
  4017c3:	39 3d 1b 2d 20 00    	cmp    %edi,0x202d1b(%rip)        # 6044e4 <cookie>
  4017c9:	75 20                	jne    4017eb <touch2+0x38>
  4017cb:	be 80 30 40 00       	mov    $0x403080,%esi
  4017d0:	bf 01 00 00 00       	mov    $0x1,%edi
  4017d5:	b8 00 00 00 00       	mov    $0x0,%eax
  4017da:	e8 d1 f5 ff ff       	callq  400db0 <__printf_chk@plt>
  4017df:	bf 02 00 00 00       	mov    $0x2,%edi
  4017e4:	e8 57 04 00 00       	callq  401c40 <validate>
  4017e9:	eb 1e                	jmp    401809 <touch2+0x56>
  4017eb:	be a8 30 40 00       	mov    $0x4030a8,%esi
  4017f0:	bf 01 00 00 00       	mov    $0x1,%edi
  4017f5:	b8 00 00 00 00       	mov    $0x0,%eax
  4017fa:	e8 b1 f5 ff ff       	callq  400db0 <__printf_chk@plt>
  4017ff:	bf 02 00 00 00       	mov    $0x2,%edi
  401804:	e8 f9 04 00 00       	callq  401d02 <fail>
  401809:	bf 00 00 00 00       	mov    $0x0,%edi
  40180e:	e8 ed f5 ff ff       	callq  400e00 <exit@plt>

0000000000401813 <hexmatch>:
  401813:	41 54                	push   %r12
  401815:	55                   	push   %rbp
  401816:	53                   	push   %rbx
  401817:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
  40181b:	89 fd                	mov    %edi,%ebp
  40181d:	48 89 f3             	mov    %rsi,%rbx
  401820:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401827:	00 00 
  401829:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  40182e:	31 c0                	xor    %eax,%eax
  401830:	e8 3b f5 ff ff       	callq  400d70 <random@plt>
  401835:	48 89 c1             	mov    %rax,%rcx
  401838:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  40183f:	0a d7 a3 
  401842:	48 f7 ea             	imul   %rdx
  401845:	48 01 ca             	add    %rcx,%rdx
  401848:	48 c1 fa 06          	sar    $0x6,%rdx
  40184c:	48 89 c8             	mov    %rcx,%rax
  40184f:	48 c1 f8 3f          	sar    $0x3f,%rax
  401853:	48 29 c2             	sub    %rax,%rdx
  401856:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  40185a:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  40185e:	48 8d 04 95 00 00 00 	lea    0x0(,%rdx,4),%rax
  401865:	00 
  401866:	48 29 c1             	sub    %rax,%rcx
  401869:	4c 8d 24 0c          	lea    (%rsp,%rcx,1),%r12
  40186d:	41 89 e8             	mov    %ebp,%r8d
  401870:	b9 74 30 40 00       	mov    $0x403074,%ecx
  401875:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  40187c:	be 01 00 00 00       	mov    $0x1,%esi
  401881:	4c 89 e7             	mov    %r12,%rdi
  401884:	b8 00 00 00 00       	mov    $0x0,%eax
  401889:	e8 a2 f5 ff ff       	callq  400e30 <__sprintf_chk@plt>
  40188e:	ba 09 00 00 00       	mov    $0x9,%edx
  401893:	4c 89 e6             	mov    %r12,%rsi
  401896:	48 89 df             	mov    %rbx,%rdi
  401899:	e8 c2 f3 ff ff       	callq  400c60 <strncmp@plt>
  40189e:	85 c0                	test   %eax,%eax
  4018a0:	0f 94 c0             	sete   %al
  4018a3:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
  4018a8:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  4018af:	00 00 
  4018b1:	74 05                	je     4018b8 <hexmatch+0xa5>
  4018b3:	e8 e8 f3 ff ff       	callq  400ca0 <__stack_chk_fail@plt>
  4018b8:	0f b6 c0             	movzbl %al,%eax
  4018bb:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
  4018bf:	5b                   	pop    %rbx
  4018c0:	5d                   	pop    %rbp
  4018c1:	41 5c                	pop    %r12
  4018c3:	c3                   	retq   

00000000004018c4 <touch3>:
  4018c4:	53                   	push   %rbx
  4018c5:	48 89 fb             	mov    %rdi,%rbx
  4018c8:	c7 05 0a 2c 20 00 03 	movl   $0x3,0x202c0a(%rip)        # 6044dc <vlevel>
  4018cf:	00 00 00 
  4018d2:	48 89 fe             	mov    %rdi,%rsi
  4018d5:	8b 3d 09 2c 20 00    	mov    0x202c09(%rip),%edi        # 6044e4 <cookie>
  4018db:	e8 33 ff ff ff       	callq  401813 <hexmatch>
  4018e0:	85 c0                	test   %eax,%eax
  4018e2:	74 23                	je     401907 <touch3+0x43>
  4018e4:	48 89 da             	mov    %rbx,%rdx
  4018e7:	be d0 30 40 00       	mov    $0x4030d0,%esi
  4018ec:	bf 01 00 00 00       	mov    $0x1,%edi
  4018f1:	b8 00 00 00 00       	mov    $0x0,%eax
  4018f6:	e8 b5 f4 ff ff       	callq  400db0 <__printf_chk@plt>
  4018fb:	bf 03 00 00 00       	mov    $0x3,%edi
  401900:	e8 3b 03 00 00       	callq  401c40 <validate>
  401905:	eb 21                	jmp    401928 <touch3+0x64>
  401907:	48 89 da             	mov    %rbx,%rdx
  40190a:	be f8 30 40 00       	mov    $0x4030f8,%esi
  40190f:	bf 01 00 00 00       	mov    $0x1,%edi
  401914:	b8 00 00 00 00       	mov    $0x0,%eax
  401919:	e8 92 f4 ff ff       	callq  400db0 <__printf_chk@plt>
  40191e:	bf 03 00 00 00       	mov    $0x3,%edi
  401923:	e8 da 03 00 00       	callq  401d02 <fail>
  401928:	bf 00 00 00 00       	mov    $0x0,%edi
  40192d:	e8 ce f4 ff ff       	callq  400e00 <exit@plt>

0000000000401932 <test>:
  401932:	48 83 ec 08          	sub    $0x8,%rsp
  401936:	b8 00 00 00 00       	mov    $0x0,%eax
  40193b:	e8 31 fe ff ff       	callq  401771 <getbuf>
  401940:	89 c2                	mov    %eax,%edx
  401942:	be 20 31 40 00       	mov    $0x403120,%esi
  401947:	bf 01 00 00 00       	mov    $0x1,%edi
  40194c:	b8 00 00 00 00       	mov    $0x0,%eax
  401951:	e8 5a f4 ff ff       	callq  400db0 <__printf_chk@plt>
  401956:	48 83 c4 08          	add    $0x8,%rsp
  40195a:	c3                   	retq   

000000000040195b <save_char>:
  40195b:	8b 05 a3 37 20 00    	mov    0x2037a3(%rip),%eax        # 605104 <gets_cnt>
  401961:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401966:	7f 49                	jg     4019b1 <save_char+0x56>
  401968:	8d 14 40             	lea    (%rax,%rax,2),%edx
  40196b:	89 f9                	mov    %edi,%ecx
  40196d:	c0 e9 04             	shr    $0x4,%cl
  401970:	83 e1 0f             	and    $0xf,%ecx
  401973:	0f b6 b1 40 34 40 00 	movzbl 0x403440(%rcx),%esi
  40197a:	48 63 ca             	movslq %edx,%rcx
  40197d:	40 88 b1 00 45 60 00 	mov    %sil,0x604500(%rcx)
  401984:	8d 4a 01             	lea    0x1(%rdx),%ecx
  401987:	83 e7 0f             	and    $0xf,%edi
  40198a:	0f b6 b7 40 34 40 00 	movzbl 0x403440(%rdi),%esi
  401991:	48 63 c9             	movslq %ecx,%rcx
  401994:	40 88 b1 00 45 60 00 	mov    %sil,0x604500(%rcx)
  40199b:	83 c2 02             	add    $0x2,%edx
  40199e:	48 63 d2             	movslq %edx,%rdx
  4019a1:	c6 82 00 45 60 00 20 	movb   $0x20,0x604500(%rdx)
  4019a8:	83 c0 01             	add    $0x1,%eax
  4019ab:	89 05 53 37 20 00    	mov    %eax,0x203753(%rip)        # 605104 <gets_cnt>
  4019b1:	f3 c3                	repz retq 

00000000004019b3 <save_term>:
  4019b3:	8b 05 4b 37 20 00    	mov    0x20374b(%rip),%eax        # 605104 <gets_cnt>
  4019b9:	8d 04 40             	lea    (%rax,%rax,2),%eax
  4019bc:	48 98                	cltq   
  4019be:	c6 80 00 45 60 00 00 	movb   $0x0,0x604500(%rax)
  4019c5:	c3                   	retq   

00000000004019c6 <check_fail>:
  4019c6:	48 83 ec 08          	sub    $0x8,%rsp
  4019ca:	0f be 15 37 37 20 00 	movsbl 0x203737(%rip),%edx        # 605108 <target_prefix>
  4019d1:	41 b8 00 45 60 00    	mov    $0x604500,%r8d
  4019d7:	8b 0d fb 2a 20 00    	mov    0x202afb(%rip),%ecx        # 6044d8 <check_level>
  4019dd:	be 43 31 40 00       	mov    $0x403143,%esi
  4019e2:	bf 01 00 00 00       	mov    $0x1,%edi
  4019e7:	b8 00 00 00 00       	mov    $0x0,%eax
  4019ec:	e8 bf f3 ff ff       	callq  400db0 <__printf_chk@plt>
  4019f1:	bf 01 00 00 00       	mov    $0x1,%edi
  4019f6:	e8 05 f4 ff ff       	callq  400e00 <exit@plt>

00000000004019fb <Gets>:
  4019fb:	41 54                	push   %r12
  4019fd:	55                   	push   %rbp
  4019fe:	53                   	push   %rbx
  4019ff:	49 89 fc             	mov    %rdi,%r12
  401a02:	c7 05 f8 36 20 00 00 	movl   $0x0,0x2036f8(%rip)        # 605104 <gets_cnt>
  401a09:	00 00 00 
  401a0c:	48 89 fb             	mov    %rdi,%rbx
  401a0f:	eb 11                	jmp    401a22 <Gets+0x27>
  401a11:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401a15:	88 03                	mov    %al,(%rbx)
  401a17:	0f b6 f8             	movzbl %al,%edi
  401a1a:	e8 3c ff ff ff       	callq  40195b <save_char>
  401a1f:	48 89 eb             	mov    %rbp,%rbx
  401a22:	48 8b 3d a7 2a 20 00 	mov    0x202aa7(%rip),%rdi        # 6044d0 <infile>
  401a29:	e8 52 f3 ff ff       	callq  400d80 <_IO_getc@plt>
  401a2e:	83 f8 ff             	cmp    $0xffffffff,%eax
  401a31:	74 05                	je     401a38 <Gets+0x3d>
  401a33:	83 f8 0a             	cmp    $0xa,%eax
  401a36:	75 d9                	jne    401a11 <Gets+0x16>
  401a38:	c6 03 00             	movb   $0x0,(%rbx)
  401a3b:	b8 00 00 00 00       	mov    $0x0,%eax
  401a40:	e8 6e ff ff ff       	callq  4019b3 <save_term>
  401a45:	4c 89 e0             	mov    %r12,%rax
  401a48:	5b                   	pop    %rbx
  401a49:	5d                   	pop    %rbp
  401a4a:	41 5c                	pop    %r12
  401a4c:	c3                   	retq   

0000000000401a4d <notify_server>:
  401a4d:	53                   	push   %rbx
  401a4e:	48 81 ec 10 40 00 00 	sub    $0x4010,%rsp
  401a55:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401a5c:	00 00 
  401a5e:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
  401a65:	00 
  401a66:	31 c0                	xor    %eax,%eax
  401a68:	83 3d 79 2a 20 00 00 	cmpl   $0x0,0x202a79(%rip)        # 6044e8 <is_checker>
  401a6f:	0f 85 aa 01 00 00    	jne    401c1f <notify_server+0x1d2>
  401a75:	89 fb                	mov    %edi,%ebx
  401a77:	8b 05 87 36 20 00    	mov    0x203687(%rip),%eax        # 605104 <gets_cnt>
  401a7d:	83 c0 64             	add    $0x64,%eax
  401a80:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401a85:	7e 1e                	jle    401aa5 <notify_server+0x58>
  401a87:	be 78 32 40 00       	mov    $0x403278,%esi
  401a8c:	bf 01 00 00 00       	mov    $0x1,%edi
  401a91:	b8 00 00 00 00       	mov    $0x0,%eax
  401a96:	e8 15 f3 ff ff       	callq  400db0 <__printf_chk@plt>
  401a9b:	bf 01 00 00 00       	mov    $0x1,%edi
  401aa0:	e8 5b f3 ff ff       	callq  400e00 <exit@plt>
  401aa5:	0f be 05 5c 36 20 00 	movsbl 0x20365c(%rip),%eax        # 605108 <target_prefix>
  401aac:	83 3d a5 26 20 00 00 	cmpl   $0x0,0x2026a5(%rip)        # 604158 <notify>
  401ab3:	74 08                	je     401abd <notify_server+0x70>
  401ab5:	8b 15 25 2a 20 00    	mov    0x202a25(%rip),%edx        # 6044e0 <authkey>
  401abb:	eb 05                	jmp    401ac2 <notify_server+0x75>
  401abd:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  401ac2:	85 db                	test   %ebx,%ebx
  401ac4:	74 08                	je     401ace <notify_server+0x81>
  401ac6:	41 b9 59 31 40 00    	mov    $0x403159,%r9d
  401acc:	eb 06                	jmp    401ad4 <notify_server+0x87>
  401ace:	41 b9 5e 31 40 00    	mov    $0x40315e,%r9d
  401ad4:	68 00 45 60 00       	pushq  $0x604500
  401ad9:	56                   	push   %rsi
  401ada:	50                   	push   %rax
  401adb:	52                   	push   %rdx
  401adc:	44 8b 05 55 26 20 00 	mov    0x202655(%rip),%r8d        # 604138 <target_id>
  401ae3:	b9 63 31 40 00       	mov    $0x403163,%ecx
  401ae8:	ba 00 20 00 00       	mov    $0x2000,%edx
  401aed:	be 01 00 00 00       	mov    $0x1,%esi
  401af2:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  401af7:	b8 00 00 00 00       	mov    $0x0,%eax
  401afc:	e8 2f f3 ff ff       	callq  400e30 <__sprintf_chk@plt>
  401b01:	48 83 c4 20          	add    $0x20,%rsp
  401b05:	83 3d 4c 26 20 00 00 	cmpl   $0x0,0x20264c(%rip)        # 604158 <notify>
  401b0c:	0f 84 81 00 00 00    	je     401b93 <notify_server+0x146>
  401b12:	85 db                	test   %ebx,%ebx
  401b14:	74 6e                	je     401b84 <notify_server+0x137>
  401b16:	4c 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%r9
  401b1d:	00 
  401b1e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401b24:	48 89 e1             	mov    %rsp,%rcx
  401b27:	48 8b 15 12 26 20 00 	mov    0x202612(%rip),%rdx        # 604140 <lab>
  401b2e:	48 8b 35 13 26 20 00 	mov    0x202613(%rip),%rsi        # 604148 <course>
  401b35:	48 8b 3d f4 25 20 00 	mov    0x2025f4(%rip),%rdi        # 604130 <user_id>
  401b3c:	e8 ef 10 00 00       	callq  402c30 <driver_post>
  401b41:	85 c0                	test   %eax,%eax
  401b43:	79 26                	jns    401b6b <notify_server+0x11e>
  401b45:	48 8d 94 24 00 20 00 	lea    0x2000(%rsp),%rdx
  401b4c:	00 
  401b4d:	be 7f 31 40 00       	mov    $0x40317f,%esi
  401b52:	bf 01 00 00 00       	mov    $0x1,%edi
  401b57:	b8 00 00 00 00       	mov    $0x0,%eax
  401b5c:	e8 4f f2 ff ff       	callq  400db0 <__printf_chk@plt>
  401b61:	bf 01 00 00 00       	mov    $0x1,%edi
  401b66:	e8 95 f2 ff ff       	callq  400e00 <exit@plt>
  401b6b:	bf a8 32 40 00       	mov    $0x4032a8,%edi
  401b70:	e8 0b f1 ff ff       	callq  400c80 <puts@plt>
  401b75:	bf 8b 31 40 00       	mov    $0x40318b,%edi
  401b7a:	e8 01 f1 ff ff       	callq  400c80 <puts@plt>
  401b7f:	e9 9b 00 00 00       	jmpq   401c1f <notify_server+0x1d2>
  401b84:	bf 95 31 40 00       	mov    $0x403195,%edi
  401b89:	e8 f2 f0 ff ff       	callq  400c80 <puts@plt>
  401b8e:	e9 8c 00 00 00       	jmpq   401c1f <notify_server+0x1d2>
  401b93:	85 db                	test   %ebx,%ebx
  401b95:	74 07                	je     401b9e <notify_server+0x151>
  401b97:	ba 59 31 40 00       	mov    $0x403159,%edx
  401b9c:	eb 05                	jmp    401ba3 <notify_server+0x156>
  401b9e:	ba 5e 31 40 00       	mov    $0x40315e,%edx
  401ba3:	be e0 32 40 00       	mov    $0x4032e0,%esi
  401ba8:	bf 01 00 00 00       	mov    $0x1,%edi
  401bad:	b8 00 00 00 00       	mov    $0x0,%eax
  401bb2:	e8 f9 f1 ff ff       	callq  400db0 <__printf_chk@plt>
  401bb7:	48 8b 15 72 25 20 00 	mov    0x202572(%rip),%rdx        # 604130 <user_id>
  401bbe:	be 9c 31 40 00       	mov    $0x40319c,%esi
  401bc3:	bf 01 00 00 00       	mov    $0x1,%edi
  401bc8:	b8 00 00 00 00       	mov    $0x0,%eax
  401bcd:	e8 de f1 ff ff       	callq  400db0 <__printf_chk@plt>
  401bd2:	48 8b 15 6f 25 20 00 	mov    0x20256f(%rip),%rdx        # 604148 <course>
  401bd9:	be a9 31 40 00       	mov    $0x4031a9,%esi
  401bde:	bf 01 00 00 00       	mov    $0x1,%edi
  401be3:	b8 00 00 00 00       	mov    $0x0,%eax
  401be8:	e8 c3 f1 ff ff       	callq  400db0 <__printf_chk@plt>
  401bed:	48 8b 15 4c 25 20 00 	mov    0x20254c(%rip),%rdx        # 604140 <lab>
  401bf4:	be b5 31 40 00       	mov    $0x4031b5,%esi
  401bf9:	bf 01 00 00 00       	mov    $0x1,%edi
  401bfe:	b8 00 00 00 00       	mov    $0x0,%eax
  401c03:	e8 a8 f1 ff ff       	callq  400db0 <__printf_chk@plt>
  401c08:	48 89 e2             	mov    %rsp,%rdx
  401c0b:	be be 31 40 00       	mov    $0x4031be,%esi
  401c10:	bf 01 00 00 00       	mov    $0x1,%edi
  401c15:	b8 00 00 00 00       	mov    $0x0,%eax
  401c1a:	e8 91 f1 ff ff       	callq  400db0 <__printf_chk@plt>
  401c1f:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
  401c26:	00 
  401c27:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401c2e:	00 00 
  401c30:	74 05                	je     401c37 <notify_server+0x1ea>
  401c32:	e8 69 f0 ff ff       	callq  400ca0 <__stack_chk_fail@plt>
  401c37:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
  401c3e:	5b                   	pop    %rbx
  401c3f:	c3                   	retq   

0000000000401c40 <validate>:
  401c40:	53                   	push   %rbx
  401c41:	89 fb                	mov    %edi,%ebx
  401c43:	83 3d 9e 28 20 00 00 	cmpl   $0x0,0x20289e(%rip)        # 6044e8 <is_checker>
  401c4a:	74 6b                	je     401cb7 <validate+0x77>
  401c4c:	39 3d 8a 28 20 00    	cmp    %edi,0x20288a(%rip)        # 6044dc <vlevel>
  401c52:	74 14                	je     401c68 <validate+0x28>
  401c54:	bf ca 31 40 00       	mov    $0x4031ca,%edi
  401c59:	e8 22 f0 ff ff       	callq  400c80 <puts@plt>
  401c5e:	b8 00 00 00 00       	mov    $0x0,%eax
  401c63:	e8 5e fd ff ff       	callq  4019c6 <check_fail>
  401c68:	8b 15 6a 28 20 00    	mov    0x20286a(%rip),%edx        # 6044d8 <check_level>
  401c6e:	39 d7                	cmp    %edx,%edi
  401c70:	74 20                	je     401c92 <validate+0x52>
  401c72:	89 f9                	mov    %edi,%ecx
  401c74:	be 08 33 40 00       	mov    $0x403308,%esi
  401c79:	bf 01 00 00 00       	mov    $0x1,%edi
  401c7e:	b8 00 00 00 00       	mov    $0x0,%eax
  401c83:	e8 28 f1 ff ff       	callq  400db0 <__printf_chk@plt>
  401c88:	b8 00 00 00 00       	mov    $0x0,%eax
  401c8d:	e8 34 fd ff ff       	callq  4019c6 <check_fail>
  401c92:	0f be 15 6f 34 20 00 	movsbl 0x20346f(%rip),%edx        # 605108 <target_prefix>
  401c99:	41 b8 00 45 60 00    	mov    $0x604500,%r8d
  401c9f:	89 f9                	mov    %edi,%ecx
  401ca1:	be e8 31 40 00       	mov    $0x4031e8,%esi
  401ca6:	bf 01 00 00 00       	mov    $0x1,%edi
  401cab:	b8 00 00 00 00       	mov    $0x0,%eax
  401cb0:	e8 fb f0 ff ff       	callq  400db0 <__printf_chk@plt>
  401cb5:	eb 49                	jmp    401d00 <validate+0xc0>
  401cb7:	3b 3d 1f 28 20 00    	cmp    0x20281f(%rip),%edi        # 6044dc <vlevel>
  401cbd:	74 18                	je     401cd7 <validate+0x97>
  401cbf:	bf ca 31 40 00       	mov    $0x4031ca,%edi
  401cc4:	e8 b7 ef ff ff       	callq  400c80 <puts@plt>
  401cc9:	89 de                	mov    %ebx,%esi
  401ccb:	bf 00 00 00 00       	mov    $0x0,%edi
  401cd0:	e8 78 fd ff ff       	callq  401a4d <notify_server>
  401cd5:	eb 29                	jmp    401d00 <validate+0xc0>
  401cd7:	0f be 0d 2a 34 20 00 	movsbl 0x20342a(%rip),%ecx        # 605108 <target_prefix>
  401cde:	89 fa                	mov    %edi,%edx
  401ce0:	be 30 33 40 00       	mov    $0x403330,%esi
  401ce5:	bf 01 00 00 00       	mov    $0x1,%edi
  401cea:	b8 00 00 00 00       	mov    $0x0,%eax
  401cef:	e8 bc f0 ff ff       	callq  400db0 <__printf_chk@plt>
  401cf4:	89 de                	mov    %ebx,%esi
  401cf6:	bf 01 00 00 00       	mov    $0x1,%edi
  401cfb:	e8 4d fd ff ff       	callq  401a4d <notify_server>
  401d00:	5b                   	pop    %rbx
  401d01:	c3                   	retq   

0000000000401d02 <fail>:
  401d02:	48 83 ec 08          	sub    $0x8,%rsp
  401d06:	83 3d db 27 20 00 00 	cmpl   $0x0,0x2027db(%rip)        # 6044e8 <is_checker>
  401d0d:	74 0a                	je     401d19 <fail+0x17>
  401d0f:	b8 00 00 00 00       	mov    $0x0,%eax
  401d14:	e8 ad fc ff ff       	callq  4019c6 <check_fail>
  401d19:	89 fe                	mov    %edi,%esi
  401d1b:	bf 00 00 00 00       	mov    $0x0,%edi
  401d20:	e8 28 fd ff ff       	callq  401a4d <notify_server>
  401d25:	48 83 c4 08          	add    $0x8,%rsp
  401d29:	c3                   	retq   

0000000000401d2a <bushandler>:
  401d2a:	48 83 ec 08          	sub    $0x8,%rsp
  401d2e:	83 3d b3 27 20 00 00 	cmpl   $0x0,0x2027b3(%rip)        # 6044e8 <is_checker>
  401d35:	74 14                	je     401d4b <bushandler+0x21>
  401d37:	bf fd 31 40 00       	mov    $0x4031fd,%edi
  401d3c:	e8 3f ef ff ff       	callq  400c80 <puts@plt>
  401d41:	b8 00 00 00 00       	mov    $0x0,%eax
  401d46:	e8 7b fc ff ff       	callq  4019c6 <check_fail>
  401d4b:	bf 68 33 40 00       	mov    $0x403368,%edi
  401d50:	e8 2b ef ff ff       	callq  400c80 <puts@plt>
  401d55:	bf 07 32 40 00       	mov    $0x403207,%edi
  401d5a:	e8 21 ef ff ff       	callq  400c80 <puts@plt>
  401d5f:	be 00 00 00 00       	mov    $0x0,%esi
  401d64:	bf 00 00 00 00       	mov    $0x0,%edi
  401d69:	e8 df fc ff ff       	callq  401a4d <notify_server>
  401d6e:	bf 01 00 00 00       	mov    $0x1,%edi
  401d73:	e8 88 f0 ff ff       	callq  400e00 <exit@plt>

0000000000401d78 <seghandler>:
  401d78:	48 83 ec 08          	sub    $0x8,%rsp
  401d7c:	83 3d 65 27 20 00 00 	cmpl   $0x0,0x202765(%rip)        # 6044e8 <is_checker>
  401d83:	74 14                	je     401d99 <seghandler+0x21>
  401d85:	bf 1d 32 40 00       	mov    $0x40321d,%edi
  401d8a:	e8 f1 ee ff ff       	callq  400c80 <puts@plt>
  401d8f:	b8 00 00 00 00       	mov    $0x0,%eax
  401d94:	e8 2d fc ff ff       	callq  4019c6 <check_fail>
  401d99:	bf 88 33 40 00       	mov    $0x403388,%edi
  401d9e:	e8 dd ee ff ff       	callq  400c80 <puts@plt>
  401da3:	bf 07 32 40 00       	mov    $0x403207,%edi
  401da8:	e8 d3 ee ff ff       	callq  400c80 <puts@plt>
  401dad:	be 00 00 00 00       	mov    $0x0,%esi
  401db2:	bf 00 00 00 00       	mov    $0x0,%edi
  401db7:	e8 91 fc ff ff       	callq  401a4d <notify_server>
  401dbc:	bf 01 00 00 00       	mov    $0x1,%edi
  401dc1:	e8 3a f0 ff ff       	callq  400e00 <exit@plt>

0000000000401dc6 <illegalhandler>:
  401dc6:	48 83 ec 08          	sub    $0x8,%rsp
  401dca:	83 3d 17 27 20 00 00 	cmpl   $0x0,0x202717(%rip)        # 6044e8 <is_checker>
  401dd1:	74 14                	je     401de7 <illegalhandler+0x21>
  401dd3:	bf 30 32 40 00       	mov    $0x403230,%edi
  401dd8:	e8 a3 ee ff ff       	callq  400c80 <puts@plt>
  401ddd:	b8 00 00 00 00       	mov    $0x0,%eax
  401de2:	e8 df fb ff ff       	callq  4019c6 <check_fail>
  401de7:	bf b0 33 40 00       	mov    $0x4033b0,%edi
  401dec:	e8 8f ee ff ff       	callq  400c80 <puts@plt>
  401df1:	bf 07 32 40 00       	mov    $0x403207,%edi
  401df6:	e8 85 ee ff ff       	callq  400c80 <puts@plt>
  401dfb:	be 00 00 00 00       	mov    $0x0,%esi
  401e00:	bf 00 00 00 00       	mov    $0x0,%edi
  401e05:	e8 43 fc ff ff       	callq  401a4d <notify_server>
  401e0a:	bf 01 00 00 00       	mov    $0x1,%edi
  401e0f:	e8 ec ef ff ff       	callq  400e00 <exit@plt>

0000000000401e14 <sigalrmhandler>:
  401e14:	48 83 ec 08          	sub    $0x8,%rsp
  401e18:	83 3d c9 26 20 00 00 	cmpl   $0x0,0x2026c9(%rip)        # 6044e8 <is_checker>
  401e1f:	74 14                	je     401e35 <sigalrmhandler+0x21>
  401e21:	bf 44 32 40 00       	mov    $0x403244,%edi
  401e26:	e8 55 ee ff ff       	callq  400c80 <puts@plt>
  401e2b:	b8 00 00 00 00       	mov    $0x0,%eax
  401e30:	e8 91 fb ff ff       	callq  4019c6 <check_fail>
  401e35:	ba 05 00 00 00       	mov    $0x5,%edx
  401e3a:	be e0 33 40 00       	mov    $0x4033e0,%esi
  401e3f:	bf 01 00 00 00       	mov    $0x1,%edi
  401e44:	b8 00 00 00 00       	mov    $0x0,%eax
  401e49:	e8 62 ef ff ff       	callq  400db0 <__printf_chk@plt>
  401e4e:	be 00 00 00 00       	mov    $0x0,%esi
  401e53:	bf 00 00 00 00       	mov    $0x0,%edi
  401e58:	e8 f0 fb ff ff       	callq  401a4d <notify_server>
  401e5d:	bf 01 00 00 00       	mov    $0x1,%edi
  401e62:	e8 99 ef ff ff       	callq  400e00 <exit@plt>

0000000000401e67 <launch>:
  401e67:	55                   	push   %rbp
  401e68:	48 89 e5             	mov    %rsp,%rbp
  401e6b:	48 83 ec 10          	sub    $0x10,%rsp
  401e6f:	48 89 fa             	mov    %rdi,%rdx
  401e72:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401e79:	00 00 
  401e7b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401e7f:	31 c0                	xor    %eax,%eax
  401e81:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  401e85:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  401e89:	48 29 c4             	sub    %rax,%rsp
  401e8c:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  401e91:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  401e95:	be f4 00 00 00       	mov    $0xf4,%esi
  401e9a:	e8 21 ee ff ff       	callq  400cc0 <memset@plt>
  401e9f:	48 8b 05 ba 22 20 00 	mov    0x2022ba(%rip),%rax        # 604160 <__TMC_END__>
  401ea6:	48 39 05 23 26 20 00 	cmp    %rax,0x202623(%rip)        # 6044d0 <infile>
  401ead:	75 14                	jne    401ec3 <launch+0x5c>
  401eaf:	be 4c 32 40 00       	mov    $0x40324c,%esi
  401eb4:	bf 01 00 00 00       	mov    $0x1,%edi
  401eb9:	b8 00 00 00 00       	mov    $0x0,%eax
  401ebe:	e8 ed ee ff ff       	callq  400db0 <__printf_chk@plt>
  401ec3:	c7 05 0f 26 20 00 00 	movl   $0x0,0x20260f(%rip)        # 6044dc <vlevel>
  401eca:	00 00 00 
  401ecd:	b8 00 00 00 00       	mov    $0x0,%eax
  401ed2:	e8 5b fa ff ff       	callq  401932 <test>
  401ed7:	83 3d 0a 26 20 00 00 	cmpl   $0x0,0x20260a(%rip)        # 6044e8 <is_checker>
  401ede:	74 14                	je     401ef4 <launch+0x8d>
  401ee0:	bf 59 32 40 00       	mov    $0x403259,%edi
  401ee5:	e8 96 ed ff ff       	callq  400c80 <puts@plt>
  401eea:	b8 00 00 00 00       	mov    $0x0,%eax
  401eef:	e8 d2 fa ff ff       	callq  4019c6 <check_fail>
  401ef4:	bf 64 32 40 00       	mov    $0x403264,%edi
  401ef9:	e8 82 ed ff ff       	callq  400c80 <puts@plt>
  401efe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401f02:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401f09:	00 00 
  401f0b:	74 05                	je     401f12 <launch+0xab>
  401f0d:	e8 8e ed ff ff       	callq  400ca0 <__stack_chk_fail@plt>
  401f12:	c9                   	leaveq 
  401f13:	c3                   	retq   

0000000000401f14 <stable_launch>:
  401f14:	53                   	push   %rbx
  401f15:	48 89 3d ac 25 20 00 	mov    %rdi,0x2025ac(%rip)        # 6044c8 <global_offset>
  401f1c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  401f22:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401f28:	b9 32 01 00 00       	mov    $0x132,%ecx
  401f2d:	ba 07 00 00 00       	mov    $0x7,%edx
  401f32:	be 00 00 10 00       	mov    $0x100000,%esi
  401f37:	bf 00 60 58 55       	mov    $0x55586000,%edi
  401f3c:	e8 6f ed ff ff       	callq  400cb0 <mmap@plt>
  401f41:	48 89 c3             	mov    %rax,%rbx
  401f44:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  401f4a:	74 37                	je     401f83 <stable_launch+0x6f>
  401f4c:	be 00 00 10 00       	mov    $0x100000,%esi
  401f51:	48 89 c7             	mov    %rax,%rdi
  401f54:	e8 47 ee ff ff       	callq  400da0 <munmap@plt>
  401f59:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  401f5e:	ba 18 34 40 00       	mov    $0x403418,%edx
  401f63:	be 01 00 00 00       	mov    $0x1,%esi
  401f68:	48 8b 3d 11 22 20 00 	mov    0x202211(%rip),%rdi        # 604180 <stderr@@GLIBC_2.2.5>
  401f6f:	b8 00 00 00 00       	mov    $0x0,%eax
  401f74:	e8 a7 ee ff ff       	callq  400e20 <__fprintf_chk@plt>
  401f79:	bf 01 00 00 00       	mov    $0x1,%edi
  401f7e:	e8 7d ee ff ff       	callq  400e00 <exit@plt>
  401f83:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  401f8a:	48 89 15 7f 31 20 00 	mov    %rdx,0x20317f(%rip)        # 605110 <stack_top>
  401f91:	48 89 e0             	mov    %rsp,%rax
  401f94:	48 89 d4             	mov    %rdx,%rsp
  401f97:	48 89 c2             	mov    %rax,%rdx
  401f9a:	48 89 15 1f 25 20 00 	mov    %rdx,0x20251f(%rip)        # 6044c0 <global_save_stack>
  401fa1:	48 8b 3d 20 25 20 00 	mov    0x202520(%rip),%rdi        # 6044c8 <global_offset>
  401fa8:	e8 ba fe ff ff       	callq  401e67 <launch>
  401fad:	48 8b 05 0c 25 20 00 	mov    0x20250c(%rip),%rax        # 6044c0 <global_save_stack>
  401fb4:	48 89 c4             	mov    %rax,%rsp
  401fb7:	be 00 00 10 00       	mov    $0x100000,%esi
  401fbc:	48 89 df             	mov    %rbx,%rdi
  401fbf:	e8 dc ed ff ff       	callq  400da0 <munmap@plt>
  401fc4:	5b                   	pop    %rbx
  401fc5:	c3                   	retq   

0000000000401fc6 <rio_readinitb>:
  401fc6:	89 37                	mov    %esi,(%rdi)
  401fc8:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  401fcf:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401fd3:	48 89 47 08          	mov    %rax,0x8(%rdi)
  401fd7:	c3                   	retq   

0000000000401fd8 <sigalrm_handler>:
  401fd8:	48 83 ec 08          	sub    $0x8,%rsp
  401fdc:	b9 00 00 00 00       	mov    $0x0,%ecx
  401fe1:	ba 50 34 40 00       	mov    $0x403450,%edx
  401fe6:	be 01 00 00 00       	mov    $0x1,%esi
  401feb:	48 8b 3d 8e 21 20 00 	mov    0x20218e(%rip),%rdi        # 604180 <stderr@@GLIBC_2.2.5>
  401ff2:	b8 00 00 00 00       	mov    $0x0,%eax
  401ff7:	e8 24 ee ff ff       	callq  400e20 <__fprintf_chk@plt>
  401ffc:	bf 01 00 00 00       	mov    $0x1,%edi
  402001:	e8 fa ed ff ff       	callq  400e00 <exit@plt>

0000000000402006 <rio_writen>:
  402006:	41 55                	push   %r13
  402008:	41 54                	push   %r12
  40200a:	55                   	push   %rbp
  40200b:	53                   	push   %rbx
  40200c:	48 83 ec 08          	sub    $0x8,%rsp
  402010:	41 89 fc             	mov    %edi,%r12d
  402013:	48 89 f5             	mov    %rsi,%rbp
  402016:	49 89 d5             	mov    %rdx,%r13
  402019:	48 89 d3             	mov    %rdx,%rbx
  40201c:	eb 28                	jmp    402046 <rio_writen+0x40>
  40201e:	48 89 da             	mov    %rbx,%rdx
  402021:	48 89 ee             	mov    %rbp,%rsi
  402024:	44 89 e7             	mov    %r12d,%edi
  402027:	e8 64 ec ff ff       	callq  400c90 <write@plt>
  40202c:	48 85 c0             	test   %rax,%rax
  40202f:	7f 0f                	jg     402040 <rio_writen+0x3a>
  402031:	e8 0a ec ff ff       	callq  400c40 <__errno_location@plt>
  402036:	83 38 04             	cmpl   $0x4,(%rax)
  402039:	75 15                	jne    402050 <rio_writen+0x4a>
  40203b:	b8 00 00 00 00       	mov    $0x0,%eax
  402040:	48 29 c3             	sub    %rax,%rbx
  402043:	48 01 c5             	add    %rax,%rbp
  402046:	48 85 db             	test   %rbx,%rbx
  402049:	75 d3                	jne    40201e <rio_writen+0x18>
  40204b:	4c 89 e8             	mov    %r13,%rax
  40204e:	eb 07                	jmp    402057 <rio_writen+0x51>
  402050:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402057:	48 83 c4 08          	add    $0x8,%rsp
  40205b:	5b                   	pop    %rbx
  40205c:	5d                   	pop    %rbp
  40205d:	41 5c                	pop    %r12
  40205f:	41 5d                	pop    %r13
  402061:	c3                   	retq   

0000000000402062 <rio_read>:
  402062:	41 55                	push   %r13
  402064:	41 54                	push   %r12
  402066:	55                   	push   %rbp
  402067:	53                   	push   %rbx
  402068:	48 83 ec 08          	sub    $0x8,%rsp
  40206c:	48 89 fb             	mov    %rdi,%rbx
  40206f:	49 89 f5             	mov    %rsi,%r13
  402072:	49 89 d4             	mov    %rdx,%r12
  402075:	eb 2e                	jmp    4020a5 <rio_read+0x43>
  402077:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  40207b:	8b 3b                	mov    (%rbx),%edi
  40207d:	ba 00 20 00 00       	mov    $0x2000,%edx
  402082:	48 89 ee             	mov    %rbp,%rsi
  402085:	e8 66 ec ff ff       	callq  400cf0 <read@plt>
  40208a:	89 43 04             	mov    %eax,0x4(%rbx)
  40208d:	85 c0                	test   %eax,%eax
  40208f:	79 0c                	jns    40209d <rio_read+0x3b>
  402091:	e8 aa eb ff ff       	callq  400c40 <__errno_location@plt>
  402096:	83 38 04             	cmpl   $0x4,(%rax)
  402099:	74 0a                	je     4020a5 <rio_read+0x43>
  40209b:	eb 37                	jmp    4020d4 <rio_read+0x72>
  40209d:	85 c0                	test   %eax,%eax
  40209f:	74 3c                	je     4020dd <rio_read+0x7b>
  4020a1:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  4020a5:	8b 6b 04             	mov    0x4(%rbx),%ebp
  4020a8:	85 ed                	test   %ebp,%ebp
  4020aa:	7e cb                	jle    402077 <rio_read+0x15>
  4020ac:	89 e8                	mov    %ebp,%eax
  4020ae:	49 39 c4             	cmp    %rax,%r12
  4020b1:	77 03                	ja     4020b6 <rio_read+0x54>
  4020b3:	44 89 e5             	mov    %r12d,%ebp
  4020b6:	4c 63 e5             	movslq %ebp,%r12
  4020b9:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  4020bd:	4c 89 e2             	mov    %r12,%rdx
  4020c0:	4c 89 ef             	mov    %r13,%rdi
  4020c3:	e8 88 ec ff ff       	callq  400d50 <memcpy@plt>
  4020c8:	4c 01 63 08          	add    %r12,0x8(%rbx)
  4020cc:	29 6b 04             	sub    %ebp,0x4(%rbx)
  4020cf:	4c 89 e0             	mov    %r12,%rax
  4020d2:	eb 0e                	jmp    4020e2 <rio_read+0x80>
  4020d4:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4020db:	eb 05                	jmp    4020e2 <rio_read+0x80>
  4020dd:	b8 00 00 00 00       	mov    $0x0,%eax
  4020e2:	48 83 c4 08          	add    $0x8,%rsp
  4020e6:	5b                   	pop    %rbx
  4020e7:	5d                   	pop    %rbp
  4020e8:	41 5c                	pop    %r12
  4020ea:	41 5d                	pop    %r13
  4020ec:	c3                   	retq   

00000000004020ed <rio_readlineb>:
  4020ed:	41 55                	push   %r13
  4020ef:	41 54                	push   %r12
  4020f1:	55                   	push   %rbp
  4020f2:	53                   	push   %rbx
  4020f3:	48 83 ec 18          	sub    $0x18,%rsp
  4020f7:	49 89 fd             	mov    %rdi,%r13
  4020fa:	48 89 f5             	mov    %rsi,%rbp
  4020fd:	49 89 d4             	mov    %rdx,%r12
  402100:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402107:	00 00 
  402109:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  40210e:	31 c0                	xor    %eax,%eax
  402110:	bb 01 00 00 00       	mov    $0x1,%ebx
  402115:	eb 3f                	jmp    402156 <rio_readlineb+0x69>
  402117:	ba 01 00 00 00       	mov    $0x1,%edx
  40211c:	48 8d 74 24 07       	lea    0x7(%rsp),%rsi
  402121:	4c 89 ef             	mov    %r13,%rdi
  402124:	e8 39 ff ff ff       	callq  402062 <rio_read>
  402129:	83 f8 01             	cmp    $0x1,%eax
  40212c:	75 15                	jne    402143 <rio_readlineb+0x56>
  40212e:	48 8d 45 01          	lea    0x1(%rbp),%rax
  402132:	0f b6 54 24 07       	movzbl 0x7(%rsp),%edx
  402137:	88 55 00             	mov    %dl,0x0(%rbp)
  40213a:	80 7c 24 07 0a       	cmpb   $0xa,0x7(%rsp)
  40213f:	75 0e                	jne    40214f <rio_readlineb+0x62>
  402141:	eb 1a                	jmp    40215d <rio_readlineb+0x70>
  402143:	85 c0                	test   %eax,%eax
  402145:	75 22                	jne    402169 <rio_readlineb+0x7c>
  402147:	48 83 fb 01          	cmp    $0x1,%rbx
  40214b:	75 13                	jne    402160 <rio_readlineb+0x73>
  40214d:	eb 23                	jmp    402172 <rio_readlineb+0x85>
  40214f:	48 83 c3 01          	add    $0x1,%rbx
  402153:	48 89 c5             	mov    %rax,%rbp
  402156:	4c 39 e3             	cmp    %r12,%rbx
  402159:	72 bc                	jb     402117 <rio_readlineb+0x2a>
  40215b:	eb 03                	jmp    402160 <rio_readlineb+0x73>
  40215d:	48 89 c5             	mov    %rax,%rbp
  402160:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  402164:	48 89 d8             	mov    %rbx,%rax
  402167:	eb 0e                	jmp    402177 <rio_readlineb+0x8a>
  402169:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402170:	eb 05                	jmp    402177 <rio_readlineb+0x8a>
  402172:	b8 00 00 00 00       	mov    $0x0,%eax
  402177:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  40217c:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402183:	00 00 
  402185:	74 05                	je     40218c <rio_readlineb+0x9f>
  402187:	e8 14 eb ff ff       	callq  400ca0 <__stack_chk_fail@plt>
  40218c:	48 83 c4 18          	add    $0x18,%rsp
  402190:	5b                   	pop    %rbx
  402191:	5d                   	pop    %rbp
  402192:	41 5c                	pop    %r12
  402194:	41 5d                	pop    %r13
  402196:	c3                   	retq   

0000000000402197 <urlencode>:
  402197:	41 54                	push   %r12
  402199:	55                   	push   %rbp
  40219a:	53                   	push   %rbx
  40219b:	48 83 ec 10          	sub    $0x10,%rsp
  40219f:	48 89 fb             	mov    %rdi,%rbx
  4021a2:	48 89 f5             	mov    %rsi,%rbp
  4021a5:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4021ac:	00 00 
  4021ae:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4021b3:	31 c0                	xor    %eax,%eax
  4021b5:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4021bc:	f2 ae                	repnz scas %es:(%rdi),%al
  4021be:	48 f7 d1             	not    %rcx
  4021c1:	8d 41 ff             	lea    -0x1(%rcx),%eax
  4021c4:	e9 aa 00 00 00       	jmpq   402273 <urlencode+0xdc>
  4021c9:	44 0f b6 03          	movzbl (%rbx),%r8d
  4021cd:	41 80 f8 2a          	cmp    $0x2a,%r8b
  4021d1:	0f 94 c2             	sete   %dl
  4021d4:	41 80 f8 2d          	cmp    $0x2d,%r8b
  4021d8:	0f 94 c0             	sete   %al
  4021db:	08 c2                	or     %al,%dl
  4021dd:	75 24                	jne    402203 <urlencode+0x6c>
  4021df:	41 80 f8 2e          	cmp    $0x2e,%r8b
  4021e3:	74 1e                	je     402203 <urlencode+0x6c>
  4021e5:	41 80 f8 5f          	cmp    $0x5f,%r8b
  4021e9:	74 18                	je     402203 <urlencode+0x6c>
  4021eb:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  4021ef:	3c 09                	cmp    $0x9,%al
  4021f1:	76 10                	jbe    402203 <urlencode+0x6c>
  4021f3:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  4021f7:	3c 19                	cmp    $0x19,%al
  4021f9:	76 08                	jbe    402203 <urlencode+0x6c>
  4021fb:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  4021ff:	3c 19                	cmp    $0x19,%al
  402201:	77 0a                	ja     40220d <urlencode+0x76>
  402203:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  402207:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  40220b:	eb 5f                	jmp    40226c <urlencode+0xd5>
  40220d:	41 80 f8 20          	cmp    $0x20,%r8b
  402211:	75 0a                	jne    40221d <urlencode+0x86>
  402213:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  402217:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  40221b:	eb 4f                	jmp    40226c <urlencode+0xd5>
  40221d:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  402221:	3c 5f                	cmp    $0x5f,%al
  402223:	0f 96 c2             	setbe  %dl
  402226:	41 80 f8 09          	cmp    $0x9,%r8b
  40222a:	0f 94 c0             	sete   %al
  40222d:	08 c2                	or     %al,%dl
  40222f:	74 50                	je     402281 <urlencode+0xea>
  402231:	45 0f b6 c0          	movzbl %r8b,%r8d
  402235:	b9 e8 34 40 00       	mov    $0x4034e8,%ecx
  40223a:	ba 08 00 00 00       	mov    $0x8,%edx
  40223f:	be 01 00 00 00       	mov    $0x1,%esi
  402244:	48 89 e7             	mov    %rsp,%rdi
  402247:	b8 00 00 00 00       	mov    $0x0,%eax
  40224c:	e8 df eb ff ff       	callq  400e30 <__sprintf_chk@plt>
  402251:	0f b6 04 24          	movzbl (%rsp),%eax
  402255:	88 45 00             	mov    %al,0x0(%rbp)
  402258:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  40225d:	88 45 01             	mov    %al,0x1(%rbp)
  402260:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  402265:	88 45 02             	mov    %al,0x2(%rbp)
  402268:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  40226c:	48 83 c3 01          	add    $0x1,%rbx
  402270:	44 89 e0             	mov    %r12d,%eax
  402273:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  402277:	85 c0                	test   %eax,%eax
  402279:	0f 85 4a ff ff ff    	jne    4021c9 <urlencode+0x32>
  40227f:	eb 05                	jmp    402286 <urlencode+0xef>
  402281:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402286:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  40228b:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  402292:	00 00 
  402294:	74 05                	je     40229b <urlencode+0x104>
  402296:	e8 05 ea ff ff       	callq  400ca0 <__stack_chk_fail@plt>
  40229b:	48 83 c4 10          	add    $0x10,%rsp
  40229f:	5b                   	pop    %rbx
  4022a0:	5d                   	pop    %rbp
  4022a1:	41 5c                	pop    %r12
  4022a3:	c3                   	retq   

00000000004022a4 <submitr>:
  4022a4:	41 57                	push   %r15
  4022a6:	41 56                	push   %r14
  4022a8:	41 55                	push   %r13
  4022aa:	41 54                	push   %r12
  4022ac:	55                   	push   %rbp
  4022ad:	53                   	push   %rbx
  4022ae:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  4022b5:	49 89 fc             	mov    %rdi,%r12
  4022b8:	89 74 24 04          	mov    %esi,0x4(%rsp)
  4022bc:	49 89 d7             	mov    %rdx,%r15
  4022bf:	49 89 ce             	mov    %rcx,%r14
  4022c2:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
  4022c7:	4d 89 cd             	mov    %r9,%r13
  4022ca:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  4022d1:	00 
  4022d2:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4022d9:	00 00 
  4022db:	48 89 84 24 48 a0 00 	mov    %rax,0xa048(%rsp)
  4022e2:	00 
  4022e3:	31 c0                	xor    %eax,%eax
  4022e5:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%rsp)
  4022ec:	00 
  4022ed:	ba 00 00 00 00       	mov    $0x0,%edx
  4022f2:	be 01 00 00 00       	mov    $0x1,%esi
  4022f7:	bf 02 00 00 00       	mov    $0x2,%edi
  4022fc:	e8 3f eb ff ff       	callq  400e40 <socket@plt>
  402301:	85 c0                	test   %eax,%eax
  402303:	79 4e                	jns    402353 <submitr+0xaf>
  402305:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40230c:	3a 20 43 
  40230f:	48 89 03             	mov    %rax,(%rbx)
  402312:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402319:	20 75 6e 
  40231c:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402320:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402327:	74 6f 20 
  40232a:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40232e:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402335:	65 20 73 
  402338:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40233c:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  402343:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  402349:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40234e:	e9 97 06 00 00       	jmpq   4029ea <submitr+0x746>
  402353:	89 c5                	mov    %eax,%ebp
  402355:	4c 89 e7             	mov    %r12,%rdi
  402358:	e8 c3 e9 ff ff       	callq  400d20 <gethostbyname@plt>
  40235d:	48 85 c0             	test   %rax,%rax
  402360:	75 67                	jne    4023c9 <submitr+0x125>
  402362:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402369:	3a 20 44 
  40236c:	48 89 03             	mov    %rax,(%rbx)
  40236f:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402376:	20 75 6e 
  402379:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40237d:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402384:	74 6f 20 
  402387:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40238b:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402392:	76 65 20 
  402395:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402399:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4023a0:	72 20 61 
  4023a3:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4023a7:	c7 43 28 64 64 72 65 	movl   $0x65726464,0x28(%rbx)
  4023ae:	66 c7 43 2c 73 73    	movw   $0x7373,0x2c(%rbx)
  4023b4:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  4023b8:	89 ef                	mov    %ebp,%edi
  4023ba:	e8 21 e9 ff ff       	callq  400ce0 <close@plt>
  4023bf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4023c4:	e9 21 06 00 00       	jmpq   4029ea <submitr+0x746>
  4023c9:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
  4023d0:	00 00 
  4023d2:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
  4023d9:	00 00 
  4023db:	66 c7 44 24 20 02 00 	movw   $0x2,0x20(%rsp)
  4023e2:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4023e6:	48 8b 40 18          	mov    0x18(%rax),%rax
  4023ea:	48 8b 30             	mov    (%rax),%rsi
  4023ed:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
  4023f2:	b9 0c 00 00 00       	mov    $0xc,%ecx
  4023f7:	e8 34 e9 ff ff       	callq  400d30 <__memmove_chk@plt>
  4023fc:	0f b7 44 24 04       	movzwl 0x4(%rsp),%eax
  402401:	66 c1 c8 08          	ror    $0x8,%ax
  402405:	66 89 44 24 22       	mov    %ax,0x22(%rsp)
  40240a:	ba 10 00 00 00       	mov    $0x10,%edx
  40240f:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
  402414:	89 ef                	mov    %ebp,%edi
  402416:	e8 f5 e9 ff ff       	callq  400e10 <connect@plt>
  40241b:	85 c0                	test   %eax,%eax
  40241d:	79 59                	jns    402478 <submitr+0x1d4>
  40241f:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402426:	3a 20 55 
  402429:	48 89 03             	mov    %rax,(%rbx)
  40242c:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402433:	20 74 6f 
  402436:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40243a:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402441:	65 63 74 
  402444:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402448:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  40244f:	68 65 20 
  402452:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402456:	c7 43 20 73 65 72 76 	movl   $0x76726573,0x20(%rbx)
  40245d:	66 c7 43 24 65 72    	movw   $0x7265,0x24(%rbx)
  402463:	c6 43 26 00          	movb   $0x0,0x26(%rbx)
  402467:	89 ef                	mov    %ebp,%edi
  402469:	e8 72 e8 ff ff       	callq  400ce0 <close@plt>
  40246e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402473:	e9 72 05 00 00       	jmpq   4029ea <submitr+0x746>
  402478:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  40247f:	b8 00 00 00 00       	mov    $0x0,%eax
  402484:	48 89 f1             	mov    %rsi,%rcx
  402487:	4c 89 ef             	mov    %r13,%rdi
  40248a:	f2 ae                	repnz scas %es:(%rdi),%al
  40248c:	48 f7 d1             	not    %rcx
  40248f:	48 89 ca             	mov    %rcx,%rdx
  402492:	48 89 f1             	mov    %rsi,%rcx
  402495:	4c 89 ff             	mov    %r15,%rdi
  402498:	f2 ae                	repnz scas %es:(%rdi),%al
  40249a:	48 f7 d1             	not    %rcx
  40249d:	49 89 c8             	mov    %rcx,%r8
  4024a0:	48 89 f1             	mov    %rsi,%rcx
  4024a3:	4c 89 f7             	mov    %r14,%rdi
  4024a6:	f2 ae                	repnz scas %es:(%rdi),%al
  4024a8:	48 f7 d1             	not    %rcx
  4024ab:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  4024b0:	48 89 f1             	mov    %rsi,%rcx
  4024b3:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  4024b8:	f2 ae                	repnz scas %es:(%rdi),%al
  4024ba:	48 89 c8             	mov    %rcx,%rax
  4024bd:	48 f7 d0             	not    %rax
  4024c0:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  4024c5:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  4024ca:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  4024d1:	00 
  4024d2:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  4024d8:	76 72                	jbe    40254c <submitr+0x2a8>
  4024da:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4024e1:	3a 20 52 
  4024e4:	48 89 03             	mov    %rax,(%rbx)
  4024e7:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4024ee:	20 73 74 
  4024f1:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4024f5:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  4024fc:	74 6f 6f 
  4024ff:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402503:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  40250a:	65 2e 20 
  40250d:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402511:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  402518:	61 73 65 
  40251b:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40251f:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  402526:	49 54 52 
  402529:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40252d:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  402534:	55 46 00 
  402537:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40253b:	89 ef                	mov    %ebp,%edi
  40253d:	e8 9e e7 ff ff       	callq  400ce0 <close@plt>
  402542:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402547:	e9 9e 04 00 00       	jmpq   4029ea <submitr+0x746>
  40254c:	48 8d b4 24 40 40 00 	lea    0x4040(%rsp),%rsi
  402553:	00 
  402554:	b9 00 04 00 00       	mov    $0x400,%ecx
  402559:	b8 00 00 00 00       	mov    $0x0,%eax
  40255e:	48 89 f7             	mov    %rsi,%rdi
  402561:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  402564:	4c 89 ef             	mov    %r13,%rdi
  402567:	e8 2b fc ff ff       	callq  402197 <urlencode>
  40256c:	85 c0                	test   %eax,%eax
  40256e:	0f 89 8a 00 00 00    	jns    4025fe <submitr+0x35a>
  402574:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  40257b:	3a 20 52 
  40257e:	48 89 03             	mov    %rax,(%rbx)
  402581:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  402588:	20 73 74 
  40258b:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40258f:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  402596:	63 6f 6e 
  402599:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40259d:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  4025a4:	20 61 6e 
  4025a7:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4025ab:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  4025b2:	67 61 6c 
  4025b5:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4025b9:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  4025c0:	6e 70 72 
  4025c3:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4025c7:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  4025ce:	6c 65 20 
  4025d1:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4025d5:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  4025dc:	63 74 65 
  4025df:	48 89 43 38          	mov    %rax,0x38(%rbx)
  4025e3:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  4025e9:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  4025ed:	89 ef                	mov    %ebp,%edi
  4025ef:	e8 ec e6 ff ff       	callq  400ce0 <close@plt>
  4025f4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025f9:	e9 ec 03 00 00       	jmpq   4029ea <submitr+0x746>
  4025fe:	4c 8d ac 24 40 20 00 	lea    0x2040(%rsp),%r13
  402605:	00 
  402606:	41 54                	push   %r12
  402608:	48 8d 84 24 48 40 00 	lea    0x4048(%rsp),%rax
  40260f:	00 
  402610:	50                   	push   %rax
  402611:	4d 89 f9             	mov    %r15,%r9
  402614:	4d 89 f0             	mov    %r14,%r8
  402617:	b9 78 34 40 00       	mov    $0x403478,%ecx
  40261c:	ba 00 20 00 00       	mov    $0x2000,%edx
  402621:	be 01 00 00 00       	mov    $0x1,%esi
  402626:	4c 89 ef             	mov    %r13,%rdi
  402629:	b8 00 00 00 00       	mov    $0x0,%eax
  40262e:	e8 fd e7 ff ff       	callq  400e30 <__sprintf_chk@plt>
  402633:	b8 00 00 00 00       	mov    $0x0,%eax
  402638:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40263f:	4c 89 ef             	mov    %r13,%rdi
  402642:	f2 ae                	repnz scas %es:(%rdi),%al
  402644:	48 f7 d1             	not    %rcx
  402647:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40264b:	4c 89 ee             	mov    %r13,%rsi
  40264e:	89 ef                	mov    %ebp,%edi
  402650:	e8 b1 f9 ff ff       	callq  402006 <rio_writen>
  402655:	48 83 c4 10          	add    $0x10,%rsp
  402659:	48 85 c0             	test   %rax,%rax
  40265c:	79 6e                	jns    4026cc <submitr+0x428>
  40265e:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402665:	3a 20 43 
  402668:	48 89 03             	mov    %rax,(%rbx)
  40266b:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402672:	20 75 6e 
  402675:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402679:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402680:	74 6f 20 
  402683:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402687:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  40268e:	20 74 6f 
  402691:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402695:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  40269c:	72 65 73 
  40269f:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4026a3:	48 b8 75 6c 74 20 73 	movabs $0x7672657320746c75,%rax
  4026aa:	65 72 76 
  4026ad:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4026b1:	66 c7 43 30 65 72    	movw   $0x7265,0x30(%rbx)
  4026b7:	c6 43 32 00          	movb   $0x0,0x32(%rbx)
  4026bb:	89 ef                	mov    %ebp,%edi
  4026bd:	e8 1e e6 ff ff       	callq  400ce0 <close@plt>
  4026c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4026c7:	e9 1e 03 00 00       	jmpq   4029ea <submitr+0x746>
  4026cc:	89 ee                	mov    %ebp,%esi
  4026ce:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4026d3:	e8 ee f8 ff ff       	callq  401fc6 <rio_readinitb>
  4026d8:	ba 00 20 00 00       	mov    $0x2000,%edx
  4026dd:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  4026e4:	00 
  4026e5:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4026ea:	e8 fe f9 ff ff       	callq  4020ed <rio_readlineb>
  4026ef:	48 85 c0             	test   %rax,%rax
  4026f2:	7f 7d                	jg     402771 <submitr+0x4cd>
  4026f4:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4026fb:	3a 20 43 
  4026fe:	48 89 03             	mov    %rax,(%rbx)
  402701:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402708:	20 75 6e 
  40270b:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40270f:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402716:	74 6f 20 
  402719:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40271d:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  402724:	66 69 72 
  402727:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40272b:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402732:	61 64 65 
  402735:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402739:	48 b8 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rax
  402740:	6d 20 72 
  402743:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402747:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  40274e:	20 73 65 
  402751:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402755:	c7 43 38 72 76 65 72 	movl   $0x72657672,0x38(%rbx)
  40275c:	c6 43 3c 00          	movb   $0x0,0x3c(%rbx)
  402760:	89 ef                	mov    %ebp,%edi
  402762:	e8 79 e5 ff ff       	callq  400ce0 <close@plt>
  402767:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40276c:	e9 79 02 00 00       	jmpq   4029ea <submitr+0x746>
  402771:	4c 8d 84 24 40 80 00 	lea    0x8040(%rsp),%r8
  402778:	00 
  402779:	48 8d 4c 24 1c       	lea    0x1c(%rsp),%rcx
  40277e:	48 8d 94 24 40 60 00 	lea    0x6040(%rsp),%rdx
  402785:	00 
  402786:	be ef 34 40 00       	mov    $0x4034ef,%esi
  40278b:	48 8d bc 24 40 20 00 	lea    0x2040(%rsp),%rdi
  402792:	00 
  402793:	b8 00 00 00 00       	mov    $0x0,%eax
  402798:	e8 f3 e5 ff ff       	callq  400d90 <__isoc99_sscanf@plt>
  40279d:	e9 95 00 00 00       	jmpq   402837 <submitr+0x593>
  4027a2:	ba 00 20 00 00       	mov    $0x2000,%edx
  4027a7:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  4027ae:	00 
  4027af:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4027b4:	e8 34 f9 ff ff       	callq  4020ed <rio_readlineb>
  4027b9:	48 85 c0             	test   %rax,%rax
  4027bc:	7f 79                	jg     402837 <submitr+0x593>
  4027be:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4027c5:	3a 20 43 
  4027c8:	48 89 03             	mov    %rax,(%rbx)
  4027cb:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4027d2:	20 75 6e 
  4027d5:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4027d9:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4027e0:	74 6f 20 
  4027e3:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4027e7:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  4027ee:	68 65 61 
  4027f1:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4027f5:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  4027fc:	66 72 6f 
  4027ff:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402803:	48 b8 6d 20 74 68 65 	movabs $0x657220656874206d,%rax
  40280a:	20 72 65 
  40280d:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402811:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  402818:	73 65 72 
  40281b:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40281f:	c7 43 38 76 65 72 00 	movl   $0x726576,0x38(%rbx)
  402826:	89 ef                	mov    %ebp,%edi
  402828:	e8 b3 e4 ff ff       	callq  400ce0 <close@plt>
  40282d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402832:	e9 b3 01 00 00       	jmpq   4029ea <submitr+0x746>
  402837:	0f b6 94 24 40 20 00 	movzbl 0x2040(%rsp),%edx
  40283e:	00 
  40283f:	b8 0d 00 00 00       	mov    $0xd,%eax
  402844:	29 d0                	sub    %edx,%eax
  402846:	75 1b                	jne    402863 <submitr+0x5bf>
  402848:	0f b6 94 24 41 20 00 	movzbl 0x2041(%rsp),%edx
  40284f:	00 
  402850:	b8 0a 00 00 00       	mov    $0xa,%eax
  402855:	29 d0                	sub    %edx,%eax
  402857:	75 0a                	jne    402863 <submitr+0x5bf>
  402859:	0f b6 84 24 42 20 00 	movzbl 0x2042(%rsp),%eax
  402860:	00 
  402861:	f7 d8                	neg    %eax
  402863:	85 c0                	test   %eax,%eax
  402865:	0f 85 37 ff ff ff    	jne    4027a2 <submitr+0x4fe>
  40286b:	ba 00 20 00 00       	mov    $0x2000,%edx
  402870:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402877:	00 
  402878:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  40287d:	e8 6b f8 ff ff       	callq  4020ed <rio_readlineb>
  402882:	48 85 c0             	test   %rax,%rax
  402885:	0f 8f 83 00 00 00    	jg     40290e <submitr+0x66a>
  40288b:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402892:	3a 20 43 
  402895:	48 89 03             	mov    %rax,(%rbx)
  402898:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40289f:	20 75 6e 
  4028a2:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4028a6:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4028ad:	74 6f 20 
  4028b0:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4028b4:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  4028bb:	73 74 61 
  4028be:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4028c2:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  4028c9:	65 73 73 
  4028cc:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4028d0:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  4028d7:	72 6f 6d 
  4028da:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4028de:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  4028e5:	6c 74 20 
  4028e8:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4028ec:	c7 43 38 73 65 72 76 	movl   $0x76726573,0x38(%rbx)
  4028f3:	66 c7 43 3c 65 72    	movw   $0x7265,0x3c(%rbx)
  4028f9:	c6 43 3e 00          	movb   $0x0,0x3e(%rbx)
  4028fd:	89 ef                	mov    %ebp,%edi
  4028ff:	e8 dc e3 ff ff       	callq  400ce0 <close@plt>
  402904:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402909:	e9 dc 00 00 00       	jmpq   4029ea <submitr+0x746>
  40290e:	44 8b 44 24 1c       	mov    0x1c(%rsp),%r8d
  402913:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  40291a:	74 37                	je     402953 <submitr+0x6af>
  40291c:	4c 8d 8c 24 40 80 00 	lea    0x8040(%rsp),%r9
  402923:	00 
  402924:	b9 b8 34 40 00       	mov    $0x4034b8,%ecx
  402929:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  402930:	be 01 00 00 00       	mov    $0x1,%esi
  402935:	48 89 df             	mov    %rbx,%rdi
  402938:	b8 00 00 00 00       	mov    $0x0,%eax
  40293d:	e8 ee e4 ff ff       	callq  400e30 <__sprintf_chk@plt>
  402942:	89 ef                	mov    %ebp,%edi
  402944:	e8 97 e3 ff ff       	callq  400ce0 <close@plt>
  402949:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40294e:	e9 97 00 00 00       	jmpq   4029ea <submitr+0x746>
  402953:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  40295a:	00 
  40295b:	48 89 df             	mov    %rbx,%rdi
  40295e:	e8 0d e3 ff ff       	callq  400c70 <strcpy@plt>
  402963:	89 ef                	mov    %ebp,%edi
  402965:	e8 76 e3 ff ff       	callq  400ce0 <close@plt>
  40296a:	0f b6 03             	movzbl (%rbx),%eax
  40296d:	ba 4f 00 00 00       	mov    $0x4f,%edx
  402972:	29 c2                	sub    %eax,%edx
  402974:	75 22                	jne    402998 <submitr+0x6f4>
  402976:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  40297a:	b8 4b 00 00 00       	mov    $0x4b,%eax
  40297f:	29 c8                	sub    %ecx,%eax
  402981:	75 17                	jne    40299a <submitr+0x6f6>
  402983:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  402987:	b8 0a 00 00 00       	mov    $0xa,%eax
  40298c:	29 c8                	sub    %ecx,%eax
  40298e:	75 0a                	jne    40299a <submitr+0x6f6>
  402990:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  402994:	f7 d8                	neg    %eax
  402996:	eb 02                	jmp    40299a <submitr+0x6f6>
  402998:	89 d0                	mov    %edx,%eax
  40299a:	85 c0                	test   %eax,%eax
  40299c:	74 40                	je     4029de <submitr+0x73a>
  40299e:	bf 00 35 40 00       	mov    $0x403500,%edi
  4029a3:	b9 05 00 00 00       	mov    $0x5,%ecx
  4029a8:	48 89 de             	mov    %rbx,%rsi
  4029ab:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  4029ad:	0f 97 c0             	seta   %al
  4029b0:	0f 92 c1             	setb   %cl
  4029b3:	29 c8                	sub    %ecx,%eax
  4029b5:	0f be c0             	movsbl %al,%eax
  4029b8:	85 c0                	test   %eax,%eax
  4029ba:	74 2e                	je     4029ea <submitr+0x746>
  4029bc:	85 d2                	test   %edx,%edx
  4029be:	75 13                	jne    4029d3 <submitr+0x72f>
  4029c0:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  4029c4:	ba 4b 00 00 00       	mov    $0x4b,%edx
  4029c9:	29 c2                	sub    %eax,%edx
  4029cb:	75 06                	jne    4029d3 <submitr+0x72f>
  4029cd:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  4029d1:	f7 da                	neg    %edx
  4029d3:	85 d2                	test   %edx,%edx
  4029d5:	75 0e                	jne    4029e5 <submitr+0x741>
  4029d7:	b8 00 00 00 00       	mov    $0x0,%eax
  4029dc:	eb 0c                	jmp    4029ea <submitr+0x746>
  4029de:	b8 00 00 00 00       	mov    $0x0,%eax
  4029e3:	eb 05                	jmp    4029ea <submitr+0x746>
  4029e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4029ea:	48 8b 9c 24 48 a0 00 	mov    0xa048(%rsp),%rbx
  4029f1:	00 
  4029f2:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  4029f9:	00 00 
  4029fb:	74 05                	je     402a02 <submitr+0x75e>
  4029fd:	e8 9e e2 ff ff       	callq  400ca0 <__stack_chk_fail@plt>
  402a02:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  402a09:	5b                   	pop    %rbx
  402a0a:	5d                   	pop    %rbp
  402a0b:	41 5c                	pop    %r12
  402a0d:	41 5d                	pop    %r13
  402a0f:	41 5e                	pop    %r14
  402a11:	41 5f                	pop    %r15
  402a13:	c3                   	retq   

0000000000402a14 <init_timeout>:
  402a14:	85 ff                	test   %edi,%edi
  402a16:	74 23                	je     402a3b <init_timeout+0x27>
  402a18:	53                   	push   %rbx
  402a19:	89 fb                	mov    %edi,%ebx
  402a1b:	85 ff                	test   %edi,%edi
  402a1d:	79 05                	jns    402a24 <init_timeout+0x10>
  402a1f:	bb 00 00 00 00       	mov    $0x0,%ebx
  402a24:	be d8 1f 40 00       	mov    $0x401fd8,%esi
  402a29:	bf 0e 00 00 00       	mov    $0xe,%edi
  402a2e:	e8 dd e2 ff ff       	callq  400d10 <signal@plt>
  402a33:	89 df                	mov    %ebx,%edi
  402a35:	e8 96 e2 ff ff       	callq  400cd0 <alarm@plt>
  402a3a:	5b                   	pop    %rbx
  402a3b:	f3 c3                	repz retq 

0000000000402a3d <init_driver>:
  402a3d:	55                   	push   %rbp
  402a3e:	53                   	push   %rbx
  402a3f:	48 83 ec 28          	sub    $0x28,%rsp
  402a43:	48 89 fd             	mov    %rdi,%rbp
  402a46:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402a4d:	00 00 
  402a4f:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402a54:	31 c0                	xor    %eax,%eax
  402a56:	be 01 00 00 00       	mov    $0x1,%esi
  402a5b:	bf 0d 00 00 00       	mov    $0xd,%edi
  402a60:	e8 ab e2 ff ff       	callq  400d10 <signal@plt>
  402a65:	be 01 00 00 00       	mov    $0x1,%esi
  402a6a:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402a6f:	e8 9c e2 ff ff       	callq  400d10 <signal@plt>
  402a74:	be 01 00 00 00       	mov    $0x1,%esi
  402a79:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402a7e:	e8 8d e2 ff ff       	callq  400d10 <signal@plt>
  402a83:	ba 00 00 00 00       	mov    $0x0,%edx
  402a88:	be 01 00 00 00       	mov    $0x1,%esi
  402a8d:	bf 02 00 00 00       	mov    $0x2,%edi
  402a92:	e8 a9 e3 ff ff       	callq  400e40 <socket@plt>
  402a97:	85 c0                	test   %eax,%eax
  402a99:	79 4f                	jns    402aea <init_driver+0xad>
  402a9b:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402aa2:	3a 20 43 
  402aa5:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402aa9:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402ab0:	20 75 6e 
  402ab3:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402ab7:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402abe:	74 6f 20 
  402ac1:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402ac5:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402acc:	65 20 73 
  402acf:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402ad3:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402ada:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402ae0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ae5:	e9 2a 01 00 00       	jmpq   402c14 <init_driver+0x1d7>
  402aea:	89 c3                	mov    %eax,%ebx
  402aec:	bf 05 35 40 00       	mov    $0x403505,%edi
  402af1:	e8 2a e2 ff ff       	callq  400d20 <gethostbyname@plt>
  402af6:	48 85 c0             	test   %rax,%rax
  402af9:	75 68                	jne    402b63 <init_driver+0x126>
  402afb:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402b02:	3a 20 44 
  402b05:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402b09:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402b10:	20 75 6e 
  402b13:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402b17:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402b1e:	74 6f 20 
  402b21:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402b25:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402b2c:	76 65 20 
  402b2f:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402b33:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402b3a:	72 20 61 
  402b3d:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402b41:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402b48:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402b4e:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402b52:	89 df                	mov    %ebx,%edi
  402b54:	e8 87 e1 ff ff       	callq  400ce0 <close@plt>
  402b59:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b5e:	e9 b1 00 00 00       	jmpq   402c14 <init_driver+0x1d7>
  402b63:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402b6a:	00 
  402b6b:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402b72:	00 00 
  402b74:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402b7a:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402b7e:	48 8b 40 18          	mov    0x18(%rax),%rax
  402b82:	48 8b 30             	mov    (%rax),%rsi
  402b85:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402b8a:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402b8f:	e8 9c e1 ff ff       	callq  400d30 <__memmove_chk@plt>
  402b94:	66 c7 44 24 02 27 16 	movw   $0x1627,0x2(%rsp)
  402b9b:	ba 10 00 00 00       	mov    $0x10,%edx
  402ba0:	48 89 e6             	mov    %rsp,%rsi
  402ba3:	89 df                	mov    %ebx,%edi
  402ba5:	e8 66 e2 ff ff       	callq  400e10 <connect@plt>
  402baa:	85 c0                	test   %eax,%eax
  402bac:	79 50                	jns    402bfe <init_driver+0x1c1>
  402bae:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402bb5:	3a 20 55 
  402bb8:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402bbc:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402bc3:	20 74 6f 
  402bc6:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402bca:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402bd1:	65 63 74 
  402bd4:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402bd8:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402bdf:	65 72 76 
  402be2:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402be6:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402bec:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402bf0:	89 df                	mov    %ebx,%edi
  402bf2:	e8 e9 e0 ff ff       	callq  400ce0 <close@plt>
  402bf7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402bfc:	eb 16                	jmp    402c14 <init_driver+0x1d7>
  402bfe:	89 df                	mov    %ebx,%edi
  402c00:	e8 db e0 ff ff       	callq  400ce0 <close@plt>
  402c05:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402c0b:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402c0f:	b8 00 00 00 00       	mov    $0x0,%eax
  402c14:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  402c19:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402c20:	00 00 
  402c22:	74 05                	je     402c29 <init_driver+0x1ec>
  402c24:	e8 77 e0 ff ff       	callq  400ca0 <__stack_chk_fail@plt>
  402c29:	48 83 c4 28          	add    $0x28,%rsp
  402c2d:	5b                   	pop    %rbx
  402c2e:	5d                   	pop    %rbp
  402c2f:	c3                   	retq   

0000000000402c30 <driver_post>:
  402c30:	53                   	push   %rbx
  402c31:	4c 89 cb             	mov    %r9,%rbx
  402c34:	45 85 c0             	test   %r8d,%r8d
  402c37:	74 27                	je     402c60 <driver_post+0x30>
  402c39:	48 89 ca             	mov    %rcx,%rdx
  402c3c:	be 15 35 40 00       	mov    $0x403515,%esi
  402c41:	bf 01 00 00 00       	mov    $0x1,%edi
  402c46:	b8 00 00 00 00       	mov    $0x0,%eax
  402c4b:	e8 60 e1 ff ff       	callq  400db0 <__printf_chk@plt>
  402c50:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402c55:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402c59:	b8 00 00 00 00       	mov    $0x0,%eax
  402c5e:	eb 3f                	jmp    402c9f <driver_post+0x6f>
  402c60:	48 85 ff             	test   %rdi,%rdi
  402c63:	74 2c                	je     402c91 <driver_post+0x61>
  402c65:	80 3f 00             	cmpb   $0x0,(%rdi)
  402c68:	74 27                	je     402c91 <driver_post+0x61>
  402c6a:	48 83 ec 08          	sub    $0x8,%rsp
  402c6e:	41 51                	push   %r9
  402c70:	49 89 c9             	mov    %rcx,%r9
  402c73:	49 89 d0             	mov    %rdx,%r8
  402c76:	48 89 f9             	mov    %rdi,%rcx
  402c79:	48 89 f2             	mov    %rsi,%rdx
  402c7c:	be 16 27 00 00       	mov    $0x2716,%esi
  402c81:	bf 05 35 40 00       	mov    $0x403505,%edi
  402c86:	e8 19 f6 ff ff       	callq  4022a4 <submitr>
  402c8b:	48 83 c4 10          	add    $0x10,%rsp
  402c8f:	eb 0e                	jmp    402c9f <driver_post+0x6f>
  402c91:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402c96:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402c9a:	b8 00 00 00 00       	mov    $0x0,%eax
  402c9f:	5b                   	pop    %rbx
  402ca0:	c3                   	retq   

0000000000402ca1 <check>:
  402ca1:	89 f8                	mov    %edi,%eax
  402ca3:	c1 e8 1c             	shr    $0x1c,%eax
  402ca6:	85 c0                	test   %eax,%eax
  402ca8:	74 1d                	je     402cc7 <check+0x26>
  402caa:	b9 00 00 00 00       	mov    $0x0,%ecx
  402caf:	eb 0b                	jmp    402cbc <check+0x1b>
  402cb1:	89 f8                	mov    %edi,%eax
  402cb3:	d3 e8                	shr    %cl,%eax
  402cb5:	3c 0a                	cmp    $0xa,%al
  402cb7:	74 14                	je     402ccd <check+0x2c>
  402cb9:	83 c1 08             	add    $0x8,%ecx
  402cbc:	83 f9 1f             	cmp    $0x1f,%ecx
  402cbf:	7e f0                	jle    402cb1 <check+0x10>
  402cc1:	b8 01 00 00 00       	mov    $0x1,%eax
  402cc6:	c3                   	retq   
  402cc7:	b8 00 00 00 00       	mov    $0x0,%eax
  402ccc:	c3                   	retq   
  402ccd:	b8 00 00 00 00       	mov    $0x0,%eax
  402cd2:	c3                   	retq   

0000000000402cd3 <gencookie>:
  402cd3:	53                   	push   %rbx
  402cd4:	83 c7 01             	add    $0x1,%edi
  402cd7:	e8 74 df ff ff       	callq  400c50 <srandom@plt>
  402cdc:	e8 8f e0 ff ff       	callq  400d70 <random@plt>
  402ce1:	89 c3                	mov    %eax,%ebx
  402ce3:	89 c7                	mov    %eax,%edi
  402ce5:	e8 b7 ff ff ff       	callq  402ca1 <check>
  402cea:	85 c0                	test   %eax,%eax
  402cec:	74 ee                	je     402cdc <gencookie+0x9>
  402cee:	89 d8                	mov    %ebx,%eax
  402cf0:	5b                   	pop    %rbx
  402cf1:	c3                   	retq   
  402cf2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402cf9:	00 00 00 
  402cfc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402d00 <__libc_csu_init>:
  402d00:	41 57                	push   %r15
  402d02:	41 56                	push   %r14
  402d04:	41 89 ff             	mov    %edi,%r15d
  402d07:	41 55                	push   %r13
  402d09:	41 54                	push   %r12
  402d0b:	4c 8d 25 fe 10 20 00 	lea    0x2010fe(%rip),%r12        # 603e10 <__frame_dummy_init_array_entry>
  402d12:	55                   	push   %rbp
  402d13:	48 8d 2d fe 10 20 00 	lea    0x2010fe(%rip),%rbp        # 603e18 <__init_array_end>
  402d1a:	53                   	push   %rbx
  402d1b:	49 89 f6             	mov    %rsi,%r14
  402d1e:	49 89 d5             	mov    %rdx,%r13
  402d21:	4c 29 e5             	sub    %r12,%rbp
  402d24:	48 83 ec 08          	sub    $0x8,%rsp
  402d28:	48 c1 fd 03          	sar    $0x3,%rbp
  402d2c:	e8 d7 de ff ff       	callq  400c08 <_init>
  402d31:	48 85 ed             	test   %rbp,%rbp
  402d34:	74 20                	je     402d56 <__libc_csu_init+0x56>
  402d36:	31 db                	xor    %ebx,%ebx
  402d38:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402d3f:	00 
  402d40:	4c 89 ea             	mov    %r13,%rdx
  402d43:	4c 89 f6             	mov    %r14,%rsi
  402d46:	44 89 ff             	mov    %r15d,%edi
  402d49:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  402d4d:	48 83 c3 01          	add    $0x1,%rbx
  402d51:	48 39 eb             	cmp    %rbp,%rbx
  402d54:	75 ea                	jne    402d40 <__libc_csu_init+0x40>
  402d56:	48 83 c4 08          	add    $0x8,%rsp
  402d5a:	5b                   	pop    %rbx
  402d5b:	5d                   	pop    %rbp
  402d5c:	41 5c                	pop    %r12
  402d5e:	41 5d                	pop    %r13
  402d60:	41 5e                	pop    %r14
  402d62:	41 5f                	pop    %r15
  402d64:	c3                   	retq   
  402d65:	90                   	nop
  402d66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402d6d:	00 00 00 

0000000000402d70 <__libc_csu_fini>:
  402d70:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402d74 <_fini>:
  402d74:	48 83 ec 08          	sub    $0x8,%rsp
  402d78:	48 83 c4 08          	add    $0x8,%rsp
  402d7c:	c3                   	retq