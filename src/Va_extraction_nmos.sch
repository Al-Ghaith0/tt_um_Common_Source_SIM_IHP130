v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -110 -170 60 -170 {lab=#net1}
N 60 20 60 160 {lab=0}
N -110 20 -110 50 {lab=0}
N 220 -80 320 -80 {lab=#net2}
N 220 -80 220 -40 {lab=#net2}
N 220 20 220 90 {lab=#net3}
N 320 -20 320 0 {lab=0}
N 220 150 220 170 {lab=0}
N 110 -10 110 10 {lab=0}
N 60 -10 110 -10 {lab=0}
N 270 -10 270 0 {lab=0}
N 220 -10 270 -10 {lab=0}
N -110 -170 -110 -40 {lab=#net1}
N 60 -170 60 -160 {lab=#net1}
N 60 -50 60 -40 {lab=#net4}
N 20 -50 60 -50 {lab=#net4}
N 60 -100 60 -50 {lab=#net4}
N 20 -50 20 -10 {lab=#net4}
N 180 -50 180 -10 {lab=#net4}
N 60 -50 180 -50 {lab=#net4}
C {gnd.sym} 60 160 0 0 {name=l12 lab=0}
C {res.sym} 60 -130 0 0 {name=R1
value=800k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -110 -10 0 0 {name=V1 value=3 savecurrent=false}
C {gnd.sym} -110 50 0 0 {name=l1 lab=0}
C {code_shown.sym} 565 -490 0 0 {name=s1 only_toplevel=false value=".dc V2 0 3 0.001
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.param temp=27
.save all
.control
show n.xm17.nsg13_hv_nmos n.xm23.nsg13_hv_nmos n.xm22.nsg13_hv_nmos
show n.xm16.nsg13_hv_pmos n.xm9.nsg13_hv_pmos n.xm10.nsg13_hv_pmos
run
write Va_extraction_nmos.raw
*.options savecurrents
.endc"}
C {vsource.sym} 320 -50 0 0 {name=V2 value=3 savecurrent=false}
C {gnd.sym} 220 170 0 0 {name=l2 lab=0}
C {gnd.sym} 320 0 0 0 {name=l3 lab=0}
C {vsource.sym} 220 120 0 0 {name=V3 value=0 savecurrent=false}
C {sg13g2_pr/sg13_hv_rf_nmos.sym} 40 -10 0 0 {name=M13
l=0.72u
w=1.0u
ng=1
m=1
rfmode=1
model=sg13_hv_nmos
lvs_model=rfnmoshv
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_rf_nmos.sym} 200 -10 0 0 {name=M1
l=0.72u
w=1.0u
ng=1
m=1
rfmode=1
model=sg13_hv_nmos
lvs_model=rfnmoshv
spiceprefix=X
}
C {gnd.sym} 110 10 0 0 {name=l4 lab=0}
C {gnd.sym} 270 0 0 0 {name=l5 lab=0}
