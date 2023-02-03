	.file	"avl.c"
	.text
	.p2align 4
	.globl	avlMinDelete
	.type	avlMinDelete, @function
avlMinDelete:
.LFB23:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	24(%rdi), %r12
	testq	%r12, %r12
	je	.L51
	movq	24(%r12), %r13
	testq	%r13, %r13
	je	.L52
	movq	24(%r13), %r14
	testq	%r14, %r14
	je	.L53
	movq	24(%r14), %r15
	testq	%r15, %r15
	je	.L54
	movq	24(%r15), %r9
	testq	%r9, %r9
	je	.L55
	movq	24(%r9), %r10
	testq	%r10, %r10
	je	.L56
	movq	24(%r10), %r11
	testq	%r11, %r11
	je	.L57
	movq	24(%r11), %r8
	testq	%r8, %r8
	je	.L58
	movq	24(%r8), %rdi
	testq	%rdi, %rdi
	je	.L59
	movq	%r8, 24(%rsp)
	movq	%r11, 16(%rsp)
	movq	%r10, 8(%rsp)
	movq	%r9, (%rsp)
	call	avlMinDelete
	movq	24(%rsp), %r8
	movq	(%rsp), %r9
	movq	8(%rsp), %r10
	movq	16(%rsp), %r11
	movq	%rax, 24(%r8)
	movl	(%rbx), %eax
	movl	%eax, %edx
	negl	%edx
	testl	%eax, %eax
	movl	%edx, (%rbx)
	je	.L19
	subl	%eax, 16(%r8)
	movq	%r8, 24(%r11)
	jne	.L20
	movl	$1, (%rbx)
	movl	$-1, %edx
.L21:
	subl	%edx, 16(%r11)
	movq	%r11, 24(%r10)
	jne	.L23
	movl	$1, (%rbx)
	movl	$-1, %eax
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L54:
	movsd	(%r14), %xmm0
	movq	%r14, %rdi
	movq	32(%r14), %r15
	movsd	%xmm0, (%rdx)
	movl	$-1, (%rsi)
	call	free@PLT
	movl	(%rbx), %eax
	movl	%eax, %edx
	negl	%edx
.L9:
	movq	%r15, 24(%r13)
	movl	%edx, (%rbx)
	testl	%eax, %eax
	je	.L42
.L32:
	subl	%eax, 16(%r13)
	movq	%r13, 24(%r12)
	jne	.L33
	movl	$1, (%rbx)
	movl	$-1, %edx
.L34:
	subl	%edx, 16(%r12)
	movq	%r12, 24(%rbp)
	jne	.L37
	movl	$1, (%rbx)
	movl	$-1, %eax
.L36:
	subl	%eax, 16(%rbp)
	jne	.L37
	movl	$-1, (%rbx)
	movq	%rbp, %rax
.L1:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_restore_state
	movl	$0, (%rbx)
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L51:
	.cfi_restore_state
	movsd	(%rdi), %xmm0
	movq	32(%rdi), %rax
	movsd	%xmm0, (%rdx)
	movl	$-1, (%rsi)
	movq	%rax, (%rsp)
	call	free@PLT
	movq	(%rsp), %rax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L52:
	.cfi_restore_state
	movsd	(%r12), %xmm0
	movq	%r12, %rdi
	movq	32(%r12), %r13
	movsd	%xmm0, (%rdx)
	movl	$-1, (%rsi)
	call	free@PLT
	movl	(%rbx), %eax
	movl	%eax, %edx
	negl	%edx
.L5:
	movq	%r13, 24(%rbp)
	movl	%edx, (%rbx)
	testl	%eax, %eax
	jne	.L36
	movq	%rbp, %rax
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L33:
	movq	%r12, 24(%rbp)
	movq	%rbp, %rax
	movl	$0, (%rbx)
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L53:
	.cfi_restore_state
	movsd	0(%r13), %xmm0
	movq	%r13, %rdi
	movq	32(%r13), %r14
	movsd	%xmm0, (%rdx)
	movl	$-1, (%rsi)
	call	free@PLT
	movl	(%rbx), %edx
	movl	%edx, %eax
	negl	%eax
