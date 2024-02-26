\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{bmstu}[2021/11/01 v1.0 BMSTU class]


% Настройка документа ----------------------------------------------------------
% ------------------------------------------------------------------------------

% Установка базового класса
\LoadClass[a4paper, oneside, 14pt]{extreport}

% Настройка кодировки и языков
\RequirePackage[T1, T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english,main=russian]{babel}

% Настройка полей
\RequirePackage[
	left=30mm,
	right=10mm, % Является требованием МГТУ, не соответствует ГОСТ 7.32-2017
	top=20mm,
	bottom=20mm,
]{geometry}

% Настройка переносов
\RequirePackage{microtype}
\sloppy

% Настройка межстрочного интервала
\RequirePackage{setspace}
\onehalfspacing

% Настройка абзацного отступа
\RequirePackage{indentfirst}
\setlength{\parindent}{12.5mm}

% Настройка заголовков
\makeatletter
\renewcommand\LARGE{\@setfontsize\LARGE{22pt}{20}}
\renewcommand\Large{\@setfontsize\Large{20pt}{20}}
\renewcommand\large{\@setfontsize\large{16pt}{20}}
\makeatother
\RequirePackage{titlesec}
\titleformat{\chapter}{\large\bfseries}{\thechapter}{14pt}{\large\bfseries}
\titleformat{name=\chapter,numberless}{}{}{0pt}{\large\bfseries\centering}
\titleformat{\section}{\large\bfseries}{\thesection}{14pt}{\large\bfseries}
\titleformat{\subsection}{\large\bfseries}{\thesubsection}{14pt}{\large\bfseries}
\titlespacing{\chapter}{12.5mm}{-22pt}{10pt}
\titlespacing{\section}{12.5mm}{10pt}{10pt}
\titlespacing{\subsection}{12.5mm}{10pt}{10pt}

% Подключения пакетов для фигур
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{wrapfig}
\RequirePackage{tikzscale}

