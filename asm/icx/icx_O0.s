	.file	"optbench.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
.LCPI0_0:
	.quad	0x3ff000001ad7f29b              #  1.0000001000000001
.LCPI0_1:
	.quad	0x4003333333333333              #  2.3999999999999999
.LCPI0_2:
	.quad	0x4021666666666666              #  8.6999999999999993
	.text
	.globl	main
	.p2align	4
	.type	main,@function
main:                                   # 
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$2, j4
	movl	j4, %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movl	i2, %eax
	cmpl	j4, %eax
	jge	.LBB0_3
# %bb.1:
	movl	i4, %eax
	cmpl	j4, %eax
	jge	.LBB0_3
# %bb.2:
	movl	$2, i2
	movl	i2, %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
.LBB0_3:
	movl	k5, %eax
	movl	%eax, j4
	movl	j4, %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movl	i2, %eax
	cmpl	j4, %eax
	jge	.LBB0_6
# %bb.4:
	movl	i4, %eax
	cmpl	j4, %eax
	jge	.LBB0_6
# %bb.5:
	movl	$3, i5
	movl	i5, %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
.LBB0_6:
	movl	$3, i3
	movsd	.LCPI0_2(%rip), %xmm0           # xmm0 = [8.6999999999999993E+0,0.0E+0]
	movsd	%xmm0, flt_1
	movl	$5, i2
	movl	i, %eax
	addl	$0, %eax
	movl	%eax, j2
	movl	i, %eax
	movl	$1, %ecx
	cltd
	idivl	%ecx
	movl	%eax, k2
	movl	i, %eax
	shll	$0, %eax
	movl	%eax, i4
	imull	$0, i, %eax
	movl	%eax, i5
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	printf
	movsd	.LCPI0_1(%rip), %xmm0           # xmm0 = [2.3999999999999999E+0,0.0E+0]
	movsd	%xmm0, flt_3
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = [1.0000001000000001E+0,0.0E+0]
	movsd	%xmm0, flt_4
	xorps	%xmm0, %xmm0
	mulsd	flt_6, %xmm0
	movsd	%xmm0, flt_5
	movsd	flt_2, %xmm0                    # xmm0 = mem[0],zero
	mulsd	flt_3, %xmm0
	movsd	%xmm0, flt_6
	movl	$1, k3
	movl	$1, k3
	movl	j5, %eax
	shll	$2, %eax
	movl	%eax, k2
	movl	$0, i
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	cmpl	$5, i
	jg	.LBB0_10
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=1
	movl	i, %eax
	shll	%eax
	movw	%ax, %cx
	movslq	i, %rax
	movw	%cx, ivector4(,%rax,2)
# %bb.9:                                #   in Loop: Header=BB0_7 Depth=1
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
	jmp	.LBB0_7
.LBB0_10:
	movl	$0, j5
	movl	$10000, k5                      # imm = 0x2710
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	movl	k5, %eax
	subl	$1, %eax
	movl	%eax, k5
	movl	j5, %eax
	addl	$1, %eax
	movl	%eax, j5
	imull	$3, k5, %eax
	imull	$5, j5, %ecx
	cltd
	idivl	%ecx
	movl	%eax, i5
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=1
	cmpl	$0, k5
	jg	.LBB0_11
# %bb.13:
	movl	$0, i
.LBB0_14:                               # =>This Inner Loop Header: Depth=1
	cmpl	$100, i
	jge	.LBB0_17
# %bb.15:                               #   in Loop: Header=BB0_14 Depth=1
	movl	i, %eax
	shll	%eax
	addl	$3, %eax
	cltq
	movl	$5, ivector5(,%rax,4)
# %bb.16:                               #   in Loop: Header=BB0_14 Depth=1
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
	jmp	.LBB0_14
.LBB0_17:
	cmpl	$10, i
	jge	.LBB0_19
# %bb.18:
	movl	i5, %eax
	addl	i2, %eax
	movl	%eax, j5
	jmp	.LBB0_20
.LBB0_19:
	movl	i5, %eax
	addl	i2, %eax
	movl	%eax, k5
.LBB0_20:
	movl	$1, ivector
	movl	ivector, %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movslq	i2, %rax
	movl	$2, ivector(,%rax,4)
	movslq	i2, %rax
	movl	ivector(,%rax,4), %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movslq	i2, %rax
	movl	$2, ivector(,%rax,4)
	movslq	i2, %rax
	movl	ivector(,%rax,4), %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movl	$3, ivector+8
	movl	ivector+8, %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movl	h3, %eax
	addl	k3, %eax
	cmpl	$0, %eax
	jl	.LBB0_22
# %bb.21:
	movl	h3, %eax
	addl	k3, %eax
	cmpl	$5, %eax
	jle	.LBB0_23
.LBB0_22:
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf
	jmp	.LBB0_24
.LBB0_23:
	movl	h3, %eax
	addl	k3, %eax
	cltd
	idivl	i3
	movl	%eax, m3
	movl	m3, %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movl	i3, %eax
	movl	h3, %ecx
	addl	k3, %ecx
	addl	%ecx, %eax
	movl	%eax, g3
	movl	g3, %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
