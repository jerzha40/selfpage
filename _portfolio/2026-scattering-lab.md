---
title: "Scattering Lab — Acoustic Waves in 2D"
excerpt: "Analytical benchmark and field visualization for sound-soft circular-obstacle scattering."
collection: portfolio
permalink: /portfolio/scattering-lab/
date: 2026-10-11
---

**Status: Research in progress — Stage 1 verification pending.**

A computational exploration of the two-dimensional Helmholtz scattering problem.

The initial implementation evaluates the Fourier–Hankel series for a sound-soft circular obstacle and plots the real part of the total wavefield at several wavenumbers.

This is an **analytical forward-problem benchmark**, not yet a numerical inverse solver.

**Stage 1 release checklist**

- [x] Compute and visualize example fields locally
- [ ] Document the governing equation and boundary/radiation conditions
- [ ] Run and record automated tests
- [ ] Archive example figures and exact reproduction instructions
- [ ] Publish a verified source repository and first release

Future stages may include boundary-element or finite-element forward methods and a separate inverse-problem study.

Source code will be linked after the first public, verified release.