.L7:
	movq	%r14, 24(%r12)
	movl	%eax, (%rbx)
	testl	%edx, %edx
	jne	.L34
	movq	%r12, %r13
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L59:
	movsd	(%r8), %xmm0
	movq	32(%r8), %rax
	movq	%r8, %rdi
	movq	%r11, 24(%rsp)
	movq	%r10, 16(%rsp)
	movsd	%xmm0, (%rdx)
	movl	$-1, (%rsi)
	movq	%r9, 8(%rsp)
	movq	%rax, (%rsp)
	call	free@PLT
	movl	(%rbx), %edx
	movq	(%rsp), %r8
	movq	8(%rsp), %r9
	movq	16(%rsp), %r10
	movl	%edx, %eax
	movq	24(%rsp), %r11
	negl	%eax
.L19:
	movq	%r8, 24(%r11)
	movl	%eax, (%rbx)
	testl	%edx, %edx
	jne	.L21
	movq	%r11, 24(%r10)
	movl	$0, (%rbx)
	testl	%eax, %eax
	je	.L60
.L24:
	subl	%eax, 16(%r10)
	movq	%r10, 24(%r9)
	jne	.L25
	movl	$1, (%rbx)
	movl	$-1, %edx
.L26:
	subl	%edx, 16(%r9)
	movq	%r9, 24(%r15)
	jne	.L27
	movl	$1, (%rbx)
	movl	$-1, %eax
.L28:
	subl	%eax, 16(%r15)
	movq	%r15, 24(%r14)
	jne	.L29
	movl	$1, (%rbx)
	movl	$-1, %edx
.L30:
	subl	%edx, 16(%r14)
	movq	%r14, 24(%r13)
	jne	.L31
	movl	$1, (%rbx)
	movl	$-1, %eax
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L31:
	movq	%r13, 24(%r12)
	movq	%rbp, %rax
	movq	%r12, 24(%rbp)
	movl	$0, (%rbx)
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L29:
	.cfi_restore_state
	movq	%r14, 24(%r13)
	movq	%rbp, %rax
	movq	%r13, 24(%r12)
	movq	%r12, 24(%rbp)
	movl	$0, (%rbx)
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L55:
	movsd	(%r15), %xmm0
	movq	32(%r15), %rcx
	movq	%r15, %rdi
	movsd	%xmm0, (%rdx)
	movl	$-1, (%rsi)
	movq	%rcx, (%rsp)
	call	free@PLT
	movl	(%rbx), %edx
	movq	(%rsp), %rcx
	movl	%edx, %eax
	negl	%eax
.L11:
	movq	%rcx, 24(%r14)
	movl	%eax, (%rbx)
	testl	%edx, %edx
	jne	.L30
	movq	%r14, %r15
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L27:
	movq	%r15, 24(%r14)
	xorl	%edx, %edx
	xorl	%eax, %eax
	movq	%r14, 24(%r13)
	movq	%r13, 24(%r12)
	movq	%r12, %r13
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L56:
	movsd	(%r9), %xmm0
	movq	32(%r9), %rcx
	movq	%r9, %rdi
	movsd	%xmm0, (%rdx)
	movl	$-1, (%rsi)
	movq	%rcx, (%rsp)
	call	free@PLT
	movl	(%rbx), %eax
	movq	(%rsp), %rcx
	movl	%eax, %edx
	negl	%edx
.L13:
	movq	%rcx, 24(%r15)
	movl	%edx, (%rbx)
	testl	%eax, %eax
	jne	.L28
	movq	%r15, %rcx
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L25:
	movq	%r9, 24(%r15)
	xorl	%eax, %eax
	xorl	%edx, %edx
	movq	%r15, 24(%r14)
	movq	%r14, 24(%r13)
	movq	%r13, %r14
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L57:
	movsd	(%r10), %xmm0
	movq	32(%r10), %rcx
	movq	%r10, %rdi
	movq	%r9, 8(%rsp)
	movsd	%xmm0, (%rdx)
	movl	$-1, (%rsi)
	movq	%rcx, (%rsp)
	call	free@PLT
	movl	(%rbx), %edx
	movq	(%rsp), %rcx
	movq	8(%rsp), %r9
	movl	%edx, %eax
	negl	%eax
