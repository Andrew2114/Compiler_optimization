	.file	"optbench.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
.LCPI0_0:
	.quad	0x4003333333333333              #  2.3999999999999999
	.text
	.globl	main
	.p2align	4
	.type	main,@function
main:                                   # 
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	stmxcsr	4(%rsp)
	orl	$32832, 4(%rsp)                 # imm = 0x8040
	ldmxcsr	4(%rsp)
	movl	$.L.str, %edi
	movl	$2, %esi
	xorl	%eax, %eax
	callq	printf
	movl	i2(%rip), %r14d
	movl	i4(%rip), %ebp
	cmpl	$1, %r14d
	jg	.LBB0_3
# %bb.1:
	cmpl	$1, %ebp
	jg	.LBB0_3
# %bb.2:
	movl	$2, %r14d
	movl	$.L.str, %edi
	movl	$2, %esi
	xorl	%eax, %eax
	callq	printf
.LBB0_3:
	movl	k5(%rip), %ebx
	movl	%ebx, j4(%rip)
	movl	$.L.str, %edi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	printf
	cmpl	%ebx, %r14d
	jge	.LBB0_6
# %bb.4:
	cmpl	%ebx, %ebp
	jge	.LBB0_6
# %bb.5:
	movl	$.L.str, %edi
	movl	$3, %esi
	xorl	%eax, %eax
	callq	printf
.LBB0_6:
	movl	$3, i3(%rip)
	movabsq	$4621087282649523814, %rax      # imm = 0x4021666666666666
	movq	%rax, flt_1(%rip)
	movl	$5, i2(%rip)
	movl	i(%rip), %eax
	movl	%eax, j2(%rip)
	movl	%eax, k2(%rip)
	movl	%eax, i4(%rip)
	movl	$0, i5(%rip)
	movl	$.Lstr, %edi
	callq	puts@PLT
	movabsq	$4612586738352862003, %rax      # imm = 0x4003333333333333
	movq	%rax, flt_3(%rip)
	movabsq	$4607182419250377371, %rax      # imm = 0x3FF000001AD7F29B
	xorpd	%xmm0, %xmm0
	mulsd	flt_6(%rip), %xmm0
	movsd	%xmm0, flt_5(%rip)
	movsd	flt_2(%rip), %xmm0              # xmm0 = mem[0],zero
	mulsd	.LCPI0_0(%rip), %xmm0
	movq	%rax, flt_4(%rip)
	movsd	%xmm0, flt_6(%rip)
	movl	$1, k3(%rip)
	movl	j5(%rip), %eax
	shll	$2, %eax
	movl	%eax, k2(%rip)
	movabsq	$1688867040264192, %rax         # imm = 0x6000400020000
	movq	%rax, ivector4(%rip)
	movl	$655368, ivector4+8(%rip)       # imm = 0xA0008
	movl	$10000, j5(%rip)                # imm = 0x2710
	movl	$0, i5(%rip)
	movq	$-768, %rax                     # imm = 0xFD00
	.p2align	4
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movl	$5, ivector5+780(%rax)
	movl	$5, ivector5+788(%rax)
	movl	$5, ivector5+796(%rax)
	movl	$5, ivector5+804(%rax)
	movl	$5, ivector5+812(%rax)
	movl	$5, ivector5+820(%rax)
	movl	$5, ivector5+828(%rax)
	movl	$5, ivector5+836(%rax)
	addq	$64, %rax
	jne	.LBB0_7
# %bb.8:
	movl	$5, ivector5+780(%rip)
	movl	$5, ivector5+788(%rip)
	movl	$5, ivector5+796(%rip)
	movl	$5, ivector5+804(%rip)
	movl	$100, i(%rip)
	movl	$5, k5(%rip)
	movl	$1, ivector(%rip)
	movl	$.L.str, %edi
	movl	$1, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str, %edi
	movl	$2, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$2, ivector+20(%rip)
	movl	$.L.str, %edi
	movl	$2, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$3, ivector+8(%rip)
	movl	$.L.str, %edi
	movl	$3, %esi
	xorl	%eax, %eax
	callq	printf
	movl	h3(%rip), %ebx
	leal	1(%rbx), %eax
	cmpl	$5, %eax
	jbe	.LBB0_9
# %bb.16:
	movl	$.Lstr.4, %edi
	callq	puts@PLT
	jmp	.LBB0_10
.LBB0_9:
	movl	%eax, %eax
	movl	$2863311531, %esi               # imm = 0xAAAAAAAB
	imulq	%rax, %rsi
	shrq	$33, %rsi
	movl	%esi, m3(%rip)
	movl	$.L.str, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	addl	$4, %ebx
	movl	%ebx, g3(%rip)
	movl	$.L.str, %edi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	printf
