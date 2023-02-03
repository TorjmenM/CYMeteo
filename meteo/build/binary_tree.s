	.file	"binary_tree.c"
	.text
	.p2align 4
	.globl	createTree
	.type	createTree, @function
createTree:
.LFB22:
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
	movq	%rdi, %rbp
	movl	$40, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	call	xmalloc@PLT
	movq	%rax, %r12
	movslq	keycolumn(%rip), %rax
	salq	$4, %rax
	movsd	0(%rbp,%rax), %xmm0
	movl	nbstatcolumns(%rip), %eax
	movq	%rbp, 8(%r12)
	movl	$0, 16(%r12)
	movsd	%xmm0, (%r12)
	pxor	%xmm0, %xmm0
	movups	%xmm0, 24(%r12)
	testl	%eax, %eax
	jle	.L1
	xorl	%ebx, %ebx
	leaq	statcolumn(%rip), %r13
.L6:
	movslq	0(%r13,%rbx,4), %rax
	movl	flagstats(%rip), %esi
	movl	$1, %edi
	salq	$4, %rax
	addq	%rbp, %rax
	movsd	(%rax), %xmm1
	movq	8(%rax), %r14
	movsd	%xmm1, 8(%rsp)
	call	isneeded@PLT
	testl	%eax, %eax
	je	.L3
	movslq	col_max(%rip), %rax
	testl	%eax, %eax
	js	.L3
	movsd	8(%rsp), %xmm1
	movsd	%xmm1, (%r14,%rax,8)
.L3:
	movl	flagstats(%rip), %esi
	movl	$2, %edi
	call	isneeded@PLT
	testl	%eax, %eax
	je	.L4
	movslq	col_min(%rip), %rax
	testl	%eax, %eax
	js	.L4
	movsd	8(%rsp), %xmm2
	movsd	%xmm2, (%r14,%rax,8)
.L4:
	movl	flagstats(%rip), %esi
	movl	$4, %edi
	call	isneeded@PLT
	testl	%eax, %eax
	je	.L5
	movslq	col_sum(%rip), %rax
	testl	%eax, %eax
	js	.L5
	movsd	8(%rsp), %xmm3
	movq	.LC0(%rip), %rdx
	movsd	%xmm3, (%r14,%rax,8)
	movslq	col_cnt(%rip), %rax
	movq	%rdx, (%r14,%rax,8)
.L5:
	addq	$1, %rbx
	cmpl	%ebx, nbstatcolumns(%rip)
	jg	.L6
.L1:
	addq	$16, %rsp
	.cfi_def_cfa_offset 48
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE22:
	.size	createTree, .-createTree
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	""
.LC2:
	.string	"Error : the node is empty\n"
	.text
	.p2align 4
	.globl	errorMessage
	.type	errorMessage, @function
errorMessage:
.LFB23:
	.cfi_startproc
	movl	$4, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	.LC1(%rip), %rdx
	leaq	.LC2(%rip), %rsi
	call	error@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE23:
	.size	errorMessage, .-errorMessage
	.p2align 4
	.globl	existsLeftChild
	.type	existsLeftChild, @function
existsLeftChild:
.LFB24:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L26
	xorl	%eax, %eax
	cmpq	$0, 24(%rdi)
	setne	%al
	ret
.L26:
	pushq	%rax
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	call	errorMessage
	.cfi_endproc
.LFE24:
	.size	existsLeftChild, .-existsLeftChild
	.p2align 4
	.globl	existsRightChild
	.type	existsRightChild, @function
existsRightChild:
.LFB25:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L32
	xorl	%eax, %eax
	cmpq	$0, 32(%rdi)
	setne	%al
	ret
.L32:
	pushq	%rax
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	call	errorMessage
	.cfi_endproc
.LFE25:
	.size	existsRightChild, .-existsRightChild
	.p2align 4
	.globl	deleteTree
	.type	deleteTree, @function
