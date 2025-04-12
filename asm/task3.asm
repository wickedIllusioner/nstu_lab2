global _start

section .data
	prompt1 db "Введите число N: ", 0
	prompt1_len equ $ - prompt1

	prompt2 db "Введите N чисел: ", 0
	prompt2_len equ $ - prompt2

	result db "Результат: ", 0
	res_len equ $ - result
	
	space db ' ', 10
	newline db 10, 0
	buffer times 64 db 0
	num_buffer times 64 db 0

section .text
_start:
	; Вывод строки prompt1
	mov rdi, prompt1
	mov rsi, prompt1_len
	call print_string

	; Ввод значения N
	mov rdi, buffer
	mov rsi, 64
	call get_value

	; Преобразование значения N в числовой тип
	mov rdi, buffer
	call str_to_int
	mov r12, rax

	; Вывод строки prompt2
	mov rdi, prompt2
	mov rsi, prompt2_len
	call print_string

	; Чтение строки с числами
	mov rdi, buffer
	mov rsi, 4096
	call get_value

	; Вывод строки result
	mov rdi, result
	mov rsi, res_len
	call print_string

	mov r13, buffer		; сохранение адреса буфера
	xor r14, r14

.process:
.skip_spaces:
	mov al, [r13]
	cmp al, ' '
	jne .not_space
	inc r13
	jmp .skip_spaces
.not_space:
	cmp al, 10
	je .end_prog
	test al, al
	jz .end_prog
	mov r15, r13		; сохранение начала числа

.find_end:
    mov al, [r13]
    cmp al, ' '
    je .found_end
    cmp al, 10
    je .found_end
    test al, al
    jz .found_end
    inc r13
    jmp .find_end
.found_end:
    mov bl, [r13]       ; сохраняем текущий символ
    mov byte [r13], 0   ; временно заменяем на нулевой символ

    ; Преобразуем число
    mov rdi, r15
    call str_to_int

    mov [r13], bl       ; восстанавливаем символ

    ; Подсчитываем чётные цифры
    call count_even_digits

    ; Преобразуем результат в строку и выводим
    mov rdi, num_buffer
    call int_to_str
    mov rdi, num_buffer
    mov rsi, rcx
    call print_string

    ; Выводим пробел
    mov rdi, space
    mov rsi, 1
    call print_string

    ; Переходим к следующему числу
    inc r14
    cmp r14, r12        ; проверяем, все ли числа обработаны
    jge .end_prog
    jmp .process

.end_prog:
    ; Выводим перевод строки
    mov rdi, newline
    mov rsi, 1
    call print_string

    ; Завершаем программу
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; код возврата 0
    syscall



; Функция для вывода строки
print_string:
	mov rax, 1
	mov rdx, rsi
	mov rsi, rdi
	mov rdi, 1
	syscall
	ret


; Функция получения значения
get_value:
	mov rax, 0
	mov rdx, rsi
	mov rsi, rdi
	mov rdi, 0
	syscall
	ret 


; Перевод строки в число (-> rax)
str_to_int:
	xor rax, rax	; обнуление регистра
	xor rcx, rcx	; обнуление счетчика
.next_digit:
	movzx rdx, byte [rdi + rcx]	; загрузка символа в rdx
	cmp rdx, '0'		; проверка на цифру
	jb .exit
	cmp rdx, '9'
	ja .exit
	sub rdx, '0'		; преобразование символа в цифру
	imul rax, 10		; умножение текущего значения на 10
	add rax, rdx
	inc rcx			; следующий символ
	jmp .next_digit
.exit:
	ret


; Перевод числа в строку (rax - число, rdi - адрес буфера -> длина строка rcx)
int_to_str:
	mov rbx, 10	; система счисления
	xor rcx, rcx	; обнуление счетчика
.next_digit:
	xor rdx, rdx
	div rbx
	add dl, '0'	; остаток в символ
	push rdx	; сохраняем символ в стеке
	inc rcx
	test rax, rax	; проверка на ноль
	jnz .next_digit
	mov rsi, rcx	; длина строки в регистр rsi
.pop_digits:
	pop rax
	mov [rdi], al		; запись значения из стека в буфер
	inc rdi			; переход к след. позиции
	loop .pop_digits	; цикл для всех значений
	mov byte [rdi], 0
	mov rcx, rsi		; возвращение длины строки
	ret


; Счет четных цифр в числе
count_even_digits:
	xor rcx, rcx		; обнуление счетчика
	mov rbx, 10		; ???
.next_digit:
	xor rdx, rdx		; обнуление rdx
	div rbx
	cmp rdx, 0		; проверка на ноль
	je .skip_zero		; игнорируем ноль (не считаем как четное число)
	test rdx, 1		; проверка на четность
	jnz .odd		; переход к нечетной метке
	inc rcx
.odd:
.skip_zero:
	test rax, rax		; проверка на окончания числа
	jnz .next_digit
	mov rax, rcx		; возврат четных чисел
	ret	
