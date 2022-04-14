% !TEX encoding = UTF-8 Unicode
% !TEX TS-program = xelatex
% !BIB program = biber
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hdu_master_thesis}

\newif\if@blindreview\@blindreviewfalse


\DeclareOption{blindreview}{\@blindreviewtrue}
\ProcessOptions

\if@twoside
    \LoadClass[twoside,openright,a4paper,zihao=-4,fontset=none]{ctexbook}
\else
    \LoadClass[oneside,openright,a4paper,zihao=-4,fontset=none]{ctexbook}
\fi

\newcommand{\plaincite}[1]{\scalebox{1.3}[1.3]{\raisebox{-0.65ex}{\cite{#1}}}} %提供:"文献[1]提出..."的功能
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=0.15ex] (char) {#1};}}

%---------- 加载依赖 ----------
\PassOptionsToPackage{no-math,OT1}{fontspec} % 防止 fontspec 与 mathspec 冲突
\PassOptionsToPackage{backend=biber,style=gb7714-2015,gbnamefmt=lowercase,gbpub=true,gbpunctin=true}{biblatex} % 启用 GB/T 7714-2015 参考文献格式
\RequirePackage{calc,amsmath, amssymb}
\RequirePackage[paper=a4paper]{geometry}
\RequirePackage{bm}
\RequirePackage{cases}
\RequirePackage{pifont}
\RequirePackage{graphicx,caption,subcaption,longtable}
\RequirePackage{enumerate}
\RequirePackage{bigstrut}
\RequirePackage{booktabs,multirow,bookmark}
\RequirePackage[section]{placeins} % 确保图片排版不越过一节
\RequirePackage{float}
\RequirePackage{tabu}       % 制表宏包，推荐使用，不使用其他制表宏包。
\RequirePackage{ulem}       % 下划线
\RequirePackage{xeCJK}
\RequirePackage{xeCJKfntef}
\RequirePackage{CJKulem}    % CN下划线
\RequirePackage{array}      % 表格处理必备宏包
\RequirePackage{hyperref}   % hyperref 宏包可根据交叉引用生成超链接，同时生成 PDF 文档的书签。
\RequirePackage[algoruled, algosection, linesnumbered]{algorithm2e}
\RequirePackage{listings}   % 代码排印
\RequirePackage{titlesec}
\RequirePackage{pgfplots}
\RequirePackage{pgfplotstable}
\RequirePackage{tikz}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{hypernat}% hypernat 可以让hyperref 和natbib 混合使用，但它需要放在这两者之后。
\RequirePackage[all]{hypcap}% 修复图表超链接不准的问题
\RequirePackage[stable,perpage,symbol*]{footmisc}
\RequirePackage{amssymb,mathrsfs,amsmath}
\RequirePackage{setspace}
\RequirePackage{tagging}
\RequirePackage{biblatex}
\RequirePackage{makecell}
\RequirePackage{pdfpages}
%---------- 页边距设置 ----------
\if@twoside
    \geometry{twoside=true,top=3cm,bottom=2cm,left=3.6cm,right=2.5cm,headheight=10.5bp,headsep=1cm-10.5bp,footskip=1cm-2.953125bp}
\else
    \geometry{twoside=false,top=3cm,bottom=2cm,left=3.1cm,right=3.1cm,headheight=10.5bp,headsep=1cm-10.5bp,footskip=1cm-2.953125bp}
\fi


%---------- 字体设置 ----------
%设置英文字体为 TeX Gyre 系列字体为 TeX Gyre Termes / Heros / Cursor，它们兼容 Times / Helvetica / Courier
\setromanfont{texgyretermes-regular.otf}[BoldFont=template/fonts/texgyretermes-bold.otf,BoldItalicFont=template/fonts/texgyretermes-bolditalic.otf,ItalicFont=template/fonts/texgyretermes-italic.otf]
\setsansfont{texgyreheros-regular.otf}[BoldFont=template/fonts/texgyreheros-bold.otf,BoldItalicFont=template/fonts/texgyreheros-bolditalic.otf,ItalicFont=template/fonts/texgyreheros-italic.otf]
\setmonofont{texgyrecursor-regular.otf}[BoldFont=template/fonts/texgyrecursor-bold.otf,BoldItalicFont=template/fonts/texgyrecursor-bolditalic.otf,ItalicFont=template/fonts/texgyrecursor-italic.otf,Ligatures=NoCommon]
%设置主动调用字体
\setCJKfamilyfont{songti}{Adobe-Song-Std.otf}[Path=template/fonts/,AutoFakeBold=1.5,AutoFakeSlant=0.25]
\providecommand{\songti}{\CJKfamily{songti}}
\setCJKfamilyfont{fangsong}{Adobe-Fangsong-Std.otf}[Path=template/fonts/,AutoFakeBold=1.5,AutoFakeSlant=0.25]
\providecommand{\fangsong}{\CJKfamily{fangsong}}
\setCJKfamilyfont{heiti}{Adobe-Heiti-Std.otf}[Path=template/fonts/,AutoFakeBold=1.5,AutoFakeSlant=0.25]
\providecommand{\heiti}{\CJKfamily{heiti}}
\setCJKfamilyfont{kaishu}{Adobe-Kaiti-Std.otf}[Path=template/fonts/,AutoFakeBold=1.5,AutoFakeSlant=0.25]
\providecommand{\kaishu}{\CJKfamily{kaishu}}



% ---------- 页眉设置 ----------
% 设置基本页眉/脚 格式

\if@blindreview
    \gdef\hdu@pageheader{浙江省硕士学位论文}
\else
    \gdef\hdu@pageheader{杭州电子科技大学}
\fi

\pagestyle{fancy}
\fancyhf{}
\chead{\zihao{5}\songti\hdu@pageheader}
\cfoot{\thepage}
\renewcommand{\headrulewidth}{0.1mm}
\setlength{\headheight}{12.82645pt}
\addtolength{\topmargin}{-2.28708pt}
% ---------- 格式设置 ----------
\@namedef{hdu@spacechar}{\hspace{1em}} %产生一个空格
\newcommand{\nonumberchapter}[1]{\phantomsection\addcontentsline{toc}{chapter}{#1}\chapter*{#1}}
% 标题
\ctexset{
    secnumdepth     = 4,
    tocdepth        = 2,
    contentsname    = {目\texorpdfstring{{\hdu@spacechar}{\hdu@spacechar}}{}录},
    listfigurename  = {图\texorpdfstring{\hdu@spacechar}{}目\texorpdfstring{\hdu@spacechar}{}录},
    listtablename   = {表\texorpdfstring{\hdu@spacechar}{}目\texorpdfstring{\hdu@spacechar}{}录},
    abstractname    = {摘\texorpdfstring{{\hdu@spacechar}{\hdu@spacechar}}要},
    chapter = {
        name        = {第,章},
        number      = {\chinese{chapter}},
        aftername   = {\hdu@spacechar},
        format      = {\centering\heiti\zihao{3}},
        beforeskip  = {0bp},
        afterskip   = {25bp},
        pagestyle   = {fancy}
    },
    section = {
        format      = {\heiti\zihao{-3}},
        aftername   = {\hdu@spacechar},
        number      = {\arabic{chapter}{.}\arabic{section}},
        beforeskip  = {0bp},
        afterskip   = {0bp}
    },
    subsection = {
        format      = {\heiti\zihao{4}},
        aftername   = {\hdu@spacechar},
        number      = {\arabic{chapter}{.}\arabic{section}{.}\arabic{subsection}},
        beforeskip  = {0bp},
        afterskip   = {0bp}
    },
    subsubsection = {
        format      = {\bfseries\heiti\zihao{-4}},
        aftername   = {\hdu@spacechar},
        number      = {\arabic{chapter}{.}\arabic{section}{.}\arabic{subsection}{.}\arabic{subsubsection}},
        beforeskip  = {0bp},
        afterskip   = {0bp}
    }
}

% 中英文摘要配置
\newenvironment{cabstract}{%
    \nonumberchapter{摘\texorpdfstring{{\hdu@spacechar}{\hdu@spacechar}}{}要}
}{}

\newenvironment{eabstract}{%
    \nonumberchapter{ABSTRACT}
}{}

% 中英文关键字
\newcommand{\ckeywords}[1]{\vspace{5ex minus 4pt}\noindent{\textbf{关键词：}#1}}
\newcommand{\ekeywords}[1]{\vspace{5ex minus 4pt}\noindent{\textbf{Keywords:\allowbreak\ }#1}}

% \abstractmatter \frontmatter,\mainmatter,\backmatter重定义。
\renewcommand\frontmatter{%
	\if@openright\cleardoublepage\else\clearpage\fi%
    \pagenumbering{Roman}
	\@mainmatterfalse
	\pagestyle{fancy}
}

\renewcommand\mainmatter{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\@mainmattertrue
	\pagenumbering{arabic}
	\pagestyle{fancy}
}

\renewcommand\backmatter{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\@mainmatterfalse
}

\let\OLDappendix\appendix\newif\if@appendixinbackmatter\renewcommand\appendix{
	\if@mainmatter
		\@appendixinbackmatterfalse
		\OLDappendix
	\else
		\@appendixinbackmattertrue
		\@mainmattertrue
		\OLDappendix
		\renewcommand\@chapapp{附录~\thechapter}
		\gdef\thechapter{\@Alph\c@chapter}
	\fi
}

% 目录格式
\contentsmargin{0bp}
\titlecontents{chapter}[0em]{}{\thecontentslabel\hspace{1em}}{}{\titlerule*[0.25em]{.}\thecontentspage}
\titlecontents{section}[2em]{}{\thecontentslabel\hspace{1em}}{}{\titlerule*[0.25em]{.}\thecontentspage}
\titlecontents{subsection}[4em]{}{\thecontentslabel\hspace{1em}}{}{\titlerule*[0.25em]{.}\thecontentspage}

%% 图目录
\renewcommand\listoffigures{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\chapter{\listfigurename}
	\@starttoc{lof}
}

%% 表目录
\renewcommand\listoftables{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\chapter{\listtablename}
	\@starttoc{lot}
}


% ---------- 元素命名(\autoref使用) -----------
\renewcommand\equationautorefname{公式}%
\renewcommand\footnoteautorefname{脚注}%
\renewcommand\itemautorefname{项}%
\renewcommand\figureautorefname{图}%
\renewcommand\tableautorefname{表}%
\renewcommand\partautorefname{篇}%
\renewcommand\appendixautorefname{附录}%
\renewcommand\chapterautorefname{章}%
\renewcommand\sectionautorefname{节}%
\renewcommand\subsectionautorefname{小节}%
\renewcommand\subsubsectionautorefname{小节}%
\renewcommand\paragraphautorefname{段落}%
\renewcommand\subparagraphautorefname{子段落}%
\renewcommand\FancyVerbLineautorefname{行}%
\renewcommand{\theoremautorefname}{定理}%
\renewcommand{\lstlistingname}{代码}
\renewcommand{\figureautorefname}{图}
\renewcommand{\tableautorefname}{表}
\SetAlgorithmName{算法}{算法}


% ---------- 代码块设置 ----------
\lstset{
	basicstyle=\ttfamily\footnotesize, % 等宽字体
	breaklines=true,
	framextopmargin=30pt,
	framexleftmargin=37pt,
	framexrightmargin=5pt,
	framexbottommargin=5pt,
	%frame=bottomline, % 显示下框线
    columns=fixed,
    stringstyle=\rmfamily\slshape\color[RGB]{128,0,0},   % 设置字符串格式
    showstringspaces=false,                              % 不显示字符串中的空格
	showspaces=false,
	showtabs=false
}

% ---------- 细节设置 ----------
\hypersetup{
    unicode,
    % hyperfootnotes=false,
    pdfstartview=FitH,
    CJKbookmarks=true,
    bookmarksnumbered=true,
    bookmarksopen=true,
    % colorlinks=true,		% 链接颜色默认关闭，hidelink打开。
    % citecolor=blue,
    % linkcolor=blue,
    % anchorcolor=blue,
    % urlcolor=blue,
    hidelinks,			    % 隐藏超链接的颜色和边框。
    % draft,			    % 草稿模式，提高编译速度，需要时注释掉就可以了。
}

% 设置题注格式
\captionsetup{font=small,labelsep=space}

% 没有使用 固定的20磅 行间距
\renewcommand\baselinestretch{1.5} \normalsize
\setlength\baselineskip{20pt}

% 设置参考文献格式
\AtBeginDocument{\setlength{\bibitemsep}{0pt}}

% 设置浮动环境标题的字体大小。根据学位论文格式要求，插图和表格标题字体需要比正文
\captionsetup{%
	format=hang,
	labelsep=quad,		% 去掉图表号后的冒号。图序与图名文字之间空一个汉字宽度。
	skip=10pt,			% 标题与图标之间空10pt距离。
	font=small,			% 标题字体比正文小一号，这里取small。
	width=.75\textwidth % 标题最大宽度为0.75倍正文宽度。
}

% 根据学位论文格式要求，表格的标题必须位于表格上方，插图的标题必须位于插图下方。
\captionsetup[table]{position=above}
\captionsetup[figure]{position=below}

%% 以下为设置浮动对象和文字之间的距离。
% 版心顶部或者版心底部浮动体之间的垂直距离，默认为12pt plus 2pt minus 2pt。
\setlength{\floatsep}{20bp \@plus4pt \@minus1pt}

% 文本行之间浮动体（使用h位置选项）与上下文之间的距离，默认为12pt plus 2pt minus 2pt。
\setlength{\intextsep}{20bp \@plus4pt \@minus2pt}

% 版心顶部或底部的浮动体与文本之间的距离，默认为12pt plus 2pt minus 2pt。
\setlength{\textfloatsep}{20bp \@plus4pt \@minus2pt}

% 浮动页中，版心顶部的浮动体与版心顶边之间的距离，默认为0pt plus 1fil。
\setlength{\@fptop}{0bp \@plus1.0fil}

% 浮动页中浮动体直接的距离，默认为8pt plus 2fil。
\setlength{\@fpsep}{12bp \@plus2.0fil}

% 浮动页中，版心底部的浮动体与版心底边之间的距离，默认为0pt plus 1fil。
\setlength{\@fpbot}{0bp \@plus1.0fil}

%% 下面这组命令使浮动对象的缺省值稍微宽松一点，从而防止幅度对象占据过多的文本页面，也可以防止在很大空白的浮动页上放置很小的图形。
% 默认情况下，LaTeX要求每页的文字至少占据 20%，否则该页就只单独放置一个浮动环境。而这通常不是我们想要的。我们将这个要求降低到 5%。
\renewcommand{\textfraction}{0.05}

% 在一文本页中，被置于版心顶部的所有浮动体的高度与版心高度的最大比值，默认为0.7，
% 这里修改为0.9，任何造成高度超过版心高度90% 的浮动体都被将阻止置于当前版心顶部。
\renewcommand{\topfraction}{0.9}

% 同上，只不过变成了版心底部，默认为0.3.
\renewcommand{\bottomfraction}{0.8}

% 在任意一个“浮动页”中，所有的浮动体高度与版心的高度的最小比值，默认为 0.5，这里
% 设置成0.85。因此，浮动页中空白与版心的比值不会超过1-\floatpagefraction。
\renewcommand{\floatpagefraction}{0.85}

% PDF 元数据设置
\AtBeginDocument{\hypersetup{pdfinfo={
    Author={\@author},
    Title={\@title},
    CreationDate={D:20000101000000} % 随手抹除文件创建时间
}}}


% % ---------- 额外页面设置 ----------
\renewcommand*\title[1]{\gdef\hdu@title{#1}}				    	% 论文中文标题
\newcommand*\englishtitle[1]{\long\gdef\hdu@englishtitle{#1}}		% 论文英文标题
\newcommand*\blindreviewhead[1]{\gdef\hdu@blindreviewhead{#1}}	% 论文英文标题 全日制专业型研究生，全日制学术型研究生，...


\renewcommand*\author[1]{\gdef\hdu@author{#1}}			        	% 作者姓名
\newcommand*\englishauthor[1]{\long\gdef\hdu@englishauthor{#1}}		% 作者英文名

\newcommand*\research[1]{\gdef\hdu@research{#1}}					% 研究方向
\newcommand*\major[1]{\gdef\hdu@major{#1}}					% 研究专业


\newcommand*\supervisor[1]{\gdef\hdu@supervisor{#1}}				% 指导教师
\newcommand*\englishsupervisor[1]{\gdef\hdu@englishsupervisor{#1}}	% 指导教师英文名

\newcommand*\spvtitle[1]{\gdef\hdu@spvtitle{#1}}			    	% 指导教师职称 
\newcommand*\englishspvtitle[1]{\gdef\hdu@englishspvtitle{#1}}	    % 指导教师英文职称 


\newcommand*\submitdate[1]{\gdef\hdu@submitdate{#1}}				% 提交日期
\newcommand*\defencedate[1]{\gdef\hdu@defencedate{#1}}				% 答辩日期
\newcommand*\englishdefencedate[1]{\gdef\hdu@englishdefencedate{#1}}% 答辩日期英文版

% % 双面打印时空白页中间显示文本
\def\cleardoublepage{%
	\clearpage
	\if@twoside
	    \ifodd
			\c@page
		\else
            \footnotetext{留白（This page is intentionally left blank）}% 下面这个命令，如果不需要强调这是空白页，或者学校不允许，则可将其注释掉。
			\thispagestyle{fancy}%
			\hbox{}\newpage
			\if@twocolumn
				\hbox{}\newpage
			\fi
		\fi
	\fi
}

\newcommand\hdumakecover{
	\cleardoublepage
	\pdfbookmark[0]{封面}{anchor_cover}
	\thispagestyle{empty}
	\begin{center}
		\includegraphics[width=\linewidth]{template/logo/HDUlogo.pdf}\par
		\vspace{10mm}
		{
		    {\zihao{2}\songti\bfseries 硕\hspace{1em}士\hspace{1em}学\hspace{1em}位\hspace{1em}论\hspace{1em}文}
		}\par
		\vspace{36mm}
	\end{center}

	\vspace{6mm}

    \begin{center}
        \begin{tabular}[t]{rl}
            {\zihao{-2}\songti\bfseries{题\,\,\,目：}}&  \zihao{-2}\parbox[t]{260pt}{\zihao{-2}\kaishu\uline{\hdu@title\hfill}}
        \end{tabular}

        \vskip 10mm

        \begin{tabular}[t]{>{\zihao{3}\songti\bfseries}r>{\zihao{3}\kaishu}l}
            研\,\,\,究\,\,\,生：                    &  \zihao{3}\parbox[t]{200pt}{\uline{\hdu@author\hfill}} \\[3mm]
            专\,\,\,\,\,\,\,\,\,\,\,\,业：          &  \zihao{3}\parbox[t]{200pt}{\uline{\hdu@research\hfill}} \\[3mm]
            指导教师：                              &  \zihao{3}\parbox[t]{200pt}{\uline{\hdu@supervisor\,\,\,\hdu@spvtitle\hfill}} \\[30mm]
            {\zihao{4}\songti\bfseries{完成日期：}} &  \zihao{3}\parbox[t]{200pt}{\mdseries{\uline{\hdu@submitdate\hfill}}}
        \end{tabular}
    \end{center}
}

\newcommand\hdumakecntitlepage{
	\cleardoublepage
	\pdfbookmark[0]{中文题名页}{anchor_cntitle}
	\thispagestyle{empty}
	
	\linespread{1.3}
	\vspace*{2mm}
	\begin{center}
        {\zihao{2}\songti\bfseries 杭州电子科技大学硕士学位论文}

        \vspace{40mm}

        \begin{center}
        {\zihao{-1}\heiti\bfseries{\hdu@title\hfill}}
        \end{center}

        \vspace{60mm}

		\begin{tabular}{>{\zihao{3}\songti\bfseries}r>{\zihao{3}\kaishu}l}
			研\,\,\,究\,\,\,生： & {\hdu@author\hspace{1em}} \\[10mm]
			指导教师：  & {\hdu@supervisor \hspace{1em} \hdu@spvtitle} \\
		\end{tabular}

        \vspace{40mm}

        {\zihao{4}\kaishu{\hdu@defencedate}}
    \end{center}
}

\newcommand\hdumakeentitlepage{
	\cleardoublepage
	\pdfbookmark[0]{英文题名页}{anchor_entitle}
	\thispagestyle{empty}
	
	\linespread{1.3}
	\vspace*{2mm}
	\begin{center}
		{\zihao{4}\bfseries Dissertation Submitted to Hangzhou Dianzi University \\ for the Degree of Master}

        \vspace{40mm}

        \begin{center}
            {\zihao{-1}\bfseries{\hdu@englishtitle\hfill}}
        \end{center}

        \vspace{40mm}

        \begin{center}
            \begin{tabular}{>{\zihao{3}\bfseries}r>{\zihao{3}\bfseries }l}
                Candidate: & {\hdu@englishauthor \hspace{1em}}\\[10mm]
                Supervisor: & {\hdu@englishspvtitle\,\,\,\,\hdu@englishsupervisor\hspace{1em}}\\
            \end{tabular}
        \end{center}

        \vspace{40mm}

        {\zihao{4}\bfseries{\hdu@englishdefencedate}}
	\end{center}
}

\newcommand\makewarrantypage{
    \newcommand\signature@date{日期：\hspace{8ex}年\hspace{4ex}月\hspace{4ex}日}
	\cleardoublepage
	\pdfbookmark[0]{原创性声明}{anchor_os}
	\thispagestyle{empty}

	\vspace{-2em}
    \linespread{1.5}
    
    \begin{center}
        {\songti\zihao{-4}\songti\zihao{3}\bfseries{杭州电子科技大学 \\ 学位论文原创性声明和使用授权说明}}

        \vspace{2.5em}
        
        {\songti\zihao{4}\bfseries{原创性声明}}

        \vspace{1.5em}
    \end{center}

	本人郑重声明：所呈交的学位论文，是本人在导师的指导下，独立进行研究工作所取得
	的成果。除文中已经注明的引用的内容外，本论文不含任何其他个人或集体已经发表
	或撰写过的作品和成果。对本文的研究做出重要贡献的个人和集体，均已在文中以
	明确方式标明。申请学位论文与资料若有不实之处，本人承担一切相关责任。\\[2em]

	\noindent{论文作者签名：\hspace{13ex} \signature@date}
		
	\vspace{2.5em}

    \begin{center}
        {\songti\zihao{4}\bfseries{学位论文使用授权说明}}
    \end{center}

    \vspace{1.5em}
    
    本人完全了解杭州电子科技大学关于保留和使用学位论文的规定，即：研究生在校攻读%
    学位期间论文工作的知识产权单位属杭州电子科技大学。本人保证毕业离校后，发表论文%
    或使用论文工作成果时署名单位仍然为杭州电子科技大学。学校有权保留送交论文的复应件，%
    允许查阅和借阅论文；学校可以公布论文的全部或者部分内容，可以允许采用影印、缩印或其它复制手段保存论文。%
    （保密的论文在解密后遵守此规定）\\[2em]

    \noindent{论文作者签名：\hspace{13ex} \signature@date} \\[20pt]
    \noindent{指导教师签名：\hspace{13ex} \signature@date}
		
	
}

\newcommand\makeanonymouscover{
    \cleardoublepage
    \pdfbookmark[0]{盲审封面}{anchor_os}
	\thispagestyle{empty}

    \newgeometry{left=2.7cm, right=2.7cm, top=2.5cm, bottom=2.5cm}

    \noindent{\bfseries\zihao{5}\songti{\text{\ding{72}}\hdu@blindreviewhead}}

    \vspace{2cm}

    \noindent{\fontsize{30pt}{0pt}\selectfont\bfseries\songti{浙\,\,\,江\,\,\,省\,\,\,硕\,\,\,士\,\,\,学\,\,\,位\,\,\,论\,\,\,文}}

    \vspace{4cm}

    \begin{flushright}
        {\zihao{-2}\bfseries\songti{论文题目：}} \zihao{-2}\parbox[t]{18em}{\zihao{-2}\uline{\hdu@title\hfill}} \\[1em]

        {\zihao{-2}\bfseries\songti{专业名称：}} \zihao{-2}\parbox[t]{18em}{\zihao{-2}\songti\uline{\hdu@major\hfill}}  \\[1em]

        {\zihao{-2}\bfseries\songti{研究方向：}} \zihao{-2}\parbox[t]{18em}{\zihao{-2}\songti\uline{\hdu@research\hfill}}
    \end{flushright}


    \restoregeometry
}

\renewcommand{\maketitle}{
    \if@blindreview
        \makeanonymouscover
    \else
        \hdumakecover
        \hdumakecntitlepage
        \hdumakeentitlepage
        \makewarrantypage
    \fi
}

% ①->⑩
\DefineFNsymbols*{circlednumber}[text]{%
	{\ding{192}} %
	{\ding{193}} %
	{\ding{194}} %
	{\ding{195}} %
	{\ding{196}} %
	{\ding{197}} %
	{\ding{198}} %
	{\ding{199}} %
	{\ding{200}} %
	{\ding{201}}}
\setfnsymbol{circlednumber}
