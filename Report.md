% Данный файл распространяется под лицензией CC BY 4.0.
% (c) Кафедра системного программирования, 2025

\documentclass[a4paper]{article}

\usepackage[a4paper, top=8mm, bottom=8mm, left=8mm, right=8mm]{geometry}

\usepackage{polyglossia}
\setdefaultlanguage[babelshorthands=true]{russian}
\setotherlanguage{english}

\usepackage{fontspec}
\setmainfont{FreeSerif}
\newfontfamily{\russianfonttt}[Scale=0.7]{DejaVuSansMono}

\usepackage[tiny, compact]{titlesec}

\usepackage{titling}
\setlength{\droptitle}{-1cm}
\pretitle{\begin{center}\begin{bfseries}\Large}
\posttitle{\par\end{bfseries}\end{center}}
\preauthor{\begin{center}\normalsize}
\postauthor{\par\end{center}\vspace{-1.8cm}}

\usepackage{hyperref}
\usepackage{bookmark}
\usepackage{csquotes}
\usepackage{listings}
\usepackage{xcolor}
\usepackage{enumitem}

% Настройка листингов для ассемблера
\lstdefinelanguage{asm}{
  morekeywords={movl,movq,movsd,movw,movb,movabsq,addl,subl,imull,imulq,
                idivl,shll,sall,shrq,cltd,orl,xorl,cmpl,jle,jmp,call,ret,
                retq,jge,jne,jl,jb,pushq,popq,leaq,leal,mulb,mulsd,
                stmxcsr,ldmxcsr,endbr64,pxor,xorpd,xorps,mulsd},
  sensitive=false,
  morecomment=[l]{\;},
  morecomment=[l]{\#},
}
\lstset{
  language=asm,
  basicstyle=\russianfonttt,
  keywordstyle=\color{blue!70!black},
  commentstyle=\color{gray},
  backgroundcolor=\color{gray!8},
  frame=single,
  framesep=2pt,
  xleftmargin=4pt,
  xrightmargin=4pt,
  breaklines=true,
  columns=flexible,
  keepspaces=true,
}

\title{Сравнение и анализ оптимизаций компиляторов}
\author{Тарадеев Андрей Михайлович}
\date{}

\begin{document}

\maketitle

\begin{flushright}
    Группа: \emph{2025.Б41-мм}\quad\\[2pt]
    Кафедра: \emph{кафедра системного программирования}\\[2pt]
    Научный руководитель: \emph{Романова Зинаида Андреевна}\\[2pt]
    Номер семестра практики: \emph{2}
\end{flushright}

% ─────────────────────────────────────────────────────────────────────────────
\section{Постановка задачи}

\textbf{Целью работы является} исследование и сравнительный анализ стратегий
оптимизации машинного кода, применяемых современными компиляторами языка~Си,
на примере программы \texttt{optbench.c}.

Для достижения цели поставлены следующие задачи:
\begin{enumerate}[noitemsep,topsep=2pt]
  \item описать среду исследования (ОС, архитектура, версии компиляторов);
  \item выполнить компиляцию тестовой программы с уровнями оптимизации
        \texttt{-O0}, \texttt{-O2}, \texttt{-Os};
  \item произвести замеры размера исполняемых файлов и времени выполнения;
  \item сгенерировать ассемблерные листинги и составить сравнительные таблицы;
  \item провести анализ применённых оптимизаций по каждому компилятору;
  \item сравнить компиляторы между собой и сформулировать выводы.
\end{enumerate}

В качестве объектов исследования выбраны три широко распространённых
компилятора: GCC~13.3.0 (GNU Compiler Collection), Clang~18.1.3 и Intel~ICX~2026.0.0. 
Все три установлены на платформе
Ubuntu~24.04~LTS (x86\_64). Характеристики системы и точные версии
инструментов зафиксированы в репозитории%
\footnote{Характеристики системы:
\url{https://github.com/Andrew2114/Compiler_optimization/blob/main/tables/01_system_info.md}
.}$^{,}$%
\footnote{Версии компиляторов:
\url{https://github.com/Andrew2114/Compiler_optimization/blob/main/tables/02_compiler_versions.md}
.}.

Тестовой программой послужил бенчмарк PC~Tech~Journal 1988~года%
\footnote{Исходный код \texttt{optbench.c}:
\url{https://github.com/Andrew2114/Compiler_optimization/blob/main/src/optbench.c}
.}
(\texttt{optbench.c}), разработанный специально для проверки компиляторных
оптимизаций. Программа охватывает девять классических сценариев: свёртку констант, арифметические тождества,
снижение мощности операций, удаление мёртвого кода, управление переменной
индукции цикла, вынесение инвариантов из цикла, устранение общих подвыражений,
размотку цикла и сжатие цепочек переходов.

Результаты работы полезны при выборе компилятора и параметров оптимизации
в зависимости от приоритетов проекта: скорость выполнения, размер кода
или отлаживаемость.

% ─────────────────────────────────────────────────────────────────────────────
\section{Описание предлагаемого решения}

Методика исследования включала четыре последовательных этапа.

\textbf{Этап~1~--- сборка исполняемых файлов.}
Для каждого из трёх компиляторов программа собиралась с тремя уровнями
оптимизации: \texttt{-O0}~(отладочная сборка, без оптимизации),
\texttt{-O2}~(агрессивная оптимизация по скорости) и \texttt{-Os}
(оптимизация по объёму кода). Во всех случаях добавлялся флаг
\texttt{-DNO\_ZERO\_DIVIDE}, исключающий блок с делением на ноль,
который препятствует компиляции. Итого получено 9~исполняемых файлов.
Для каждого фиксировались: размер командой \texttt{ls~-la} и суммарное
время десяти запусков:
\begin{lstlisting}[language=bash,basicstyle=\russianfonttt]
time for i in $(seq 1 10); do ./binary > /dev/null; done
\end{lstlisting}

\textbf{Этап~2~--- генерация ассемблерных листингов.}
Флаг \texttt{-S} применялся для получения текстового ассемблерного
представления. Листинги создавались для уровней \texttt{-O0} и \texttt{-O2};
итого шесть файлов. Команды сборки:
\begin{lstlisting}[language=bash,basicstyle=\russianfonttt]
gcc   -O0 -S -DNO_ZERO_DIVIDE src/optbench.c -o asm/gcc/gcc_O0.s
gcc   -O2 -S -DNO_ZERO_DIVIDE src/optbench.c -o asm/gcc/gcc_O2.s
clang -O0 -S -DNO_ZERO_DIVIDE src/optbench.c -o asm/clang/clang_O0.s
clang -O2 -S -DNO_ZERO_DIVIDE src/optbench.c -o asm/clang/clang_O2.s
icx   -O0 -S -DNO_ZERO_DIVIDE src/optbench.c -o asm/icx/icx_O0.s
icx   -O2 -S -DNO_ZERO_DIVIDE src/optbench.c -o asm/icx/icx_O2.s
\end{lstlisting}
Все листинги сохранены в репозитории%
\footnote{Ассемблерные листинги GCC, Clang, ICX:
\url{https://github.com/Andrew2114/Compiler_optimization/tree/main/asm}
.}.

\textbf{Этап~3~--- покодовый анализ листингов.}
Каждый листинг изучался применительно к 14~типам оптимизаций, явно
выраженных в исходном коде. Для каждого компилятора составлена таблица
с тремя колонками: исходная конструкция на~Си, ассемблер при \texttt{-O0}
и ассемблер при \texttt{-O2}. К каждой строке дано пояснение: что именно
изменилось, почему это сделано компилятором и насколько замена логична.

\textbf{Этап~4~--- сравнение компиляторов.}
На основе трёх таблиц составлена сводная матрица оптимизаций: по строкам —
типы преобразований, по столбцам~--- компиляторы. В ней отражено,
какие оптимизации поддерживает каждый компилятор, где они уникальны
и где идентичны. 

% ─────────────────────────────────────────────────────────────────────────────
\section{Эксперименты}

\subsection{Размер бинарных файлов}

Полные таблицы размеров для каждого компилятора приведены в репозитории%
\footnote{Таблицы размеров файлов — GCC, Clang, ICX:
\url{https://github.com/Andrew2114/Compiler_optimization/blob/main/tables/03_1_executable_files.md},
\url{https://github.com/Andrew2114/Compiler_optimization/blob/main/tables/03_2_executable_files.md},
\url{https://github.com/Andrew2114/Compiler_optimization/blob/main/tables/03_3_executable_files.md}
.}.

GCC сформировал файлы одинакового размера (16\,992~байт) при всех трёх флагах.
Это объясняется тем, что для данной небольшой программы большую часть объёма
ELF-файла занимают заголовки, таблицы символов и секции метаданных,
а не машинный код: оптимизация последнего не меняет итоговый размер ощутимо.

Clang при \texttt{-O0} совпал с GCC (16\,992~байт), однако при \texttt{-O2}
и \texttt{-Os} вырос до 17\,048~байт. Прирост в 56~байт объясняется
добавлением секции \texttt{.addrsig} (Address Significance Table)~---
таблицы, которую использует компоновщик LLD для оптимизации ссылок на
глобальные символы. GCC и ICX эту секцию не генерируют.

ICX при \texttt{-O0} дал наименьший размер (16\,936~байт): компилятор
не добавляет расширенных отладочных метаданных по умолчанию. При \texttt{-O2}
размер незначительно вырос до 16\,984~байт из-за инлайнинга вспомогательных
функций в \texttt{main} и добавления пролога инициализации FPU.

\textbf{Вывод.} Для данного бенчмарка ни у одного компилятора флаги
оптимизации не дали ощутимого сокращения размера~--- программа слишком мала.
Наименьший размер обеспечил ICX (\texttt{-O0}), наибольший~--- Clang
(\texttt{-O2}/\texttt{-Os}).

\subsection{Время выполнения}

Подробные данные по всем девяти вариантам сборки приведены в репозитории%
\footnote{Таблицы времени выполнения:
\url{https://github.com/Andrew2114/Compiler_optimization/blob/main/tables/04_execution_times.md}
.}.
Время одного запуска вычислялось как суммарное \texttt{real} делённое на~10.
Столбец \texttt{user} отражает время непосредственного выполнения программы,
\texttt{sys}~--- время на системные вызовы (\texttt{printf}, запуск процесса).

GCC показал наибольшее ускорение: с $\approx$3,9\,мс (\texttt{-O0})
до $\approx$3,4\,мс (\texttt{-O2})~--- $\approx$13\,\%.
Флаги \texttt{-O2} и \texttt{-Os} дали одинаковый результат.
У Clang разница между \texttt{-O0} (3,6\,мс) и \texttt{-O2} (3,5\,мс)
минимальна~--- менее 3\,\%; \texttt{-Os} не дал ускорения относительно \texttt{-O0}.
ICX при \texttt{-O0} оказался самым медленным (4,0\,мс)~--- из-за инструкций
инициализации SSE-блока (\texttt{stmxcsr}/\texttt{ldmxcsr}) в \texttt{main};
при \texttt{-O2}~--- 3,9\,мс, при \texttt{-Os}~--- 3,7\,мс.

\textbf{Вывод.} Различия между флагами невелики: программа многократно вызывает
\texttt{printf}, и до 90\,\% времени составляют системные вызовы (\texttt{sys}),
а не вычислительный код. Для корректного измерения вычислительных оптимизаций
следует использовать программу без интенсивного ввода-вывода.

\subsection{Анализ ассемблерных листингов}

Три таблицы с покодовым анализом (по одной на компилятор) размещены
в репозитории%
\footnote{Таблицы ассемблерного анализа~--- GCC, Clang, ICX:
\url{https://github.com/Andrew2114/Compiler_optimization/blob/main/tables/04_1_asm_analys.md},
\url{https://github.com/Andrew2114/Compiler_optimization/blob/main/tables/04_2_asm_analys.md},
\url{https://github.com/Andrew2114/Compiler_optimization/blob/main/tables/04_3_asm_analys.md}
.}.
Сводная матрица оптимизаций всех трёх компиляторов~--- там же%
\footnote{Сводная таблица оптимизаций:
\url{https://github.com/Andrew2114/Compiler_optimization/blob/main/tables/05_comparison_table.md}.}.
Ниже приведены ключевые наблюдения.

\textbf{1. Свёртка констант.}
Все три компилятора вычисляют \texttt{1~+~2~=~3} на этапе компиляции
даже при \texttt{-O0}: в листинге нет инструкции сложения, сразу появляется
\texttt{movl~\$3}. Для вещественных констант при \texttt{-O2} картина различается:
GCC хранит результат \texttt{2.4~+~6.3~=~8.7} в секции \texttt{.rodata}
и загружает через \texttt{movsd~.LC1(\%rip)}, что требует обращения к памяти.
Clang и ICX встраивают IEEE~754-представление
(\texttt{0x4021666666666666}) прямо в инструкцию \texttt{movabsq}~---
обращения к памяти нет. В данном случае Clang и ICX эффективнее GCC.

\textbf{2. Арифметические тождества.}
GCC при \texttt{-O0} уже убирает бессмысленные операции: вместо \texttt{i+0},
\texttt{i/1} и \texttt{i*1} генерирует простой \texttt{mov}.
Clang и ICX при \texttt{-O0} следуют исходнику буквально:
\texttt{addl~\$0,~\%eax} (сложение с нулём), \texttt{idivl~\$1}
(деление~--- 20--90~тактов), \texttt{shll~\$0,~\%eax} (сдвиг на 0~бит),
\texttt{imull~\$0} (умножение вместо \texttt{movl~\$0}).
При \texttt{-O2} все три компилятора корректно оптимизируют эти конструкции.
Поведение Clang и ICX при \texttt{-O0} удобнее для отладки,
но очевидно неэффективно.

\textbf{3. Снижение мощности.}
Замена \texttt{4~*~j5} на \texttt{j5~<<~2} выполняется всеми тремя компиляторами
уже при \texttt{-O0}: умножение на степень двойки эквивалентно битовому сдвигу
(1~такт против 3--5~тактов). GCC использует мнемонику \texttt{sall},
Clang и ICX~--- \texttt{shll}: это одна и та же инструкция x86 (опкод \texttt{0xC1/4}).

\textbf{4. Лишнее присваивание.}
При \texttt{-O0} все компиляторы генерируют два одинаковых
\texttt{movl~\$1,~k3}. При \texttt{-O2} остаётся одна инструкция:
второй \texttt{mov} перезаписывает первый до его чтения~---
первый является мёртвым хранилищем (dead store) и убирается.

\textbf{5. Мёртвый код.}
Блок \texttt{if(0)\{printf(...)\}} убирается всеми компиляторами
уже при \texttt{-O0}. При \texttt{-O2} функция \texttt{dead\_code}
сводится к одному \texttt{ret}. Примечательно: GCC добавляет перед
\texttt{ret} инструкцию \texttt{endbr64}~--- метку допустимой цели
перехода для Intel~CET (Control-flow Enforcement Technology),
защищающей от атак типа ROP. Clang и ICX эту инструкцию не генерируют~---
потенциально менее защищённый, но на одну инструкцию короткий код.

\textbf{6. Ненужный цикл и хвостовые вызовы.}
Функция \texttt{unnecessary\_loop} содержит цикл из 5~итераций,
где \texttt{x~=~0}, значит \texttt{k5~=~j5} на каждой итерации.
При \texttt{-O2} все три компилятора полностью убирают цикл
и применяют оптимизацию хвостового вызова: \texttt{call~printf;~ret}
заменяется на \texttt{jmp~printf}, экономя кадр стека.
GCC вызывает защищённую версию \texttt{\_\_printf\_chk},
Clang и ICX~--- стандартный \texttt{printf}.

\textbf{7. Размотка цикла~--- ключевое различие компиляторов.}
GCC и Clang при \texttt{-O2} сохраняют цикл \texttt{loop\_unrolling}
из 6~итераций. ICX разворачивает его полностью~--- 6~прямых инструкций
записи, при этом объединяя запись двух элементов \texttt{short} в одну
инструкцию \texttt{movq} (8~байт). Устраняются 6~инструкций \texttt{cmpl}
и 6~инструкций \texttt{jle}; число обращений к памяти сокращается вдвое.
Аналогичная размотка применяется в \texttt{loop\_jamming}:
ICX раскрывает оба цикла по~5~итераций в прямую последовательность
с предвычисленными константами.

\textbf{8. Инвариант цикла и предвычисление массива.}
Выражение \texttt{j~*~k} в цикле по \texttt{ivector2} при \texttt{-O0}
вычисляется на каждой итерации. При \texttt{-O2} все три компилятора
выносят умножение за пределы цикла (loop-invariant code motion).
Цикл \texttt{ivector4[i]~=~i~*~2} при \texttt{-O2} полностью убирается:
значения \{0,\,2,\,4,\,6,\,8,\,10\} записываются двумя инструкциями.
GCC хранит их в \texttt{.rodata}, Clang и ICX встраивают 64-битную
константу \texttt{0x0006000400020000} прямо в \texttt{movabsq}.

\textbf{9. Замена деления умножением (только ICX).}
Операция \texttt{m3~=~(h3+k3)/i3} у GCC и Clang остаётся инструкцией
\texttt{idivl}. ICX при \texttt{-O2} заменяет её:
\begin{lstlisting}
; GCC/Clang:
idivl i3(%rip)            ; 20-90 тактов

; ICX -O2: деление на 3 без idiv
movl  $2863311531, %esi   ; = ceil(2^33 / 3)
imulq %rax, %rsi          ; 64-битное умножение
shrq  $33, %rsi           ; арифметический сдвиг
\end{lstlisting}
Математически: $\lfloor n/3\rfloor=\lfloor n\cdot\lceil 2^{33}/3\rceil/2^{33}\rfloor$.
\texttt{imulq}~+~\texttt{shrq} выполняются за 4--6~тактов~---
ускорение в 5--15~раз. GCC и Clang такую замену не производят.

\textbf{10. Инициализация FPU (только ICX).}
ICX при \texttt{-O2} добавляет в начало \texttt{main}:
\begin{lstlisting}
stmxcsr  4(%rsp)           ; сохранить регистр управления SSE
orl      $32832, 4(%rsp)   ; установить биты DAZ и FTZ (0x8040)
ldmxcsr  4(%rsp)           ; загрузить обратно
\end{lstlisting}
Биты DAZ (Denormals Are Zero) и FTZ (Flush To Zero) переводят
блок SSE в режим, где денормализованные числа заменяются нулём.
Обработка денормалей через микрокод занимает до 100~тактов;
в режиме DAZ/FTZ этого не происходит. GCC и Clang данную
инициализацию не выполняют.

\textbf{11. Адресация переменных.}
ICX при \texttt{-O0} использует абсолютную адресацию
(\texttt{movl~k5,~\%eax}~--- 8~байт на адрес), тогда как GCC и Clang~---
RIP-относительную (\texttt{movl~k5(\%rip),~\%eax}~--- 4~байта на смещение).
При \texttt{-O2} ICX переходит на RIP-относительную адресацию,
что стандартно для позиционно-независимого кода (PIC).

\textbf{Вывод по анализу листингов.}
Наибольшую агрессивность при \texttt{-O2} демонстрирует ICX:
единственный полностью разматывает короткие циклы,
заменяет деление умножением и инициализирует FPU.
GCC выделяется частичной оптимизацией уже при \texttt{-O0}
и добавлением защиты CET (\texttt{endbr64}).
Clang при \texttt{-O0} строго следует исходнику,
при \texttt{-O2}~--- эффективен наравне с GCC,
но уступает ICX в агрессивности преобразования циклов.
Все три компилятора одинаково хорошо справляются
с устранением мёртвого кода, ненужных циклов и лишних присваиваний.

% ─────────────────────────────────────────────────────────────────────────────
\section{Заключение}

В ходе выполнения работы получены следующие результаты:

\begin{itemize}[noitemsep,topsep=2pt]
    \item Тестовая программа \texttt{optbench.c} скомпилирована тремя
    компиляторами (GCC~13.3.0, Clang~18.1.3, Intel~ICX~2026.0.0)
    с флагами \texttt{-O0}, \texttt{-O2} и \texttt{-Os};
    для каждого варианта зафиксированы размер исполняемого файла и время выполнения.

    \item Получены и проанализированы ассемблерные листинги для 14~типов
    оптимизаций; составлены три сравнительные таблицы в формате
    «C-код~--- \texttt{-O0}~--- \texttt{-O2}» с подробными пояснениями.

    \item Установлено, что GCC при \texttt{-O0} уже частично оптимизирует код
    (убирает тождества \texttt{+0}, \texttt{/1}, \texttt{*1}),
    тогда как Clang и ICX строго следуют исходнику,
    генерируя бесполезные инструкции \texttt{addl~\$0},
    \texttt{idivl~\$1}, \texttt{shll~\$0}, \texttt{imull~\$0}.

    \item Выявлены уникальные оптимизации ICX: полная размотка коротких
    циклов (\texttt{loop\_unrolling}, \texttt{loop\_jamming}),
    замена деления умножением на магическое число,
    объединение записей через \texttt{movq}
    и инициализация FPU-режима DAZ/FTZ.

    \item Показано, что при \texttt{-O2} все три компилятора одинаково
    эффективно устраняют мёртвый код и мёртвые хранилища, ликвидируют
    ненужные циклы с применением хвостового вызова, выносят инварианты
    и предвычисляют константные массивы.

    \item Зафиксировано, что флаги оптимизации слабо влияют на время
    выполнения данного бенчмарка: программа IO-bound (многократные вызовы
    \texttt{printf}), системные вызовы составляют до~90\,\% времени.
\end{itemize}

Репозиторий с исходным кодом, ассемблерными листингами и всеми таблицами:
\url{https://github.com/Andrew2114/Compiler_optimization}.

\end{document}
