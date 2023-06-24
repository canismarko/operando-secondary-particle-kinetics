This repository accompanies the paper titled:

> Origin of Rapid Delithiation In Secondary Particles Of
> LiNi0.8Co0.15Al0.05O2 and LiNiyMnzCo1–y–zO2 Cathodes

by

> Mark Wolfman, Brian M. May, Vishwas Goel, Sicen Du, Young-Sang Yu,
> Nicholas V. Faenza, Nathalie Pereira, Kamila M. Wiaderek, Ruqing Xu,
> Jiajun Wang, Glenn G. Amatucci, Katsuyo Thornton, and Jordi Cabana

# Transmission X-ray Microscopy (TXM) Data

Operando TXM are in the ``txm`` folder organized by date of
acquisition and user facility.

## NMC cathodes:

- NMC-532 - ``txm/txm-2016-07-02-aps/``
- NMC-333 - ``txm/txm-2017-02-21-aps/``

Both sets of data were collected on an Xradia microscope and so use
the proprietary .xrm file format. Both directories contain ipython
notebooks for reading and pre-processing the image formats,

- ``txm/txm-2017-02-21-aps/Operando_Processing.ipynb``
- ``txm/txm-2016-07-02-aps/NCA_NMC_Importing.ipynb``

which use the file ``txm_tools.py`` along with the
[xanespy](https://github.com/canismarko/xanespy) python package. A
copy of the xanespy package is included here for reference
(``txm/xanespy-master.zip``). Once run, the ipython notebooks will
produce an HDF5 file with the processed data. The notebook
``txm/Operando_Paper_Graphics.ipynb`` can then read these HDF5 files
to produce the figures presented in the paper.

**Electro-chemistry** data for each experiment are also included in
separate folders:

- ``txm/txm-2017-02-21-aps/electrochem``
- ``txm/txm-2016-07-02-aps/electrochem``

each of which contain data in raw binary format (``.mpr`` file) and
exported text format (``.mpt`` file), exported using BioLogic's EC-Lab
software.

# µ-XRD Data

Operando micro-focused powder X-ray diffraction mapping (µ-XRD) data
are in a zip archive in the ``uxrd`` folder, organized by particle.

For each particle (1-3), there is an HDF5 file with the processed 1D
diffraction patterns for all mapping positions at each state of charge
(e.g. ``Particle1/SOC44.h5``). These files contain the reduced 1D
diffraction patterns, but not the 2D area detector patterns.

The folder *Echem* contains the potential and time arrays from the
galvanostat during the experiment. All particles were measured
concurrently and so there is only one set of electrochemistry data for
all 3 particles.

The folder *summed-data* contains the overall diffraction pattern for
each particle at each state of charge. These were the data used for
whole-pattern fitting using Topas.

Additionally, there are two jupyter notebooks, ``paper-figs.ipynb``
and ``Data_Analysis.ipynb`` that were used for generating µ-XRD
figures for the paper and preparing the data for whole pattern
fitting, respectively.
