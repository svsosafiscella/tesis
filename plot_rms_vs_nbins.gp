set encoding iso_8859_1
set title ''
set ylabel 'Wrms [{/Symbol m}s]'; set ylabel offset 0.5,0
set xlabel 'log_2 (Nbin) '
set xrange [5.5:10.5]
set yrange [0.82:1.25]
set xtics 1
set xtics (6,7,8,9,10)
set ytics (0.839, 0.849, 0.983, 1.201)


plot 'results.dat' u (log($1)/log(2)):($2) t '' pt 3 ps 2

set term png
set output 'results.png'
replot
