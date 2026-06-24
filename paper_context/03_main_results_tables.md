# Main Result Tables

This file contains the numeric results most likely to be cited in the manuscript.

## Table 1: Official NavGPT-2 Runner-up PCAI on Held-out Splits

| Split | Episodes | Interventions | Baseline SR | Runner-up SR | Fixes | Regressions | McNemar p |
|---|---:|---:|---:|---:|---:|---:|---:|
| val_seen | 1021 | 589 | 72.9677 | 73.7512 | 50 | 42 | 0.46570745 |
| val_unseen | 2349 | 1278 | 69.6892 | 70.4555 | 114 | 96 | 0.24068186 |

Interpretation:

- Runner-up intervention slightly increases SR, but success improvements are not statistically significant under exact McNemar.
- The paper should not frame runner-up as a reliable performance method.

## Table 2: Conversion of H1-beneficial Runner-up Actions

| Split | H1-beneficial | H5 retained | H5 erased | H5 reversed | Terminal retained | Terminal erased | Terminal reversed |
|---|---:|---:|---:|---:|---:|---:|---:|
| val_seen | 251 | 35.06% | 48.61% | 16.33% | 29.88% | 55.78% | 14.34% |
| val_unseen | 559 | 38.10% | 45.97% | 15.92% | 31.13% | 56.35% | 12.52% |

Interpretation:

- Only about one third of immediate improvements persist.
- This is the core Conversion Gap evidence.

## Table 3: Official val_unseen Full Metrics

| Method | SR | SPL | nDTW | SDTW | CLS |
|---|---:|---:|---:|---:|---:|
| Baseline | 69.69 | 58.73 | 66.51 | 56.54 | 65.00 |
| Runner-up | 70.46 | 58.77 | 66.35 | 56.62 | 64.62 |
| H1-oracle | 71.82 | 60.29 | 67.74 | 58.13 | 65.96 |
| Gap-random | 69.22 | 58.15 | 65.97 | 55.99 | 64.61 |

Interpretation:

- H1-oracle improves metrics but uses privileged diagnostic information.
- Gap-random harms most metrics.
- Runner-up is between the two.

## Table 4: Pairwise val_unseen Controls

### H1-oracle vs Runner-up

Paired episodes: 257.

| Metric | Direct gain of H1-oracle over runner-up | Scan-cluster CI | Wins / Losses / Neutral |
|---|---:|---:|---:|
| H1 distance | +3.5622 m | [2.9958, 4.3251] | 257 / 0 / 0 |
| H3 distance | +2.9958 m | [2.1492, 3.9363] | 175 / 40 / 42 |
| H5 distance | +2.7169 m | [1.8394, 3.9095] | 139 / 44 / 74 |
| Terminal distance | +2.5716 m | [1.8071, 3.8157] | 113 / 31 / 113 |

Success:

- Runner-up: 109 / 257
- H1-oracle: 163 / 257
- Difference: +21.0117 percentage points
- Success wins/losses: 64 / 10
- McNemar p approximately 0

Important caution:

- H1 all-wins is by construction and should not be over-interpreted.

### Gap-random vs Runner-up

Paired episodes: 164.

| Metric | Direct gain of gap-random over runner-up | Scan-cluster CI | Wins / Losses / Neutral |
|---|---:|---:|---:|
| H1 distance | -1.6932 m | [-2.6066, -1.0931] | 35 / 129 / 0 |
| H3 distance | -1.2973 m | [-2.5867, -0.3844] | 49 / 81 / 34 |
| H5 distance | -1.0723 m | [-1.9372, -0.5114] | 42 / 64 / 58 |
| Terminal distance | -1.1267 m | [-2.0112, -0.4000] | 38 / 50 / 76 |

Success:

- Runner-up: 88 / 164
- Gap-random: 78 / 164
- Difference: -6.0976 percentage points
- Success wins/losses: 11 / 21
- McNemar p: 0.11018417

Interpretation:

- Distance metrics robustly worsen.
- Success decrease is directional but not significant under exact McNemar.

## Table 5: No-op Causal Control

| Control | Applied | Unique | Trajectory changes |
|---|---:|---:|---:|
| No-op official NavGPT-2 | 500 | 500 | 0 |

Interpretation:

- The intervention/replay path itself does not perturb trajectories when the selected action is unchanged.

