# 中文论文框架建议

暂定题目：

**从局部动作优势到闭环轨迹价值：视觉语言导航中的转换鸿沟与配对动作干预**

## 摘要

写作要点：

- 视觉语言导航智能体通常基于当前状态选择动作，但局部动作偏好是否能转化为闭环轨迹收益并不清楚。
- 提出 PCAI：在相同状态强制替换一个动作，然后恢复原策略继续闭环执行。
- 定义 Conversion Gap：局部动作收益到 H5/terminal 轨迹价值之间的转化缺口。
- 在官方 NavGPT-2 上，runner-up 动作的 H1 优势只有约三分之一保留到 H5/terminal。
- H1-oracle 证明可恢复的反事实动作价值存在，但策略置信排序不能可靠识别。

避免：

- 不写成新模型。
- 不写成 SOTA。

## 1 引言

逻辑：

1. VLN 的最终目标是闭环轨迹成功，而不是单步动作看起来合理。
2. 现有研究常通过更强表示、语言推理、记忆或候选排序改善决策，但较少直接测量一个动作改变如何影响后续闭环轨迹。
3. 本文观察到局部候选优势与最终轨迹收益之间存在转换失效。
4. 提出 PCAI 作为诊断协议。
5. 在官方 NavGPT-2 上进行 no-op、runner-up、H1-oracle、gap-random 对照。

贡献写法：

1. 提出 PCAI，用于评估 VLN 中单次动作干预的闭环轨迹后果。
2. 定义并量化 Conversion Gap，显示大量 H1 有益动作在 H5/terminal 被擦除或反转。
3. 通过 H1-oracle 和 gap-random 对照区分可恢复反事实价值与任意动作扰动。
4. 给出失败的单步 reranking/switching 结果作为机制边界，说明未来方法需要多步价值建模。

## 2 相关工作

建议小节：

1. Vision-and-Language Navigation and R2R
2. Map-based and graph-based VLN agents
3. LLM/VLM-augmented navigation agents
4. Counterfactual evaluation and intervention analysis
5. Navigation value estimation and uncertainty

注意：

- 需要网页版 GPT 或你再补最新文献检索。
- 不要声称 "first" 除非做过系统检索。

## 3 方法：PCAI

必须说明：

- 输入：同一条 instruction，同一环境状态，同一冻结策略。
- 干预：只在一个状态强制替换一个 action。
- 后续：恢复 baseline 策略继续 rollout。
- 比较：baseline trajectory vs intervened trajectory。
- 指标：H1/H3/H5/terminal distance gain, SR, SPL, nDTW, SDTW, CLS。
- 控制：
  - no-op；
  - runner-up；
  - H1 oracle；
  - gap-random。

数学定义：

- state `s_t`
- baseline action `a_t`
- intervention action `a'_t`
- rollout `tau(a_t)` and `tau(a'_t)`
- gain `G_k = d(v_{t+k}, goal) - d(v'_{t+k}, goal)`
- retained/erased/reversed categories.

## 4 实验设置

必须报告：

- Dataset: R2R
- Splits: val_seen and val_unseen
- Baseline: official clean NavGPT-2
- Action interface: discrete waypoint / graph navigation
- Batch size fixed to 1 for intervention experiments
- Frozen policy, no training during PCAI
- No-op control
- Scan-cluster bootstrap / Wilson interval / McNemar where appropriate
- Large files/checkpoints not committed; SHA and summaries retained

## 5 结果

建议结果顺序：

1. No-op control validates intervention machinery.
2. Runner-up closed-loop effect on val_seen and val_unseen.
3. Conversion categories: H1 positive -> retained/erased/reversed.
4. Pairwise H1-oracle vs runner-up.
5. Pairwise gap-random vs runner-up.
6. Negative learned switch/reranking attempts as appendix or diagnostic discussion.

核心叙事：

- Runner-up is not random noise and sometimes helps.
- But most immediate improvements are not stable.
- H1-oracle shows useful alternatives exist.
- Gap-random shows arbitrary alternatives are harmful.
- Therefore the bottleneck is not merely candidate availability, but action-value conversion and selection.

## 6 讨论

讨论点：

- Why local improvement fails:
  - instruction route constraints;
  - graph memory/state distribution shift;
  - policy recovery after intervention;
  - short-horizon distance is not path fidelity.
- Why hard overrides failed:
  - one-step scorer cannot model future rollout;
  - high policy confidence does not equal trajectory value.
- Future work:
  - multi-step counterfactual value model;
  - intervention-aware DAgger;
  - uncertainty-gated residual policy updates;
  - cross-architecture replication with DUET.

## 7 局限性

必须诚实写：

- Main evidence is currently official NavGPT-2.
- H1 oracle uses privileged goal information and is diagnostic only.
- R2R graph/discrete action setting does not imply real-robot generalization.
- DUET replication is optional/pending unless completed.
- Negative SCG/CTAS experiments are project-specific and not proof that all rerankers fail.

## 8 结论

结论写法：

> 本文表明，VLN 中一个动作的局部优势不能被直接视为闭环轨迹价值。PCAI 揭示了 NavGPT-2 中显著的 Conversion Gap：可恢复的反事实价值存在，但当前策略置信排序难以稳定选择这些动作。该发现提示未来 VLN 方法应从单步候选排序转向多步闭环价值建模与干预感知学习。

