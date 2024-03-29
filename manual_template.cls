%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%                                                                  %%%%% 
%%%%%%            Document d'estil per manuals d'instruccions           %%%%% 
%%%%%%                                                                  %%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                         %%
%%         Author: Llu�s Hontecillas Guinart (lluis.honte@gmail.com)       %% 
%%                                                                         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Versi� 1.0.0 - Septembre 2020 - Control de versions en GitHub:          %%
%% latex-manual-template                                                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%----------------------------------------------------------------------------------------%%%
%%%                                  IDENTIFICATION                                        %%%
%%%----------------------------------------------------------------------------------------%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{manual_template}
              [2020/12/02 Lluis document style]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%----------------------------------------------------------------------------------------%%%
%%%                                 INITIAL CODE                                           %%%
%%%----------------------------------------------------------------------------------------%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifthen}

% Declaraci� de la variable booleana per definir els marges en funci� si �s a doble cara o no
% M�s endavant es modificaran les caracter�stiques de cadascuna
\newboolean{twoside}     
\newboolean{mparswitch}

% Variables per mostrar el document resultant amb imatges i tot o simplement per mostrar
% on anir� cada cosa
\newboolean{@draft} \setboolean{@draft}{false}
\newboolean{@final} \setboolean{@final}{false}

% Variables dels possibles idiomes del document
\newboolean{Lcat}   \setboolean{Lcat}{true}
\newboolean{Leng}   \setboolean{Leng}{false}
\newboolean{Les}	\setboolean{Les}{false}

%
% \newboolean{PFC}         \setboolean{PFC}{false} % NOT USED
\newboolean{manual}	    \setboolean{manual}{false}
\newboolean{autor}     	\setboolean{autor}{true}
\newboolean{logo}       \setboolean{logo}{false}
\newboolean{coverpage}	\setboolean{coverpage}{false}
\newboolean{paginaLOF}  \setboolean{paginaLOF}{false}
\newboolean{paginaLOT}  \setboolean{paginaLOT}{false}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%----------------------------------------------------------------------------------------%%%
%%%                        OPTIONS DECLARATION and EXECUTION                               %%%
%%%----------------------------------------------------------------------------------------%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Switch entre les dues opcions de "a doble cara" o "a una cara" per definir les dimensions
% del paper
\DeclareOption{oneside}{\setboolean{twoside}{false} \setboolean{mparswitch}{false}}
\DeclareOption{twoside}{\setboolean{twoside}{true} 	\setboolean{mparswitch}{true}}

