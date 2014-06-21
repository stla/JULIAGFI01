simuler avec particules dans les positifs

étape suivante : toujours avec cette restriction, vrai algorithme sans l'alteration (mais calcul du poids)


read rda : pour faire un plot javascript truc dans knitr:

The function you are looking for is read_rda which comes with the DataFrames package. So,

read_rda(filename)
should work and return a Dict with variable names => data.
