v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -260 -180 -120 -180 {lab=0}
N -120 -70 -120 0 {lab=0}
N 50 -190 100 -190 {lab=#net1}
N -120 220 -120 260 {lab=#net2}
N -160 0 -160 40 {lab=#net3}
N -160 40 -120 40 {lab=#net3}
N -120 30 -120 40 {lab=#net3}
N 10 0 10 40 {lab=#net3}
N -120 40 10 40 {lab=#net3}
N 50 -190 50 -30 {lab=#net1}
N -120 40 -120 160 {lab=#net3}
N 50 -0 130 -0 {lab=0}
N 130 -70 130 0 {lab=0}
N -120 -70 130 -70 {lab=0}
N -120 -180 -120 -70 {lab=0}
N 50 30 50 70 {lab=#net4}
N 50 130 50 160 {lab=0}
N -260 -180 -260 -40 {lab=0}
N -120 320 -120 330 {lab=0}
N 100 -190 100 -180 {lab=#net1}
N 100 -120 100 -110 {lab=0}
C {gnd.sym} -120 330 0 0 {name=l1 lab=0}
C {res.sym} -120 190 0 0 {name=R1
value=800k
footprint=1206
device=resistor
m=1}
C {gnd.sym} -260 -40 0 0 {name=l2 lab=0}
C {gnd.sym} 100 -110 0 0 {name=l3 lab=0}
C {gnd.sym} 50 160 0 0 {name=l4 lab=0}
C {sg13g2_pr/sg13_hv_rf_pmos.sym} -140 0 0 0 {name=M7
l=0.72u
w=1.0u
ng=1
m=1
rfmode=1
model=sg13_hv_pmos
lvs_model=rfpmoshv
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_rf_pmos.sym} 30 0 0 0 {name=M1
l=0.72u
w=1.0u
ng=1
m=1
rfmode=1
model=sg13_hv_pmos
lvs_model=rfpmoshv
spiceprefix=X
}
C {code_shown.sym} 435 -420 0 0 {name=s1 only_toplevel=false value=".dc V3 -3 0 0.001
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
write Va_extraction_pmos.raw
*.options savecurrents
.endc"}
C {vsource.sym} 50 100 0 0 {name=V3 value=-3 savecurrent=false}
C {vsource.sym} -120 290 0 0 {name=V1 value=-3 savecurrent=false}
C {vsource.sym} 100 -150 0 0 {name=V2 value=0 savecurrent=false}
