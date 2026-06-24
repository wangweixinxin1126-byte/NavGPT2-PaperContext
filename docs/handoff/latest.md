# NavGPT-2 Conversion Gap Handoff

Updated for Web GPT handoff.

## Reading Order

1. `paper_context/00_README_FOR_GPT.md`
2. `paper_context/01_claim_evidence.md`
3. `paper_context/03_main_results_tables.md`
4. `paper_context/04_negative_results.md`
5. PR diff or changed files

## Current Project Status

The project has shifted from trying to build a new NavGPT-2 reranking method to writing a diagnostic VLN paper.

Main paper object:

- PCAI: Paired Closed-Loop Action Intervention
- Conversion Gap: local action advantage often fails to convert into H5 or terminal trajectory value

## Main Evidence

Official clean NavGPT-2:

- `val_seen`: 589 runner-up interventions, H5 retention among H1-beneficial actions 35.06%.
- `val_unseen`: 1278 runner-up interventions, H5 retention among H1-beneficial actions 38.10%.
- No-op: 500 interventions, 0 trajectory changes.
- `val_unseen` H1-oracle vs runner-up: +2.7169 m H5 gain and +21.0117 pp success on 257 paired episodes.
- `val_unseen` gap-random vs runner-up: -1.0723 m H5 gain on 164 paired episodes.

## What Not to Write as Success

Do not present these as final methods:

- SCG-v5.3/v5.5 online reranking
- CTAS learned switch
- distance-only candidate ranker
- single-step final-logit override

They are negative evidence that single-step local reranking is insufficient.

## Current Next Step

Preferred:

- Write the paper from the official NavGPT-2 PCAI evidence.

Optional:

- Add DUET cross-architecture replication only if data/checkpoints can be prepared quickly.

## Reviewer Risks

1. The paper may be seen as analysis-only unless PCAI is framed as a reusable protocol.
2. Cross-architecture generality is not proven unless DUET is completed.
3. H1-oracle uses privileged goal distance and must be described as diagnostic only.
4. Negative SCG/CTAS routes should not clutter the main story.