.L15:
	movq	%rcx, 24(%r9)
	movl	%eax, (%rbx)
	testl	%edx, %edx
	jne	.L26
	movq	%r9, %rcx
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L23:
	movq	%r10, 24(%r9)
	xorl	%edx, %edx
	xorl	%eax, %eax
	movq	%r9, 24(%r15)
	movq	%r15, 24(%r14)
	movq	%r14, %r15
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L20:
	movq	%r11, 24(%r10)
	movq	%r15, %rcx
	xorl	%eax, %eax
	xorl	%edx, %edx
	movq	%r10, 24(%r9)
	movq	%r9, 24(%r15)
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L58:
	movsd	(%r11), %xmm0
	movq	32(%r11), %rcx
	movq	%r11, %rdi
	movq	%r10, 16(%rsp)
	movq	%r9, 8(%rsp)
	movsd	%xmm0, (%rdx)
	movl	$-1, (%rsi)
	movq	%rcx, (%rsp)
	call	free@PLT
	movl	(%rbx), %eax
	movq	(%rsp), %rcx
	movq	16(%rsp), %r10
	movq	8(%rsp), %r9
	movl	%eax, %edx
	negl	%edx
	testl	%eax, %eax
	movq	%rcx, 24(%r10)
	movq	%r10, %rcx
	movl	%edx, (%rbx)
	je	.L15
	jmp	.L24
.L60:
	movq	%r10, 24(%r9)
	xorl	%edx, %edx
	movq	%r9, %rcx
	jmp	.L13
.L42:
	movq	%r13, %r14
	jmp	.L7
	.cfi_endproc
.LFE23:
	.size	avlMinDelete, .-avlMinDelete
	.p2align 4
	.globl	min
	.type	min, @function
min:
.LFB25:
	.cfi_startproc
	cmpl	%edi, %esi
	movl	%edi, %eax
	cmovle	%esi, %eax
	ret
	.cfi_endproc
.LFE25:
	.size	min, .-min
	.p2align 4
	.globl	minThree
	.type	minThree, @function
minThree:
.LFB26:
	.cfi_startproc
	cmpl	%edx, %esi
	movl	%edi, %eax
	cmovg	%edx, %esi
	cmpl	%edi, %esi
	cmovle	%esi, %eax
	ret
	.cfi_endproc
.LFE26:
	.size	minThree, .-minThree
	.p2align 4
	.globl	max
	.type	max, @function
max:
.LFB27:
	.cfi_startproc
	cmpl	%esi, %edi
	movl	%esi, %eax
	cmovge	%edi, %eax
	ret
	.cfi_endproc
.LFE27:
	.size	max, .-max
	.p2align 4
	.globl	maxThree
	.type	maxThree, @function
maxThree:
.LFB28:
	.cfi_startproc
	cmpl	%edx, %esi
	movl	%edi, %eax
	cmovl	%edx, %esi
	cmpl	%edi, %esi
	cmovge	%esi, %eax
	ret
	.cfi_endproc
.LFE28:
	.size	maxThree, .-maxThree
	.p2align 4
	.globl	leftRotation
	.type	leftRotation, @function
