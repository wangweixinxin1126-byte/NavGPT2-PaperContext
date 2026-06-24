#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-$PWD}"
cd "$ROOT"

mkdir -p paper_context docs/handoff

cat > paper_context/00_README_FOR_GPT.md <<'MD'
# README for Web GPT: NavGPT-2 Conversion Gap Study

Read this file first. Then read `paper_context/01_claim_evidence.md`, `paper_context/03_main_results_tables.md`, `paper_context/04_negative_results.md`, `paper_context/05_paper_outline_zh.md`, and `docs/handoff/latest.md`.

This is not a new VLN model and not a state-of-the-art navigation method. The paper is a diagnostic and evaluation-protocol paper about PCAI, Paired Closed-Loop Action Intervention, and the Conversion Gap between local action advantage and closed-loop trajectory value.

Main evidence should come from official clean NavGPT-2 on R2R `val_seen` and `val_unseen`. Development-branch experiments should be used only as motivation or appendix.

Allowed claims:

1. PCAI isolates the effect of one action change while keeping the policy, environment, and downstream rollout fixed.
2. On official NavGPT-2, many local action alternatives do not reliably convert into H5 or terminal value.
3. H1-oracle interventions on `val_unseen` reveal recoverable counterfactual value, but policy runner-up does not consistently identify it.
4. No-op controls show that the replay/intervention machinery itself does not perturb trajectories when the forced action equals the baseline action.

Do not claim SOTA, a new navigation model, or cross-architecture universality unless DUET replication is completed.
MD

cat > paper_context/01_claim_evidence.md <<'MD'
# Claim-Evidence Ledger

## Confirmed claim: PCAI is valid for official NavGPT-2 diagnostics

Evidence: no-op control applied 500 interventions and changed 0 trajectories.

## Confirmed claim: runner-up alternatives show weak conversion

`val_seen`: 589 interventions; H1-beneficial cases 251; H5 retained 35.06%, erased 48.61%, reversed 16.33%; terminal retained 29.88%.

`val_unseen`: 1278 interventions; H1-beneficial cases 559; H5 retained 38.10%, erased 45.97%, reversed 15.92%; terminal retained 31.13%.

## Confirmed claim: recoverable counterfactual value exists

`val_unseen` H1-oracle vs runner-up, 257 paired episodes: H5 +2.7169 m, terminal +2.5716 m, success 109/257 -> 163/257, +21.0117 pp, wins/losses 64/10, McNemar p approximately 0.

## Confirmed claim: random alternatives are harmful controls

`val_unseen` gap-random vs runner-up, 164 paired episodes: H5 -1.0723 m, terminal -1.1267 m, success 88/164 -> 78/164, McNemar p 0.11018417.

## Negative evidence

SCG, CTAS, distance-only reranking, and single-step final-logit overrides should not be written as successful methods. They motivate why closed-loop conversion must be measured directly.
MD

cat > paper_context/03_main_results_tables.md <<'MD'
# Main Result Tables

## Official NavGPT-2 Runner-up PCAI

| Split | Episodes | Interventions | Baseline SR | Runner-up SR | Fixes | Regressions | McNemar p |
|---|---:|---:|---:|---:|---:|---:|---:|
| val_seen | 1021 | 589 | 72.9677 | 73.7512 | 50 | 42 | 0.46570745 |
| val_unseen | 2349 | 1278 | 69.6892 | 70.4555 | 114 | 96 | 0.24068186 |

## Conversion of H1-beneficial Runner-up Actions

| Split | H1-beneficial | H5 retained | H5 erased | H5 reversed | Terminal retained | Terminal erased | Terminal reversed |
|---|---:|---:|---:|---:|---:|---:|---:|
| val_seen | 251 | 35.06% | 48.61% | 16.33% | 29.88% | 55.78% | 14.34% |
| val_unseen | 559 | 38.10% | 45.97% | 15.92% | 31.13% | 56.35% | 12.52% |

## val_unseen Pairwise Controls

