# DUET Pairwise Action-Identity Controls

## Setting

- Architecture: official DUET
- Dataset: R2R val_unseen
- Policy: frozen released checkpoint
- Batch size: 1
- Intervention: only one forced action
- All subsequent actions are selected by the same frozen policy
- Statistics use paired episodes and scan-cluster bootstrap confidence intervals

## H1-Oracle versus Runner-Up

Paired episodes: 218 across 11 scans.

| Metric | Mean paired difference | 95% scan-cluster CI |
|---|---:|---:|
| H1 distance gain | +3.6808 m | [2.9675, 4.5362] |
| H3 distance gain | +2.7753 m | [2.1634, 3.3428] |
| H5 distance gain | +2.8029 m | [1.6685, 3.7589] |
| Terminal distance gain | +2.2011 m | [1.2134, 3.0243] |
| Success-rate difference | +21.5596 pp | [11.9792, 30.8642] |

- Success: 92/218 to 139/218
- Success wins/losses: 53/6
- Exact McNemar p = 1.7539e-10

## Gap-Matched Random versus Runner-Up

Paired episodes: 149 across 10 scans.

| Metric | Mean paired difference | 95% scan-cluster CI |
|---|---:|---:|
| H1 distance gain | -1.7055 m | [-2.4313, -1.0050] |
| H3 distance gain | -1.8126 m | [-2.5464, -1.1734] |
| H5 distance gain | -1.3753 m | [-2.3037, -0.6089] |
| Terminal distance gain | -0.6564 m | [-1.2613, -0.1344] |
| Success-rate difference | -6.0403 pp | [-12.9310, 0.0000] |

- Success: 79/149 to 70/149
- Success wins/losses: 9/18
- Exact McNemar p = 0.12207812

## Supported Interpretation

The results establish an action-quality ordering on DUET:

H1-oracle > runner-up > gap-matched random.

Therefore, PCAI outcomes are not caused merely by forcing any action. They depend on the identity and quality of the replacement action, and the ordering persists from H1 to H5 and terminal distance.

## Evidence Boundary

H1-oracle uses privileged goal-distance information. It is a diagnostic causal control and upper bound, not a deployable navigation method.

The gap-random distance degradation is statistically supported. Its success-rate decrease is directional but not statistically significant.

These results strengthen the cross-architecture validity of PCAI and the Conversion Gap analysis.
