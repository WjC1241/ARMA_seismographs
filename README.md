# ARMA Stochastic Modeling of Seismic Time Series (Fortran 90)

This repository contains the source code, data, and documentation associated with my [Master’s thesis](https://bibdigital.epn.edu.ec/bitstream/15000/21456/1/CD%2010924.pdf):

**“Procesos estocásticos ARMA para el estudio de series temporales sísmicas del Ecuador”**

The project uses **Fortran 90** to implement a workflow for preprocessing, whitening, and analyzing seismic time series using Gaussian noise generation, minimum-distance fitting, signal whitening, and principal component analysis.

---

## 📁 Repository Structure
```text
├── src/
│ ├── 1gauss.f90 # Gaussian noise generator / initial processing
│ ├── 2mindfp.f90 # Minimum-distance fitting procedure
│ ├── 3whiten.f90 # Whitening and signal conditioning
│ └── 4prin.f90 # Principal component / final analysis
└── data/ # Input seismic time series (I am currently producing a small example file)
```
 


## ⚙️ Requirements

To compile and run the code you will need:

- A **Fortran 90 or newer compiler**, for example:
  - `gfortran` (GNU Fortran)
  - `ifort` (Intel Fortran compiler)
  - `nvfortran` (NVIDIA HPC SDK)
- A Linux/Mac/WSL terminal (Windows users can also use MinGW or Cygwin)

---

## ▶️ Compile

From the `src/` directory, compile each script:

```bash
gfortran 1gauss.f90 2mindfp.f90 3whiten.f90 4prin.f90 -o myprogram
```

If you want debug info:
```bash
gfortran -g 1gauss.f90 2mindfp.f90 3whiten.f90 4prin.f90 -o myprogram
```

or optinization 
```bash
gfortran -O3 1gauss.f90 2mindfp.f90 3whiten.f90 4prin.f90 -o myprogram

```

## ▶️ Run


```bash
./myprogram
```

## 

## 📬 Contact

If you have questions or suggestions, feel free to open an issue or contact me.


