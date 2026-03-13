# 从零开始使用

这份教程是写给第一次使用本模板的同学的。目标很简单：

- 先把封面信息改成自己的
- 再把摘要和正文示例替换成自己的内容
- 需要插图、表格、公式、参考文献时，知道去哪里复制现成代码块
- 最后顺利编译出 PDF

如果你之前几乎没有接触过 LaTeX，也可以直接照着本页一步一步操作。

## 先知道模板的结构

这个模板最常用到的文件只有几类：

- [`setup.tex`](setup.tex)
  这里填写论文题目、学位类型、姓名、导师、学科专业、研究方向、日期等封面信息。
- [`main.tex`](main.tex)
  这里控制整篇论文由哪些模块组成，例如摘要、目录、正文、参考文献、附录。
- `contents/` 目录
  这里存放论文正文和前后置内容。你真正写论文时，主要就是修改这里面的 `.tex` 文件。
- [`contents/abstract.tex`](contents/abstract.tex)
  这里写中英文摘要。
- [`contents/chapter2.tex`](contents/chapter2.tex)
  这里已经整理成“模板使用说明”，里面有表格、公式、引用等最小示例。
- [`contents/chapter3.tex`](contents/chapter3.tex)
  这里有单图、双图、分图名等图片示例，后面插图时最适合从这里复制代码。
- [`Compile.bat`](Compile.bat)
  Windows 下一键编译脚本，双击或终端运行都可以。

## 第一步：填写自己的封面信息

先打开 [`setup.tex`](setup.tex)。

这个文件现在已经做成了“表单式填写”，你只需要把这些内容替换成自己的信息：

- `title`：论文题目
- `degree-type`：学位论文类型
- `author`：作者姓名
- `supervisor`：导师姓名和职称
- `major`：学科专业
- `research-field`：研究方向
- `work-date`：论文工作起止日期
- `submit-date`：论文提交日期

例如：

```tex
title = {基于某某方法的某某研究},
degree-type = {硕士学位论文},
author = {张三},
supervisor = {李四教授},
major = {生物医学工程},
research-field = {医学图像处理},
work-date = {2023年9月 $\sim$ 2025年5月},
submit-date = {2025年5月},
```

如果你只是刚开始搭模板，先把这一步完成，再编译一次看看封面有没有问题。

## 第二步：修改摘要

中英文摘要统一写在 [`contents/abstract.tex`](contents/abstract.tex)。

这个文件里已经分成两部分：

- `cnabstract`：中文摘要
- `enabstract`：英文摘要

你只要把示例文字替换掉即可。

中文关键词写在：

```tex
\cnkeywords{关键词1，关键词2，关键词3，关键词4}
```

英文关键词写在：

```tex
\enkeywords{keyword1, keyword2, keyword3, keyword4}
```

注意：

- 中文关键词用全角逗号
- 英文关键词用半角逗号
- 最后一个关键词后面一般不加句号

## 第三步：开始写正文

正文是通过 [`main.tex`](main.tex) 里的 `\input{...}` 组织起来的。

目前正文部分大致是这样：

```tex
\input{contents/intro}
\input{contents/chapter2}
\input{contents/chapter3}
\input{contents/chapter4}
\input{contents/chapter5}
```

这表示主文件会依次载入这些章节。

你有两种最常见的写法：

### 方式一：直接改现有章节文件

如果你只是想尽快开始写，可以直接把这些文件里的示例文字替换成自己的内容：

- [`contents/intro.tex`](contents/intro.tex)
- [`contents/chapter2.tex`](contents/chapter2.tex)
- [`contents/chapter3.tex`](contents/chapter3.tex)
- [`contents/chapter4.tex`](contents/chapter4.tex)
- [`contents/chapter5.tex`](contents/chapter5.tex)

### 方式二：自己新建章节文件

如果你想让结构更贴合自己的论文，可以新建一个文件，比如 `contents/chapter6.tex`，然后在 [`main.tex`](main.tex) 里加入：

```tex
\input{contents/chapter6}
```

新的章节文件最小可以这样写：

```tex
\chapter{实验设计}

\section{研究对象}
这里写正文。

\section{实验方法}
这里继续写正文。
```

## 第四步：如果想增删模块，去哪里改

还是改 [`main.tex`](main.tex)。

你可以把它理解成整篇论文的“目录总控文件”。

例如：

- 想暂时不显示缩略词，就把 `\input{contents/abbreviations}` 先注释掉
- 想暂时不显示成果说明，就把 `\input{contents/achievements}` 先注释掉
- 想增加附录或新章节，就继续加新的 `\input{...}`

例如注释掉某一部分：

```tex
% \input{contents/abbreviations}
```

LaTeX 中一行前面加 `%`，就表示这一行暂时不参与编译。

## 第五步：想插入图片时，去哪里复制代码

最推荐直接去看 [`contents/chapter3.tex`](contents/chapter3.tex)。

因为这个文件里已经有现成、可编译、版式也已经调好的图片示例。

### 插入单张图片

可以直接复制这个结构：

```tex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.62\textwidth]{image/image1.png}
    \bicaption{单图示例}{Single image example}
    \label{fig:single-image-example}
    \fignote{注：如有需要可对图片进行注释说明，标尺内容，英文简称，统计值等，不用可省略。\par 图片来源：如需对图片来源进行说明，请参照此格式，不用可省略。}
\end{figure}
```

