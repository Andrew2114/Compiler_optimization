	.text
	.file	"optbench.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
.LCPI0_0:
	.quad	0x4003333333333333              # double 2.3999999999999999
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movl	$2, j4(%rip)
	leaq	.L.str(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	j4(%rip), %eax
	cmpl	%eax, i2(%rip)
	jge	.LBB0_3
# %bb.1:
	cmpl	%eax, i4(%rip)
	jge	.LBB0_3
# %bb.2:
	movl	$2, i2(%rip)
	leaq	.L.str(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	callq	printf@PLT
.LBB0_3:
	movl	k5(%rip), %esi
	movl	%esi, j4(%rip)
	leaq	.L.str(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	j4(%rip), %eax
	cmpl	%eax, i2(%rip)
	jge	.LBB0_6
# %bb.4:
	cmpl	%eax, i4(%rip)
	jge	.LBB0_6
# %bb.5:
	movl	$3, i5(%rip)
	leaq	.L.str(%rip), %rdi
	movl	$3, %esi
	xorl	%eax, %eax
	callq	printf@PLT
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
	leaq	.Lstr(%rip), %rdi
	callq	puts@PLT
	movabsq	$4612586738352862003, %rax      # imm = 0x4003333333333333
	movq	%rax, flt_3(%rip)
	movabsq	$4607182419250377371, %rax      # imm = 0x3FF000001AD7F29B
	movq	%rax, flt_4(%rip)
	xorpd	%xmm0, %xmm0
	mulsd	flt_6(%rip), %xmm0
	movsd	%xmm0, flt_5(%rip)
	movsd	flt_2(%rip), %xmm0              # xmm0 = mem[0],zero
	mulsd	.LCPI0_0(%rip), %xmm0
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
	xorl	%eax, %eax
	leaq	ivector5(%rip), %rcx
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movl	$5, 12(%rcx,%rax,8)
	movl	$5, 20(%rcx,%rax,8)
	movl	$5, 28(%rcx,%rax,8)
	movl	$5, 36(%rcx,%rax,8)
	addq	$4, %rax
	cmpq	$100, %rax
	jne	.LBB0_7
# %bb.8:
	movl	$100, i(%rip)
	movl	i2(%rip), %eax
	movl	%eax, k5(%rip)
	movl	$1, ivector(%rip)
	leaq	ivector(%rip), %r14
	leaq	.L.str(%rip), %rbx
	movq	%rbx, %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movslq	i2(%rip), %rax
	movl	$2, (%r14,%rax,4)
	movq	%rbx, %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movslq	i2(%rip), %rax
	movl	$2, (%r14,%rax,4)
	movq	%rbx, %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$3, ivector+8(%rip)
	movq	%rbx, %rdi
	movl	$3, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	k3(%rip), %eax
	addl	h3(%rip), %eax
	cmpl	$6, %eax
	jb	.LBB0_10
# %bb.9:
	leaq	.Lstr.4(%rip), %rdi
	callq	puts@PLT
	jmp	.LBB0_11
.LBB0_10:
	cltd
	idivl	i3(%rip)
	movl	%eax, m3(%rip)
	leaq	.L.str(%rip), %rbx
	movq	%rbx, %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	h3(%rip), %esi
	addl	i3(%rip), %esi
	addl	k3(%rip), %esi
	movl	%esi, g3(%rip)
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
.LBB0_11:
	movl	$0, i4(%rip)
	leaq	ivector2(%rip), %r14
	leaq	.L.str(%rip), %rbx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	movl	k(%rip), %ecx
	imull	j(%rip), %ecx
	cltq
	movb	%cl, (%rax,%r14)
	movzbl	%cl, %esi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	i4(%rip), %ecx
	leal	1(%rcx), %eax
	movl	%eax, i4(%rip)
	cmpl	$2, %ecx
	jl	.LBB0_12
# %bb.13:
	movl	j5(%rip), %esi
	movl	%esi, k5(%rip)
	movl	$5, i(%rip)
	leaq	.L.str(%rip), %rbx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$0, i(%rip)
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_14:                               # =>This Inner Loop Header: Depth=1
	imull	j5(%rip), %esi
	addl	$7, %esi
	movl	%esi, k5(%rip)
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	i(%rip), %eax
	leal	1(%rax), %esi
	movl	%esi, i(%rip)
	cmpl	$4, %eax
	jl	.LBB0_14
# %bb.15:
	movl	$0, i(%rip)
	leaq	.L.str(%rip), %rbx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_16:                               # =>This Inner Loop Header: Depth=1
	movl	k5(%rip), %esi
	imull	%esi, %eax
	leal	(,%rax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, i5(%rip)
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	i(%rip), %ecx
	leal	1(%rcx), %eax
	movl	%eax, i(%rip)
	cmpl	$4, %ecx
	jl	.LBB0_16
# %bb.17:
	movl	$0, i(%rip)
	leaq	ivector4(%rip), %r14
	leaq	.L.str(%rip), %rbx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_18:                               # =>This Inner Loop Header: Depth=1
	cltq
	movw	$0, (%r14,%rax,2)
	movq	%rbx, %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	i(%rip), %ecx
	leal	1(%rcx), %eax
	movl	%eax, i(%rip)
	cmpl	$5, %ecx
	jl	.LBB0_18
# %bb.19:
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	dead_code                       # -- Begin function dead_code
	.p2align	4, 0x90
	.type	dead_code,@function
dead_code:                              # @dead_code
	.cfi_startproc
# %bb.0:
	retq
.Lfunc_end1:
	.size	dead_code, .Lfunc_end1-dead_code
	.cfi_endproc
                                        # -- End function
	.globl	unnecessary_loop                # -- Begin function unnecessary_loop
	.p2align	4, 0x90
	.type	unnecessary_loop,@function
unnecessary_loop:                       # @unnecessary_loop
	.cfi_startproc
# %bb.0:
	movl	j5(%rip), %esi
	movl	%esi, k5(%rip)
	movl	$5, i(%rip)
	leaq	.L.str(%rip), %rdi
	xorl	%eax, %eax
	jmp	printf@PLT                      # TAILCALL
.Lfunc_end2:
	.size	unnecessary_loop, .Lfunc_end2-unnecessary_loop
	.cfi_endproc
                                        # -- End function
	.globl	loop_jamming                    # -- Begin function loop_jamming
	.p2align	4, 0x90
	.type	loop_jamming,@function
loop_jamming:                           # @loop_jamming
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movl	%edi, %ebx
	movl	$0, i(%rip)
	leaq	.L.str(%rip), %r14
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	imull	j5(%rip), %esi
	addl	%ebx, %esi
	movl	%esi, k5(%rip)
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	i(%rip), %eax
	leal	1(%rax), %esi
	movl	%esi, i(%rip)
	cmpl	$4, %eax
	jl	.LBB3_1
# %bb.2:
	movl	$0, i(%rip)
	leaq	.L.str(%rip), %r14
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB3_3:                                # =>This Inner Loop Header: Depth=1
	movl	k5(%rip), %esi
	imull	%ebx, %eax
	imull	%esi, %eax
	movl	%eax, i5(%rip)
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	i(%rip), %ecx
	leal	1(%rcx), %eax
	movl	%eax, i(%rip)
	cmpl	$4, %ecx
	jl	.LBB3_3
# %bb.4:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	loop_jamming, .Lfunc_end3-loop_jamming
	.cfi_endproc
                                        # -- End function
	.globl	loop_unrolling                  # -- Begin function loop_unrolling
	.p2align	4, 0x90
	.type	loop_unrolling,@function
loop_unrolling:                         # @loop_unrolling
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movl	$0, i(%rip)
	leaq	ivector4(%rip), %r14
	leaq	.L.str(%rip), %rbx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	cltq
	movw	$0, (%r14,%rax,2)
	movq	%rbx, %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	i(%rip), %ecx
	leal	1(%rcx), %eax
	movl	%eax, i(%rip)
	cmpl	$5, %ecx
	jl	.LBB4_1
# %bb.2:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end4:
	.size	loop_unrolling, .Lfunc_end4-loop_unrolling
	.cfi_endproc
                                        # -- End function
	.globl	jump_compression                # -- Begin function jump_compression
	.p2align	4, 0x90
	.type	jump_compression,@function
jump_compression:                       # @jump_compression
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%r8d, %ebp
	movl	%ecx, %r12d
	movl	%edx, %r14d
	movl	%esi, %ebx
	movl	%edi, %r15d
	cmpl	%edi, %esi
	jle	.LBB5_9
# %bb.1:
	leaq	.L.str(%rip), %r13
	jmp	.LBB5_2
	.p2align	4, 0x90
.LBB5_7:                                #   in Loop: Header=BB5_2 Depth=1
	addl	%r14d, %ebx
	movq	%r13, %rdi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	printf@PLT
.LBB5_8:                                #   in Loop: Header=BB5_2 Depth=1
	cmpl	%r15d, %ebx
	jle	.LBB5_9
.LBB5_2:                                # =>This Inner Loop Header: Depth=1
	cmpl	%r14d, %ebx
	jge	.LBB5_7
# %bb.3:                                #   in Loop: Header=BB5_2 Depth=1
	cmpl	%r12d, %r14d
	jge	.LBB5_6
# %bb.4:                                #   in Loop: Header=BB5_2 Depth=1
	cmpl	%ebp, %r12d
	jge	.LBB5_8
# %bb.5:
	addl	%ebp, %r12d
	jmp	.LBB5_10
.LBB5_9:
	addl	%ebx, %r15d
.LBB5_10:
	addl	%r12d, %r14d
	addl	%ebp, %ebx
	addl	%r14d, %ebx
	addl	%r15d, %ebx
	movl	%ebx, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB5_6:
	.cfi_def_cfa_offset 64
	addl	%r12d, %r14d
	jmp	.LBB5_10
.Lfunc_end5:
	.size	jump_compression, .Lfunc_end5-jump_compression
	.cfi_endproc
                                        # -- End function
	.type	j4,@object                      # @j4
	.bss
	.globl	j4
	.p2align	2, 0x0
j4:
	.long	0                               # 0x0
	.size	j4, 4

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.type	i2,@object                      # @i2
	.bss
	.globl	i2
	.p2align	2, 0x0
i2:
	.long	0                               # 0x0
	.size	i2, 4

	.type	i4,@object                      # @i4
	.globl	i4
	.p2align	2, 0x0
i4:
	.long	0                               # 0x0
	.size	i4, 4

	.type	k5,@object                      # @k5
	.globl	k5
	.p2align	2, 0x0
k5:
	.long	0                               # 0x0
	.size	k5, 4

	.type	i5,@object                      # @i5
	.globl	i5
	.p2align	2, 0x0
i5:
	.long	0                               # 0x0
	.size	i5, 4

	.type	i3,@object                      # @i3
	.globl	i3
	.p2align	2, 0x0
i3:
	.long	0                               # 0x0
	.size	i3, 4

	.type	flt_1,@object                   # @flt_1
	.globl	flt_1
	.p2align	3, 0x0
flt_1:
	.quad	0x0000000000000000              # double 0
	.size	flt_1, 8

	.type	i,@object                       # @i
	.globl	i
	.p2align	2, 0x0
i:
	.long	0                               # 0x0
	.size	i, 4

	.type	j2,@object                      # @j2
	.globl	j2
	.p2align	2, 0x0
j2:
	.long	0                               # 0x0
	.size	j2, 4

	.type	k2,@object                      # @k2
	.globl	k2
	.p2align	2, 0x0
k2:
	.long	0                               # 0x0
	.size	k2, 4

	.type	flt_3,@object                   # @flt_3
	.globl	flt_3
	.p2align	3, 0x0
flt_3:
	.quad	0x0000000000000000              # double 0
	.size	flt_3, 8

	.type	flt_4,@object                   # @flt_4
	.globl	flt_4
	.p2align	3, 0x0
flt_4:
	.quad	0x0000000000000000              # double 0
	.size	flt_4, 8

	.type	flt_6,@object                   # @flt_6
	.globl	flt_6
	.p2align	3, 0x0
flt_6:
	.quad	0x0000000000000000              # double 0
	.size	flt_6, 8

	.type	flt_5,@object                   # @flt_5
	.globl	flt_5
	.p2align	3, 0x0
flt_5:
	.quad	0x0000000000000000              # double 0
	.size	flt_5, 8

	.type	flt_2,@object                   # @flt_2
	.globl	flt_2
	.p2align	3, 0x0
flt_2:
	.quad	0x0000000000000000              # double 0
	.size	flt_2, 8

	.type	k3,@object                      # @k3
	.globl	k3
	.p2align	2, 0x0
k3:
	.long	0                               # 0x0
	.size	k3, 4

	.type	j5,@object                      # @j5
	.globl	j5
	.p2align	2, 0x0
j5:
	.long	0                               # 0x0
	.size	j5, 4

	.type	ivector4,@object                # @ivector4
	.globl	ivector4
	.p2align	3, 0x0
ivector4:
	.zero	12
	.size	ivector4, 12

	.type	ivector5,@object                # @ivector5
	.globl	ivector5
	.p2align	4, 0x0
ivector5:
	.zero	400
	.size	ivector5, 400

	.type	ivector,@object                 # @ivector
	.globl	ivector
	.p2align	2, 0x0
ivector:
	.zero	12
	.size	ivector, 12

	.type	h3,@object                      # @h3
	.globl	h3
	.p2align	2, 0x0
h3:
	.long	0                               # 0x0
	.size	h3, 4

	.type	m3,@object                      # @m3
	.globl	m3
	.p2align	2, 0x0
m3:
	.long	0                               # 0x0
	.size	m3, 4

	.type	g3,@object                      # @g3
	.globl	g3
	.p2align	2, 0x0
g3:
	.long	0                               # 0x0
	.size	g3, 4

	.type	j,@object                       # @j
	.globl	j
	.p2align	2, 0x0
j:
	.long	0                               # 0x0
	.size	j, 4

	.type	k,@object                       # @k
	.globl	k
	.p2align	2, 0x0
k:
	.long	0                               # 0x0
	.size	k, 4

	.type	ivector2,@object                # @ivector2
	.globl	ivector2
ivector2:
	.zero	3
	.size	ivector2, 3

	.type	l,@object                       # @l
	.globl	l
	.p2align	2, 0x0
l:
	.long	0                               # 0x0
	.size	l, 4

	.type	m,@object                       # @m
	.globl	m
	.p2align	2, 0x0
m:
	.long	0                               # 0x0
	.size	m, 4

	.type	.Lstr,@object                   # @str
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr:
	.asciz	"This compiler handles divide-by-zero as                     an error"
	.size	.Lstr, 69

	.type	.Lstr.4,@object                 # @str.4
.Lstr.4:
	.asciz	"Common subexpression elimination"
	.size	.Lstr.4, 33

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
