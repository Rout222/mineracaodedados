\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sep}[2017/01/26 v2.0 Classe IF para trabalhos acadêmicos por Marcos Roberto Ribeiro]

% Repassa demais opções a abntex2
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{abntex2}%
}
\ProcessOptions\relax

% =============================================================================
% Herança da classe `abntex2' e inclusão das opções padrões
% =============================================================================
\LoadClass[article,12pt,oneside,a4paper,english,brazil,sumario=tradicional,section=TITLE]{abntex2}

% =============================================================================
% Pacotes Usados
% =============================================================================
\RequirePackage[T1]{fontenc}          % Seleção de códigos de fonte
\RequirePackage[utf8]{inputenc}       % Codificação automática de caracteres especiais
% Citações no formato ABNT
\let\oldbibcite\bibcite%
\RequirePackage[alf, abnt-emphasize=bf, abnt-repeated-author-omit=yes, abnt-missing-year=void, abnt-thesis-year=both]{abntex2cite}
\let\bibcite\oldbibcite%
\RequirePackage{lineno}               % Numeração de linhas
\RequirePackage{graphicx}             % Inclusão de gráficos
\RequirePackage{amsmath,amsfonts}     % Pacotes matemáticos
\RequirePackage{amssymb,amsthm}       % Pacotes matemáticos
\RequirePackage{color}                % Cores personalizadas
\RequirePackage{indentfirst}          % Indenta primeiro parágrafo
\RequirePackage{setspace}             % Espaços personalizados
% Personalização do formato página
\RequirePackage[a4paper,left=3.0cm,right=2.0cm,top=3.0cm,bottom=2.0cm, headsep=1.2cm]{geometry}

% =============================================================================
% Configurações
% =============================================================================

\renewcommand{\linenumberfont}{\normalfont\scriptsize\color{blue}}

% -----------------------------------------------------------------------------
% Alinhamento de títulos de flutuantes (tabelas, quadros e figuras) a esquerda
% -----------------------------------------------------------------------------
\captionstyle[\raggedright]{\raggedright}

% -----------------------------------------------------------------------------
% Seleção do idioma padrão
% -----------------------------------------------------------------------------
\selectlanguage{brazil}

% -----------------------------------------------------------------------------
% Inclusão de quadros
% -----------------------------------------------------------------------------
\newcommand{\quadronome}{Quadro}%
\newfloat{quadro}{loq}{\quadronome}%

% -----------------------------------------------------------------------------
% Inclusão de comandos LaTeX
% -----------------------------------------------------------------------------
\newcommand{\comando}[1]{\textbf{$\backslash$#1}}

% -----------------------------------------------------------------------------
% Resumo
% -----------------------------------------------------------------------------
\providecommand{\textoresumo}{}%
\providecommand{\textopalavraschave}{}%
\renewcommand{\resumo}[1]{%
  \renewcommand{\textoresumo}{#1}%
}%
\newcommand{\palavraschave}[1]{%
  \renewcommand{\textopalavraschave}{#1}%
}%

\newcommand{\geraresumo}{%
  \SingleSpacing%
  \ifthenelse{\not\equal{\textoresumo}{}}{%
    \begin{center}%
    \textbf{RESUMO}%
    \end{center}%
    \par\noindent%
    \textoresumo%
    \par%
    \vspace{\onelineskip}%
    \noindent\textbf{Palavras-chave:} \textopalavraschave%
  }{}%
  \OnehalfSpacing%
}%

% -----------------------------------------------------------------------------
% Abstract
% -----------------------------------------------------------------------------
\providecommand{\textotituloingles}{}%
\providecommand{\textoabstract}{}%
\providecommand{\textokeywords}{}%
\newcommand{\tituloingles}[1]{%
  \renewcommand{\textotituloingles}{#1}%
}%
\renewcommand{\abstract}[1]{%
  \renewcommand{\textoabstract}{#1}%
}%
\newcommand{\keywords}[1]{%
  \renewcommand{\textokeywords}{#1}%
}%

\newcommand{\geraabstract}{%
  \begin{center}%
    \textbf{\MakeUppercase{\textotituloingles}}%
  \end{center}%
  \par%
  \vspace{\onelineskip}%
  \SingleSpacing%
  \ifthenelse{\not\equal{\textoabstract}{}}{%
    \begin{center}%
    \textbf{ABSTRACT}%
    \end{center}%
    \par\noindent%
    \textoabstract%
    \par%
    \vspace{\onelineskip}%
    \noindent\textbf{Keywords:} \textokeywords%
  }{}%
  \OnehalfSpacing%
}%

% -----------------------------------------------------------------------------
% Tradução da seção de referências
% -----------------------------------------------------------------------------
\addto\captionsbrazil{%
\renewcommand{\bibname}{{\normalfont \textbf{{\normalsize REFER\^ENCIAS}}}}
}

% -----------------------------------------------------------------------------
% Personalização das fontes
% -----------------------------------------------------------------------------
\captionnamefont{\ABNTEXfontereduzida}
\captiontitlefont{\ABNTEXfontereduzida}

% -----------------------------------------------------------------------------
% Indentação de parágrafos
% -----------------------------------------------------------------------------
\parindent=1.25cm

% -----------------------------------------------------------------------------
% Reduz o tamanho das fontes de \section para equivalentes a 12 pt
% -----------------------------------------------------------------------------
\setsecheadstyle{\bfseries \small}
\setsubsecheadstyle{\bfseries\sethangfrom{\noindent ##1}\raggedright}
\setbeforesubsecskip{-\onelineskip}
\setaftersubsecskip{\onelineskip}

% -----------------------------------------------------------------------------
% Ambiente baseados em teoremas
% -----------------------------------------------------------------------------
\theoremstyle{definition}%
\newtheorem{corolario}{Corolário}%
\newtheorem{definicao}{Definição}%
\newtheorem{exemplo}{Exemplo}%
\newtheorem{lema}{Lema}%
\newtheorem{observacao}{Observação}%
\newtheorem{proposicao}{Proposição}%
\newtheorem{teorema}{Teorema}%
\newenvironment{demonstracao}{\begin{proof}[Demonstração]}{\end{proof}}%

% -----------------------------------------------------------------------------
% Estilo de página com numeração no canto superior direito
% -----------------------------------------------------------------------------
\makepagestyle{pagartigo}
\makeevenhead{pagartigo}{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}
\makeoddhead{pagartigo}{}{}{\ABNTEXfontereduzida\thepage}

\AfterBeginDocument{\pagestyle{pagartigo}}

% -----------------------------------------------------------------------------
% Evita violação de margens
% -----------------------------------------------------------------------------
\sloppy%

% -----------------------------------------------------------------------------
% Redefinição do \maketitle
% -----------------------------------------------------------------------------
\renewcommand{\maketitle}{%
\vspace{1cm}%
\begin{center}%
   \textbf{\MakeUppercase{\imprimirtitulo}}%
   \par%
   \vspace{\onelineskip}%
   \par%
   \imprimirautor%
\end{center}
\par%
\vspace{\onelineskip}%
\geraresumo%
}

\AtEndDocument{\geraabstract}

% -----------------------------------------------------------------------------
% Configurações para o PDF
% -----------------------------------------------------------------------------
\RequirePackage{hyperref}%
\makeatletter%
\hypersetup{%
    pdftitle={\@title},%
    pdfauthor={\@author},%
    pdfkeywords={\textopalavraschave},%
}%
\makeatother%