% Создание рисунков
\newcommand{\imgw}[4]
{
	\begin{figure}[#2]
		\center{\includegraphics[width=#3]{inc/img/#1}}
		\ifthenelse{\isempty{#4}}{}{\caption{#4}}
		\label{img:#1}
	\end{figure}
}
\newcommand{\imgh}[4]
{
	\begin{figure}[#2]
		\center{\includegraphics[height=#3]{inc/img/#1}}
		\ifthenelse{\isempty{#4}}{}{\caption{#4}}
		\label{img:#1}
	\end{figure}
}
\newcommand{\imgs}[4]
{
	\begin{figure}[#2]
		\center{\includegraphics[scale=#3]{inc/img/#1}}
		\ifthenelse{\isempty{#4}}{}{\caption{#4}}
		\label{img:#1}
	\end{figure}
}
\newcommand{\imgr}[4]
{
	\begin{figure}[#2]
		\center{\includegraphics[width=#3, angle = 90]{inc/img/#1}}
		\caption[angle=90]{#4}
		\label{img:#1}
	\end{figure}
}

\newcommand{\imga}[3]
{
	\begin{figure}[#2]
		\center{\includegraphics[width=#3]{inc/img/#1}}
		\label{img:#1}
	\end{figure}
}

% % Поворот рисунков
% \RequirePackage{epsfig}
% \RequirePackage{rotating}

% \newcommand{\imgr}[4]
% {
% 	\begin{sidewaysfigure}
% 		\centerline{\epsfig{file=inc/img/#1.ps, scale=#3}}[#2]
% 			%\center{\includegraphics[scale=#3]{}}
% 			\caption{#4}
% 			\label{img:#1}
% 	\end{sidewaysfigure}
% }

% Подключение пакетов таблиц
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{longtable}

% Настройка графиков
\RequirePackage{pgfplots}
\pgfplotsset{compat=newest}

% Настройка листингов
\RequirePackage{listings}
\RequirePackage{listingsutf8}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codeblue}{rgb}{0.11,0.49,0.83}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\DeclareFixedFont{\ttb}{T1}{txtt}{bx}{n}{12} % for bold
\DeclareFixedFont{\ttm}{T1}{txtt}{m}{n}{12}  % for normal

\lstset{
	basicstyle=\small\ttm,
	commentstyle=\ttm,
	keywordstyle=\ttb,
	stringstyle=\ttm,
	frame=single,
	numbers=none,
	breaklines=true,
	% inputencoding=utf8/koi8-r,
	%escapeinside={(*}{*)}, %выделение
	literate={а}{{\selectfont\char224}}1
	{б}{{\selectfont\char225}}1
	{в}{{\selectfont\char226}}1
	{г}{{\selectfont\char227}}1
	{д}{{\selectfont\char228}}1
	{е}{{\selectfont\char229}}1
	{ё}{{\"e}}1
	{ж}{{\selectfont\char230}}1
	{з}{{\selectfont\char231}}1
	{и}{{\selectfont\char232}}1
	{й}{{\selectfont\char233}}1
	{к}{{\selectfont\char234}}1
	{л}{{\selectfont\char235}}1
	{м}{{\selectfont\char236}}1
	{н}{{\selectfont\char237}}1
	{о}{{\selectfont\char238}}1
	{п}{{\selectfont\char239}}1
	{р}{{\selectfont\char240}}1
	{с}{{\selectfont\char241}}1
	{т}{{\selectfont\char242}}1
	{у}{{\selectfont\char243}}1
	{ф}{{\selectfont\char244}}1
	{х}{{\selectfont\char245}}1
	{ц}{{\selectfont\char246}}1
	{ч}{{\selectfont\char247}}1
	{ш}{{\selectfont\char248}}1
	{щ}{{\selectfont\char249}}1
	{ъ}{{\selectfont\char250}}1
	{ы}{{\selectfont\char251}}1
	{ь}{{\selectfont\char252}}1
	{э}{{\selectfont\char253}}1
	{ю}{{\selectfont\char254}}1
	{я}{{\selectfont\char255}}1
	{А}{{\selectfont\char192}}1
	{Б}{{\selectfont\char193}}1
	{В}{{\selectfont\char194}}1
	{Г}{{\selectfont\char195}}1
	{Д}{{\selectfont\char196}}1
	{Е}{{\selectfont\char197}}1
	{Ё}{{\"E}}1
	{Ж}{{\selectfont\char198}}1
	{З}{{\selectfont\char199}}1
	{И}{{\selectfont\char200}}1
	{Й}{{\selectfont\char201}}1
	{К}{{\selectfont\char202}}1
	{Л}{{\selectfont\char203}}1
	{М}{{\selectfont\char204}}1
	{Н}{{\selectfont\char205}}1
	{О}{{\selectfont\char206}}1
	{П}{{\selectfont\char207}}1
	{Р}{{\selectfont\char208}}1
	{С}{{\selectfont\char209}}1
	{Т}{{\selectfont\char210}}1
	{У}{{\selectfont\char211}}1
	{Ф}{{\selectfont\char212}}1
	{Х}{{\selectfont\char213}}1
	{Ц}{{\selectfont\char214}}1
	{Ч}{{\selectfont\char215}}1
	{Ш}{{\selectfont\char216}}1
	{Щ}{{\selectfont\char217}}1
	{Ъ}{{\selectfont\char218}}1
	{Ы}{{\selectfont\char219}}1
	{Ь}{{\selectfont\char220}}1
	{Э}{{\selectfont\char221}}1
	{Ю}{{\selectfont\char222}}1
	{Я}{{\selectfont\char223}}1
}

% Создание листинга
\newcommand{\listingfile}[5]{
	\lstinputlisting[
		frame=single,
 		numbers=left, %%on/off
		abovecaptionskip=-5pt,
		showspaces=false,
        showstringspaces=false,
		abovecaptionskip=-5pt,
		caption={#4},
		label={lst:#2},
		language={#3},
		#5,
	]{inc/lst/#1}
}

% Настройка подписей
\RequirePackage[
	labelsep=endash,
	figurename=Рисунок,
	singlelinecheck=false,
]{caption}
\captionsetup[figure]{justification=centering}

% Подключение пакетов для альбомной ориентации
\RequirePackage{lscape}
\RequirePackage{afterpage}

% Подключение математических пакетов
\RequirePackage{amsmath}
\RequirePackage{amssymb}

% Настройка библиографии
\RequirePackage[
	style=gost-numeric,
	language=auto,
	autolang=other,
	sorting=none,
	backend=biber,
]{biblatex}
\RequirePackage{csquotes}

% Подключение пакета для гиперссылок
\RequirePackage[unicode, hidelinks]{hyperref}

% Подключение пакета для управляющих конструкций
\RequirePackage{xifthen}


% Титульная страница -----------------------------------------------------------
% ------------------------------------------------------------------------------

% Установка мета-данных выходного файла
\newcommand{\documentmeta}[4]
{
	\hypersetup{
		pdftitle={#1 #2 #3},
		pdfsubject={#4},
		pdfauthor={#2}
	}
}

% Cоздание полей
\RequirePackage[normalem]{ulem}
\RequirePackage{stackengine}
\newcommand{\longunderline}[1]
{
	\uline{#1\hfill\mbox{}}
}
\newcommand{\fixunderline}[3]
{
	$\underset{\text{#3}}{\text{\uline{\stackengine{0pt}{\hspace{#2}}{\text{#1}}{O}{c}{F}{F}{L}}}}$
}

% Создание горизонтальной линии
\makeatletter
\newcommand{\vhrulefill}[1]
{
	\leavevmode\leaders\hrule\@height#1\hfill \kern\z@
}
\makeatother

% Создание шапки титульной страницы
\newcommand{\titlepageheader}[2]
{
	\begin{wrapfigure}[7]{l}{0.14\linewidth}
		\vspace{3.4mm}
		\hspace{-8mm}
		\includegraphics[width=0.89\linewidth]{bmstu-logo}
	\end{wrapfigure}

	{
		\singlespacing \small
		Министерство науки и высшего образования Российской Федерации \\
		Федеральное государственное бюджетное образовательное учреждение \\
		высшего образования \\
		<<Московский государственный технический университет \\
		имени Н.~Э.~Баумана \\
		(национальный исследовательский университет)>> \\
		(МГТУ им. Н.~Э.~Баумана) \\
	}

	\vspace{-4.2mm}
	\vhrulefill{0.9mm} \\
	\vspace{-7mm}
	\vhrulefill{0.2mm} \\
	\vspace{2.8mm}

	{
		\small
		ФАКУЛЬТЕТ \longunderline{<<#1>>} \\
		\vspace{3.3mm}
		КАФЕДРА \longunderline{<<#2>>} \\
	}
}

% Установка заголовков РПЗ
\newcommand{\titlepagenotetitle}[2]
{
	{
		\LARGE \bfseries
		РАСЧЕТНО-ПОЯСНИТЕЛЬНАЯ ЗАПИСКА \\
	}
	\vspace{5mm}
	{
		\Large \itshape
		#1 \\
		\vspace{5mm}
		НА ТЕМУ: \\
		<<#2>> \\
	}
}

% Установка заголовков отчета
\newcommand{\titlepagereporttitle}[4]
{
	\textbf{ОТЧЕТ} \\
	по #1 \\
	\ifthenelse{\isempty{#2}}{}{по курсу <<#2>> \\}
	\ifthenelse{\isempty{#3}}{}{на тему: <<#3>> \\}
	\ifthenelse{\isempty{#4}}{}{Вариант №~#4 \\}
}

% Создание поля студента
\newcommand{\titlepagestudent}[2]
{
	Студент \fixunderline{#1}{25mm}{(Группа)} &
	\fixunderline{}{40mm}{(Подпись, дата)} \vspace{1.3mm} &
	\fixunderline{#2}{40mm}{(И.~О.~Фамилия)} \\
}

% Создание прочих полей
\newcommand{\titlepageothers}[2]
{
	#1 &
	\fixunderline{}{40mm}{(Подпись, дата)} \vspace{1.3mm} &
	\fixunderline{#2}{40mm}{(И.~О.~Фамилия)} \\
}

% Установка исполнителей работы
\newcommand{\titlepageauthors}[7]
{
	{
		\small
		\begin{tabularx}{\textwidth}{@{}>{\hsize=.5\hsize}X>{\hsize=.25\hsize}X>{\hsize=.25\hsize}X@{}}
			\titlepagestudent{#1}{#2}
			\titlepageothers{#3}{#4}
			\ifthenelse{\isempty{#5}}{}{\titlepageothers{Консультант}{#5}}
			\ifthenelse{\isempty{#6}}{}{\titlepageothers{Консультант}{#6}}
			\ifthenelse{\isempty{#7}}{}{\titlepageothers{Нормоконтролер}{#7}}
		\end{tabularx}
	}
}

% Создание титульной страницы РПЗ к ВКР
\makeatletter
\newcommand{\makethesistitle}[9]
{
	\documentmeta{РПЗ к ВКР}{#5}{#4}{#3}

	\begin{titlepage}
		\centering

		\titlepageheader{#1}{#2}
		\vspace{15.8mm}

		\titlepagenotetitle{К ВЫПУСКНОЙ КВАЛИФИКАЦИОННОЙ РАБОТЕ}{#3}
		\vfill

		\titlepageauthors{#4}{#5}{Руководитель ВКР}{#6}{#7}{#8}{#9}
		\vspace{14mm}

		\textit{{\the\year} г.}
	\end{titlepage}

	\setcounter{page}{2}
}
\makeatletter

% Создание титульной страницы РПЗ к КР
\makeatletter
\newcommand{\makecourseworktitle}[8]
{
	\documentmeta{РПЗ к КР}{#5}{#4}{#3}

	\begin{titlepage}
		\centering

		\titlepageheader{#1}{#2}
		\vspace{15.8mm}

		\titlepagenotetitle{К КУРСОВОЙ РАБОТЕ}{#3}
		\vfill

		\titlepageauthors{#4}{#5}{Руководитель курсовой работы}{#6}{#7}{#8}{}
		\vspace{14mm}

		\textit{{\the\year} г.}
	\end{titlepage}

	\setcounter{page}{2}
}
\makeatletter

% Создание титульной страницы отчета
\makeatletter
\newcommand{\makereporttitle}[9]
{
	\documentmeta{Отчет}{#8}{#3 #4}{#5}

	\begin{titlepage}
		\centering

		\titlepageheader{#1}{#2}
		\vspace{15.8mm}

		\titlepagereporttitle{#3}{#4}{#5}{#6}
		\vfill

		\titlepageauthors{#7}{#8}{Преподаватель}{#9}{}{}{}
		\vspace{14mm}

		\textit{{\the\year} г.}
	\end{titlepage}

	\setcounter{page}{2}
}
\makeatletter


% Реферат ----------------------------------------------------------------------
% ------------------------------------------------------------------------------

% Подсчет количества страниц
\RequirePackage{lastpage}

% Подсчет количества рисунков и таблиц
\RequirePackage{etoolbox}
\newcounter{totfigures}
\newcounter{tottables}
\providecommand\totfig{}
\providecommand\tottab{}
\makeatletter
\AtEndDocument{%
	\addtocounter{totfigures}{\value{figure}}%
	\addtocounter{tottables}{\value{table}}%
	\immediate\write\@mainaux{%
		\string\gdef\string\totfig{\number\value{totfigures}}%
		\string\gdef\string\tottab{\number\value{tottables}}%
	}%
}
\makeatother
\pretocmd{\chapter}{\addtocounter{totfigures}{\value{figure}}\setcounter{figure}{0}}{}{}
\pretocmd{\chapter}{\addtocounter{tottables}{\value{table}}\setcounter{table}{0}}{}{}

% Подсчет количества использованных источников
\newcounter{totbibentries}
\newcommand*{\listcounted}{}
\providecommand\totbib{}
\makeatletter
\AtDataInput{%
	\xifinlist{\abx@field@entrykey}\listcounted%
	{}%
	{\stepcounter{totbibentries}%
		\listxadd\listcounted{\abx@field@entrykey}}%
}%
\makeatother

% Подсчет количества приложений
\usepackage{totcount, assoccnt}
\newcounter{appendixchapters}
\DeclareAssociatedCounters{chapter}{appendixchapters}
\regtotcounter{appendixchapters}

% Создание страницы реферата
\newenvironment{essay}[1]
{
	\chapter*{РЕФЕРАТ}
	\addcontentsline{toc}{chapter}{РЕФЕРАТ}

	Расчетно-пояснительная записка содержит \begin{NoHyper}\pageref{LastPage}\end{NoHyper}~страниц, \totfig~рисунков, \tottab~таблиц, \thetotbibentries~источников, \total{appendixchapters}~приложение.

	\noindent \MakeUppercase{#1} \par
}{}


% Содержание -------------------------------------------------------------------
% ------------------------------------------------------------------------------

% Создание содержания
\newcommand{\maketableofcontents}
{
	\renewcommand\contentsname{СОДЕРЖАНИЕ}
	\tableofcontents
}


% Определения, обозначения и сокращения ----------------------------------------
% ------------------------------------------------------------------------------

% Создание элемента
\RequirePackage{enumitem}
\newcommand{\definition}[2]
{
	\item \noindent #1 --- #2
}

% Создание страницы определений
\newenvironment{definitions}
{
	\chapter*{ОПРЕДЕЛЕНИЯ}
	\addcontentsline{toc}{chapter}{ОПРЕДЕЛЕНИЯ}

	В настоящей расчетно-пояснительной записке применяют следующие термины с соответствующими определениями.

	\begin{description}[leftmargin=0pt]
}
{
	\end{description}
}

% Создание страницы обозначений и сокращений
\newenvironment{abbreviations}
{
	\chapter*{ОБОЗНАЧЕНИЯ И СОКРАЩЕНИЯ}
	\addcontentsline{toc}{chapter}{ОБОЗНАЧЕНИЯ И СОКРАЩЕНИЯ}

	В настоящей расчетно-пояснительной записке применяют следующие сокращения и обозначения.

	\begin{description}[leftmargin=0pt]
}
{
	\end{description}
}


% Список использованных источников ---------------------------------------------
% ------------------------------------------------------------------------------

% Создание списка использованных источников
\newcommand{\makebibliography}
{
	\printbibliography[title=СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ]
	\addcontentsline{toc}{chapter}{СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ}
}


% Приложения -------------------------------------------------------------------
% ------------------------------------------------------------------------------

% Установка заголовков приложений
\RequirePackage[
	titletoc,
	title,
]{appendix}
\AtBeginDocument{\renewcommand{\appendixname}{ПРИЛОЖЕНИЕ}}

% Создание приложений
\let\oldappendices\appendices
\let\oldendappendices\endappendices
\renewenvironment{appendices}
{
	\titleformat{\chapter}{\large\bfseries}{\appendixname~\thechapter}{0pt}{\centering\large\bfseries\\}
	\setcounter{appendixchapters}{0}
	\oldappendices
	\renewcommand{\thechapter}{\Asbuk{chapter}}
}
{
	\oldendappendices
}
