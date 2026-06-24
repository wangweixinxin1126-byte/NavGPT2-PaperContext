# README for Web GPT: NavGPT-2 Conversion Gap Study

This repository contains the working context for writing a Chinese VLN paper from a long Codex-driven NavGPT-2 research process.

Read this file first. Then read:

1. `paper_context/01_claim_evidence.md`
2. `paper_context/03_main_results_tables.md`
3. `paper_context/04_negative_results.md`
4. `paper_context/05_paper_outline_zh.md`
5. `docs/handoff/latest.md`

Do not infer claims from chat history. Treat this context pack as the source of truth unless the user provides newer experiment logs.

## Paper Position

This is not a new VLN model and not a state-of-the-art navigation method.

The current paper is a diagnostic and evaluation-protocol paper:

> We introduce a paired closed-loop action intervention protocol (PCAI) to diagnose how local action preference in Vision-and-Language Navigation converts, or fails to convert, into multi-step and terminal trajectory value.

## Core Terms

- **PCAI**: Paired Closed-Loop Action Intervention. At one matched state, force a single alternative action, then return control to the same frozen policy and compare trajectories.
- **Conversion Gap**: The gap between local/immediate action advantage and closed-loop multi-step or terminal trajectory value.
- **H1 / H3 / H5**: Distance gain at 1, 3, and 5 actions after intervention.
- **Runner-up action**: The second-best policy-logit navigational action at the intervention state.
- **H1 oracle action**: A candidate action selected with privileged goal distance to maximize immediate improvement. It is not an online deployable method. It is used as a diagnostic upper-bound/control.
- **Gap-random action**: A gap-matched random alternative candidate used as a control.
- **No-op action**: Re-forcing the original baseline action. It must produce identical trajectories.

## Current Main Evidence

Main evidence should come from official clean NavGPT-2 on R2R `val_seen` and `val_unseen`.

Use development-branch experiments only as motivation or appendix, not as primary evidence.

## Allowed Main Claims

Confirmed by current evidence:

1. PCAI provides a reproducible way to isolate the effect of one action change while keeping the policy, environment, and downstream rollout fixed.
2. On official NavGPT-2, many local action alternatives do not reliably convert into H5 or terminal value.
3. H1-oracle interventions on `val_unseen` reveal recoverable counterfactual value, but the policy runner-up does not consistently identify it.
4. No-op controls show that the replay/intervention machinery itself does not perturb trajectories when the forced action equals the baseline action.

Allowed with careful wording:

1. The evidence suggests a policy-confidence-to-trajectory-value mismatch.
2. The results motivate future multi-step value estimation or closed-loop intervention-aware learning.

Do not claim yet unless DUET replication is completed:

1. Cross-architecture universality.
2. General VLN law.
3. State-of-the-art performance.
4. A new navigation improvement method.

## Main Writing Stance

Frame the work as:

- closed-loop diagnostic protocol;
- causal intervention analysis;
- evidence for local-to-trajectory conversion failure;
- reusable evaluation assets and statistics.

Avoid framing as:

- a successful reranker;
- a learned switching model;
- a large language model reasoning module;
- a benchmark performance improvement paper.

## Recommended Journal Positioning

Best-fit journal family: robotics/autonomous systems rather than pure computer vision.

Suggested first target:

- Robotics and Autonomous Systems

Safer backup:

- Journal of Intelligent & Robotic Systems

The manuscript should emphasize closed-loop embodied decision analysis, not image recognition or leaderboard gains.

