# 昆明理工大学研究生学位论文 LaTeX 模板

> **新手入口**
> 第一次使用这个模板的同学，请先看 [`docs/START_HERE.md`](docs/START_HERE.md)。
> 这个文件会作为“从零开始使用”的完整教程入口，后续会持续补充。

本项目是一个面向昆明理工大学医学部研究生学位论文写作的 LaTeX 模板工程（基于“医学部-博士硕士通用研究生学位论文模板.doc”），2026年3月10日学校发布了官方论文模板，以后医学部可能会采用学校官方的论文模板[关于公布昆明理工大学研究生学位论文撰写规范模版的通知](https://yjs.kmust.edu.cn/info/1264/4251.htm)。假如以后有新模板希望后有心制作Latex模板的后来者有个参考。本项目在导出的PDF文档相较于word导出的PDF页码更精准，不会发生格式错乱。

当前模板以本仓库中的 [`kustthesis.cls`](kustthesis.cls) 为核心，配套提供了封面、声明、中英文摘要、目录、插图和附表清单、缩略词、正文、参考文献与附录示例。项目同时保留了学校官方 Word 模板的解压分析结果，以及上海交通大学模板作为参考实现，便于后续继续比对和完善。

## 项目特点

- 尽量贴合昆明理工大学官方 Word 模板中的版式要求。
- 使用 `XeLaTeX + biber` 编译，适合中文论文写作。
- 已实现双语图题、双语表题、图注/图片来源说明、三线表、参考文献、前后置部分分页与页码切换。
- 第二章已经改写为“模板使用说明”，可以直接当作示例教程阅读和复制。
- 保留学校 Word 模板分析资料，便于继续补齐细节规范。

## 当前状态

本仓库目前属于“可用的初版模板”阶段，已经可以生成完整 PDF，但仍在持续细化版式。

目前已覆盖的部分包括：

- 封面与声明页
- 中英文摘要与关键词
- 目录
- 插图和附表清单
- 缩略词
- 正文页眉页脚与章节标题
- 单图、双图、三线表
- 图注与图片来源说明
- 参考文献输出
- 附录与成果说明

仍建议继续核对的部分包括：

- 页脚位置与 `\footskip` 的细节
- 个别页面的细微行距和溢出警告
- 参考文献与学校最终样张的一致性
- 封面字段、声明页与特殊附页的逐项比对

## 环境要求

建议使用以下环境：

- TeX Live 2026
- XeLaTeX
- Biber
- UTF-8 编码

本模板依赖 `fontspec`，因此不能使用 `pdfLaTeX`。如果使用 VS Code + LaTeX Workshop，请确保编译链为 `xelatex -> biber -> xelatex -> xelatex`。

## 快速开始

### 1. 修改论文信息

论文题名、学位类型、作者姓名、指导教师、学科专业、研究方向、论文起止日期、提交日期等信息在 [`setup.tex`](setup.tex) 中统一配置。

### 2. 编辑正文内容

正文内容按章节拆分在 `contents/` 目录下，主文件 [`main.tex`](main.tex) 通过 `\input{...}` 依次加载。

目前主要章节文件包括：

- [`contents/intro.tex`](contents/intro.tex)
- [`contents/chapter2.tex`](contents/chapter2.tex)
- [`contents/chapter3.tex`](contents/chapter3.tex)
- [`contents/chapter4.tex`](contents/chapter4.tex)
- [`contents/chapter5.tex`](contents/chapter5.tex)
- [`contents/abstract.tex`](contents/abstract.tex)
- [`contents/abbreviations.tex`](contents/abbreviations.tex)
- [`contents/ack.tex`](contents/ack.tex)
- [`contents/achievements.tex`](contents/achievements.tex)

### 3. 编译文档

Windows 用户可以直接双击或在终端运行一键脚本：

```powershell
.\Compile.bat
```

推荐命令：

```powershell
latexmk -xelatex -interaction=nonstopmode -file-line-error main.tex
```

如果只做快速测试，也可以使用：

```powershell
xelatex main.tex
```

但涉及目录、交叉引用和参考文献时，建议始终使用完整流程：

```text
xelatex -> biber -> xelatex -> xelatex
```

## 目录结构

仓库当前的主要目录与文件如下：

- [`main.tex`](main.tex)：主控文件，组织整篇论文结构
- [`kustthesis.cls`](kustthesis.cls)：模板类文件，控制版式与命令
- [`setup.tex`](setup.tex)：论文信息与全局配置
- `reference.bib`：参考文献数据库（可按需新建）
- `contents/`：正文及前后置部分内容
- `image/`：示例图片
- `figures/`：预留的图形目录
- [`docs/KUST_Thesis_Standard.md`](docs/KUST_Thesis_Standard.md)：已整理出的学校版式要求
- [`医学部-博士硕士通用研究生学位论文模板.docx`](医学部-博士硕士通用研究生学位论文模板.docx)：学校官方 Word 模板原件
- `docx_extracted/`：Word 模板解压后的结构化分析文件
- `SJTUThesis-full-2.3.1/`：上海交通大学模板参考实现，用于借鉴写法与组织方式

## 已实现的常用写法

### 图表

模板当前支持：

- 单图插入
- 双图并排插入
- 双语图题和表题
- 图注与图片来源说明
- 三线表自动按正文宽度展开
- 图表标签与正文交叉引用

示例可以参考：

- [`contents/chapter3.tex`](contents/chapter3.tex)
- [`contents/chapter2.tex`](contents/chapter2.tex)

模板中提供了这些常用命令：

- `\bicaption{中文标题}{English title}`
- `\fignote{...}`
- `\begin{kusttabular}{...} ... \end{kusttabular}`

### 公式与引用

模板已经加载 `amsmath` 和 `biblatex`，因此支持：

- 公式编号
- 图表公式交叉引用
- `\cite{...}` 文献引用
- 国标风格参考文献输出

第二章 [`contents/chapter2.tex`](contents/chapter2.tex) 已经整理成“模板使用说明”，里面包含了这些写法的最小示例。

## 编译与使用建议

- 修改目录、图表编号、公式编号后，至少再编译一次。
- 修改参考文献后，记得运行 `biber`。
- 如果目录、引用或文献没有刷新，不一定是模板错误，通常只是编译轮次不够。
- 如果看到 `fontspec requires XeTeX or LuaTeX`，说明编译器选错了，应改用 `XeLaTeX`。

## 常见问题

### 1. 为什么目录第一次编译不显示？

第一次编译通常只是生成 `main.toc`，第二次编译才会把目录真正排进 PDF。涉及参考文献时还要运行 `biber`。

### 2. 为什么 VS Code 一直报 `fontspec` 错误？

因为模板要求使用 `XeLaTeX`，如果编辑器默认调用 `pdfLaTeX`，就会报错。

### 3. 图表和公式能不能在正文中引用？

可以。只要写了 `\label{...}`，正文中就可以用 `\ref{...}` 引用。

### 4. 第二章为什么像教程？

这是有意设计的。当前第二章被作为“模板示例章”使用，目的是让使用者能直接从示例里复制常见结构，而不是从零摸索。

## 参考来源与致谢

本项目的形成主要参考了以下资料：

- 昆明理工大学官方 Word 论文模板
- 从 Word 模板中提取并整理出的格式要求
- 上海交通大学论文模板的 README、示例内容与组织方式

特别说明：

- `SJTUThesis-full-2.3.1/` 仅作为本地参考资料保留，不属于本模板发布内容
- 学校名称、校徽、官方文档等资料的版权归原权利方所有

## 后续计划

后续仍计划继续完善以下方向：

- 继续对照 Word 模板补齐遗漏规范
- 清理少量 overfull / underfull 警告
- 进一步细化封面、声明、目录和参考文献的版式
- 增补更多“可直接复用”的教程型示例
- 形成稳定版本后再补充更完整的发布文档

## 许可证与使用说明

本项目采用 MIT License 开源，详见 [`LICENSE`](LICENSE)。

你可以在保留原始版权与许可证声明的前提下，自由使用、修改、分发本模板代码。

以下内容不随 MIT 协议授权，请使用者自行确认权利边界：

- 学校名称、校徽、官方视觉标识
- 学校官方发布的 Word 模板及其原始内容
- 仓库中可能包含的第三方图片、示例素材或外部文档
