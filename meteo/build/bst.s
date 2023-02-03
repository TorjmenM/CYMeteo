	.file	"bst.c"
	.text
	.p2align 4
	.globl	search
	.type	search, @function
search:
.LFB22:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L12
	movsd	(%rdi), %xmm1
	ucomisd	%xmm0, %xmm1
	jnp	.L36
.L18:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	comisd	%xmm0, %xmm1
	ja	.L37
	movq	32(%rdi), %rax
	testq	%rax, %rax
	je	.L17
.L34:
	movsd	(%rax), %xmm1
	ucomisd	%xmm1, %xmm0
	jnp	.L38
.L22:
	comisd	%xmm0, %xmm1
	jbe	.L26
	movq	24(%rax), %rdi
	call	search
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_restore_state
	movq	24(%rdi), %rax
	testq	%rax, %rax
	jne	.L34
.L17:
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L36:
	jne	.L18
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	.cfi_def_cfa_offset 16
	movq	32(%rax), %rdi
	call	search
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L38:
	.cfi_def_cfa_offset 16
	je	.L17
	jmp	.L22
	.cfi_endproc
.LFE22:
	.size	search, .-search
	.p2align 4
	.globl	bstInsertion
	.type	bstInsertion, @function
bstInsertion:
.LFB23:
	.cfi_startproc
	movslq	keycolumn(%rip), %rax
	salq	$4, %rax
	movsd	(%rsi,%rax), %xmm0
	testq	%rdi, %rdi
	je	.L78
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movsd	(%rdi), %xmm1
	comisd	%xmm0, %xmm1
	ja	.L79
	comisd	%xmm1, %xmm0
	ja	.L80
	ucomisd	%xmm0, %xmm1
	jnp	.L81
.L50:
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
.L79:
	.cfi_restore_state
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L82
	movsd	(%rbx), %xmm1
	comisd	%xmm0, %xmm1
	ja	.L83
	comisd	%xmm1, %xmm0
	ja	.L84
	ucomisd	%xmm1, %xmm0
	jnp	.L85
.L44:
	movq	%rbx, 24(%r12)
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
.L80:
	.cfi_restore_state
	movq	32(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L86
	movsd	(%rbx), %xmm1
	comisd	%xmm0, %xmm1
	ja	.L87
	comisd	%xmm1, %xmm0
	ja	.L88
	ucomisd	%xmm1, %xmm0
	jnp	.L89
.L54:
	movq	%rbx, 32(%r12)
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
.L83:
	.cfi_restore_state
	movq	24(%rbx), %rdi
	call	bstInsertion
	movq	%rax, 24(%rbx)
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L81:
	jne	.L50
	movq	8(%rdi), %rdi
	call	updateStats@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L78:
	.cfi_restore 3
	.cfi_restore 12
	movq	%rsi, %rdi
	jmp	createTree@PLT
	.p2align 4,,10
	.p2align 3
.L87:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -24
	.cfi_offset 12, -16
	movq	24(%rbx), %rdi
	call	bstInsertion
	movq	%rax, 24(%rbx)
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L84:
	movq	32(%rbx), %rdi
	call	bstInsertion
	movq	%rax, 32(%rbx)
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L85:
	jne	.L44
	movq	8(%rbx), %rdi
	call	updateStats@PLT
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L88:
	movq	32(%rbx), %rdi
	call	bstInsertion
	movq	%rax, 32(%rbx)
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L82:
	movq	%rsi, %rdi
	call	createTree@PLT
	movq	%rax, %rbx
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L89:
	jne	.L54
	movq	8(%rbx), %rdi
	call	updateStats@PLT
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L86:
	movq	%rsi, %rdi
	call	createTree@PLT
	movq	%rax, %rbx
	jmp	.L54
	.cfi_endproc
.LFE23:
	.size	bstInsertion, .-bstInsertion
	.p2align 4
	.globl	deleteMax
	.type	deleteMax, @function
deleteMax:
.LFB24:
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
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	call	existsRightChild@PLT
	testl	%eax, %eax
	je	.L91
	movq	32(%rbp), %r12
	movq	%r12, %rdi
	call	existsRightChild@PLT
	testl	%eax, %eax
	jne	.L100
	movsd	(%r12), %xmm0
	movq	%r12, %rdi
	movsd	%xmm0, 0(%r13)
	movq	24(%r12), %r13
	call	free@PLT
	movq	%r13, %r12
.L97:
	movq	%r12, 32(%rbp)
	movq	%rbp, %r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
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
.L91:
	.cfi_restore_state
	movsd	0(%rbp), %xmm0
	movq	24(%rbp), %r12
	movq	%rbp, %rdi
	movsd	%xmm0, 0(%r13)
	call	free@PLT
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
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
.L100:
	.cfi_restore_state
	movq	32(%r12), %r14
	movq	%r14, %rdi
	call	existsRightChild@PLT
	testl	%eax, %eax
	je	.L93
	movq	32(%r14), %r15
	movq	%r15, %rdi
	call	existsRightChild@PLT
	testl	%eax, %eax
	je	.L94
	movq	32(%r15), %rdi
	movq	%r13, %rsi
	call	deleteMax
	movq	%rax, 32(%r15)
.L95:
	movq	%r15, 32(%r14)
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L93:
	movsd	(%r14), %xmm0
	movq	%r14, %rdi
	movsd	%xmm0, 0(%r13)
	movq	24(%r14), %r13
	call	free@PLT
	movq	%r13, %r14
.L96:
	movq	%r14, 32(%r12)
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L94:
	movsd	(%r15), %xmm0
	movq	%r15, %rdi
	movsd	%xmm0, 0(%r13)
	movq	24(%r15), %r13
	call	free@PLT
	movq	%r13, %r15
	jmp	.L95
	.cfi_endproc
.LFE24:
	.size	deleteMax, .-deleteMax
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
