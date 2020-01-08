set encoding iso_8859_1
set title ''
set ylabel 'Residual [{/Symbol m}s]'; set ylabel offset 0.5,0
set xlabel 'MJD-58720 [days]'
set xrange [-130:130]
#set yrange [-3:3.1]
set xtics 30; set mxtics 3
set ytics 1; set mytics 5
set key top right font ",8" height 0.2 spacing 1.0 box

#T0 (MJD)        54530.1726263544
#PEPOCH (MJD)    54500                    

# T0 = en cuánto están corridas las observaciones
T0 = 54500.0
T1 = 58720.0 - T0 

set arrow from graph 0,0.5 to graph 1,0.5 nohead dt 2 lw 2 lc rgb "grey40"

plot 'residues_64_A2.dat' u ($1-T1):($2*1e6):($3) w yerrorbars pt 4 lc rgb "orange" t 'nbin=64 (rms = 1.222 {/Symbol m}s)',\
	'residues_128_A2.dat' u ($1-T1):($2*1e6):($3) w yerrorbars pt 5 lc rgb "violet" t 'nbin=128 (rms = 0.995 {/Symbol m}s)',\
	'residues_256_A2.dat' u ($1-T1):($2*1e6):($3) w yerrorbars pt 6 lc rgb "green" t 'nbin=256 (rms = 0.860 {/Symbol m}s)',\
	'residues_512_A2.dat' u ($1-T1):($2*1e6):($3) w yerrorbars pt 8 lc rgb "red" t 'nbin=512 (rms = 0.850 {/Symbol m}s)',\
	'residues_1024_A2.dat' u ($1-T1):($2*1e6):($3) w yerrorbars pt 7 lc rgb "blue" t 'nbin=1024 (rms = 0.839 {/Symbol m}s)'

set terminal postscript color solid enhanced dl 2.5 lw 2.7 "Helvetica" 20
set output 'timing_J04_A2.ps'
replot
!./fixbb timing_J04_A2.ps
!mv timing_J04_A2.ps timing_J04_A2.eps