你需要改的通常只有这几处：

- 图片路径：`image/image1.png`
- 中文图名：`单图示例`
- 英文图名：`Single image example`
- 标签名：`fig:single-image-example`
- 图注和图片来源说明

如果暂时不需要图注或图片来源说明，可以删掉 `\fignote{...}` 这一行。

正文里引用这张图时可以写：

```tex
如图~\ref{fig:single-image-example} 所示
```

### 插入双图或分图

如果你想插入左右并排的双图，也去复制 [`contents/chapter3.tex`](contents/chapter3.tex) 里的双图示例。

最小结构如下：

```tex
\begin{figure}[htbp]
    \centering
    \begin{minipage}[t]{0.48\textwidth}
        \centering
        \includegraphics[width=\textwidth]{image/image2(a).png}
        {\songti\rmfamily\xiaosi (a)\quad 分图示例一\par}
    \end{minipage}\hfill
    \begin{minipage}[t]{0.48\textwidth}
        \centering
        \includegraphics[width=\textwidth]{image/image2(b).png}
        {\songti\rmfamily\xiaosi (b)\quad 分图示例二\par}
    \end{minipage}
    \bicaption{双图示例}{Two-image example}
    \label{fig:two-image-example}
\end{figure}
```

你只需要替换两张图片路径、两个分图名和总图名。

## 第六步：想插入表格时，去哪里复制代码

最推荐去看 [`contents/chapter2.tex`](contents/chapter2.tex)。

这个文件里已经有三线表的标准示例，直接复制最省事。

例如最常用的三线表结构是：

```tex
\begin{table}[htbp]
    \centering
    \bicaption{中文表名}{English table title}
    \label{tab:example}
    \begin{kusttabular}{lll}
        \toprule
        表头1 & 表头2 & 表头3 \\
        \midrule
        数据1 & 数据2 & 数据3 \\
        \bottomrule
    \end{kusttabular}
\end{table}
```

这里建议优先使用模板提供的 `kusttabular`，这样三线表会自动按正文宽度展开，不容易出现表格太窄的问题。

正文里引用表格时可以写：

```tex
如表~\ref{tab:example} 所示
```

## 第七步：想插入公式时，去哪里复制代码

还是建议参考 [`contents/chapter2.tex`](contents/chapter2.tex)。

最常见的公式写法是：

```tex
\begin{equation}
    E = mc^2
    \label{eq:einstein}
\end{equation}
```

正文中引用公式可以写：

```tex
由式~(\ref{eq:einstein}) 可知
```

如果你写的是较复杂的推导，后续也可以继续使用 `align`、`cases` 等环境，模板已经加载了相关数学宏包。

## 第八步：想插入参考文献时，去哪里改

参考文献由两个地方配合：

- [`setup.tex`](setup.tex) 中的 `\addbibresource{reference.bib}`
- [`main.tex`](main.tex) 中的 `\printbibliography`

也就是说，你平时主要维护的是 `reference.bib` 这个文献数据库文件。

正文里的引用命令最常用的是：

```tex
\cite{某个文献键名}
```

如果你还没有 `reference.bib`，可以后面再补；如果已经准备开始写文献，我建议我们下一步单独给仓库补一个最小可用的 `reference.bib` 示例文件。

## 第九步：如何编译

Windows 下最简单的方式是直接运行根目录的 [`Compile.bat`](Compile.bat)：

```powershell
.\Compile.bat
```

它会按完整流程编译文档。

如果你使用命令行，也可以手动运行：

```powershell
latexmk -xelatex -interaction=nonstopmode -file-line-error main.tex
```

如果遇到目录、引用、参考文献没有刷新的情况，通常不是模板坏了，而是编译轮次还不够。

## 第十步：推荐的实际写作顺序

如果你是第一次用这个模板，建议这样开始：

1. 先改 [`setup.tex`](setup.tex) 里的个人信息。
2. 再改 [`contents/abstract.tex`](contents/abstract.tex) 的中英文摘要。
3. 再把 `contents/` 里的示例章节替换成自己的正文。
4. 插图时从 [`contents/chapter3.tex`](contents/chapter3.tex) 复制图片代码块。
5. 插表时从 [`contents/chapter2.tex`](contents/chapter2.tex) 复制表格代码块。
6. 最后用 [`Compile.bat`](Compile.bat) 编译检查。

## 常见问题

### 为什么编译后目录没出来

目录通常需要多编译一次才会稳定显示。如果涉及参考文献，还需要运行 `biber`。

### 为什么会报 `fontspec` 错误

因为这个模板不能用 `pdfLaTeX`，必须使用 `XeLaTeX`。

### 为什么我加了图片却不显示

通常先检查三件事：

- 图片路径是否写对
- 图片文件名大小写和括号是否一致
- 是否放在仓库里的 `image/` 目录下

### 我只是想删掉示例内容，保留模板框架，可以吗

完全可以。你可以把示例文字换成自己的，也可以暂时保留章节标题，只删正文内容。

## 后续建议

如果你刚开始使用，不建议一上来就大改类文件 [`kustthesis.cls`](kustthesis.cls)。
更推荐的顺序是：

- 先会填写 `setup.tex`
- 再会修改 `contents/*.tex`
- 再会复制图表公式示例
- 最后再考虑微调版式

这样最稳，也最不容易把模板本身改坏。
