%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  USN-MSc.cls                     %%
%%  LaTeX-class for writing theses  %%
%%                                  %%
%%  (c) Dietmar Winkler (me.dwe.no) %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ---Identification----
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{USN-MSc}[2019/04/26 Template class MSc reports and theses]

% --- definitions of options ---
% project option:
\newif\if@project
\@projectfalse
\DeclareOption{project}{\@projecttrue}

% All other options are passed on to the book class
\DeclareOption*{%
    \typeout{Option \CurrentOption\space is passed to package USN-base!}
    \PassOptionsToClass{\CurrentOption}{USN-base}
}%

% --- execution of options ---
\ProcessOptions*      %% process the options in calling order

% --- load other classes
\LoadClass{USN-base}  %% we reuse the USN-base class

% --- useful commands
\newcommand{\mysubject}{%
  %%%% for project only i removed if command
  %\if@project%
  FM4017 Project \the\year%
  %\else%
 % FMH606 Master's Thesis \the\year%
 % \fi%
}

\newcommand{\USNtitlepage}[5]{%
% #1 optional figure
% #2 confidential
% #3 Project partner
% #4 summary
  \subject{%
    %%%% only for project I edited next line
    %\if@project\mysubject\else\mysubject\\\mysubtitle\fi}
  \mysubject}
  \title{\mytitle}
  \subtitle{\vfill #1}
  \author{\myauthor}
  \date{}  %% no date on title page
% --- pdf document settings ---
  \hypersetup{%
    pdftitle = {\mytitle},%
    pdfsubject = {\mysubject},%
    pdfauthor = {\myauthor}
  }%
\pdfbookmark[0]{\@title}{title}    %% set the correct PDF bookmark
\maketitle%
%
\cleardoubleemptypage              %% fillpage without page number
%

%% --- summary page ---
\if@summary%
{
\thispagestyle{summary}
\setlength{\footheight}{52pt}
\label{Summary}\pdfbookmark[1]{Summary}{Summary}
\USNtitlehead%
\par\bigskip

%%%% only for project I removed if clause
%\if@project%
  {
    \begin{tabular}{rl}
      \textbf{Course:}   & \mysubject                        \\
      \textbf{Title:}    & \begin{minipage}[t]{0.8\textwidth}
                             \textit{\mytitle}\end{minipage} \\
      \textbf{Pages:}    & \textit{\pageref{LastPage}}       \\
      %\textbf{Keywords:} & \begin{minipage}[t]{0.8\textwidth}
                         %  \textit{\mykeywords}\end{minipage}
    \end{tabular}

    \begin{tabular}{rl}
      \textbf{Project group:}     & \textit{\myauthor}                       \\
      \textbf{Group participants:} & \begin{minipage}[t]{0.5\textwidth}
                                       \textit{\myparticipants}\end{minipage} \\
      \textbf{Supervisor:}         & \textit{\supervisor}                     \\
      \textbf{External partner:}   & \begin{minipage}[t]{0.7\textwidth}
                                       \textit{#3}\end{minipage}              \\
      \textbf{Availability:}       & \textit{%
      \ifthenelse{\equal{#2}{yes}}{\textbf{Confidential}}{Open}}
    \end{tabular}
  }
%\else
%%%% I added this iffalse fi for multicomment
\iffalse
{
    \begin{tabular}{rl}
      \textbf{Course:}   & \mysubject                        \\
      \textbf{Title:}    & \begin{minipage}[t]{0.8\textwidth}
                             \textit{\mytitle}\end{minipage} \\
      \textbf{Pages:}    & \textit{\pageref{LastPage}}       \\
      \textbf{Keywords:} & \begin{minipage}[t]{0.8\textwidth}
                           \textit{\mykeywords}\end{minipage}
    \end{tabular}

    \begin{tabular}{rl}
      \textbf{Student:}          & \textit{\myauthor}          \\
      \textbf{Supervisor:}       & \textit{\supervisor}        \\
      \textbf{External partner:} & \begin{minipage}[t]{0.7\textwidth}
                                     \textit{#3}\end{minipage} \\
      \textbf{Availability:}     & \textit{%
      \ifthenelse{\equal{#2}{yes}}{\textbf{Confidential}}{Open}}
    \end{tabular}
}
\fi

~\\

% \begin{tabular}{lp{20em}}
% \textbf{Approved for archiving: } & \hrulefill\\
%                                   & (\supervisor)
% \end{tabular}

\begin{framed}
  \textbf{Summary:}\\
   {\small #4}
\end{framed}
%
\cleardoubleemptypage              %% fillpage without page number
}
\else
{}
\fi % end if@summary
}