H1-oracle vs runner-up: 257 paired episodes, H5 +2.7169 m, terminal +2.5716 m, success +21.0117 pp.

Gap-random vs runner-up: 164 paired episodes, H5 -1.0723 m, terminal -1.1267 m, success -6.0976 pp.
MD

cat > paper_context/04_negative_results.md <<'MD'
# Negative Results

Do not present the following as successful methods:

- SCG-v5.3/v5.5 online reranking.
- v5.4/v5.5 distance ranking as an online method.
- CTAS learned switch.
- Always-switch policies.

Allowed role:

- They show that local or one-step reranking is not enough.
- They motivate PCAI and Conversion Gap analysis.

Forbidden role:

- Do not claim they are deployable improvements.
- Do not claim they solve VLN grounding.
MD

cat > paper_context/05_paper_outline_zh.md <<'MD'
# 中文论文框架

题目建议：从局部动作优势到闭环轨迹价值：视觉语言导航中的转换鸿沟与配对动作干预

## 贡献

1. 提出 PCAI 配对闭环动作干预协议。
2. 定义并量化 Conversion Gap。
3. 在官方 NavGPT-2 上用 no-op、runner-up、H1-oracle、gap-random 对照揭示局部动作优势与闭环轨迹价值之间的不稳定转换。

## 章节

1. 引言
2. 相关工作
3. PCAI 方法与 Conversion Gap 定义
4. 实验设置
5. 主结果
6. 失败路线和机制分析
7. 讨论与局限性
8. 结论
MD

cat > paper_context/06_file_map.md <<'MD'
# File Map

Priority documents:

- `paper_context/00_README_FOR_GPT.md`
- `paper_context/01_claim_evidence.md`
- `paper_context/03_main_results_tables.md`
- `paper_context/04_negative_results.md`
- `docs/handoff/latest.md`

Priority scripts:

- `scripts/analyze_v55_horizon_conversion.py`
- `scripts/summarize_heldout_conversion.py`
- `scripts/build_pairwise_control_manifests.py`
- `scripts/compare_pairwise_conversion.py`
- `r2r/forced_action_replay.py`
- `r2r/official_proposal_trace.py`

Do not commit datasets, checkpoints, LMDB features, HDF5 features, Matterport3D scans, or large raw JSONL files.
MD

cat > paper_context/07_web_gpt_prompt.md <<'MD'
# Prompt to Paste into Web GPT

请先阅读 GitHub 仓库中的 `paper_context/00_README_FOR_GPT.md`，然后阅读 `paper_context/01_claim_evidence.md`、`paper_context/03_main_results_tables.md`、`paper_context/04_negative_results.md`、`paper_context/05_paper_outline_zh.md` 和 `docs/handoff/latest.md`。

请基于这些文件帮我写中文 VLN 二区期刊论文。注意：本文不是新模型，不是 SOTA 方法，而是官方 NavGPT-2 上的 PCAI 闭环反事实诊断研究。不要把 SCG、CTAS、distance reranker 写成成功方法。所有 claim 必须遵守 evidence boundary。
MD

cat > docs/handoff/latest.md <<'MD'
# NavGPT-2 Conversion Gap Handoff

Current project status: write a diagnostic VLN paper from official NavGPT-2 PCAI evidence.

Main evidence:

- `val_seen`: 589 runner-up interventions, H5 retention among H1-beneficial actions 35.06%.
- `val_unseen`: 1278 runner-up interventions, H5 retention among H1-beneficial actions 38.10%.
- No-op: 500 interventions, 0 trajectory changes.
- `val_unseen` H1-oracle vs runner-up: +2.7169 m H5 gain and +21.0117 pp success on 257 paired episodes.
- `val_unseen` gap-random vs runner-up: -1.0723 m H5 gain on 164 paired episodes.

Do not present SCG or CTAS as successful final methods.
MD

echo "Paper context pack created under: $ROOT/paper_context"
echo "Handoff created under: $ROOT/docs/handoff/latest.md"

