% ==================================================
% ozakilab-thesis.cls
%
% Description: 
%   卒業論文・修士論文 ドキュメントクラス
%   jlreq クラスをベースに調整
%
% Usage:
%   \documentclass{ozakilab-thesis}
% --------------------------------------------------
% Version: 1.0
% Date:    2025-10-20
% Author:  Sena <s.saito@irlab-uu.jp>
% ==================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ozakilab-thesis}[2025/10/20 Lab Thesis Template]


% ========== 基底クラスの読み込み ==========
\LoadClass[
  lualatex,                       % LuaLaTeX エンジンを使用
  a4paper,                        % A4 用紙サイズ
  book,                           % book クラスを基底にする
  11pt,                           % 11pt フォントサイズ
  titlepage,                      % タイトルページを独立させる
  oneside,                        % 片面印刷用にする (表紙の次に空白ページを入れない)
  % twoside,                      % 両面印刷用にする
  openany,                        % 章の開始を固定しない
  % openright,                    % 章の開始を右ページに固定
  gutter=30mm,                    % 綴じ側の余白
  fore-edge=20mm,                 % 小口側の余白
  head_space=30mm,                % ヘッダの余白
  foot_space=30mm,                % フッタの余白
  headfoot_verticalposition=15mm, % ヘッダ線と本文の間の余白
]{jlreq}

% ========== jlreqsetup の設定 ==========
\RequirePackage{jlreq-complements}
\jlreqsetup{
  % thebibliography_heading={
  %   \chapter*{\refname}
  %   \addcontentsline{toc}{chapter}{\refname}
  % },
  % 参照マーク
  reference_mark = interlinear,%
  % 日付を和暦表示にする
  year_style = wareki,%
  % 目次の2段組み設定
  tableofcontents_twocolumn = false,%
  % 目次の見出し
  tableofcontents_heading={%
    \begin{center}%
      {\huge\sffamily\gtfamily\bfseries \contentsname}%
    \end{center}%
    \vspace{2\baselineskip}%
  },%
  tableofcontents_twocolumn = false,%
  % caption_font = \normalsize,%
  % caption_label_font = \normalsize \bfseries,%
  % caption_label_format = \normalsize \bfseries #1~,%
}

% ========== 柱の設定 ==========
\ModifyPageStyle{headings}{
  % 章名を表示
  odd_running_head={_chapter}, 
  even_running_head={_chapter},
  % 罫線を表示
  odd_head_format={\underline{\makebox[\jlreqyokoheadlength]{#1}}},
  even_head_format={\underline{\makebox[\jlreqyokoheadlength]{#1}}},
  % フォントサイズ
  running_head_font={\small}, 
  % 小口側に寄せる
  running_head_position={top-fore-edge},
}

% ========== チャプタの見出し設定 ==========
\ModifyHeading{chapter}{
  % 最初のページは柱を非表示
  pagestyle=plain,
  % 中央揃え
  align=center,
  % 章番号とタイトルの間隔
  after_label_space=0pt,
  % 章番号とタイトルで改行
  format={%
    \jlreqHeadingLabel{#1%
    \vspace{\baselineskip}}\par%
    \jlreqHeadingText{#2%
    \vspace{\baselineskip}}\par%
    \vspace{\baselineskip}
  },%
}

\ModifyHeading{section}{
  lines = 3,%
  before_lines = 1,%
}

\ModifyHeading{subsection}{
  lines = 3,%
  before_lines = 1,%
}

\ModifyHeading{subsubsection}{
  lines = 3,%
  before_lines = 1,%
}

% ========== 目次の最初のページは柱を非表示 ==========
\let\jlreq@original@tableofcontents\tableofcontents
\renewcommand{\tableofcontents}{%
  \thispagestyle{plain}%
  \jlreq@original@tableofcontents%
}

% ========== 独自パッケージの読み込み ==========
\RequirePackage{styles/title-page}
\RequirePackage{styles/table-of-contents}
\RequirePackage{styles/lab-caption}
\RequirePackage{styles/lab-ref}

% ========== 標準パッケージの読み込み ==========
% 数式
\RequirePackage{amsmath}    % align, pmatrix, text
\RequirePackage{amssymb}    % mathbb, mathfrac
\RequirePackage{bm}         % 太字ベクトル

\RequirePackage{amsthm}     % 定理環境
\RequirePackage{mathtools}  %
% \RequirePackage{physics}    % 微分記号
\RequirePackage{siunitx}    % SI単位
% 図
\RequirePackage{graphicx}
% \RequirePackage{subcaption}
\RequirePackage{float}
% 表
\RequirePackage{booktabs}
\RequirePackage{makecell}
\RequirePackage{multirow}
\RequirePackage{longtable}
% アルゴリズム
\RequirePackage{algorithm}
% \RequirePackage{algorithmic}
\RequirePackage{algpseudocode}
% ソースコード
\RequirePackage{listings}
% リスト
\RequirePackage{enumitem}
% PDF
% \RequirePackage{hyperref}
% \RequirePackage{cleveref}
% \RequirePackage{pxjahyper}
% \RequirePackage{bookmark}
% \RequirePackage{fontenc}
% \RequirePackage{microtype}
\RequirePackage[
  colorlinks = true,        % リンクに色を付ける (falseだと枠線になる)
  linkcolor = black,        % 内部リンク（\ref, 目次など）の色
  citecolor = black,        % 引用（\cite）リンクの色
  urlcolor = black,         % URLリンクの色
  pdfpagemode = UseOutlines,% PDFを開いたときにアウトライン（目次）パネルを表示
  plainpages   = false,
  pdfpagelabels= true,
]{hyperref}


\endinput