leftRotation:
.LFB29:
	.cfi_startproc
	movq	32(%rdi), %r8
	movl	16(%rdi), %ecx
	movl	$0, %esi
	movl	16(%r8), %edx
	movq	24(%r8), %rax
	testl	%edx, %edx
	movq	%rax, 32(%rdi)
	movl	%ecx, %eax
	cmovns	%edx, %esi
	movq	%rdi, 24(%r8)
	subl	%esi, %eax
	leal	-2(%rcx), %esi
	subl	$1, %eax
	movl	%eax, 16(%rdi)
	leal	-1(%rdx), %eax
	leal	-2(%rcx,%rdx), %edx
	cmpl	%esi, %eax
	cmovg	%esi, %eax
	cmpl	%edx, %eax
	cmovg	%edx, %eax
	movl	%eax, 16(%r8)
	movq	%r8, %rax
	ret
	.cfi_endproc
.LFE29:
	.size	leftRotation, .-leftRotation
	.p2align 4
	.globl	rightRotation
	.type	rightRotation, @function
rightRotation:
.LFB30:
	.cfi_startproc
	movq	24(%rdi), %r8
	movl	16(%rdi), %ecx
	movl	$0, %esi
	movl	16(%r8), %edx
	movq	32(%r8), %rax
	testl	%edx, %edx
	movq	%rax, 24(%rdi)
	movl	%ecx, %eax
	cmovle	%edx, %esi
	movq	%rdi, 32(%r8)
	subl	%esi, %eax
	leal	2(%rcx), %esi
	addl	$1, %eax
	movl	%eax, 16(%rdi)
	leal	1(%rdx), %eax
	leal	2(%rcx,%rdx), %edx
	cmpl	%esi, %eax
	cmovl	%esi, %eax
	cmpl	%edx, %eax
	cmovl	%edx, %eax
	movl	%eax, 16(%r8)
	movq	%r8, %rax
	ret
	.cfi_endproc
.LFE30:
	.size	rightRotation, .-rightRotation
	.p2align 4
	.globl	doubleLeftRotation
	.type	doubleLeftRotation, @function
doubleLeftRotation:
.LFB31:
	.cfi_startproc
	movq	32(%rdi), %rax
	movq	24(%rax), %r8
	movl	16(%rax), %esi
	movq	32(%r8), %rdx
	movl	16(%r8), %ecx
	movl	%esi, %r9d
	movq	%rdx, 24(%rax)
	xorl	%edx, %edx
	testl	%ecx, %ecx
	movl	%edx, %r10d
	movq	%rax, 32(%r8)
	cmovle	%ecx, %r10d
	subl	%r10d, %r9d
	addl	$1, %r9d
	movl	%r9d, 16(%rax)
	leal	2(%rsi), %r9d
	leal	1(%rcx), %eax
	cmpl	%r9d, %eax
	leal	2(%rsi,%rcx), %ecx
	cmovl	%r9d, %eax
	cmpl	%ecx, %eax
	cmovl	%ecx, %eax
	movq	24(%r8), %rcx
	movl	%eax, 16(%r8)
	testl	%eax, %eax
	movq	%rcx, 32(%rdi)
	movl	16(%rdi), %ecx
	cmovns	%eax, %edx
	movq	%rdi, 24(%r8)
	movl	%ecx, %esi
	subl	%edx, %esi
	leal	-1(%rsi), %edx
	leal	-2(%rcx), %esi
	movl	%edx, 16(%rdi)
	leal	-1(%rax), %edx
	leal	-2(%rcx,%rax), %eax
	cmpl	%esi, %edx
	cmovg	%esi, %edx
	cmpl	%eax, %edx
	cmovg	%eax, %edx
	movq	%r8, %rax
	movl	%edx, 16(%r8)
	ret
	.cfi_endproc
.LFE31:
	.size	doubleLeftRotation, .-doubleLeftRotation
	.p2align 4
	.globl	doubleRightRotation
	.type	doubleRightRotation, @function
