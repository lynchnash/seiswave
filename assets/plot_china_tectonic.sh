#!/bin/bash
PS=China_tectonic.ps
R=74/135/20/54
J=M7i

gmt pscoast -J$J -R$R -Bx10 -By10 -N1/0p,black,- -UBL/-1c/-1.2c/"This figure does not make the basis for territorial delimitation" -K > $PS
gmt psxy China_tectonic.dat -J$J -R$R -W1p,red -K -O >> $PS
gmt pstext China_tectonic_name.dat -J$J -R$R -F+a+f10p,5+jLT -O >> $PS
rm gmt.*