deleteTree:
.LFB26:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L33
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	24(%rdi), %r12
	testq	%r12, %r12
	je	.L35
	movq	24(%r12), %r13
	testq	%r13, %r13
	je	.L36
	movq	24(%r13), %r14
	testq	%r14, %r14
	je	.L37
	movq	24(%r14), %r15
	testq	%r15, %r15
	je	.L38
	movq	24(%r15), %rbx
	testq	%rbx, %rbx
	je	.L39
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L39:
	movq	32(%r15), %rbx
	testq	%rbx, %rbx
	je	.L40
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L40:
	movq	%r15, %rdi
	call	xmemfree@PLT
.L38:
	movq	32(%r14), %r15
	testq	%r15, %r15
	je	.L41
	movq	24(%r15), %rbx
	testq	%rbx, %rbx
	je	.L42
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L42:
	movq	32(%r15), %rbx
	testq	%rbx, %rbx
	je	.L43
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L43:
	movq	%r15, %rdi
	call	xmemfree@PLT
.L41:
	movq	%r14, %rdi
	call	xmemfree@PLT
.L37:
	movq	32(%r13), %r14
	testq	%r14, %r14
	je	.L44
	movq	24(%r14), %r15
	testq	%r15, %r15
	je	.L45
	movq	24(%r15), %rbx
	testq	%rbx, %rbx
	je	.L46
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L46:
	movq	32(%r15), %rbx
	testq	%rbx, %rbx
	je	.L47
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L47:
	movq	%r15, %rdi
	call	xmemfree@PLT
.L45:
	movq	32(%r14), %r15
	testq	%r15, %r15
	je	.L48
	movq	24(%r15), %rbx
	testq	%rbx, %rbx
	je	.L49
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L49:
	movq	32(%r15), %rbx
	testq	%rbx, %rbx
	je	.L50
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L50:
	movq	%r15, %rdi
	call	xmemfree@PLT
.L48:
	movq	%r14, %rdi
	call	xmemfree@PLT
.L44:
	movq	%r13, %rdi
	call	xmemfree@PLT
.L36:
	movq	32(%r12), %r13
	testq	%r13, %r13
	je	.L51
	movq	24(%r13), %r14
	testq	%r14, %r14
	je	.L52
	movq	24(%r14), %r15
	testq	%r15, %r15
	je	.L53
	movq	24(%r15), %rbx
	testq	%rbx, %rbx
	je	.L54
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L54:
	movq	32(%r15), %rbx
	testq	%rbx, %rbx
	je	.L55
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L55:
	movq	%r15, %rdi
	call	xmemfree@PLT
.L53:
	movq	32(%r14), %r15
	testq	%r15, %r15
	je	.L56
	movq	24(%r15), %rbx
	testq	%rbx, %rbx
	je	.L57
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L57:
	movq	32(%r15), %rbx
	testq	%rbx, %rbx
	je	.L58
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L58:
	movq	%r15, %rdi
	call	xmemfree@PLT
.L56:
	movq	%r14, %rdi
	call	xmemfree@PLT
.L52:
	movq	32(%r13), %r14
	testq	%r14, %r14
	je	.L59
	movq	24(%r14), %r15
	testq	%r15, %r15
	je	.L60
	movq	24(%r15), %rbx
	testq	%rbx, %rbx
	je	.L61
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L61:
	movq	32(%r15), %rbx
	testq	%rbx, %rbx
	je	.L62
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L62:
	movq	%r15, %rdi
	call	xmemfree@PLT
.L60:
	movq	32(%r14), %r15
	testq	%r15, %r15
	je	.L63
	movq	24(%r15), %rbx
	testq	%rbx, %rbx
	je	.L64
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L64:
	movq	32(%r15), %rbx
	testq	%rbx, %rbx
	je	.L65
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L65:
	movq	%r15, %rdi
	call	xmemfree@PLT
.L63:
	movq	%r14, %rdi
	call	xmemfree@PLT
.L59:
	movq	%r13, %rdi
	call	xmemfree@PLT
.L51:
	movq	%r12, %rdi
	call	xmemfree@PLT
