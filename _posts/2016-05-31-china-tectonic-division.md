---
layout: post
title: 中国地质构造区划分界线
---

下图中红线是中国构造区划的分界线：

![中国地质构造区划图](/assets/China_tectonic.png)

绘图脚本为：

```bash
#!/bin/bash
PS=China_tectonic.ps
R=74/135/20/54
J=M7i

gmt pscoast -J$J -R$R -Bx10 -By10 -N1/0p,black,- -UBL/-1c/-1.2c/"This figure does not make the basis for territorial delimitation" -K > $PS
gmt psxy China_tectonic.dat -J$J -R$R -W1p,red -K -O >> $PS
gmt pstext China_tectonic_name.dat -J$J -R$R -F+a+f10p,5+jLT -O >> $PS
rm gmt.*
```

数据下载： [China_tectonic.dat](/assets/China_tectonic.dat) [China_tectonic_name.dat](/assets/China_tectonic_name.dat)