.LBB0_24:
	movl	$0, i4
.LBB0_25:                               # =>This Inner Loop Header: Depth=1
	cmpl	$2, i4
	jg	.LBB0_28
# %bb.26:                               #   in Loop: Header=BB0_25 Depth=1
	movl	j, %eax
	imull	k, %eax
	movb	%al, %cl
	movslq	i4, %rax
	movb	%cl, ivector2(,%rax)
	movslq	i4, %rax
	movzbl	ivector2(,%rax), %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
# %bb.27:                               #   in Loop: Header=BB0_25 Depth=1
	movl	i4, %eax
	addl	$1, %eax
	movl	%eax, i4
	jmp	.LBB0_25
.LBB0_28:
	movl	$1, %edi
	movabsq	$.L.str.3, %rsi
	callq	dead_code
	callq	unnecessary_loop
	movl	$7, %edi
	callq	loop_jamming
	movl	$7, %edi
	callq	loop_unrolling
	movl	$1, %edi
	movl	$2, %esi
	movl	$3, %edx
	movl	$4, %ecx
	movl	$5, %r8d
	callq	jump_compression
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -20(%rbp)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$0, i
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$5, i
	jge	.LBB2_4
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	movl	-4(%rbp), %eax
	addl	j5, %eax
	movl	%eax, k5
# %bb.3:                                #   in Loop: Header=BB2_1 Depth=1
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
	jmp	.LBB2_1
.LBB2_4:
	movl	k5, %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
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
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	$0, i
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$5, i
	jge	.LBB3_4
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	movl	-4(%rbp), %eax
	movl	j5, %ecx
	imull	i, %ecx
	addl	%ecx, %eax
	movl	%eax, k5
	movl	k5, %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
# %bb.3:                                #   in Loop: Header=BB3_1 Depth=1
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
	jmp	.LBB3_1
.LBB3_4:
	movl	$0, i
.LBB3_5:                                # =>This Inner Loop Header: Depth=1
	cmpl	$5, i
	jge	.LBB3_8
# %bb.6:                                #   in Loop: Header=BB3_5 Depth=1
	movl	-4(%rbp), %eax
	imull	k5, %eax
	imull	i, %eax
	movl	%eax, i5
	movl	k5, %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
# %bb.7:                                #   in Loop: Header=BB3_5 Depth=1
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
	jmp	.LBB3_5
.LBB3_8:
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	$0, i
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$6, i
	jge	.LBB4_4
# %bb.2:                                #   in Loop: Header=BB4_1 Depth=1
	movslq	i, %rax
	movw	$0, ivector4(,%rax,2)
	movslq	i, %rax
	movswl	ivector4(,%rax,2), %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
# %bb.3:                                #   in Loop: Header=BB4_1 Depth=1
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
	jmp	.LBB4_1
.LBB4_4:
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	%ecx, -16(%rbp)
	movl	%r8d, -20(%rbp)
.LBB5_1:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB5_13
# %bb.2:                                #   in Loop: Header=BB5_1 Depth=1
	movl	-8(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB5_10
# %bb.3:                                #   in Loop: Header=BB5_1 Depth=1
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB5_8
# %bb.4:                                #   in Loop: Header=BB5_1 Depth=1
	movl	-16(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB5_6
# %bb.5:
	movl	-20(%rbp), %eax
	addl	-16(%rbp), %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB5_7
.LBB5_6:                                #   in Loop: Header=BB5_1 Depth=1
	jmp	.LBB5_11
.LBB5_7:
	jmp	.LBB5_9
.LBB5_8:
	movl	-16(%rbp), %eax
	addl	-12(%rbp), %eax
	movl	%eax, -12(%rbp)
.LBB5_9:
	jmp	.LBB5_12
.LBB5_10:                               #   in Loop: Header=BB5_1 Depth=1
	movl	-12(%rbp), %eax
	addl	-8(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
.LBB5_11:                               #   in Loop: Header=BB5_1 Depth=1
	jmp	.LBB5_1
.LBB5_12:
	jmp	.LBB5_14
.LBB5_13:
	movl	-8(%rbp), %eax
	addl	-4(%rbp), %eax
	movl	%eax, -4(%rbp)
.LBB5_14:
	movl	-4(%rbp), %eax
	addl	-8(%rbp), %eax
	addl	-12(%rbp), %eax
	addl	-16(%rbp), %eax
	addl	-20(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
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

	.type	.L.str.1,@object                # 
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"This compiler handles divide-by-zero as                     an error\n"
	.size	.L.str.1, 70

	.type	flt_3,@object                   # 
	.bss
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
	.p2align	1, 0x0
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

	.type	.L.str.2,@object                # 
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"Common subexpression elimination\n"
	.size	.L.str.2, 34

	.type	m3,@object                      # 
	.bss
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

	.type	.L.str.3,@object                # 
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.3:
	.asciz	"This line should not be printed"
	.size	.L.str.3, 32

	.type	l,@object                       # 
	.bss
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

	.ident	"Intel(R) oneAPI DPC++/C++ Compiler 2026.0.0 (2026.0.0.20260331)"
	.section	".note.GNU-stack","",@progbits
