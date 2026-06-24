# Claim-Evidence Ledger

Use this file to keep every manuscript claim proportional to evidence.

Labels:

- **Confirmed**: directly supported by available results/logs/scripts.
- **Inference**: reasonable interpretation, but not directly proven.
- **Proposal**: future direction, not a result.
- **Do not claim**: unsupported or contradicted by experiments.

## Claim 1: PCAI is a valid closed-loop intervention protocol for NavGPT-2

Status: Confirmed.

Evidence:

- Official NavGPT-2 no-op control applied 500 interventions.
- Forced original action produced 0 trajectory changes.
- Runner-up and other forced alternatives changed exactly the targeted trajectories when applied.

Use in paper:

> The no-op control verifies that the intervention machinery does not alter the rollout when the selected action is unchanged, supporting PCAI as a controlled closed-loop diagnostic protocol.

Avoid:

> PCAI proves causal mechanisms in all VLN models.

## Claim 2: Runner-up policy alternatives show weak conversion into trajectory value

Status: Confirmed for official NavGPT-2 on R2R `val_seen` and `val_unseen`.

Evidence:

`val_seen`:

- Interventions: 589 / 589
- H1 beneficial cases: 251
- H5 retained: 88 / 251 = 35.06%
- H5 erased: 48.61%
- H5 reversed: 16.33%
- Terminal retained: 29.88%
- Terminal erased: 55.78%
- Terminal reversed: 14.34%

`val_unseen`:

- Interventions: 1278 / 1278
- H1 beneficial cases: 559
- H5 retained: 213 / 559 = 38.10%
- H5 erased: 45.97%
- H5 reversed: 15.92%
- Terminal retained: 31.13%
- Terminal erased: 56.35%
- Terminal reversed: 12.52%

Use in paper:

> Even when a runner-up action produces immediate progress, only about one third of such cases retain a positive effect at H5 or at the terminal state.

Avoid:

> Runner-up actions are useless.

The data show they sometimes help, but conversion is unstable.

## Claim 3: Recoverable counterfactual action value exists

Status: Confirmed on official NavGPT-2 `val_unseen` pairwise control.

Evidence:

H1-oracle vs runner-up on 257 paired episodes:

- H3 direct gain: +2.9958 m
- H5 direct gain: +2.7169 m
- Terminal direct gain: +2.5716 m
- Success: 109/257 -> 163/257
- Difference: +21.0117 percentage points
- Success wins/losses: 64 / 10
- Exact McNemar p approximately 0

Use in paper:

> The H1-oracle intervention reveals that better counterfactual actions often exist at the same state, but they are not reliably selected by the policy confidence ranking.

Avoid:

> The H1 oracle is an online method.

The H1 oracle uses privileged goal-distance information and must be described as diagnostic only.

## Claim 4: Random alternatives are not a meaningful explanation for oracle gains

Status: Confirmed for the available `val_unseen` pairwise gap-random control.

Evidence:

Gap-random vs runner-up on 164 paired episodes:

- H3 direct gain: -1.2973 m
- H5 direct gain: -1.0723 m
- Terminal direct gain: -1.1267 m
- Success: 88/164 -> 78/164
- Difference: -6.0976 percentage points
- Success wins/losses: 11 / 21
- Exact McNemar p: 0.11018417

Use in paper:

> Gap-matched random alternatives are worse than runner-up actions in distance metrics, indicating that the H1-oracle effect is not explained by arbitrary action perturbation.

Careful wording:

- Distance degradation is robust.
- Success degradation is directional but not significant under exact paired McNemar.

## Claim 5: Single-step learned reranking is insufficient

Status: Confirmed as negative evidence in this project; use as motivation or appendix.

Evidence:

- SCG-v5.3/v5.5 online overrides failed to produce stable improvements.
- CTAS learned switch did not outperform policy-only features in pilot probes.
- Always-switch over 6439 train interventions was harmful:
  - SR 72.82 -> 72.16
  - SPL 61.92 -> 59.57
  - nDTW 68.96 -> 66.60

Use in paper:

> Our failed reranking and switching attempts motivate treating the issue as a conversion problem rather than a one-step local ranking problem.

Avoid:

> We propose SCG/CTAS as final methods.

## Claim 6: The phenomenon generalizes across architectures

Status: Unknown / not yet confirmed.

Needed evidence:

- DUET official checkpoint and ViTBase features.
- `val_unseen` PCAI baseline trace.
- No-op pilot.
- Runner-up pilot.
- Formal approximately 500 interventions.

Current manuscript boundary:

> We report cross-architecture replication only if DUET PCAI is completed. Otherwise, state it as future work.

