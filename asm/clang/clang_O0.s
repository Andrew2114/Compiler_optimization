	.text
	.file	"optbench.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
.LCPI0_0:
	.quad	0x3ff000001ad7f29b              # double 1.0000001000000001
.LCPI0_1:
	.quad	0x4003333333333333              # double 2.3999999999999999
.LCPI0_2:
	.quad	0x4021666666666666              # double 8.6999999999999993
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
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
	movl	$2, j4(%rip)
	movl	j4(%rip), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	i2(%rip), %eax
	cmpl	j4(%rip), %eax
	jge	.LBB0_3
# %bb.1:
	movl	i4(%rip), %eax
	cmpl	j4(%rip), %eax
	jge	.LBB0_3
# %bb.2:
	movl	$2, i2(%rip)
	movl	i2(%rip), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB0_3:
	movl	k5(%rip), %eax
	movl	%eax, j4(%rip)
	movl	j4(%rip), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	i2(%rip), %eax
	cmpl	j4(%rip), %eax
	jge	.LBB0_6
# %bb.4:
	movl	i4(%rip), %eax
	cmpl	j4(%rip), %eax
	jge	.LBB0_6
# %bb.5:
	movl	$3, i5(%rip)
	movl	i5(%rip), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB0_6:
	movl	$3, i3(%rip)
	movsd	.LCPI0_2(%rip), %xmm0           # xmm0 = [8.6999999999999993E+0,0.0E+0]
	movsd	%xmm0, flt_1(%rip)
	movl	$5, i2(%rip)
	movl	i(%rip), %eax
	addl	$0, %eax
	movl	%eax, j2(%rip)
	movl	i(%rip), %eax
	movl	$1, %ecx
	cltd
	idivl	%ecx
	movl	%eax, k2(%rip)
	movl	i(%rip), %eax
	shll	$0, %eax
	movl	%eax, i4(%rip)
	imull	$0, i(%rip), %eax
	movl	%eax, i5(%rip)
	leaq	.L.str.1(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movsd	.LCPI0_1(%rip), %xmm0           # xmm0 = [2.3999999999999999E+0,0.0E+0]
	movsd	%xmm0, flt_3(%rip)
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = [1.0000001000000001E+0,0.0E+0]
	movsd	%xmm0, flt_4(%rip)
	xorps	%xmm0, %xmm0
	mulsd	flt_6(%rip), %xmm0
	movsd	%xmm0, flt_5(%rip)
	movsd	flt_2(%rip), %xmm0              # xmm0 = mem[0],zero
	mulsd	flt_3(%rip), %xmm0
	movsd	%xmm0, flt_6(%rip)
	movl	$1, k3(%rip)
	movl	$1, k3(%rip)
	movl	j5(%rip), %eax
	shll	$2, %eax
	movl	%eax, k2(%rip)
	movl	$0, i(%rip)
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	cmpl	$5, i(%rip)
	jg	.LBB0_10
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=1
	movl	i(%rip), %eax
	shll	%eax
	movw	%ax, %dx
	movslq	i(%rip), %rcx
	leaq	ivector4(%rip), %rax
	movw	%dx, (%rax,%rcx,2)
# %bb.9:                                #   in Loop: Header=BB0_7 Depth=1
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
	jmp	.LBB0_7
.LBB0_10:
	movl	$0, j5(%rip)
	movl	$10000, k5(%rip)                # imm = 0x2710
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	movl	k5(%rip), %eax
	subl	$1, %eax
	movl	%eax, k5(%rip)
	movl	j5(%rip), %eax
	addl	$1, %eax
	movl	%eax, j5(%rip)
	imull	$3, k5(%rip), %eax
	imull	$5, j5(%rip), %ecx
	cltd
	idivl	%ecx
	movl	%eax, i5(%rip)
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=1
	cmpl	$0, k5(%rip)
	jg	.LBB0_11
# %bb.13:
	movl	$0, i(%rip)
.LBB0_14:                               # =>This Inner Loop Header: Depth=1
	cmpl	$100, i(%rip)
	jge	.LBB0_17
# %bb.15:                               #   in Loop: Header=BB0_14 Depth=1
	movl	i(%rip), %eax
	shll	%eax
	addl	$3, %eax
	movslq	%eax, %rcx
	leaq	ivector5(%rip), %rax
	movl	$5, (%rax,%rcx,4)
# %bb.16:                               #   in Loop: Header=BB0_14 Depth=1
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
	jmp	.LBB0_14
.LBB0_17:
	cmpl	$10, i(%rip)
	jge	.LBB0_19
# %bb.18:
	movl	i5(%rip), %eax
	addl	i2(%rip), %eax
	movl	%eax, j5(%rip)
	jmp	.LBB0_20
.LBB0_19:
	movl	i5(%rip), %eax
	addl	i2(%rip), %eax
	movl	%eax, k5(%rip)
.LBB0_20:
	movl	$1, ivector(%rip)
	movl	ivector(%rip), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movslq	i2(%rip), %rcx
	leaq	ivector(%rip), %rax
	movl	$2, (%rax,%rcx,4)
	movslq	i2(%rip), %rcx
	leaq	ivector(%rip), %rax
	movl	(%rax,%rcx,4), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movslq	i2(%rip), %rcx
	leaq	ivector(%rip), %rax
	movl	$2, (%rax,%rcx,4)
	movslq	i2(%rip), %rcx
	leaq	ivector(%rip), %rax
	movl	(%rax,%rcx,4), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	$3, ivector+8(%rip)
	movl	ivector+8(%rip), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	h3(%rip), %eax
	addl	k3(%rip), %eax
	cmpl	$0, %eax
	jl	.LBB0_22
# %bb.21:
	movl	h3(%rip), %eax
	addl	k3(%rip), %eax
	cmpl	$5, %eax
	jle	.LBB0_23
.LBB0_22:
	leaq	.L.str.2(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB0_24
.LBB0_23:
	movl	h3(%rip), %eax
	addl	k3(%rip), %eax
	cltd
	idivl	i3(%rip)
	movl	%eax, m3(%rip)
	movl	m3(%rip), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	i3(%rip), %eax
	movl	h3(%rip), %ecx
	addl	k3(%rip), %ecx
	addl	%ecx, %eax
	movl	%eax, g3(%rip)
	movl	g3(%rip), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB0_24:
	movl	$0, i4(%rip)
.LBB0_25:                               # =>This Inner Loop Header: Depth=1
	cmpl	$2, i4(%rip)
	jg	.LBB0_28
# %bb.26:                               #   in Loop: Header=BB0_25 Depth=1
	movl	j(%rip), %eax
	imull	k(%rip), %eax
	movb	%al, %dl
	movslq	i4(%rip), %rcx
	leaq	ivector2(%rip), %rax
	movb	%dl, (%rax,%rcx)
	movslq	i4(%rip), %rcx
	leaq	ivector2(%rip), %rax
	movzbl	(%rax,%rcx), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
# %bb.27:                               #   in Loop: Header=BB0_25 Depth=1
	movl	i4(%rip), %eax
	addl	$1, %eax
	movl	%eax, i4(%rip)
	jmp	.LBB0_25
.LBB0_28:
	movl	$1, %edi
	leaq	.L.str.3(%rip), %rsi
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
	.p2align	4, 0x90
	.type	dead_code,@function
dead_code:                              # @dead_code
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
	.p2align	4, 0x90
	.type	unnecessary_loop,@function
unnecessary_loop:                       # @unnecessary_loop
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$0, i(%rip)
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$5, i(%rip)
	jge	.LBB2_4
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	movl	-4(%rbp), %eax
	addl	j5(%rip), %eax
	movl	%eax, k5(%rip)
# %bb.3:                                #   in Loop: Header=BB2_1 Depth=1
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
	jmp	.LBB2_1
.LBB2_4:
	movl	k5(%rip), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	$0, i(%rip)
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$5, i(%rip)
	jge	.LBB3_4
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	movl	-4(%rbp), %eax
	movl	j5(%rip), %ecx
	imull	i(%rip), %ecx
	addl	%ecx, %eax
	movl	%eax, k5(%rip)
	movl	k5(%rip), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
# %bb.3:                                #   in Loop: Header=BB3_1 Depth=1
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
	jmp	.LBB3_1
.LBB3_4:
	movl	$0, i(%rip)
.LBB3_5:                                # =>This Inner Loop Header: Depth=1
	cmpl	$5, i(%rip)
	jge	.LBB3_8
# %bb.6:                                #   in Loop: Header=BB3_5 Depth=1
	movl	-4(%rbp), %eax
	imull	k5(%rip), %eax
	imull	i(%rip), %eax
	movl	%eax, i5(%rip)
	movl	k5(%rip), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
# %bb.7:                                #   in Loop: Header=BB3_5 Depth=1
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
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
	.p2align	4, 0x90
	.type	loop_unrolling,@function
loop_unrolling:                         # @loop_unrolling
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	$0, i(%rip)
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$6, i(%rip)
	jge	.LBB4_4
# %bb.2:                                #   in Loop: Header=BB4_1 Depth=1
	movslq	i(%rip), %rcx
	leaq	ivector4(%rip), %rax
	movw	$0, (%rax,%rcx,2)
	movslq	i(%rip), %rcx
	leaq	ivector4(%rip), %rax
	movswl	(%rax,%rcx,2), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
# %bb.3:                                #   in Loop: Header=BB4_1 Depth=1
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
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
	.p2align	4, 0x90
	.type	jump_compression,@function
jump_compression:                       # @jump_compression
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
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
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

	.type	.L.str.1,@object                # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"This compiler handles divide-by-zero as                     an error\n"
	.size	.L.str.1, 70

	.type	flt_3,@object                   # @flt_3
	.bss
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
	.p2align	1, 0x0
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

	.type	.L.str.2,@object                # @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"Common subexpression elimination\n"
	.size	.L.str.2, 34

	.type	m3,@object                      # @m3
	.bss
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

	.type	.L.str.3,@object                # @.str.3
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.3:
	.asciz	"This line should not be printed"
	.size	.L.str.3, 32

	.type	l,@object                       # @l
	.bss
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

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym printf
	.addrsig_sym dead_code
	.addrsig_sym unnecessary_loop
	.addrsig_sym loop_jamming
	.addrsig_sym loop_unrolling
	.addrsig_sym jump_compression
	.addrsig_sym j4
	.addrsig_sym i2
	.addrsig_sym i4
	.addrsig_sym k5
	.addrsig_sym i5
	.addrsig_sym i3
	.addrsig_sym flt_1
	.addrsig_sym i
	.addrsig_sym j2
	.addrsig_sym k2
	.addrsig_sym flt_3
	.addrsig_sym flt_4
	.addrsig_sym flt_6
	.addrsig_sym flt_5
	.addrsig_sym flt_2
	.addrsig_sym k3
	.addrsig_sym j5
	.addrsig_sym ivector4
	.addrsig_sym ivector5
	.addrsig_sym ivector
	.addrsig_sym h3
	.addrsig_sym m3
	.addrsig_sym g3
	.addrsig_sym j
	.addrsig_sym k
	.addrsig_sym ivector2
