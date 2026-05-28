# Анализ ассемблерного кода

## Параметры сборки

### Без оптимизации (пункт 4.5)
- gcc   -O0 -S -DNO_ZERO_DIVIDE src/optbench.c -o asm/gcc/gcc_O0.s

### С оптимизацией по скорости (пункт 4.6)
- gcc   -O2 -S -DNO_ZERO_DIVIDE src/optbench.c -o asm/gcc/gcc_O2.s

## GCC 

| №  | Оптимизация              | Исходный код (C)               | Ассемблер `-O0`                                      | Ассемблер `-O2`                                        |
|----|--------------------------|--------------------------------|------------------------------------------------------|--------------------------------------------------------|
| 1  | Свёртка константы (int)  | `i3 = 1 + 2`                   | `movl $3, i3(%rip)`                                  | `movl $3, i3(%rip)`                                    |
| 2  | Свёртка константы (double) | `flt_1 = 2.4 + 6.3`          | `movsd .LC1(%rip), %xmm0`<br>`movsd %xmm0, flt_1(%rip)` | `movq .LC1(%rip), %rax`<br>`movq %rax, flt_1(%rip)`  |
| 3  | Сложение с нулём         | `j2 = i + 0`                   | `movl i(%rip), %eax`<br>`movl %eax, j2(%rip)`        | `movl i(%rip), %eax`<br>`movl %eax, j2(%rip)`          |
| 4  | Деление на единицу       | `k2 = i / 1`                   | `movl i(%rip), %eax`<br>`movl %eax, k2(%rip)`        | `movl i(%rip), %eax`<br>`movl %eax, k2(%rip)`          |
| 5  | Умножение на единицу     | `i4 = i * 1`                   | `movl i(%rip), %eax`<br>`movl %eax, i4(%rip)`        | `movl i(%rip), %eax`<br>`movl %eax, i4(%rip)`          |
| 6  | Умножение на ноль        | `i5 = i * 0`                   | `movl $0, i5(%rip)`                                  | `movl $0, i5(%rip)`                                    |
| 7  | Снижение мощности        | `k2 = 4 * j5`                  | `movl j5(%rip), %eax`<br>`sall $2, %eax`             | `movl j5(%rip), %eax`<br>`sall $2, %eax`               |
| 8  | Лишнее присваивание      | `k3=1; k3=1;`                  | `movl $1, k3(%rip)`<br>`movl $1, k3(%rip)`           | `movl $1, k3(%rip)`                                    |
| 9  | Мёртвый код              | `if(0){printf(...)}`<br>`dead_store = a` | Блок отсутствует; `dead_store` сохранён               | `endbr64`<br>`ret`                                     |
| 10 | Ненужный цикл            | `unnecessary_loop` (5 итераций) | Полный цикл из 5 итераций                            | `movl $5, i(%rip)`<br>`jmp __printf_chk@PLT`          |
| 11 | Размотка цикла           | `loop_unrolling` (6 итераций)  | Цикл сохранён                                        | Цикл сохранён                                          |
| 12 | Инвариант цикла          | `ivector2[i4] = j * k`          | `imull k(%rip), %eax` в теле цикла                   | `imulb k(%rip)` до цикла                               |
| 13 | Предвычисление массива   | `ivector4[i] = i*2`            | Цикл с `leal (%rax,%rax)`                            | `movq .LC6(%rip), %rax`<br>2 инструкции               |
| 14 | Замена деления           | `m3 = (h3+k3)/i3`              | `idivl %ecx`                                         | `idivl i3(%rip)`                                       |

