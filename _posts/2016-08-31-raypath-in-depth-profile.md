---
layout: post
title: 震相射线路径
---

![震相射线路径](/assets/phase-raypath.png)

绘图脚本为：

```bash
#!/bin/bash
J=Pa10c/285
R=-10/38/0/6371
PS=phase-raypath.ps

taup_path -mod prem -ph PcP -h 300 -deg 30 -o PcP.30.raypath
taup_path -mod prem -ph PKiKP -h 300 -deg 30 -o PKiKP.30.raypath

gmt set MAP_GRID_PEN_PRIMARY 1p

# 绘制地表
gmt psbasemap -J$J -R$R -Byg6371 -Bs -K > $PS
# 绘制 410 界面
gmt psbasemap -J$J -R$R -Byg6371+5961 -Bs -K -O >> $PS
# 绘制 660 界面
gmt psbasemap -J$J -R$R -Byg6371+5711 -Bs -K -O >> $PS
# 绘制 CMB
gmt psbasemap -J$J -R$R -Byg6371+3480 -Bs -K -O >> $PS
# 绘制 ICB
gmt psbasemap -J$J -R$R -Byg6371+1221 -Bs -K -O >> $PS

# 绘制震相的射线路径
gmt psxy PcP.30.raypath.gmt -W1p,blue -J$J -R$R -K -O >> $PS
gmt psxy PKiKP.30.raypath.gmt -W1p,red -J$J -R$R -K -O >> $PS

# 绘制震源和台站位置
gmt psxy -J$J -R$R -S -Gblack -N -K -O >> $PS << EOF
0 6071 0.4c a
30 6471 0.4c i
EOF

# 添加标注
gmt pstext -J$J -R$R -F+f11p+a -N -K -O >> $PS << EOF
-6 6170 -70 Surface
-6 3280 -70 CMB
-3 1020 -70 ICB
16 4100 -90 @;blue;PcP@;;
37 1600 -90 @;red;PKiKP@;;
EOF

gmt psxy -J$J -R$R -T -O >> $PS
rm gmt.*
```