doubleRightRotation:
.LFB32:
	.cfi_startproc
	movq	24(%rdi), %rax
	movq	32(%rax), %r8
	movl	16(%rax), %esi
	movq	24(%r8), %rdx
	movl	16(%r8), %ecx
	movl	%esi, %r9d
	movq	%rdx, 32(%rax)
	xorl	%edx, %edx
	testl	%ecx, %ecx
	movl	%edx, %r10d
	movq	%rax, 24(%r8)
	cmovns	%ecx, %r10d
	subl	%r10d, %r9d
	subl	$1, %r9d
	movl	%r9d, 16(%rax)
	leal	-2(%rsi), %r9d
	leal	-1(%rcx), %eax
	cmpl	%r9d, %eax
	leal	-2(%rsi,%rcx), %ecx
	cmovg	%r9d, %eax
	cmpl	%ecx, %eax
	cmovg	%ecx, %eax
	movq	32(%r8), %rcx
	movl	%eax, 16(%r8)
	testl	%eax, %eax
	movq	%rcx, 24(%rdi)
	movl	16(%rdi), %ecx
	cmovle	%eax, %edx
	movq	%rdi, 32(%r8)
	movl	%ecx, %esi
	subl	%edx, %esi
	leal	1(%rsi), %edx
	leal	2(%rcx), %esi
	movl	%edx, 16(%rdi)
	leal	1(%rax), %edx
	leal	2(%rcx,%rax), %eax
	cmpl	%esi, %edx
	cmovl	%esi, %edx
	cmpl	%eax, %edx
	cmovl	%eax, %edx
	movq	%r8, %rax
	movl	%edx, 16(%r8)
	ret
	.cfi_endproc
.LFE32:
	.size	doubleRightRotation, .-doubleRightRotation
	.p2align 4
	.globl	balanceAVL
	.type	balanceAVL, @function
balanceAVL:
.LFB33:
	.cfi_startproc
	movl	16(%rdi), %eax
	cmpl	$1, %eax
	jle	.L70
	movq	32(%rdi), %r8
	movl	16(%r8), %ecx
	movq	24(%r8), %rdx
	testl	%ecx, %ecx
	js	.L71
	movq	%rdx, 32(%rdi)
	movl	%eax, %edx
	leal	-2(%rax), %esi
	leal	-2(%rax,%rcx), %eax
	subl	%ecx, %edx
	movq	%rdi, 24(%r8)
	subl	$1, %edx
	movl	%edx, 16(%rdi)
	leal	-1(%rcx), %edx
	cmpl	%esi, %edx
	cmovg	%esi, %edx
	cmpl	%eax, %edx
	cmovg	%eax, %edx
	movl	%edx, 16(%r8)
.L69:
	movq	%r8, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L70:
	movq	%rdi, %r8
	cmpl	$-1, %eax
	jge	.L69
	movq	24(%rdi), %r8
	movl	16(%r8), %edx
	movq	32(%r8), %rcx
	testl	%edx, %edx
	jg	.L73
	movq	%rcx, 24(%rdi)
	movl	%eax, %ecx
	leal	2(%rax), %esi
	leal	2(%rax,%rdx), %eax
	subl	%edx, %ecx
	movq	%rdi, 32(%r8)
	addl	$1, %ecx
	movl	%ecx, 16(%rdi)
	leal	1(%rdx), %ecx
	cmpl	%esi, %ecx
	cmovl	%esi, %ecx
	cmpl	%eax, %ecx
	cmovl	%eax, %ecx
	movl	%ecx, 16(%r8)
	jmp	.L69
	.p2align 4,,10
	.p2align 3
.L71:
	movl	16(%rdx), %r9d
	xorl	%esi, %esi
	movq	32(%rdx), %rax
	movl	%esi, %r10d
	testl	%r9d, %r9d
	movq	%rax, 24(%r8)
	movl	%ecx, %eax
	cmovle	%r9d, %r10d
	movq	%r8, 32(%rdx)
	subl	%r10d, %eax
	addl	$1, %eax
	movl	%eax, 16(%r8)
	leal	2(%rcx), %r8d
	leal	1(%r9), %eax
	cmpl	%r8d, %eax
	leal	2(%rcx,%r9), %ecx
	cmovl	%r8d, %eax
	cmpl	%ecx, %eax
	cmovl	%ecx, %eax
	movq	24(%rdx), %rcx
	movl	%eax, 16(%rdx)
	testl	%eax, %eax
	movl	16(%rdi), %r8d
	cmovns	%eax, %esi
	movq	%rcx, 32(%rdi)
	movl	%r8d, %ecx
	movq	%rdi, 24(%rdx)
	subl	%esi, %ecx
	leal	-2(%r8), %esi
	subl	$1, %ecx
	movl	%ecx, 16(%rdi)
	leal	-1(%rax), %ecx
	leal	-2(%rax,%r8), %eax
	movq	%rdx, %r8
	cmpl	%esi, %ecx
	cmovg	%esi, %ecx
	cmpl	%eax, %ecx
	cmovg	%eax, %ecx
	movq	%r8, %rax
	movl	%ecx, 16(%rdx)
	ret
	.p2align 4,,10
	.p2align 3