.L35:
	movq	32(%rbp), %r12
	testq	%r12, %r12
	je	.L66
	movq	24(%r12), %r13
	testq	%r13, %r13
	je	.L67
	movq	24(%r13), %r14
	testq	%r14, %r14
	je	.L68
	movq	24(%r14), %r15
	testq	%r15, %r15
	je	.L69
	movq	24(%r15), %rbx
	testq	%rbx, %rbx
	je	.L70
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L70:
	movq	32(%r15), %rbx
	testq	%rbx, %rbx
	je	.L71
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L71:
	movq	%r15, %rdi
	call	xmemfree@PLT
.L69:
	movq	32(%r14), %r15
	testq	%r15, %r15
	je	.L72
	movq	24(%r15), %rbx
	testq	%rbx, %rbx
	je	.L73
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L73:
	movq	32(%r15), %rbx
	testq	%rbx, %rbx
	je	.L74
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L74:
	movq	%r15, %rdi
	call	xmemfree@PLT
.L72:
	movq	%r14, %rdi
	call	xmemfree@PLT
.L68:
	movq	32(%r13), %r14
	testq	%r14, %r14
	je	.L75
	movq	24(%r14), %r15
	testq	%r15, %r15
	je	.L76
	movq	24(%r15), %rbx
	testq	%rbx, %rbx
	je	.L77
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L77:
	movq	32(%r15), %rbx
	testq	%rbx, %rbx
	je	.L78
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L78:
	movq	%r15, %rdi
	call	xmemfree@PLT
.L76:
	movq	32(%r14), %r15
	testq	%r15, %r15
	je	.L79
	movq	24(%r15), %rbx
	testq	%rbx, %rbx
	je	.L80
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L80:
	movq	32(%r15), %rbx
	testq	%rbx, %rbx
	je	.L81
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L81:
	movq	%r15, %rdi
	call	xmemfree@PLT
.L79:
	movq	%r14, %rdi
	call	xmemfree@PLT
.L75:
	movq	%r13, %rdi
	call	xmemfree@PLT
.L67:
	movq	32(%r12), %r13
	testq	%r13, %r13
	je	.L82
	movq	24(%r13), %r14
	testq	%r14, %r14
	je	.L83
	movq	24(%r14), %r15
	testq	%r15, %r15
	je	.L84
	movq	24(%r15), %rbx
	testq	%rbx, %rbx
	je	.L85
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L85:
	movq	32(%r15), %rbx
	testq	%rbx, %rbx
	je	.L86
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L86:
	movq	%r15, %rdi
	call	xmemfree@PLT
.L84:
	movq	32(%r14), %r15
	testq	%r15, %r15
	je	.L87
	movq	24(%r15), %rbx
	testq	%rbx, %rbx
	je	.L88
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L88:
	movq	32(%r15), %rbx
	testq	%rbx, %rbx
	je	.L89
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L89:
	movq	%r15, %rdi
	call	xmemfree@PLT
.L87:
	movq	%r14, %rdi
	call	xmemfree@PLT
.L83:
	movq	32(%r13), %r14
	testq	%r14, %r14
	je	.L90
	movq	24(%r14), %r15
	testq	%r15, %r15
	je	.L91
	movq	24(%r15), %rbx
	testq	%rbx, %rbx
	je	.L92
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L92:
	movq	32(%r15), %rbx
	testq	%rbx, %rbx
	je	.L93
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L93:
	movq	%r15, %rdi
	call	xmemfree@PLT
.L91:
	movq	32(%r14), %r15
	testq	%r15, %r15
	je	.L94
	movq	24(%r15), %rbx
	testq	%rbx, %rbx
	je	.L95
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L95:
	movq	32(%r15), %rbx
	testq	%rbx, %rbx
	je	.L96
	movq	24(%rbx), %rdi
	call	deleteTree
	movq	32(%rbx), %rdi
	call	deleteTree
	movq	%rbx, %rdi
	call	xmemfree@PLT
.L96:
	movq	%r15, %rdi
	call	xmemfree@PLT
.L94:
	movq	%r14, %rdi
	call	xmemfree@PLT
