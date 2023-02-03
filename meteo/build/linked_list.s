	.file	"linked_list.c"
	.text
	.p2align 4
	.globl	createNode
	.type	createNode, @function
createNode:
.LFB22:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	movl	$24, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L5
.L2:
	movslq	keycolumn(%rip), %rax
	movq	%rbp, %rdi
	movq	%rbp, 8(%r12)
	movq	$0, 16(%r12)
	salq	$4, %rax
	movsd	0(%rbp,%rax), %xmm0
	movsd	%xmm0, (%r12)
	call	initStats@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%r12, %rax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	xorl	%eax, %eax
	call	errorMessage@PLT
	jmp	.L2
	.cfi_endproc
.LFE22:
	.size	createNode, .-createNode
	.p2align 4
	.globl	insertFirst
	.type	insertFirst, @function
insertFirst:
.LFB23:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L9
.L7:
	movslq	keycolumn(%rip), %rax
	movq	%rbp, %rdi
	movq	%rbp, 8(%r12)
	movq	$0, 16(%r12)
	salq	$4, %rax
	movsd	0(%rbp,%rax), %xmm0
	movsd	%xmm0, (%r12)
	call	initStats@PLT
	movq	%rbx, 16(%r12)
	movq	%r12, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L9:
	.cfi_restore_state
	xorl	%eax, %eax
	call	errorMessage@PLT
	jmp	.L7
	.cfi_endproc
.LFE23:
	.size	insertFirst, .-insertFirst
	.p2align 4
	.globl	insertAfter
	.type	insertAfter, @function
insertAfter:
.LFB24:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	movl	$24, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	call	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L13
.L11:
	movslq	keycolumn(%rip), %rax
	movq	%rbp, %rdi
	movq	%rbp, 8(%rbx)
	movq	$0, 16(%rbx)
	salq	$4, %rax
	movsd	0(%rbp,%rax), %xmm0
	movsd	%xmm0, (%rbx)
	call	initStats@PLT
	movq	16(%r12), %rax
	movq	%rbx, 16(%r12)
	movq	%rax, 16(%rbx)
	movq	%r12, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L13:
	.cfi_restore_state
	xorl	%eax, %eax
	call	errorMessage@PLT
	jmp	.L11
	.cfi_endproc
.LFE24:
	.size	insertAfter, .-insertAfter
	.p2align 4
	.globl	compare
	.type	compare, @function
compare:
.LFB25:
	.cfi_startproc
	movapd	%xmm0, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sdl	sorting(%rip), %xmm0
	subsd	%xmm1, %xmm2
	mulsd	%xmm2, %xmm0
	cvttsd2sil	%xmm0, %eax
	ret
	.cfi_endproc
.LFE25:
	.size	compare, .-compare
	.p2align 4
	.globl	addNode
	.type	addNode, @function
addNode:
.LFB26:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movslq	keycolumn(%rip), %rax
	salq	$4, %rax
	movsd	(%rsi,%rax), %xmm1
	testq	%rdi, %rdi
	je	.L30
	pxor	%xmm2, %xmm2
	movq	%rdi, %rbp
	movq	%rdi, %rax
	cvtsi2sdl	sorting(%rip), %xmm2
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L31:
	movapd	%xmm1, %xmm0
	subsd	(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	cvttsd2sil	%xmm0, %edx
	testl	%edx, %edx
	js	.L19
.L20:
	movq	%rax, %rbx
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L31
.L19:
	subsd	(%rbx), %xmm1
	mulsd	%xmm2, %xmm1
	cvttsd2sil	%xmm1, %eax
	testl	%eax, %eax
	jg	.L32
	jne	.L33
	movq	8(%rbx), %rdi
	movq	%r13, %rsi
	movq	%rbp, %r12
	call	updateStats@PLT
.L15:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L33:
	.cfi_restore_state
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L34
.L24:
	movslq	keycolumn(%rip), %rax
	movq	%r13, 8(%r12)
	movq	%r13, %rdi
	movq	$0, 16(%r12)
	salq	$4, %rax
	movsd	0(%r13,%rax), %xmm0
	movsd	%xmm0, (%r12)
	call	initStats@PLT
	movq	%rbx, 16(%r12)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L32:
	.cfi_restore_state
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L35
.L22:
	movslq	keycolumn(%rip), %rax
	movq	%r13, 8(%r12)
	movq	%r13, %rdi
	movq	$0, 16(%r12)
	salq	$4, %rax
	movsd	0(%r13,%rax), %xmm0
	movsd	%xmm0, (%r12)
	call	initStats@PLT
	movq	16(%rbx), %rax
	movq	%rax, 16(%r12)
	movq	%r12, 16(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%rbp, %r12
	popq	%rbx
	.cfi_def_cfa_offset 32
	movq	%r12, %rax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	.cfi_restore_state
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L36
.L17:
	movslq	keycolumn(%rip), %rax
	movq	%r13, 8(%r12)
	movq	%r13, %rdi
	movq	$0, 16(%r12)
	salq	$4, %rax
	movsd	0(%r13,%rax), %xmm0
	movsd	%xmm0, (%r12)
	call	initStats@PLT
	jmp	.L15
.L36:
	xorl	%eax, %eax
	call	errorMessage@PLT
	jmp	.L17
.L34:
	xorl	%eax, %eax
	call	errorMessage@PLT
	jmp	.L24
.L35:
	xorl	%eax, %eax
	call	errorMessage@PLT
	jmp	.L22
	.cfi_endproc
.LFE26:
	.size	addNode, .-addNode
	.p2align 4
	.globl	deleteList
	.type	deleteList, @function
deleteList:
.LFB27:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	movq	16(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L38
	.p2align 4,,10
	.p2align 3
.L39:
	movq	16(%rdi), %rax
	movq	%rax, 16(%rbp)
	call	free@PLT
	movq	16(%rbp), %rdi
	testq	%rdi, %rdi
	jne	.L39
.L38:
	movq	%rbp, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.cfi_endproc
.LFE27:
	.size	deleteList, .-deleteList
	.p2align 4
	.globl	printList
	.type	printList, @function
printList:
.LFB28:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L53
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L47:
	movq	8(%rbx), %rdi
	call	show@PLT
	movq	16(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L47
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L53:
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE28:
	.size	printList, .-printList
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