.L73:
	movl	16(%rcx), %r9d
	xorl	%esi, %esi
	movq	24(%rcx), %rax
	movl	%esi, %r10d
	testl	%r9d, %r9d
	movq	%rax, 32(%r8)
	movl	%edx, %eax
	cmovns	%r9d, %r10d
	movq	%r8, 24(%rcx)
	subl	%r10d, %eax
	subl	$1, %eax
	movl	%eax, 16(%r8)
	leal	-2(%rdx), %r8d
	leal	-1(%r9), %eax
	cmpl	%r8d, %eax
	leal	-2(%rdx,%r9), %edx
	cmovg	%r8d, %eax
	cmpl	%edx, %eax
	cmovg	%edx, %eax
	movq	32(%rcx), %rdx
	movl	%eax, 16(%rcx)
	testl	%eax, %eax
	movl	16(%rdi), %r8d
	cmovle	%eax, %esi
	movq	%rdx, 24(%rdi)
	movl	%r8d, %edx
	movq	%rdi, 32(%rcx)
	subl	%esi, %edx
	leal	2(%r8), %esi
	addl	$1, %edx
	movl	%edx, 16(%rdi)
	leal	1(%rax), %edx
	leal	2(%rax,%r8), %eax
	movq	%rcx, %r8
	cmpl	%esi, %edx
	cmovl	%esi, %edx
	cmpl	%eax, %edx
	cmovl	%eax, %edx
	movl	%edx, 16(%rcx)
	jmp	.L69
	.cfi_endproc
.LFE33:
	.size	balanceAVL, .-balanceAVL
	.p2align 4
	.globl	avlInsertion
	.type	avlInsertion, @function
avlInsertion:
.LFB22:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdx, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movslq	keycolumn(%rip), %rax
	salq	$4, %rax
	movsd	(%rsi,%rax), %xmm0
	testq	%rdi, %rdi
	je	.L93
	movsd	(%rdi), %xmm1
	movq	%rdi, %r12
	comisd	%xmm0, %xmm1
	ja	.L94
	comisd	%xmm1, %xmm0
	jbe	.L91
	movq	32(%rdi), %rdi
	call	avlInsertion
	movq	%rax, 32(%r12)
	movl	(%rbx), %eax
	testl	%eax, %eax
	jne	.L95
.L82:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L91:
	.cfi_restore_state
	movl	$0, (%rdx)
	movq	8(%rdi), %rdi
	call	updateStats@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L94:
	.cfi_restore_state
	movq	24(%rdi), %rdi
	call	avlInsertion
	movq	%rax, 24(%r12)
	movl	(%rbx), %eax
	negl	%eax
	movl	%eax, (%rbx)
	testl	%eax, %eax
	je	.L82
.L95:
	addl	%eax, 16(%r12)
	movq	%r12, %rdi
	call	balanceAVL
	cmpq	%r12, pRoot(%rip)
	je	.L96
.L83:
	movl	16(%rax), %edx
	testl	%edx, %edx
	jne	.L84
	movl	$0, (%rbx)
	movq	%rax, %r12
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L84:
	.cfi_restore_state
	movl	$1, (%rbx)
	movq	%rax, %r12
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L96:
	.cfi_restore_state
	movq	%rax, pRoot(%rip)
	jmp	.L83
	.p2align 4,,10
	.p2align 3
