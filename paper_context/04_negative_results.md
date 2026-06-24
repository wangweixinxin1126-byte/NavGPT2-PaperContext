# Negative Results and What Not to Write as Main Contribution

This file prevents Web GPT from accidentally turning failed routes into claimed methods.

## Do not present SCG as the final method

What was tried:

- SCG-v5.3 legal candidate reranker.
- SCG-v5.4 action-aligned final-logit trace.
- SCG-v5.5 value/distance ranking and online override.

Why it failed as a method:

- Offline candidate ranking looked useful.
- Online closed-loop gains were weak, unstable, or negative.
- Hard overriding final logits changed trajectory branches without modeling future rollout.

Allowed paper role:

- Negative evidence supporting the need for closed-loop intervention analysis.

Forbidden paper framing:

- "We propose SCG to improve NavGPT-2."
- "SCG achieves robust gains."

## Do not present CTAS as a successful learned switch

What was tried:

- CTAS pilot and train6508 proposal sets.
- Compact policy features.
- Hidden/action features.
- Probe models for beneficial/harmful switch prediction.

Why it failed as a main method:

- Fused/action-hidden features did not improve reliably over policy-only.
- Harmful acceptance remained nontrivial.
- Always-switch degraded metrics on train6508:
  - SR: 72.82 -> 72.16
  - SPL: 61.92 -> 59.57
  - nDTW: 68.96 -> 66.60

Allowed paper role:

- Motivation that simple learned switching is not enough.
- Appendix negative result.

Forbidden paper framing:

- "CTAS is a deployable action switcher."
- "Action hidden states solve the conversion gap."

## Do not claim local distance is equivalent to instruction following

Evidence:

- Many immediate gains disappear or reverse at H5/terminal.
- VLN routes may require temporarily non-greedy movement to follow instruction structure.

Allowed paper wording:

- "Immediate goal-distance improvement is an imperfect proxy for trajectory value."

Forbidden wording:

- "Closer candidate means better navigation action."

## Do not overclaim runner-up intervention

Runner-up action sometimes improves SR, but:

- McNemar p is not significant for val_seen or val_unseen runner-up SR.
- H5/terminal conversion is weak.

Allowed paper role:

- Runner-up is a policy-confidence probe.

Forbidden paper role:

- Runner-up is a performance-improving method.

## Do not claim cross-architecture generality before DUET

Current evidence:

- Official NavGPT-2 only, plus development-branch NavGPT-2 variants.

Needed:

- DUET official val_unseen PCAI or another public VLN architecture.

Allowed wording before DUET:

- "We leave cross-architecture replication to future work."

Forbidden wording before DUET:

- "The conversion gap is universal across VLN models."