.LBB0_10:
	movl	k(%rip), %eax
	imull	j(%rip), %eax
	movzbl	%al, %ebx
	xorl	%r14d, %r14d
	.p2align	4
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	movb	%bl, ivector2(%r14)
	movl	$.L.str, %edi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	printf
	leaq	1(%r14), %r15
	movl	%r15d, i4(%rip)
	cmpl	$2, %r14d
	jge	.LBB0_15
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=1
	movb	%bl, ivector2+1(%r14)
	movl	$.L.str, %edi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	printf
	leal	2(%r14), %eax
	movl	%eax, i4(%rip)
	cmpl	$1, %r15d
	jg	.LBB0_15
# %bb.13:                               #   in Loop: Header=BB0_11 Depth=1
	movb	%bl, ivector2+2(%r14)
	movl	$.L.str, %edi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	printf
	leal	3(%r14), %eax
	movl	%eax, i4(%rip)
	cmpl	$2147483646, %r14d              # imm = 0x7FFFFFFE
	jb	.LBB0_15
# %bb.14:                               #   in Loop: Header=BB0_11 Depth=1
	movb	%bl, ivector2+3(%r14)
	movl	$.L.str, %edi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	printf
	addq	$4, %r14
	movl	%r14d, i4(%rip)
	movl	%r14d, %eax
	addl	$-4, %eax
	js	.LBB0_11
.LBB0_15:
	movl	$.L.str, %edi
	movl	$10000, %esi                    # imm = 0x2710
	xorl	%eax, %eax
	callq	printf
	movl	$0, i(%rip)
	movl	$7, k5(%rip)
	movl	$.L.str, %edi
	movl	$7, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$10007, k5(%rip)                # imm = 0x2717
	movl	$.L.str, %edi
	movl	$10007, %esi                    # imm = 0x2717
	xorl	%eax, %eax
	callq	printf
	movl	$20007, k5(%rip)                # imm = 0x4E27
	movl	$.L.str, %edi
	movl	$20007, %esi                    # imm = 0x4E27
	xorl	%eax, %eax
	callq	printf
	movl	$30007, k5(%rip)                # imm = 0x7537
	movl	$.L.str, %edi
	movl	$30007, %esi                    # imm = 0x7537
	xorl	%eax, %eax
	callq	printf
	movl	$40007, k5(%rip)                # imm = 0x9C47
	movl	$.L.str, %edi
	movl	$40007, %esi                    # imm = 0x9C47
	xorl	%eax, %eax
	callq	printf
	movl	$0, i(%rip)
	movl	$0, i5(%rip)
	movl	$.L.str, %edi
	movl	$40007, %esi                    # imm = 0x9C47
	xorl	%eax, %eax
	callq	printf
	movl	$280049, i5(%rip)               # imm = 0x445F1
	movl	$.L.str, %edi
	movl	$40007, %esi                    # imm = 0x9C47
	xorl	%eax, %eax
	callq	printf
	movl	$560098, i5(%rip)               # imm = 0x88BE2
	movl	$.L.str, %edi
	movl	$40007, %esi                    # imm = 0x9C47
	xorl	%eax, %eax
	callq	printf
	movl	$840147, i5(%rip)               # imm = 0xCD1D3
	movl	$.L.str, %edi
	movl	$40007, %esi                    # imm = 0x9C47
	xorl	%eax, %eax
	callq	printf
	movl	$1120196, i5(%rip)              # imm = 0x1117C4
	movl	$.L.str, %edi
	movl	$40007, %esi                    # imm = 0x9C47
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$1, i(%rip)
	movl	$.L.str, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$2, i(%rip)
	movl	$.L.str, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$3, i(%rip)
	movq	$0, ivector4(%rip)
	movl	$.L.str, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$4, i(%rip)
	movw	$0, ivector4+8(%rip)
	movl	$.L.str, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$5, i(%rip)
	movw	$0, ivector4+10(%rip)
	movl	$.L.str, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$6, i(%rip)
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	dead_code                       # -- Begin function dead_code
	.p2align	4
	.type	dead_code,@function
dead_code:                              # 
	.cfi_startproc
# %bb.0:
	retq
.Lfunc_end1:
	.size	dead_code, .Lfunc_end1-dead_code
	.cfi_endproc
                                        # -- End function
	.globl	unnecessary_loop                # -- Begin function unnecessary_loop
	.p2align	4
	.type	unnecessary_loop,@function
unnecessary_loop:                       # 
	.cfi_startproc
# %bb.0:
	movl	j5(%rip), %esi
	movl	%esi, k5(%rip)
	movl	$5, i(%rip)
	movl	$.L.str, %edi
	xorl	%eax, %eax
	jmp	printf                          # TAILCALL