.L90:
	movq	%r13, %rdi
	call	xmemfree@PLT
.L82:
	movq	%r12, %rdi
	call	xmemfree@PLT
.L66:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	jmp	xmemfree@PLT
	.p2align 4,,10
	.p2align 3
.L33:
	ret
	.cfi_endproc
.LFE26:
	.size	deleteTree, .-deleteTree
	.section	.rodata.str1.1
.LC3:
	.string	"%s\n"
.LC5:
	.string	"%.15g;"
.LC6:
	.string	"%0*.15g%c"
.LC7:
	.string	"%.15g%c"
	.text
	.p2align 4
	.globl	show
	.type	show, @function
show:
.LFB27:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$35, %ecx
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$344, %rsp
	.cfi_def_cfa_offset 400
	leaq	48(%rsp), %rdi
	movups	%xmm0, 32(%rsp)
	rep stosq
	movl	$0, (%rdi)
	testq	%r13, %r13
	je	.L286
	movl	fieldcnt(%rip), %eax
	xorl	%r12d, %r12d
	leaq	32(%rsp), %r14
	testl	%eax, %eax
	jg	.L298
	jmp	.L299
	.p2align 4,,10
	.p2align 3
.L296:
	leaq	.LC7(%rip), %rsi
	movq	%rbp, %rdi
	movl	$1, %eax
	call	sprintf@PLT
.L297:
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	strcat@PLT
.L316:
	movl	fieldcnt(%rip), %eax
.L292:
	addl	$1, %r12d
	addq	$16, %r13
	cmpl	%eax, %r12d
	jge	.L299
.L298:
	movq	8(%r13), %r15
	testq	%r15, %r15
	je	.L289
	cmpl	%r12d, statcolumn(%rip)
	je	.L293
	cmpl	%r12d, 4+statcolumn(%rip)
	je	.L293
.L289:
	cmpl	%r12d, keycolumn(%rip)
	movsd	0(%r13), %xmm0
	movq	%rsp, %rbp
	movsbl	field_separator(%rip), %edx
	jne	.L296
	movl	%edx, %ecx
	movl	keylength(%rip), %edx
	movq	%rbp, %rdi
	leaq	.LC6(%rip), %rsi
	movl	$1, %eax
	call	sprintf@PLT
	jmp	.L297
	.p2align 4,,10
	.p2align 3
.L293:
	movl	nbstats(%rip), %edx
	xorl	%ebx, %ebx
	movq	%rsp, %rbp
	testl	%edx, %edx
	jle	.L292
	.p2align 4,,10
	.p2align 3
.L291:
	movslq	%ebx, %rax
	cmpl	%ebx, col_sum(%rip)
	movsd	(%r15,%rax,8), %xmm0
	leaq	0(,%rax,8), %rdx
	leal	1(%rbx), %eax
	je	.L317
.L314:
	movl	%eax, %ebx
.L294:
	leaq	.LC5(%rip), %rsi
	movq	%rbp, %rdi
	movl	$1, %eax
	call	sprintf@PLT
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	strcat@PLT
	cmpl	%ebx, nbstats(%rip)
	jg	.L291
	jmp	.L316
	.p2align 4,,10
	.p2align 3
.L317:
	movsd	8(%r15,%rdx), %xmm1
	ucomisd	.LC4(%rip), %xmm1
	jp	.L303
	comisd	.LC4(%rip), %xmm1
	je	.L314
.L303:
	divsd	%xmm1, %xmm0
	addl	$2, %ebx
	jmp	.L294
	.p2align 4,,10
	.p2align 3
.L299:
	movq	%r14, %rdi
	call	strlen@PLT
	movq	outfile(%rip), %rdi
	movq	%r14, %rdx
	leaq	.LC3(%rip), %rsi
	movb	$0, 31(%rsp,%rax)
	xorl	%eax, %eax
	call	fprintf@PLT
.L286:
	addq	$344, %rsp
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
	.cfi_endproc
.LFE27:
	.size	show, .-show
	.p2align 4
	.globl	updateStats
	.type	updateStats, @function
