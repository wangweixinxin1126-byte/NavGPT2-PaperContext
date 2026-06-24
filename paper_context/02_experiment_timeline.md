# Experiment Timeline

This timeline helps Web GPT understand what happened without reading the full Codex chat history.

## Stage 1: SCG single-step reranking attempts

Goal:

- Use semantic/candidate grounding signals to choose better candidate actions.

Versions:

- SCG-v5.3 legal candidate reranker.
- SCG-v5.4 action-aligned final-logit trace.
- SCG-v5.5 value/distance ranking.

Outcome:

- Offline ranking appeared promising.
- Online intervention was weak or unstable.
- `val_train_seen` smoke and held-out splits showed that local candidate improvement did not reliably improve full trajectories.

Paper role:

- Negative motivation only.
- Do not present as final method.

## Stage 2: Action-aligned trace and local value labels

Goal:

- Align training data with the final action logits actually used by NavGPT-2.

Outcome:

- The trace was trajectory-neutral.
- Final-logit changes existed, but candidate ranking was often unchanged.
- Distance labels revealed many locally improvable states.

Paper role:

- Useful background for why conversion, not just local scoring, became the core problem.
- Usually appendix or internal motivation.

## Stage 3: v6 counterfactual replay on development branch

Goal:

- Force one selected action and let the baseline continue, then measure H1/H3/H5/terminal value.

Important result:

- Immediate gains often disappeared or reversed.

Development-branch scale:

- 6439 applied interventions from 6508 proposals.
- H5 retained: 34.52%
- H5 erased: 49.87%
- H5 reversed: 15.61%
- Success fixes/regressions: 454 / 497

Paper role:

- Supplemental replication/motivation.
- Not main evidence because the branch contains multiple previous modifications.

## Stage 4: CTAS learned switch model

Goal:

- Learn whether to accept or reject proposed action switches using policy and hidden-state features.

Pilot results:

- Policy-only features were stronger than fused/action-hidden features.
- Fused AP did not improve over policy-only.
- Top-10% H5 gains were unstable or negative.
- Always-switch on train6508 was harmful.

Paper role:

- Negative result showing that naive learned switching is not yet enough.
- Do not write as successful contribution.

## Stage 5: Official clean NavGPT-2 PCAI

Goal:

- Re-run PCAI on official clean NavGPT-2 to remove confounds from development-branch changes.

Main results:

- `val_seen`: 589 runner-up interventions.
- `val_unseen`: 1278 runner-up interventions.
- No-op: 500 interventions, 0 trajectory changes.
- Pairwise controls on `val_unseen`:
  - H1-oracle vs runner-up: strong positive direct gains.
  - Gap-random vs runner-up: negative distance effect.

Paper role:

- Main evidence.

## Stage 6: Optional DUET cross-architecture replication

Goal:

- Test whether the same PCAI phenomenon appears in a different VLN architecture.

Current state:

- Optional.
- Requires official DUET checkpoint and ViTBase feature file.
- If setup takes more than one day, do not delay writing.

Paper role:

- If completed, add as cross-architecture replication.
- If not completed, list as limitation/future work.