.Lfunc_end2:
	.size	unnecessary_loop, .Lfunc_end2-unnecessary_loop
	.cfi_endproc
                                        # -- End function
	.globl	loop_jamming                    # -- Begin function loop_jamming
	.p2align	4
	.type	loop_jamming,@function
loop_jamming:                           # 
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	movl	$0, i(%rip)
	movl	j5(%rip), %r14d
	movl	%edi, k5(%rip)
	movl	$.L.str, %edi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	printf
	leal	(%rbx,%r14), %esi
	movl	%esi, k5(%rip)
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	leal	(%rbx,%r14,2), %esi
	movl	%esi, k5(%rip)
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	leal	(%r14,%r14,2), %esi
	addl	%ebx, %esi
	movl	%esi, k5(%rip)
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	leal	(%rbx,%r14,4), %ebp
	movl	%ebp, k5(%rip)
	movl	$.L.str, %edi
	movl	%ebp, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$0, i5(%rip)
	movl	$.L.str, %edi
	movl	%ebp, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$1, i(%rip)
	imull	%ebp, %ebx
	movl	%ebx, i5(%rip)
	movl	$.L.str, %edi
	movl	%ebp, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$2, i(%rip)
	leal	(%rbx,%rbx), %eax
	movl	%eax, i5(%rip)
	movl	$.L.str, %edi
	movl	%ebp, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$3, i(%rip)
	leal	(%rbx,%rbx,2), %eax
	movl	%eax, i5(%rip)
	movl	$.L.str, %edi
	movl	%ebp, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$4, i(%rip)
	shll	$2, %ebx
	movl	%ebx, i5(%rip)
	movl	$.L.str, %edi
	movl	%ebp, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$5, i(%rip)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	loop_jamming, .Lfunc_end3-loop_jamming
	.cfi_endproc
                                        # -- End function
	.globl	loop_unrolling                  # -- Begin function loop_unrolling
	.p2align	4
	.type	loop_unrolling,@function
loop_unrolling:                         # 
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$.L.str, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$1, i(%rip)
	movl	$.L.str, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$2, i(%rip)
	movl	$.L.str, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$3, i(%rip)
	movq	$0, ivector4(%rip)
	movl	$.L.str, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$4, i(%rip)
	movw	$0, ivector4+8(%rip)
	movl	$.L.str, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$5, i(%rip)
	movw	$0, ivector4+10(%rip)
	movl	$.L.str, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$6, i(%rip)
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end4:
	.size	loop_unrolling, .Lfunc_end4-loop_unrolling
	.cfi_endproc
                                        # -- End function
	.globl	jump_compression                # -- Begin function jump_compression
	.p2align	4
	.type	jump_compression,@function
jump_compression:                       # 
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%r8d, %ebp
	movl	%ecx, %ebx
	movl	%edx, %r15d
	movl	%esi, %r14d
	movl	%edi, %r12d
	cmpl	%esi, %edi
	jl	.LBB5_1
.LBB5_8:
	addl	%r14d, %r12d
.LBB5_9:
	addl	%r15d, %r14d
	addl	%r12d, %r14d
	addl	%ebp, %ebx
	addl	%r14d, %ebx
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
	.p2align	4
.LBB5_6:                                #   in Loop: Header=BB5_1 Depth=1
	.cfi_def_cfa_offset 48
	addl	%r15d, %r14d
	movl	$.L.str, %edi
	movl	%r14d, %esi
	xorl	%eax, %eax
	callq	printf
.LBB5_7:                                #   in Loop: Header=BB5_1 Depth=1
	cmpl	%r14d, %r12d
	jge	.LBB5_8
.LBB5_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	%r15d, %r14d
	jge	.LBB5_6
# %bb.2:                                #   in Loop: Header=BB5_1 Depth=1
	cmpl	%ebx, %r15d
	jge	.LBB5_5
# %bb.3:                                #   in Loop: Header=BB5_1 Depth=1
	cmpl	%ebp, %ebx
	jge	.LBB5_7
# %bb.4:
	addl	%ebp, %ebx
	jmp	.LBB5_9
.LBB5_5:
	addl	%ebx, %r15d
	jmp	.LBB5_9
.Lfunc_end5:
	.size	jump_compression, .Lfunc_end5-jump_compression
	.cfi_endproc
                                        # -- End function
	.type	j4,@object                      # 
	.bss
	.globl	j4
	.p2align	2, 0x0
j4:
	.long	0                               # 0x0
	.size	j4, 4

	.type	.L.str,@object                  # 
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.type	i2,@object                      # 
	.bss
	.globl	i2
	.p2align	2, 0x0
