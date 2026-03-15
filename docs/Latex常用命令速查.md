# LaTeX 论文写作速查表 (Cheat Sheet)

写论文时，您只需要复制粘贴以下模板，填入您的内容即可。无需深入学习代码。

## 1. 章节标题
```latex
\chapter{这里写章标题}
\section{这里写节标题}
\subsection{这里写小节标题}
\subsubsection{这里写小小节标题}
```

## 2. 插入图片
将图片放入 `figures` 文件夹，然后复制以下代码：
```latex
\begin{figure}[htbp]
    \centering
    % 0.8 表示图片宽度占页面的 80%
    \includegraphics[width=0.8\textwidth]{figures/您的图片文件名.jpg}
    
    % 双语标题：{中文标题}{English Title}
    \bicaption{中文标题}{English Title}
    
    % 引用标签，用于在文中引用 (如：如图 \ref{fig:my_image} 所示)
    \label{fig:my_image}
\end{figure}
```

## 3. 插入表格 (三线表)
推荐使用 [TableConvert](https://tableconvert.com/) 在线工具生成 LaTeX 代码，或者直接复制以下模板：
```latex
\begin{table}[htbp]
    \centering
    \bicaption{表格中文标题}{Table English Title}
    \label{tab:my_table}
    \begin{tabular}{lcc} % l=左对齐, c=居中, r=右对齐
        \toprule
        列1名称 & 列2名称 & 列3名称 \\
        \midrule
        数据A1 & 数据A2 & 数据A3 \\
        数据B1 & 数据B2 & 数据B3 \\
        \bottomrule
    \end{tabular}
\end{table}
```

## 4. 列表
**无序列表 (点)**
```latex
\begin{itemize}
    \item 第一点内容
    \item 第二点内容
\end{itemize}
```

**有序列表 (数字)**
```latex
\begin{enumerate}
    \item 第一点
    \item 第二点
\end{enumerate}
```

## 5. 引用参考文献
1. 将文献信息 (BibTeX 格式) 放入 `reference.bib` 文件。
2. 在文中需要引用的地方使用：
```latex
\cite{文献ID}  % 例如：即使是 \cite{zhang2024} 或者是 \cite{li2026}
```
*提示：Google Scholar 点击“引用”->“BibTeX”即可获取文献信息。*

## 6. 数学公式
**行内公式** (夹在文字中)：
```latex
正文中可以使用 $E=mc^2$ 这样的公式。
```

**独立公式** (独占一行)：
```latex
\begin{equation}
    a^2 + b^2 = c^2
\end{equation}
```

---
**小技巧**：
遇到不会写的格式，直接在对话框里告诉我：“**帮我把这段文字变成一个表格**”或者“**帮我插入这种布局的图片**”，我会直接把代码生成给您，通过复制粘贴即可完成。
