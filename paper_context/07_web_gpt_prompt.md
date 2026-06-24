# Prompt to Paste into Web GPT

Copy this prompt into Web GPT after giving it the GitHub repository or PR link.

```text
你现在是视觉语言导航 VLN 领域的论文写作和审稿专家。

请先阅读这个 GitHub 仓库中的：

1. paper_context/00_README_FOR_GPT.md
2. paper_context/01_claim_evidence.md
3. paper_context/03_main_results_tables.md
4. paper_context/04_negative_results.md
5. paper_context/05_paper_outline_zh.md
6. docs/handoff/latest.md

请不要根据聊天记录脑补实验结论。所有论文主张必须来自这些文件和仓库中的统计摘要、脚本、日志或 SHA 记录。

我的论文目标是中文 VLN 二区期刊论文。论文不是新模型，不是 SOTA 方法，而是基于官方 NavGPT-2 的闭环反事实诊断研究。

核心概念：

- PCAI：Paired Closed-Loop Action Intervention，配对闭环动作干预。
- Conversion Gap：局部动作优势无法稳定转化为 H5 或 terminal 轨迹价值。

请帮我完成以下任务：

1. 判断当前证据能支撑哪些论文 claim，哪些 claim 必须降级或删除；
2. 基于 evidence boundary 写中文论文；
3. 不要把 SCG、CTAS、distance reranker 写成成功方法；
4. 主证据只使用 official clean NavGPT-2 val_seen / val_unseen 和 pairwise controls；
5. 开发分支大规模结果只能作为补充或动机；
6. 不要声称 SOTA，不要声称跨架构普遍性，除非 DUET 结果已经加入；
7. 如果你认为论文缺关键实验，请指出最小补实验，而不是建议无限扩展。

请先输出：

- 一句话论文 thesis；
- 三条贡献；
- 主结果表应该包含哪些；
- 你认为最危险的三个审稿风险；
- 然后再开始写论文正文。
```

