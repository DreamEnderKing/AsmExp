global _start

section .text
    _start:
        mov esi, msg                ; 要输出的字符串地址
        mov edx, msglen             ; 要输出的字符串长度
        mov ecx, edx                ; 全部转换为大写
        mov ebx, 0
      c:mov al, [ecs:ebx+esi]
        and al, 11011111b
        mov [ecs:ebx+esi], al
        add ebx, 1
        loop c
        mov eax, 1                  ; sys_write的系统调用编号为1
        mov edi, 1                  ; 文件句柄1对应stdout
        syscall                     ; 系统调用
        mov eax, 60                 ; sys_exit的系统调用编号为60
        xor edi, edi                ; exit 0
        syscall

section .data
    msg: db "Hello, World!", 10     ; ascii表中10对应换行符
    msglen: equ $ - msg             ; $ 等于当前行开头的地址
