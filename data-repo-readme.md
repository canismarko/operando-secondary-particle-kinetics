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