.L93:
	movl	$1, (%rdx)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%rsi, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	createTree@PLT
	.cfi_endproc
.LFE22:
	.size	avlInsertion, .-avlInsertion
	.p2align 4
	.globl	avlDelete
	.type	avlDelete, @function
avlDelete:
.LFB24:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rsi, %rbx
	testq	%rdi, %rdi
	je	.L130
	movsd	(%rdi), %xmm1
	movq	%rdi, %rbp
	comisd	%xmm1, %xmm0
	ja	.L131
	comisd	%xmm0, %xmm1
	jbe	.L128
	movq	32(%rdi), %rdi
	movq	%rbp, %r12
	call	avlDelete
	movq	%rax, 32(%rbp)
	movl	(%rbx), %eax
	negl	%eax
	movl	%eax, (%rbx)
.L102:
	testl	%eax, %eax
	je	.L97
.L113:
	addl	%eax, 16(%r12)
	setne	%al
	movzbl	%al, %eax
	movl	%eax, (%rbx)
.L97:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L128:
	.cfi_restore_state
	call	existsRightChild@PLT
	testl	%eax, %eax
	je	.L105
	movq	32(%rbp), %r13
	movq	24(%r13), %r12
	testq	%r12, %r12
	je	.L132
	movq	24(%r12), %rdi
	testq	%rdi, %rdi
	je	.L133
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	call	avlMinDelete
	movq	%rax, 24(%r12)
	movl	(%rbx), %eax
	movl	%eax, %edx
	negl	%edx
	movl	%edx, (%rbx)
	testl	%eax, %eax
	je	.L109
	subl	%eax, 16(%r12)
	movq	%r12, 24(%r13)
	jne	.L112
	movl	$1, (%rbx)
	movl	$-1, %edx
.L111:
	subl	%edx, 16(%r13)
	jne	.L112
	movl	$-1, (%rbx)
	movq	%rbp, %r12
	movl	$-1, %eax
	movq	%r13, 32(%rbp)
	jmp	.L113
	.p2align 4,,10
	.p2align 3
.L131:
	movq	32(%rdi), %rdi
	movq	%rbp, %r12
	call	avlDelete
	movq	%rax, 32(%rbp)
	movl	(%rbx), %eax
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L105:
	movq	24(%rbp), %r12
	movq	%rbp, %rdi
	call	free@PLT
	testq	%r12, %r12
	jne	.L134
	movl	$0, (%rbx)
	xorl	%edi, %edi
	call	balanceAVL
	movq	%rax, %r12
	movl	(%rbx), %eax
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L112:
	movl	$0, (%rbx)
	movq	%rbp, %r12
	movq	%r13, 32(%rbp)
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L130:
	movl	$1, (%rsi)
	xorl	%r12d, %r12d
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L133:
	movsd	(%r12), %xmm0
	movq	%r12, %rdi
	movq	32(%r12), %r14
	movsd	%xmm0, 0(%rbp)
	movq	%r14, %r12
	movl	$-1, (%rbx)
	call	free@PLT
	movl	(%rbx), %edx
	movl	%edx, %eax
	negl	%eax
.L109:
	movq	%r12, 24(%r13)
	movl	%eax, (%rbx)
	testl	%edx, %edx
	jne	.L111
.L107:
	movq	%r13, 32(%rbp)
	movq	%rbp, %r12
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L132:
	movsd	0(%r13), %xmm0
	movq	32(%r13), %r12
	movq	%r13, %rdi
	movsd	%xmm0, 0(%rbp)
	movq	%r12, %r13
	movl	$-1, (%rbx)
	call	free@PLT
	movl	(%rbx), %eax
	jmp	.L107
.L134:
	movl	$-1, (%rbx)
	orl	$-1, %eax
	jmp	.L113
	.cfi_endproc
.LFE24:
	.size	avlDelete, .-avlDelete
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
