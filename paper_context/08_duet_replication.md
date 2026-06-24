# DUET Cross-Architecture PCAI Replication

DUET val_unseen PCAI replication completed.

## Baseline Trace

Official DUET baseline on R2R val_unseen:

- SR: 71.52
- SPL: 60.41
- nDTW: 67.02
- SDTW: 58.06
- CLS: 65.81

## Runner-up500 Integrity

- Applied interventions: 500 / 500
- Unique applied episodes: 500
- Changed trajectories: 500
- Changed outside applied: 0
- Applied unchanged: 0
- Validation errors: 0

## No-op500 Causal Control

- Applied no-op interventions: 500 / 500
- Trajectory changes: 0

## Full Metrics

| Method | SR | SPL | nDTW | SDTW | CLS |
|---|---:|---:|---:|---:|---:|
| DUET baseline | 71.52 | 60.41 | 67.02 | 58.06 | 65.81 |
| DUET runner-up500 | 71.35 | 59.96 | 66.54 | 57.57 | 65.39 |

## Conversion Statistics

- H1 beneficial: 232 / 500
- H5 retained: 98 / 232 = 42.24%
- H5 erased: 105 / 232 = 45.26%
- H5 reversed: 29 / 232 = 12.50%
- Terminal retained: 80 / 232 = 34.48%
- Terminal erased: 128 / 232 = 55.17%
- Terminal reversed: 24 / 232 = 10.34%
- Success fixes/regressions: 53 / 57
- Exact McNemar p: 0.77500298

## Interpretation

DUET runner-up interventions do not provide a reliable navigation improvement, but they reproduce the main Conversion Gap pattern: many locally beneficial action changes fail to persist into H5 or terminal trajectory value.

This result can be written as cross-architecture replication evidence, with the boundary that it tests runner-up PCAI on DUET rather than all VLN architectures.
