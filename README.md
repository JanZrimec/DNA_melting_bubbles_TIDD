# Thermodynamically induced duplex destabilization
This process leads to DNA melting bubble formation, as published in our paper [Zrimec & Lapanje 2015: Fast Prediction of DNA Melting Bubbles Using DNA Thermodynamic Stability](https://dx.doi.org/10.1109/TCBB.2015.2396057)

## Description
DNA melting bubbles are the basis of many DNA-protein interactions, such as those in regulatory DNA regions driving gene expression, DNA replication and bacterial horizontal gene transfer. 

<img src="https://github.com/JanZrimec/DNA_melting_bubbles_TIDD/blob/master/Figure1.jpg" width="480">

Bubble formation is affected by DNA duplex stability and thermally induced duplex destabilization (TIDD).
Our method is based on a molecular simulation method for predicting melting bubbles, termed Peyrard-Bishop-Dauxois (PBD) model (Peyrard et al. 1993), and the findings that PBD predicted TIDD is inherently related to the DNA thermodynamic stability given by Nearest Neighbor (NN) model (Santalucia 1998).
Using machine learning models, NN duplex stabilities were used to predict TIDD almost as accurately as is predicted with PBD.
The advantage of the method are over six orders of magnitute faster prediction times and the possibility to use neighboring regions around the destabilization region for prediction.

## Usage
<img src="https://github.com/JanZrimec/DNA_melting_bubbles_TIDD/blob/master/Figure_1.jpg" width="480">

```tidd = weka_run(seq,W,T,wide)```

where:
* seq	.. nucleotide sequence (capital letters, ATGC only)
* W	.. destabilization width: {5, 10, 15, 20}
* T	.. destabilization treshold: {0.1, 0.5, 1.0, 1.5}
* wide	.. number of included neighboring regions. The models here are restricted to 0 or 6 bp neighboring regions, though the full set of models can be downloaded from http://tidd.immt.eu/.

Dependencies: Weka.jar is needed, which is included here.