i2:
	.long	0                               # 0x0
	.size	i2, 4

	.type	i4,@object                      # 
	.globl	i4
	.p2align	2, 0x0
i4:
	.long	0                               # 0x0
	.size	i4, 4

	.type	k5,@object                      # 
	.globl	k5
	.p2align	2, 0x0
k5:
	.long	0                               # 0x0
	.size	k5, 4

	.type	i5,@object                      # 
	.globl	i5
	.p2align	2, 0x0
i5:
	.long	0                               # 0x0
	.size	i5, 4

	.type	i3,@object                      # 
	.globl	i3
	.p2align	2, 0x0
i3:
	.long	0                               # 0x0
	.size	i3, 4

	.type	flt_1,@object                   # 
	.globl	flt_1
	.p2align	3, 0x0
flt_1:
	.quad	0x0000000000000000              #  0
	.size	flt_1, 8

	.type	i,@object                       # 
	.globl	i
	.p2align	2, 0x0
i:
	.long	0                               # 0x0
	.size	i, 4

	.type	j2,@object                      # 
	.globl	j2
	.p2align	2, 0x0
j2:
	.long	0                               # 0x0
	.size	j2, 4

	.type	k2,@object                      # 
	.globl	k2
	.p2align	2, 0x0
k2:
	.long	0                               # 0x0
	.size	k2, 4

	.type	flt_3,@object                   # 
	.globl	flt_3
	.p2align	3, 0x0
flt_3:
	.quad	0x0000000000000000              #  0
	.size	flt_3, 8

	.type	flt_4,@object                   # 
	.globl	flt_4
	.p2align	3, 0x0
flt_4:
	.quad	0x0000000000000000              #  0
	.size	flt_4, 8

	.type	flt_6,@object                   # 
	.globl	flt_6
	.p2align	3, 0x0
flt_6:
	.quad	0x0000000000000000              #  0
	.size	flt_6, 8

	.type	flt_5,@object                   # 
	.globl	flt_5
	.p2align	3, 0x0
flt_5:
	.quad	0x0000000000000000              #  0
	.size	flt_5, 8

	.type	flt_2,@object                   # 
	.globl	flt_2
	.p2align	3, 0x0
flt_2:
	.quad	0x0000000000000000              #  0
	.size	flt_2, 8

	.type	k3,@object                      # 
	.globl	k3
	.p2align	2, 0x0
k3:
	.long	0                               # 0x0
	.size	k3, 4

	.type	j5,@object                      # 
	.globl	j5
	.p2align	2, 0x0
j5:
	.long	0                               # 0x0
	.size	j5, 4

	.type	ivector4,@object                # 
	.globl	ivector4
	.p2align	3, 0x0
ivector4:
	.zero	12
	.size	ivector4, 12

	.type	ivector5,@object                # 
	.globl	ivector5
	.p2align	4, 0x0
ivector5:
	.zero	400
	.size	ivector5, 400

	.type	ivector,@object                 # 
	.globl	ivector
	.p2align	2, 0x0
ivector:
	.zero	12
	.size	ivector, 12

	.type	h3,@object                      # 
	.globl	h3
	.p2align	2, 0x0
h3:
	.long	0                               # 0x0
	.size	h3, 4

	.type	m3,@object                      # 
	.globl	m3
	.p2align	2, 0x0
m3:
	.long	0                               # 0x0
	.size	m3, 4

	.type	g3,@object                      # 
	.globl	g3
	.p2align	2, 0x0
g3:
	.long	0                               # 0x0
	.size	g3, 4

	.type	j,@object                       # 
	.globl	j
	.p2align	2, 0x0
j:
	.long	0                               # 0x0
	.size	j, 4

	.type	k,@object                       # 
	.globl	k
	.p2align	2, 0x0
k:
	.long	0                               # 0x0
	.size	k, 4

	.type	ivector2,@object                # 
	.globl	ivector2
ivector2:
	.zero	3
	.size	ivector2, 3

	.type	l,@object                       # 
	.globl	l
	.p2align	2, 0x0
l:
	.long	0                               # 0x0
	.size	l, 4

	.type	m,@object                       # 
	.globl	m
	.p2align	2, 0x0
m:
	.long	0                               # 0x0
	.size	m, 4

	.type	.Lstr,@object                   # 
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr:
	.asciz	"This compiler handles divide-by-zero as                     an error"
	.size	.Lstr, 69

	.type	.Lstr.4,@object                 # 
.Lstr.4:
	.asciz	"Common subexpression elimination"
	.size	.Lstr.4, 33

	.ident	"Intel(R) oneAPI DPC++/C++ Compiler 2026.0.0 (2026.0.0.20260331)"
	.section	".note.GNU-stack","",@progbits
