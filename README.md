## 书籍模板 BodieBook v0.1 发布

今天，Elegant 团队的新成员 WD 为大家带来一个高大上的书籍模板类文件，`bodiebook.cls`，这个书籍模板是在《博迪投资学》英文版第 7 版 [1] 的排版启发下设计出来的，原书应该是用 InDesign 设计出来的 （用 LaTeX 做这种效果实在是太麻烦了><）。不过呢，作为一次练习使用 LaTeX 的机会，我把这本书的主要模块用 LaTeX 做了出来，同时分享给大家使用，看起来真的很有出版物的感觉哦。

先 show 几个效果图：

<center>![shot1](http://elegantlatex.org/wp-content/uploads/2014/11/1-shot10.jpg)</center>
<center>![shot2](http://elegantlatex.org/wp-content/uploads/2014/11/2-shot20.jpg)</center>
<center>![shot3](http://elegantlatex.org/wp-content/uploads/2014/11/3-shot30.jpg)</center>
<center>![shot4](http://elegantlatex.org/wp-content/uploads/2014/11/4-shot40.jpg)</center>

## 使用说明

下载我们提供的 `bodie.cls` 文件，`main.tex` 文件，以及 `body.tex` 文件，后面两个文件是作为 sample 帮助你使用这个模板的。

### 基本设置

首先，设置文档类型为 bodiebook，并设置主题颜色和主题。

<pre class="lang:tex decode:true " >
\documentclass{bodiebook}
\wdtexbooktheme{bodie} %
\wdtexbookcolor{green} % green, violet, print
</pre>

我们提供了两种颜色主题供选择，`green` 和 `violet`，上面给的例子是 `green` 的主题。另外还提供了一个 `print` 黑白主题，用于打印。

然后设置标题，版本和作者信息，不填也可以。这里最多三个作者，下一个版本争取提供能够不限作者数量的命令。

<pre class="lang:tex decode:true " >
\wdtitle{ELEGANCE {\color{black!70}\rm\itshape of} LATEX}
\wdedition{FIRST}
\wdfirstauthor{Donald E. Knuth}
\wdfirstinstitute{Stanford University}
\wdsecondauthor{Leslie Lamport}
\wdsecondinstitute{Brandeis University}
\wdthirdauthor{}
\wdthirdinstitute{}
</pre>

然后就是正文部分了，这里添加了 brief contents 和 contents，

<pre class="lang:tex decode:true " >
\begin{document}

\wdmaketitle

\shorttoc{Brief Contents}{0}

\tableofcontents

\switchgeometry  % 切换页面布局
\wdstartdoc % 务必添加这行代码

\input{body.tex} % 这里是正文部分

\wdenddoc % 务必添加这行代码 （用来调整格式）

\end{document}
</pre>

章节样式的细节图如下

<center>![sec](http://elegantlatex.org/wp-content/uploads/2014/11/5-sec.jpg)</center>

### 表格和图片

正文中有两种表格样式，一种是「宽式」，由于书籍左右边距不等，同时预留给边注（margin note）有一定的宽度，宽式表格能撑满整个页面宽度，而另一种「窄式」表格则是只撑满文本宽度。

宽式表格代码如下：

<pre class="lang:tex decode:true " >
\begin{table*}[!htbp]
\setmathfont{Geometric415BT-Lite.ttf}
\ttabbox
{\caption{Balance sheet U.S. households, 2006}}
{
\begin{tabular*}{\caplength}{@{\extracolsep{\fill}}@{\hspace{1em}}lr.lr.}
    \hspace{-1em}\textbf{Assets}              &\textbf{\$ Billion}     &\hed{\textbf{\% Total}}   &\textbf{\makecell[lb]{Liabilities\\and Net Worth}}   &\textbf{\$ Billion}     &\hed{\textbf{\% Total}}\\
    \addlinespace
    Real assets\\
    Real estate         &\$22,177       &33.6\%           &Mortgages          &\$\ 9,161  &13.9\%\\
    Consumer durables   &3,822          &5.8              &Consumer credit    &2,150      &3.3\\
    Other               &224            &0.3              &Bank \& other loans   &237     &0.4\\
    \addlinespace
    \cline{2-2}\cline{3-3}
    \addlinespace
    \hspace{1em}\textit{Total real assets}   &\$26,223       &39.7\%           &\hspace{1em}\textit{Total liabilities}  &\$12,199   &18.5\%\\
\end{tabular*}
\floatfoot*{Note: Column sums may differ from totals because of rounding error.\\
Source: \textit{Flow of Funds Accounts of the United States}, Board of Governors of the Federal Reserve System, June 2006.}
}
%\end{widetable}
\setmathfont[Ligatures=TeX]{xits-math.otf}
\end{table*}
</pre>

效果如下：

<center>![tablewide](http://elegantlatex.org/wp-content/uploads/2014/11/6-tablewide.jpg)</center>


窄式表格代码如下：

<pre class="lang:tex decode:true " >
\begin{table}[!htbp]
\setmathfont{Geometric415BT-Lite.ttf}
\stabbox{2.0cm}
{\caption{Domestic net worth}}
{\begin{tabular*}{\cflwidth}{@{\hspace{3pt}}@{\extracolsep{\fill}}*{8}{@{\hspace{-3pt}}c}}
    p1 & 1.7538 & -0.7698 & 1.4597 & -0.4137 & 1.2449 & -0.5518                 \\
    p2 & 1.6055 & -0.5549 & 1.2368 & 0.2507  & 1.2172 & -0.0974                 \\
    p3 & 1.5619 & 0.0799  & 1.0892 & 0.3585  & 1.2357 & -0.2726                 \\
    p4 & 1.4741 & 0.0109  & 0.9944 & 0.5935  & 1.2515 & -0.5038                 \\
\end{tabular*}
\floatfoot*{Note: Column sums may differ from totals because of rounding error. \\
Source: \textit{Flow of Funds Accounts of the United States}, Board of Governors of the Federal Reserve System, June 2006.}
}
\setmathfont[Ligatures=TeX]{xits-math.otf}
\end{table}
</pre>
效果如下：

<center>![tablenarrow](http://elegantlatex.org/wp-content/uploads/2014/11/7-tablenarrow.jpg)</center>


图片只有一中宽式（参考原书排版），代码如下：


<pre class="lang:tex decode:true " >
\begin{figure*}[!htbp]
  \wdfigbox
  {\caption{Bundling creates a complex security}}
  {
  \includegraphics{./figure/sample.pdf}
  \floatfoot{Source: \textit{The Wall Street Journal}, December 19, 2001}
  }
\end{figure*}
</pre>

效果如下：

<center>![figure](http://elegantlatex.org/wp-content/uploads/2014/11/8-figure.jpg)</center>


### 其他环境

此外，还定义了一些其他环境供大家使用，如果想使用另外的环境可以参考类文件中的定义自行添加。
自带的是 example 环境：

<pre class="lang:tex decode:true " >
\begin{example*}
  \wdexpbox
  {\caption{Bundling creates a complex security}}
  {\lipsum[10]}
\end{example*}
</pre>

效果如下：

<center>![example](http://elegantlatex.org/wp-content/uploads/2014/11/9-example.jpg)</center>


---
[1] Marcus, Alan J., Zvi Bodie, and Alex Kane. *Essentials of investments*, 7th edition. McGraw Hill, 2008.

[download info="BodieBook 代码下载" time="2014-11-18" cat="项目线"]
<a href="http://elegantlatex.org/wp-content/uploads/2014/11/BodieBook.zip" target="_blank">本站下载</a>
[/download]
