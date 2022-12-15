using CUFSM, Plots


prop = [100 29500.00 29500.00 0.30 0.30 11346.15]

node = [1 5.0000 1.0000 1 1 1 1 -38.889
2 5.0000 0.0000 1 1 1 1 -50.000
3 2.5000 0.0000 1 1 1 1 -50.000
4 0.0000 0.0000 1 1 1 1 -50.000
5 0.0000 3.0000 1 1 1 1 -16.667
6 0.0000 6.0000 1 1 1 1 16.667 
7 0.0000 9.0000 1 1 1 1 50.000 
8 2.5000 9.0000 1 1 1 1 50.000 
9 5.0000 9.0000 1 1 1 1 50.000 
10 5.0000 8.0000 1 1 1 1 38.889]

elem = [1 1 2 0.100000 100 
2 2 3 0.100000 100 
3 3 4 0.100000 100 
4 4 5 0.100000 100 
5 5 6 0.100000 100 
6 6 7 0.100000 100 
7 7 8 0.100000 100 
8 8 9 0.100000 100 
9 9 10 0.100000 100]

lengths = [1.00   
2.00   
3.00   
4.00   
5.00   
6.00   
7.00   
8.00   
9.00   
10.00  
11.00  
12.00  
13.00  
14.00  
15.00  
20.00  
30.00  
40.00  
50.00  
60.00  
70.00  
80.00  
90.00  
100.00 
200.00 
300.00 
400.00 
500.00 
600.00 
700.00 
800.00 
900.00 
1000.00]

springs = []

constraints = []

neigs = 1

curve, shapes = CUFSM.strip(prop, node, elem, lengths, springs, constraints, neigs)

half_wavelength = [curve[i,1][1] for i=1:length(lengths)]
load_factor = [curve[i,1][2] for i=1:length(lengths)]

plot(half_wavelength, load_factor)

Mcr = minimum(load_factor)

min_index = findfirst(x->x==minimum(load_factor), load_factor)    

Lcr = half_wavelength[min_index]