\DeclareOption{draft}{\AtEndOfClass{\setlength\overfullrule{10pt}	\setboolean{@draft}{true}}}
\DeclareOption{final}{\AtEndOfClass{\setlength\overfullrule{0pt} 	\setboolean{@final}{true}}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
%\DeclareOption*{code}  -->  code execution for a unknown option
%\PassOptionsToPackage{option}{pack}
%\CurrentOption

%% EXECUTION OF OPTIONS
% default options if not specified 
\ExecuteOptions{twoside,final}  
\ProcessOptions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%----------------------------------------------------------------------------------------%%%
%%%                                 PACKAGE LOADING                                        %%%
%%%----------------------------------------------------------------------------------------%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[a4paper,12pt]{book}
%\LoadClass{book}

%%% FancyHeadings, nextpage, calc, praphics packages are required
\RequirePackage{calc}                %% Allows basic operations inside LaTeX commands
\RequirePackage{helvet}              %% Set the default font family
\RequirePackage{pslatex}             %% Arialfont 
\RequirePackage{fancyhdr,nextpage}   %% Fancy Headers. Next page can force empty style when  
                                     %% blank page is inserted due to chapter change        
                                     %% by using \cleartooddpage instead of \cleardoublepage
\RequirePackage[export]{adjustbox}
\RequirePackage[subfigure]{tocloft}  %% Controls typografic design of the TOC, LOF etc...
\RequirePackage{graphicx}            %% Include graphic files
\RequirePackage{url}                 %% Allows a easy handle of URLs
                                     %% (very helpful in the bibliography!)


\renewcommand{\familydefault}{\sfdefault}  %% sans-serif is default
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%----------------------------------------------------------------------------------------%%%
%%%                              DOCUMENT CLASS DEFINITIONS                                %%%
%%%----------------------------------------------------------------------------------------%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%\ifthenelse{test}{thencode}{elsecode}
%%\equal{string1}{string2}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%------------------------------------------------------------------------------------------%%
%% PAGE LAYOUT                                                                              %%
%%------------------------------------------------------------------------------------------%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% NOTE!!: All margin dimensions are measured from a point one inch from top and side of page.  

%%%%%%%%%% HORIZONTAL SPACING %%%%%%%%%%
% En aquest cas el \hoffset �s zero i per tant el marge horitzontal per defecte es d'una
% polzada

\ifthenelse{\boolean{twoside}}{% Values for two-sided printing:
  \setlength{\oddsidemargin}{-0.45cm}      %   Left margin on odd-numbered pages.
  \setlength{\evensidemargin}{-0.46cm}     %   Left margin on even-numbered pages.
  \setlength{\marginparwidth}{0cm}        %   Width of marginal notes.
  \setlength{\marginparsep}{0cm}            % Horizontal space between outer margin and marginal note
}
{% Values for one-sided printing:
  \setlength{\oddsidemargin}{0.46cm}      %   Left margin on odd-numbered pages.
  \setlength{\evensidemargin}{0.46cm}       %   Left margin on even-numbered pages.
  \setlength{\marginparwidth}{0cm}        %   Width of marginal notes.
  \setlength{\marginparsep}{0pt}            % Horizontal space between outer margin and marginal note
}
%\setlength{\hoffset}{-1cm}


%%%%%%%%%% VERTICAL SPACING %%%%%%%%%%
% Top of page:
\setlength{\headheight}{1\baselineskip + 0.1pt}    % Height of box containing running head.
\setlength{\headsep}{8mm}    % Space between running head and text.
\setlength{\topmargin}{-0.04cm - \headheight - \headsep}    % Nominal distance from top of page to top of box containing running head.

% Bottom of page:
\setlength{\footskip}{7mm}    % Distance from baseline of box containing foot to baseline of last line of text.


%%%%%%%%%% DIMENSION OF TEXT %%%%%%%%%%
\setlength{\textheight}{24.6cm}    % \textheight is the height of text (including footnotes and figures, excluding running head and foot).
\setlength{\textwidth}{16.5cm}    % Width of text line.

% A \raggedbottom command causes 'ragged bottom' pages: pages set to natural height instead of being stretched to exactly \textheight.
\raggedbottom


%%%%%%%%%% FOOTNOTES %%%%%%%%%%
\setlength{\footnotesep}{8.4pt}    % Height of strut placed at the beginning of every footnote = height of normal \footnotesize strut, so no extra space between footnotes.

%%\skip\footins 10.8pt plus 4pt minus 2pt  % Space between last line of text and top of first footnote.


%%%%%%%%%% FLOATS: (a float is something like a figure or table) %%%%%%%%%%
% FOR FLOATS ON A TEXT PAGE

%    ONE-COLUMN MODE OR SINGLE-COLUMN FLOATS IN TWO-COLUMN MODE:
\setlength{\floatsep}{14pt plus 2pt minus 4pt}           % Space between adjacent floats moved  to top or bottom of text page.
\setlength{\textfloatsep}{20pt plus 2pt minus 4pt}       % Space between main text and floats at top or bottom of page.
\setlength{\intextsep}{14pt plus 4pt minus 4pt}          % Space between in-text figures and text
%    TWO-COLUMN FLOATS IN TWO-COLUMN MODE:
\setlength{\dblfloatsep}{14pt plus 2pt minus 4pt}        % Same as \floatsep for double-column figures in two-column mode.
\setlength{\dbltextfloatsep}{20pt plus 2pt minus 4pt}    % \textfloatsep for double-column floats.

% FOR FLOATS ON A SEPARATE FLOAT PAGE OR COLUMN
%    ONE-COLUMN MODE OR SINGLE-COLUMN FLOATS IN TWO-COLUMN MODE:
\setlength{\@fptop}{0pt plus 1fil}      % Stretch at top of float page/column. (Must be 0pt plus ...)          
\setlength{\@fpsep}{10pt plus 2fil}     % Space between floats on float page/column.       
\setlength{\@fpbot}{0pt plus 1fil}      % Stretch at bottom of float page/column. (Must be 0pt plus ... )    
%   DOUBLE-COLUMN FLOATS IN TWO-COLUMN MODE.
\setlength{\@dblfptop}{0pt plus 1fil}   % Stretch at top of float page. (Must be 0pt plus ...)
\setlength{\@dblfpsep}{10pt plus 2fil}  % Space between floats on float page.
\setlength{\@dblfpbot}{0pt plus 1fil}   % Stretch at bottom of float page. (Must be 0pt plus ... )     


%%%%%%%%%% MARGINAL NOTES %%%%%%%%%%
\setlength{\marginparpush}{7pt}       % Minimum vertical separation between two marginal notes.




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%------------------------------------------------------------------------------------------%%
%% NEW ENVIRONMENT DEFINITIONS                                                              %%
%%------------------------------------------------------------------------------------------%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%% LOGO DESIGN %%%%%%%%%%
\newlength{\LogoHeight}  
\setlength{\LogoHeight}{1.5cm}

\newlength{\LogoWidth}
\setlength{\LogoWidth}{2cm}

\newsavebox{\LogoLL}
\sbox{\LogoLL}{
  \includegraphics[right, scale = 0.5]{./setup/drone_logo.jpg}
}
%\sbox{\logoLL}{
%  \includegraphics[llx =  22cm, lly =  12cm]
%  [urx = 23cm, ury = 14cm]{./setup/drone_logo.jpg}
%}

\newcommand{\mylogo}[2]
{ 
  \newlength{\logoHeight} 
  \newsavebox{\logoImg}      
  \setlength{\logoHeight}{#2}
  \sbox{\logoImg}{\includegraphics[totalheight=\logoHeight, right]{#1}}
}


%%%%%%%%%% COVER IMAGE DESIGN %%%%%%%%%%
\newlength{\CoverImgHeight}	
\setlength{\CoverImgHeight}{10cm}

\newlength{\CoverImgWidth}
\setlength{\CoverImgWidth}{16.5cm}

\newsavebox{\CoverImgLL}
\sbox{\CoverImgLL}{\includegraphics[width=\CoverImgWidth]{./setup/drone_cover}}

\newcommand{\mycoverImg}[2]
{ 
  \newlength{\coverImgWidth} 
  \newsavebox{\coverImg}      
  \setlength{\coverImgWidth}{#2}
  \sbox{\coverImg}{\includegraphics[width=\coverImgWidth]{#1}}
}

%%%%%%%%%% TITLE DESIGN %%%%%%%%%%
\newcommand{\@titol}{Falta titol!}
\newcommand{\titol}[1]{\renewcommand{\@titol}{#1}}

\newcommand{\@titolE}{Falta titol Angles!}
\newcommand{\titolE}[1]{\renewcommand{\@titolE}{#1}}

\newcommand{\@titolC}{Falta titol Catala!}
\newcommand{\titolC}[1]{\renewcommand{\@titolC}{#1}}

\newcommand{\@titolES}{Falta titol Castella!}
\newcommand{\titolES}[1]{\renewcommand{\@titolES}{#1}}


%%%%%%%%%% AUTHORS DESIGN %%%%%%%%%%
\newcommand{\@autorC}{Falta autor!}
\newcommand{\autorC}[1]{\renewcommand{\@autorC}{#1}}

\newcommand{\@autorE}{Author missing!}
\newcommand{\autorE}[1]{\renewcommand{\@autorE}{Author: #1}}

\newcommand{\@autorES}{Falta autor!}
\newcommand{\autorES}[1]{\renewcommand{\@autorES}{Autor: #1}}

%\newlength{\Lautors}


%%%%%%%%%% PORTADA ENVIRONMENT %%%%%%%%%%
\newcommand{\portada}{
  \ifthenelse{\boolean{Lcat}}{
      \newcommand{\@NtitolMANUAL}{T\'itol del manual}
      \newcommand{\@Nautor}{Autor}
      \newcommand{\@Ntitulacio}{Titulaci\'o}
      \newcommand{\@Ndata}{Data}
  }{
  	\ifthenelse{\boolean{Les}}{
      \newcommand{\@NtitolMANUAL}{T\'itulo del manual}
      \newcommand{\@Nautor}{Autor}
      \newcommand{\@Ntitulacio}{Titulaci\'on}
      \newcommand{\@Ndata}{Fecha}    
    }{
  	  \newcommand{\@NtitolMANUAL}{Manual title}
      \newcommand{\@Nautor}{Author}
      \newcommand{\@Ntitulacio}{Degree}
      \newcommand{\@Ndata}{Date} 
    }
  }

  %\settowidth{\Lautors}{{\normalsize\bf\sffamily\MakeUppercase   \@Nautors : }}
  %\settowidth{\Ldirectors}{{\normalsize\bf\sffamily\MakeUppercase \@Ndirectors :}}
  %\renewcommand{\and}{\\ \hspace*{\Lautors}}

  \begin{tabular}{p{\textwidth}}
    
    % LOGO
    \ifthenelse{\boolean{logo}}
    {
      \begin{flushright}
        \usebox{\LogoLL}  \hfill \usebox{\logoImg}
    	\end{flushright}
    	\\[1cm]
    }{
      \begin{flushright}
        \usebox{\LogoLL} 
  	  \end{flushright}
    	\\[1cm]
    }
    
    % ------------------------------------------------------------
    % TITOL
    
    % Horizontal line
    \noindent\makebox[\linewidth]{\rule{\textwidth}{1.8pt}}

    \ifthenelse{\boolean{Lcat}}
    {
		\begin{center}
			\Huge\rmfamily  \@titolC 
      	\end{center}  
    }
    {
	  	\ifthenelse{\boolean{Leng}}
	  	{
      		\begin{center}
  				\Huge\rmfamily  \@titolE 
  			\end{center}  
	   	}
	   	{
      		\begin{center}
        		\Huge\rmfamily  \@titolES  
      		\end{center}  
      }
    }

    % Horizontal line
    \noindent\makebox[\linewidth]{\rule{\textwidth}{1.8pt}}

    % ------------------------------------------------------------
    % AUTHORS
    \\[1.5cm]
    \ifthenelse{\boolean{autor}}
    {
	    \ifthenelse{\boolean{Lcat}} 
	    {
	    	\begin{center}
    			\large\rmfamily \textit{\@autorC}\\
    			\textit{\today}
	    	\end{center}
	    }
	    {
	      	\ifthenelse{\boolean{Leng}} 
	      	{ 
	      		\begin{center}
    				\large\rmfamily \textit{\@autorE}
	    		\end{center} 
	      	}
	      	{
	      		 \begin{center}
    				\large\rmfamily \textit{\@autorES} 
	    		\end{center} 
	      	}
	    }
    }

    \\[2.5cm]

    % ------------------------------------------------------------
    % IMATGE PRINCIPAL
    
    \ifthenelse{\boolean{coverpage}}
    {
      \begin{centering}
    		\usebox{\coverImg}
    	\end{centering}
    }
    {
    	\begin{centering}
    		\usebox{\CoverImgLL}
    	\end{centering}
    }


    %\fbox{\parbox{\textwidth}{
    %    \vspace{2ex}
    %    \ifthenelse{\boolean{PFC}}{{\normalsize\bf\sffamily\MakeUppercase \@NtitolPFC : \@titol}  \\[2ex]}
    %                              {{\normalsize\bf\sffamily\MakeUppercase \@NtitolMANUAL : \@titol}  \\[2ex]}
    %               {\normalsize\bf\sffamily\MakeUppercase   \@Ntitulacio : \@titulacio    }  \\[2ex]
    %               \ifthenelse{\boolean{autor}}{{\normalsize\bf\sffamily\MakeUppercase \@Nautor :  \@autor  } \\[2ex]}
    %                                             {{\normalsize\bf\sffamily\MakeUppercase \@Nautors : \@autor  } \\[2ex]}
    %               \ifthenelse{\boolean{UNdirector}}{{\normalsize\bf\sffamily\MakeUppercase  \@Ndirector :  \@director }  \\[2ex]}
    %                                                {{\normalsize\bf\sffamily\MakeUppercase  \@Ndirectors : \@director \\ \hspace*{\Ldirectors} \@segondirector }  \\[2ex]}
    %                          \ifthenelse{\boolean{supervisor}}{{\normalsize\bf\sffamily\MakeUppercase  \@Nsupervisor : \@supervisor  } \\[2ex]}{}
    %                                     {\normalsize\bf\sffamily\MakeUppercase  \@Ndata : \today               }  \\[2ex]
    %}} \\
    
  \end{tabular}
  \cleardoublepage
}

\newcommand{\beforepreface}
{
	\pagestyle{empty}
  	\pagenumbering{roman}
  	\setlength{\parskip}{0ex}
  	\setlength{\parindent}{0ex}
  	\portada
}

\newcommand{\afterpreface}{
  	\pagestyle{fancy}
  	\pagenumbering{arabic}

  	% \ifdedicatoria
   %  	\vspace*{5cm}
   %  	\begin{flushright}
   %    		\@textDedicatoria
   %  	\end{flushright}
   %  	\cleartooddpage[\thispagestyle{empty}]  
  	% \fi
  	
  	\tableofcontents
  	\cleartooddpage[\thispagestyle{empty}]
  	
 %  	\ifpaginaLOF
 %      \addcontentsline{toc}{section}{List of Figures}
 %    	\listoffigures
 %    	\cleartooddpage[\thispagestyle{empty}]
 %  	\fi
  	
 %  	\ifpaginaLOT
	% % \addcontentsline{toc}{section}{List of Tables}
 %  		\listoftables 
 %  		\cleartooddpage[\thispagestyle{empty}]
 %  	\fi
  	
  	\setlength{\parskip}{\normalparskip}
  	\setlength{\parindent}{\normalparindent}
  	\cleartooddpage[\thispagestyle{empty}]
  	% Define the chapter information (for the header):
    \renewcommand{\chaptermark}[1]{\markboth{\sffamily\small\@chapapp{} \thechapter\ - \ ##1}{}}
  	% Define the section information (for the header):
    \renewcommand{\sectionmark}[1]{\markright{\sffamily\small \thesection \ ##1}}
    \headingson
  	
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HEADERS AND FOOTERS DESIGN                                                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\headrulewidth{0.5pt}
\renewcommand\footrulewidth{0pt}
%\addtolength{\headwidth}{\marginparwidth+\marginparsep}   % Span headwidth to marginal notes

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% REDEFINITION OF PAGE MARKERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\sectionmark}[1]{\markright{#1}}
\renewcommand{\chaptermark}[1]{\markboth{\footnotesize #1}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HEADERS AND FOOTERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\lhead[\fancyplain{}{\footnotesize \thepage}]{\fancyplain{\leftmark}{\leftmark}}
\chead{}
\rhead[\fancyplain{}{\footnotesize \@titol}]{\fancyplain{}{\footnotesize \thepage}}
\lfoot{}
\cfoot{}
\rfoot{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TABLE OF CONTENTS DEFINITION                                                             %%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\tocloftpagestyle{empty}
    
%% TOC title configuration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\cftbeforetoctitleskip}{0ex}
\setlength{\cftaftertoctitleskip}{0ex}
\renewcommand{\cfttoctitlefont}{\LARGE\sffamily\bfseries\MakeUppercase}
\renewcommand{\cftaftertoctitle}{\\}

%% LOF title configuration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\cftbeforeloftitleskip}{0pt}
\setlength{\cftafterloftitleskip}{0ex}
\renewcommand{\cftloftitlefont}{\LARGE\sffamily\bfseries\MakeUppercase}
\renewcommand{\cftafterloftitle}{\\}

%% LOT title configuration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\cftbeforelottitleskip}{0pt}
\setlength{\cftafterlottitleskip}{0ex}
\renewcommand{\cftlottitlefont}{\LARGE\sffamily\bfseries\MakeUppercase}
\renewcommand{\cftafterlottitle}{\\}

% TOC chapter configuration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Chapters
\setlength{\cftbeforechapskip}{2em}   
\setlength{\cftchapindent}{0em}
\setlength{\cftchapnumwidth}{7em}
\renewcommand{\cftchapleader}{\bfseries\cftsecleader}
\renewcommand{\cftchapfont}{\large\sffamily\bfseries}
\renewcommand{\cftchappagefont}{\large\sffamily\bfseries} 
\renewcommand{\cftchappresnum}{\MakeUppercase \@chapapp{} \space}%
\renewcommand{\cftchapaftersnum}{. \space}%
%\renewcommand{\cftchapaftersnumb}{}%

%% Sections
\setlength{\cftbeforesecskip}{1em}   
\setlength{\cftsecindent}{0em}
\setlength{\cftsecnumwidth}{2em}
\renewcommand{\cftsecfont}{\normalsize\sffamily\bfseries}
\renewcommand{\cftsecpagefont}{\normalsize\sffamily\bfseries} 
\renewcommand{\cftsecpresnum}{}%
\renewcommand{\cftsecaftersnum}{}%
%\renewcommand{\cftsecaftersnumb}{}%

%% Subsections
\setlength{\cftbeforesubsecskip}{0.2em}   
\setlength{\cftsubsecindent}{3em}
\setlength{\cftsubsecnumwidth}{3em}
\renewcommand{\cftsubsecfont}{\normalsize\sffamily}
\renewcommand{\cftsubsecpagefont}{\normalsize\sffamily} 
\renewcommand{\cftsubsecpresnum}{}%
\renewcommand{\cftsubsecaftersnum}{}%
%\renewcommand{\cftsecaftersnumb}{}%

% Table of figures and table of tables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\l@figure}{\@dottedtocline{1}{0em}{2em}}
\renewcommand{\l@table}{\l@figure}

%%%% specifies the highest level appearing in the table of contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{2}
%\setcounter{minitocdepth}{4}         % idem for mini table of contents

%%%% configures minitoc font properties
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\setlength{\mtcindent}{24pt}
%\renewcommand{\mtifont}{\huge\sffamily\bfseries}
%\renewcommand{\mtcfont}{\normalsize\rm}
%\nomtcrule   %%% supress rule in minitoc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PARAGRAPHING                                                                             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
\setlength{\parskip}{2ex}          % Extra vertical space between paragraphs (added to \baselineskip)
\setlength{\parindent}{0em}        % Width of paragraph indentation.

\setlength{\topsep}{0.5ex}         % Extra vertical space, in addition to 
                                   % \parskip, added above and below list and
                                   % paragraphing environments.
\setlength{\partopsep}{0.5ex}      % Extra vertical space, in addition to 
                                   % \parskip and \topsep, added when user
                                   % leaves blank line before environment.

\setlength{\itemsep}{1pt}          % Extra vertical space, in addition to 
                                   % \parskip, added between list items.

% The following page-breaking penalties are defined

%\@lowpenalty   51      % Produced by \nopagebreak[1] or \nolinebreak[1]
%\@medpenalty  151      % Produced by \nopagebreak[2] or \nolinebreak[2]
%\@highpenalty 301      % Produced by \nopagebreak[3] or \nolinebreak[3]

%\@beginparpenalty -\@lowpenalty    % Before a list or paragraph environment.
%\@endparpenalty   -\@lowpenalty    % After a list or paragraph environment.
%\@itempenalty     -\@lowpenalty    % Between list items.

% \clubpenalty         % 'Club line'  at bottom of page.
% \widowpenalty        % 'Widow line' at top of page.
% \displaywidowpenalty % Math display widow line.
% \predisplaypenalty   % Breaking before a math display.
% \postdisplaypenalty  % Breaking after a math display.
% \interlinepenalty    % Breaking at a line within a paragraph.
% \brokenpenalty       % Breaking after a hyphenated line.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HEADINGS OF CHAPTERS AND SECTIONS FORMATTING                                             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% COUNTER DEFINITIONS
%%%%%%%%%%%%%%%%%%%%%%
%% If you want to redefine an already existing counter use \@addtoreset  command
%
%%%% specifies the highest level with numbered headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{4}

%% CHAPTER HEADINGS
%%%%%%%%%%%%%%%%%%%
% DEFINITION OF THE NUMBERING OF THE HEADERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\thechapter .\arabic{section}}
\renewcommand{\thesubsection}{\thesection .\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection .\arabic{subsubsection}}
\renewcommand{\theparagraph}{\alph{paragraph}}
\renewcommand{\thesubparagraph}{-}

\renewcommand{\chapter}{%
  \if@openright\cleartooddpage[\thispagestyle{empty}]\else\clearpage\fi
  \suppressfloats[t]  % Prevents floats appearing in the top of the page chapter
  \addtocontents{lof}{\protect\addvspace{15\p@}}%
  \addtocontents{lot}{\protect\addvspace{15\p@}}%
  \thispagestyle{plain}
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter
}

% \@makechapterhead Makes the heading for the \chapter command.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\@makechapterhead}[1]{%
  \noindent                             % No indentation in this paragraph
  \begin{center}                    % Prints chapter name etc...
    \LARGE\sffamily\bfseries\MakeUppercase 
    \@chapapp{} \thechapter . \MakeUppercase{#1} \par\nobreak  %% \@chapapp{} prints ``CHAPTER'' according to selected language
  \end{center}                     
  \vspace{3ex}
}

% \@makechapterhead Makes the heading for the \chapter* command.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\@makeschapterhead}[1]{%
  \noindent                                                     % No indentation in this paragraph
  \begin{center}
    \LARGE\sffamily\bfseries \MakeUppercase{#1} \par\nobreak
  \end{center}
  \vspace{3ex}
  \addcontentsline{toc}{chapter}{\large\sffamily\bfseries #1}
}









%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SECTIONS HEADINGS
%%%%%%%%%%%%%%%%%%%%

% \@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE} 
%            optional * [ALTHEADING]{HEADING}
%    Generic command to start a section.  
%    NAME       : e.g., 'subsection'
%    LEVEL      : a number, denoting depth of section -- e.g., chapter=1,
%                 section = 2, etc.  A section number will be printed if
%                 and only if LEVEL < or = the value of the secnumdepth
%                 counter.
%    INDENT     : Indentation of heading from left margin
%    BEFORESKIP : Absolute value = skip to leave above the heading.  
%                 If negative, then paragraph indent of text following 
%                 heading is suppressed.
%    AFTERSKIP  : if positive, then skip to leave below heading,
%                       else - skip to leave to right of run-in heading.
%    STYLE      : commands to set heading style 
%  If '*' missing, then increments the counter.  If it is present, then
%  there should be no [ALTHEADING] argument.  A sectioning command
%  is normally defined to \@startsection + its first six arguments.

%% REDEFINITION OF ALREADY EXISTING SECTIONS (book.cls)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\section}{%
  \@startsection {section}%                          %% NAME
                 {1}{0pt}%                           %% LEVEL and INDENT
                 {-3.5ex plus -1ex minus -.2ex}%    %% BEFORESKIP
                 {2.3ex plus .2ex}%                  %% AFTERSKIP
                 {\sffamily\Large\bfseries}%         %% STYLE
}

\renewcommand{\subsection}{%
  \@startsection{subsection}%                        %% NAME
                {2}{0pt}%                            %% LEVEL and INDENT
                {-3.25ex plus -1ex minus -.2ex}%     %% BEFORESKIP
                {1.5ex plus .2ex}%                   %% AFTERSKIP
                {\sffamily\large\bfseries}%          %% STYLE
}

\renewcommand{\subsubsection}{%
  \@startsection{subsubsection}%                     %% NAME
                {3}{0pt}%                            %% LEVEL and INDENT
                {-3.25ex plus -1ex minus -.2ex}%     %% BEFORESKIP
                {1.0ex plus .2ex}%                   %% AFTERSKIP
                {\sffamily\normalsize\itshape}%      %% STYLE
}

\renewcommand{\paragraph}{%
  \@startsection{paragraph}%                             %% NAME
                {4}{2ex}%                                %% LEVEL and INDENT
                {3.25ex plus 1ex minus .2ex}%            %% BEFORESKIP
                {1ex}%                                   %% AFTERSKIP
                {\normalsize\bfseries} %        %% STYLE
}

\renewcommand{\subparagraph}{%
  \@startsection{subparagraph}%                      %% NAME
                {5}{3ex}%                            %% LEVEL and INDENT
                {3.25ex plus 1ex minus .2ex}%        %% BEFORESKIP
                {1ex}%                              %% AFTERSKIP
                {\normalsize\bfseries}%                       %% STYLE
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% APPENDICES CONFIGURATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareRobustCommand{\changetoapp}{%
  \setlength{\cftbeforechapskip}{2em}  
  \setlength{\cftchapindent}{0em}
  \setlength{\cftchapnumwidth}{8em}
  \renewcommand{\cftchapleader}{\bfseries\cftsecleader}
  \renewcommand{\cftchapfont}{\large\sffamily\bfseries}
  \renewcommand*{\cftchappresnum}{\MakeUppercase \appendixname \space}%
  \renewcommand{\cftchapaftersnum}{. \space}
  \renewcommand{\cftchapaftersnumb}{}%
}

\let\oldappendix\appendix

\renewcommand*{\appendix}{
  \oldappendix 
  \addtocontents{toc}{\changetoapp}
 % \addtocontents{toc}{\protect\clearpage\par}
%  \addtocontents{toc}{{\Large\sffamily\bfseries Annexos}\par}
%  \addtocontents{toc}{\protect\apprule \par}
  
  \addtocontents{lof}{\changetoapp}
%  \addtocontents{lof}{\protect\clearpage\par}
%  \addtocontents{lof}{{\Large\sffamily\bfseries Annexos}\par}
 % \addtocontents{lof}{\protect\apprule \par}

  \addtocontents{lot}{\changetoapp} 
%  \addtocontents{lot}{\protect\clearpage\par}
%  \addtocontents{lot}{{\Large\sffamily\bfseries Annexos}\par}
%  \addtocontents{lot}{\protect\apprule \par}


  \cleardoublepage
  
}

\newcommand{\senseportada}{
  \vspace*{\stretch{1}}                
  \begin{center}                    % Prints chapter name etc...
    \Huge\sffamily\bfseries\MakeUppercase \@Napp  \par
  \end{center}                     
  \vspace*{\stretch{2}}                
  \thispagestyle{empty}                 % Page style
  \newpage
  \thispagestyle{empty}                 % Page style
  \newpage
}

% \newcommand{\ambportada}{
%   \settowidth{\Lautors}{{\normalsize\bf\sffamily\MakeUppercase   \@Nautors : }}
%   \settowidth{\Ldirectors}{{\normalsize\bf\sffamily\MakeUppercase \@Ndirectors :}}

%   \begin{tabular}{p{\textwidth}}
%     \ifthenelse{\boolean{logo}}{\usebox{\logoEPSC}  \hfill \usebox{\logo}   \\[8cm]}{\usebox{\logoEPSC} \\[8cm]}
%     \begin{center}\Huge\sffamily\bfseries\MakeUppercase  \@Napp \end{center}  \\[5cm]
%     \fbox{\parbox{\textwidth}{
%         \vspace{2ex}
%         \ifthenelse{\boolean{PFC}}{{\normalsize\bf\sffamily\MakeUppercase \@NtitolPFC : \@titol  } \\[2ex]}
%                    {{\normalsize\bf\sffamily\MakeUppercase \@NtitolMANUAL  : \@titol  } \\[2ex]}
%                    {\normalsize\bf\sffamily\MakeUppercase  \@Ntitulacio : \@titulacio    }  \\[2ex]
%                    \ifthenelse{\boolean{autor}}{{\normalsize\bf\sffamily\MakeUppercase \@Nautor:  \@autor } \\[2ex]}
%                               {{\normalsize\bf\sffamily\MakeUppercase \@Nautors : \@autor } \\[2ex]}
%                               \ifthenelse{\boolean{UNdirector}}{{\normalsize\bf\sffamily\MakeUppercase \@Ndirector :  \@director }  \\[2ex]}
%                                          {{\normalsize\bf\sffamily\MakeUppercase \@Ndirectors : \@director \\ \hspace*{\Ldirectors} \@segondirector }  \\[2ex]}
%                                          \ifthenelse{\boolean{supervisor}}{{\normalsize\bf\sffamily\MakeUppercase \@Nsupervisor : \@supervisor  } \\[2ex]}{}
%                                                     {\normalsize\bf\sffamily\MakeUppercase  \@Ndata : \today               }  \\[2ex]
%     }} \\
%   \end{tabular}
%   \setcounter{page}{-1}
% }
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%----------------------------------------------------------------------------------------%%%
%%%----------------------------   END OF CLASS FILE  --------------------------------------%%%
%%%----------------------------------------------------------------------------------------%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