updateStats:
.LFB28:
	.cfi_startproc
	movl	nbstatcolumns(%rip), %eax
	testl	%eax, %eax
	jle	.L339
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	statcolumn(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	xorl	%ebx, %ebx
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
.L325:
	movslq	0(%r13,%rbx,4), %rax
	movl	flagstats(%rip), %esi
	movl	$1, %edi
	salq	$4, %rax
	movsd	(%r12,%rax), %xmm1
	movq	8(%rbp,%rax), %r14
	movsd	%xmm1, 8(%rsp)
	call	isneeded@PLT
	testl	%eax, %eax
	je	.L320
	movslq	col_max(%rip), %rax
	testl	%eax, %eax
	js	.L320
	leaq	(%r14,%rax,8), %rax
	movsd	8(%rsp), %xmm1
	comisd	(%rax), %xmm1
	ja	.L342
	.p2align 4,,10
	.p2align 3
.L320:
	movl	flagstats(%rip), %esi
	movl	$2, %edi
	call	isneeded@PLT
	testl	%eax, %eax
	je	.L322
	movslq	col_min(%rip), %rax
	testl	%eax, %eax
	js	.L322
	leaq	(%r14,%rax,8), %rax
	movsd	8(%rsp), %xmm2
	movsd	(%rax), %xmm0
	comisd	%xmm2, %xmm0
	ja	.L343
	.p2align 4,,10
	.p2align 3
.L322:
	movl	flagstats(%rip), %esi
	movl	$4, %edi
	call	isneeded@PLT
	testl	%eax, %eax
	je	.L324
	movslq	col_sum(%rip), %rax
	testl	%eax, %eax
	js	.L324
	leaq	(%r14,%rax,8), %rax
	movsd	8(%rsp), %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
	movslq	col_cnt(%rip), %rax
	movsd	.LC0(%rip), %xmm0
	leaq	(%r14,%rax,8), %rax
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
.L324:
	addq	$1, %rbx
	cmpl	%ebx, nbstatcolumns(%rip)
	jg	.L325
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
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
.L343:
	.cfi_restore_state
	movsd	%xmm2, (%rax)
	jmp	.L322
	.p2align 4,,10
	.p2align 3
.L342:
	movsd	%xmm1, (%rax)
	jmp	.L320
	.p2align 4,,10
	.p2align 3
.L339:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	ret
	.cfi_endproc
.LFE28:
	.size	updateStats, .-updateStats
	.p2align 4
	.globl	initStats
	.type	initStats, @function
initStats:
.LFB29:
	.cfi_startproc
	movl	nbstatcolumns(%rip), %eax
	testl	%eax, %eax
	jle	.L361
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	statcolumn(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xorl	%ebx, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
.L349:
	movslq	(%r12,%rbx,4), %rax
	movl	flagstats(%rip), %esi
	movl	$1, %edi
	salq	$4, %rax
	addq	%rbp, %rax
	movsd	(%rax), %xmm0
	movq	8(%rax), %r13
	movsd	%xmm0, 8(%rsp)
	call	isneeded@PLT
	testl	%eax, %eax
	je	.L346
	movslq	col_max(%rip), %rax
	testl	%eax, %eax
	js	.L346
	movsd	8(%rsp), %xmm0
	movsd	%xmm0, 0(%r13,%rax,8)
.L346:
	movl	flagstats(%rip), %esi
	movl	$2, %edi
	call	isneeded@PLT
	testl	%eax, %eax
	je	.L347
	movslq	col_min(%rip), %rax
	testl	%eax, %eax
	js	.L347
	movsd	8(%rsp), %xmm1
	movsd	%xmm1, 0(%r13,%rax,8)
.L347:
	movl	flagstats(%rip), %esi
	movl	$4, %edi
	call	isneeded@PLT
	testl	%eax, %eax
	je	.L348
	movslq	col_sum(%rip), %rax
	testl	%eax, %eax
	js	.L348
	movsd	8(%rsp), %xmm2
	movq	.LC0(%rip), %rdx
	movsd	%xmm2, 0(%r13,%rax,8)
	movslq	col_cnt(%rip), %rax
	movq	%rdx, 0(%r13,%rax,8)
.L348:
	addq	$1, %rbx
	cmpl	%ebx, nbstatcolumns(%rip)
	jg	.L349
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
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
.L361:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.cfi_endproc
.LFE29:
	.size	initStats, .-initStats
	.p2align 4
	.globl	infixTraversal
	.type	infixTraversal, @function
infixTraversal:
.LFB30:
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%rdi, 24(%rsp)
	testq	%rdi, %rdi
	je	.L364
.L365:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	je	.L541
	movq	24(%rsp), %rdx
	movq	32(%rdx), %rcx
	movq	%rcx, 16(%rsp)
	testq	%rcx, %rcx
	je	.L370
	cmpl	$1, %eax
	je	.L542
.L371:
	movq	16(%rsp), %rcx
	movq	32(%rcx), %rsi
	movq	%rsi, 8(%rsp)
	testq	%rsi, %rsi
	je	.L374
	cmpl	$1, %eax
	je	.L543
.L375:
	movq	8(%rsp), %rdx
	movq	32(%rdx), %r14
	testq	%r14, %r14
	je	.L378
	cmpl	$1, %eax
	je	.L544
.L379:
	movq	32(%r14), %r13
	testq	%r13, %r13
	je	.L382
	cmpl	$1, %eax
	je	.L545
.L383:
	movq	32(%r13), %r12
	testq	%r12, %r12
	je	.L410
	cmpl	$1, %eax
	je	.L546
.L411:
	movq	32(%r12), %rbp
	testq	%rbp, %rbp
	je	.L442
	cmpl	$1, %eax
	je	.L547
.L443:
	movq	32(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L458
	cmpl	$1, %eax
	je	.L548
.L459:
	movq	32(%rbx), %r15
	testq	%r15, %r15
	je	.L466
	cmpl	$1, %eax
	je	.L549
.L467:
	movq	32(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	24(%r15), %r15
	testq	%r15, %r15
	je	.L466
.L468:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L467
.L549:
	movq	24(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	32(%r15), %r15
	testq	%r15, %r15
	jne	.L468
.L466:
	movq	8(%rbx), %rdi
	call	show
	movq	24(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L458
.L551:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L459
.L548:
	movq	24(%rbx), %r15
	testq	%r15, %r15
	je	.L461
	cmpl	$1, %eax
	je	.L550
.L462:
	movq	32(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	24(%r15), %r15
	testq	%r15, %r15
	je	.L461
.L463:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L462
.L550:
	movq	24(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	32(%r15), %r15
	testq	%r15, %r15
	jne	.L463
.L461:
	movq	8(%rbx), %rdi
	call	show
	movq	32(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L551
.L458:
	movq	8(%rbp), %rdi
	call	show
	movq	24(%rbp), %rbp
	testq	%rbp, %rbp
	je	.L442
.L556:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L443
.L547:
	movq	24(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L445
	cmpl	$1, %eax
	je	.L552
.L446:
	movq	32(%rbx), %r15
	testq	%r15, %r15
	je	.L453
	cmpl	$1, %eax
	je	.L553
.L454:
	movq	32(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	24(%r15), %r15
	testq	%r15, %r15
	je	.L453
.L455:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L454
.L553:
	movq	24(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	32(%r15), %r15
	testq	%r15, %r15
	jne	.L455
.L453:
	movq	8(%rbx), %rdi
	call	show
	movq	24(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L445
.L555:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L446
.L552:
	movq	24(%rbx), %r15
	testq	%r15, %r15
	je	.L448
	cmpl	$1, %eax
	je	.L554
.L449:
	movq	32(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	24(%r15), %r15
	testq	%r15, %r15
	je	.L448
.L450:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L449
.L554:
	movq	24(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	32(%r15), %r15
	testq	%r15, %r15
	jne	.L450
.L448:
	movq	8(%rbx), %rdi
	call	show
	movq	32(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L555
.L445:
	movq	8(%rbp), %rdi
	call	show
	movq	32(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L556
.L442:
	movq	8(%r12), %rdi
	call	show
	movq	24(%r12), %r12
	testq	%r12, %r12
	je	.L410
.L567:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L411
.L546:
	movq	24(%r12), %rbp
	testq	%rbp, %rbp
	je	.L413
	cmpl	$1, %eax
	je	.L557
.L414:
	movq	32(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L429
	cmpl	$1, %eax
	je	.L558
.L430:
	movq	32(%rbx), %r15
	testq	%r15, %r15
	je	.L437
	cmpl	$1, %eax
	je	.L559
.L438:
	movq	32(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	24(%r15), %r15
	testq	%r15, %r15
	je	.L437
.L439:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L438
.L559:
	movq	24(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	32(%r15), %r15
	testq	%r15, %r15
	jne	.L439
.L437:
	movq	8(%rbx), %rdi
	call	show
	movq	24(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L429
.L561:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L430
.L558:
	movq	24(%rbx), %r15
	testq	%r15, %r15
	je	.L432
	cmpl	$1, %eax
	je	.L560
.L433:
	movq	32(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	24(%r15), %r15
	testq	%r15, %r15
	je	.L432
.L434:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L433
.L560:
	movq	24(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	32(%r15), %r15
	testq	%r15, %r15
	jne	.L434
.L432:
	movq	8(%rbx), %rdi
	call	show
	movq	32(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L561
.L429:
	movq	8(%rbp), %rdi
	call	show
	movq	24(%rbp), %rbp
	testq	%rbp, %rbp
	je	.L413
.L566:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L414
.L557:
	movq	24(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L416
	cmpl	$1, %eax
	je	.L562
.L417:
	movq	32(%rbx), %r15
	testq	%r15, %r15
	je	.L424
	cmpl	$1, %eax
	je	.L563
.L425:
	movq	32(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	24(%r15), %r15
	testq	%r15, %r15
	je	.L424
.L426:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L425
.L563:
	movq	24(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	32(%r15), %r15
	testq	%r15, %r15
	jne	.L426
.L424:
	movq	8(%rbx), %rdi
	call	show
	movq	24(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L416
.L565:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L417
.L562:
	movq	24(%rbx), %r15
	testq	%r15, %r15
	je	.L419
	cmpl	$1, %eax
	je	.L564
.L420:
	movq	32(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	24(%r15), %r15
	testq	%r15, %r15
	je	.L419
.L421:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L420
.L564:
	movq	24(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	32(%r15), %r15
	testq	%r15, %r15
	jne	.L421
.L419:
	movq	8(%rbx), %rdi
	call	show
	movq	32(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L565
.L416:
	movq	8(%rbp), %rdi
	call	show
	movq	32(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L566
.L413:
	movq	8(%r12), %rdi
	call	show
	movq	32(%r12), %r12
	testq	%r12, %r12
	jne	.L567
.L410:
	movq	8(%r13), %rdi
	call	show
	movq	24(%r13), %r13
	testq	%r13, %r13
	je	.L382
.L577:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L383
.L545:
	movq	24(%r13), %r12
	testq	%r12, %r12
	je	.L385
	cmpl	$1, %eax
	je	.L568
.L386:
	movq	32(%r12), %rbp
	testq	%rbp, %rbp
	je	.L389
	cmpl	$1, %eax
	je	.L569
.L390:
	movq	32(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L397
	cmpl	$1, %eax
	je	.L570
.L398:
	movq	32(%rbx), %r15
	testq	%r15, %r15
	je	.L405
	cmpl	$1, %eax
	je	.L571
.L406:
	movq	32(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	24(%r15), %r15
	testq	%r15, %r15
	je	.L405
.L407:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L406
.L571:
	movq	24(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	32(%r15), %r15
	testq	%r15, %r15
	jne	.L407
.L405:
	movq	8(%rbx), %rdi
	call	show
	movq	24(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L397
.L573:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L398
.L570:
	movq	24(%rbx), %r15
	testq	%r15, %r15
	je	.L400
	cmpl	$1, %eax
	je	.L572
.L401:
	movq	32(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	24(%r15), %r15
	testq	%r15, %r15
	je	.L400
.L402:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L401
.L572:
	movq	24(%r15), %rdi
	call	infixTraversal
	movq	8(%r15), %rdi
	call	show
	movq	32(%r15), %r15
	testq	%r15, %r15
	jne	.L402
.L400:
	movq	8(%rbx), %rdi
	call	show
	movq	32(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L573
.L397:
	movq	8(%rbp), %rdi
	call	show
	movq	24(%rbp), %rbp
	testq	%rbp, %rbp
	je	.L389
.L575:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L390
.L569:
	movq	24(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L392
	cmpl	$1, %eax
	je	.L574
.L393:
	movq	32(%rbx), %rdi
	call	infixTraversal
	movq	8(%rbx), %rdi
	call	show
	movq	24(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L392
.L394:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L393
.L574:
	movq	24(%rbx), %rdi
	call	infixTraversal
	movq	8(%rbx), %rdi
	call	show
	movq	32(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L394
.L392:
	movq	8(%rbp), %rdi
	call	show
	movq	32(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L575
.L389:
	movq	8(%r12), %rdi
	call	show
	movq	24(%r12), %r12
	testq	%r12, %r12
	je	.L385
.L576:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L386
.L568:
	movq	24(%r12), %rdi
	call	infixTraversal
	movq	8(%r12), %rdi
	call	show
	movq	32(%r12), %r12
	testq	%r12, %r12
	jne	.L576
.L385:
	movq	8(%r13), %rdi
	call	show
	movq	32(%r13), %r13
	testq	%r13, %r13
	jne	.L577
.L382:
	movq	8(%r14), %rdi
	call	show
	movq	24(%r14), %r14
	testq	%r14, %r14
	je	.L378
.L578:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L379
.L544:
	movq	24(%r14), %rdi
	call	infixTraversal
	movq	8(%r14), %rdi
	call	show
	movq	32(%r14), %r14
	testq	%r14, %r14
	jne	.L578
.L378:
	movq	8(%rsp), %rbx
	movq	8(%rbx), %rdi
	call	show
	movq	24(%rbx), %rax
	movq	%rax, 8(%rsp)
	cmpq	$0, 8(%rsp)
	je	.L374
.L579:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L375
.L543:
	movq	8(%rsp), %rbx
	movq	24(%rbx), %rdi
	call	infixTraversal
	movq	8(%rbx), %rdi
	call	show
	movq	32(%rbx), %rax
	movq	%rax, 8(%rsp)
	cmpq	$0, 8(%rsp)
	jne	.L579
.L374:
	movq	16(%rsp), %rbx
	movq	8(%rbx), %rdi
	call	show
	movq	24(%rbx), %rax
	movq	%rax, 16(%rsp)
	cmpq	$0, 16(%rsp)
	je	.L370
.L580:
	movl	sorting(%rip), %eax
	cmpl	$1, %eax
	jne	.L371
.L542:
	movq	16(%rsp), %rbx
	movq	24(%rbx), %rdi
	call	infixTraversal
	movq	8(%rbx), %rdi
	call	show
	movq	32(%rbx), %rax
	movq	%rax, 16(%rsp)
	cmpq	$0, 16(%rsp)
	jne	.L580
.L370:
	movq	24(%rsp), %rbx
	movq	8(%rbx), %rdi
	call	show
	movq	24(%rbx), %rax
	movq	%rax, 24(%rsp)
.L368:
	cmpq	$0, 24(%rsp)
	jne	.L365
.L364:
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
.L541:
	.cfi_restore_state
	movq	24(%rsp), %rbx
	movq	24(%rbx), %rdi
	call	infixTraversal
	movq	8(%rbx), %rdi
	call	show
	movq	32(%rbx), %rax
	movq	%rax, 24(%rsp)
	jmp	.L368
	.cfi_endproc
.LFE30:
	.size	infixTraversal, .-infixTraversal
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC4:
	.long	0
	.long	0
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
