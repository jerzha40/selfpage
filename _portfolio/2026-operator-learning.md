---
title: "Operator Learning Lab — ResOpNet & SCHO"
excerpt: "An open research program exploring residual corrections for numerical integration and spline-coefficient operator learning."
collection: portfolio
permalink: /portfolio/operator-learning/
date: 2026-10-16
---

**Status: Research in progress — mathematical specifications published; numerical validation pending.**

The [Operator Learning Research Program](https://github.com/jerzha40/2026tua-OperatorLearning) explores two related methods:

- **ResOpNet (Residual Operator Network):** keep a classical quadrature rule and learn its signed local error from function samples. The central question is whether this can improve accuracy versus *strong classical quadrature methods* at comparable total cost.
- **SCHO (Spline-Coefficient HyperOperator):** represent functions through coefficients of fixed, linearly independent B-spline bases, and learn maps between input and output coefficient vectors. A proposed restricted residual function space (SCHO-Res) could augment the base representation.

The public repository contains the [ResOpNet manuscript](https://github.com/jerzha40/2026tua-OperatorLearning/tree/main/book/chapters/chapter4), an initial [SCHO mathematical specification](https://github.com/jerzha40/2026tua-OperatorLearning/tree/main/book/chapters/chapter5), and an evolving [research program plan](https://github.com/jerzha40/2026tua-OperatorLearning/blob/main/docs/program.md).

**Current limitations:** These are research proposals, not demonstrated numerical improvements. The SCHO physics-informed training setup has not been validated experimentally, and ResOpNet has not yet established a speed or accuracy advantage over classical quadrature. Initial priorities are reproducible small experiments, tests, independent references, and transparent comparisons.

**Source:** [jerzha40/2026tua-OperatorLearning](https://github.com/jerzha40/2026tua-OperatorLearning)
