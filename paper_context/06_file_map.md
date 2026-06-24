# File Map for Web GPT and Reviewers

This file tells Web GPT which repository files matter.

## First-read documents

- `paper_context/00_README_FOR_GPT.md`
- `paper_context/01_claim_evidence.md`
- `paper_context/03_main_results_tables.md`
- `docs/handoff/latest.md`

## Manuscript drafts and writing materials

Expected locations:

- `paper_materials/conversion_gap/`
- `outputs/conversion_gap_vln_paper_zh_full.md` if copied from Codex local workspace
- `outputs/conversion_gap_claim_evidence_zh.md` if copied from Codex local workspace

## Main official evidence

Expected locations in the remote repo:

- `analysis/conversion_gap_official/results/val_seen_runnerup_statistics.txt`
- `analysis/conversion_gap_official/results/val_unseen_runnerup_statistics.txt`
- `analysis/conversion_gap_official/results/oracle_vs_runnerup_pairwise.txt`
- `analysis/conversion_gap_official/results/random_vs_runnerup_pairwise.txt`
- `analysis/conversion_gap_official/results/VAL_SEEN_RUNNERUP_SHA256SUMS`
- `analysis/conversion_gap_official/results/VAL_UNSEEN_RUNNERUP_SHA256SUMS`
- `analysis/conversion_gap_official/results/OFFICIAL_REPLICATION_SHA256SUMS`

## Key scripts

- `scripts/analyze_v55_horizon_conversion.py`
  - Computes H1/H3/H5/terminal gains and conversion categories.
- `scripts/summarize_heldout_conversion.py`
  - Produces held-out statistics with scan-cluster CIs.
- `scripts/build_pairwise_control_manifests.py`
  - Builds H1-oracle and gap-random pairwise common-support controls.
- `scripts/compare_pairwise_conversion.py`
  - Compares two intervention result sets on paired episodes.
- `r2r/forced_action_replay.py`
  - Implements one-shot action forcing.
- `r2r/official_proposal_trace.py`
  - Traces official NavGPT-2 proposal states.

## Files not to commit

Never commit:

- `datasets/`
- raw LMDB features
- Matterport3D scans
- `.hdf5` feature files
- `.pth`, `.pt`, `.ckpt`, `.safetensors` model weights
- raw huge JSONL candidate files larger than GitHub can comfortably handle

Instead, commit:

- summaries
- SHA256SUMS
- scripts
- protocol files
- small manifest samples if needed
- paper context files

## If Web GPT has limited time

Ask it to inspect only:

1. `paper_context/00_README_FOR_GPT.md`
2. `paper_context/01_claim_evidence.md`
3. `paper_context/03_main_results_tables.md`
4. `paper_context/04_negative_results.md`
5. `paper_context/05_paper_outline_zh.md`

Then ask it to write or revise the manuscript.

