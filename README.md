# ARMA Stochastic Modeling of Seismic Time Series (Fortran 90)

This repository contains the source code, data, and documentation associated with my Master’s thesis:

**“Procesos estocásticos ARMA para el estudio de series temporales sísmicas del Ecuador.”**

The project uses **Fortran 90** to implement a workflow for preprocessing, whitening, and analyzing seismic time series using Gaussian noise generation, minimum-distance fitting, signal whitening, and principal component analysis.

---

## 📁 Repository Structure

.
├── src/
│ ├── 1gauss.f90 # Gaussian noise generator / initial processing
│ ├── 2mindfp.f90 # Minimum-distance fitting procedure
│ ├── 3whiten.f90 # Whitening and signal conditioning
│ └── 4prin.f90 # Principal component / final analysis
├── data/ # Input seismic time series (not included or add your own)
├── results/ # Output files and logs
└── PaperTesisWJCA.pdf # Full thesis
---

## ⚙️ Requirements

To compile and run the code you will need:

- A **Fortran 90 or newer compiler**, for example:
  - `gfortran` (GNU Fortran)
  - `ifort` (Intel Fortran compiler)
  - `nvfortran` (NVIDIA HPC SDK)
- A Linux/Mac/WSL terminal (Windows users can also use MinGW or Cygwin)

---

## ▶️ How to Compile

From the `src/` directory, compile each script:

```bash
gfortran -o gauss 1gauss.f90
gfortran -o mindfp 2mindfp.f90
gfortran -o whiten 3whiten.f90
gfortran -o prin 4prin.f90
