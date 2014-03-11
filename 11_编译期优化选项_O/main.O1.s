	.file	"main.cpp"
	.text
.globl _Z3sumii
	.type	_Z3sumii, @function
_Z3sumii:
.LFB0:
	.cfi_startproc
	leal	(%rsi,%rdi), %eax
	ret
	.cfi_endproc
.LFE0:
	.size	_Z3sumii, .-_Z3sumii
.globl main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	call	_Z9createNumv
	movl	%eax, %ebx
	call	_Z9createNumv
	movl	%eax, %esi
	movl	%ebx, %edi
	call	_Z3sumii
	movl	%eax, %edi
	call	_Z6putNumi
	movl	$0, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.5.2-8ubuntu4) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
