eps0 = 8.854187e-12;
eps_ox = 3.9;
%NMOS
Cjorgatn = 1.3846e-11;
Cjorgatdn = 1e-9;
Cjorstin = 2.4557e-11;
Cjorstidn = 1e-9;
Cjorbotn = 0.85856;
Cjorbotdn = 0.001;
toxon = 7.4256e-9;
toxovon = 7.4256e-9;
meun = 0.46687 * 0.85058;
Lovn = 6.3866e-8;
Coxn = eps0 * eps_ox / toxon;
Coxovn = eps0 * eps_ox / toxovon;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pmos
Cjorgatdp = 1e-9;
Cjorgatp = 3.1e-11;
Cjorstip = 4.2583e-11;
Cjorstidp = 1e-9;
Cjorbotp = 0.0008085;
Cjorbotdp = 0.001;
toxop = 6.945e-9;
toxovop = 6.945e-9;
meup = 0.018428 * 1.8162;
Lovp = 3.471e-8;
Coxp = eps0 * eps_ox / toxop;
Coxovp = eps0 * eps_ox / toxovop;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NMOS XM17
W17 = 1e-5;
L17 = 7.2e-7;
As17 = 3.4e-12;
Ps17 = 2.068e-5;
Ad17 = 3.4e-12;
Pd17 = 2.068e-5;
Cgsn17 = 2/3 * W17 * L17 * Coxn + W17 * Lovn * Coxovn
Cgdn17 = W17 * Lovn * Coxovn
Cjsn17 = Cjorbotn / (sqrt(1 + 0))
Csbn17 = (As17 + W17 * L17) * Cjsn17 + Ps17 * Cjorstin + W17 * Cjorgatn
Cjdn17 = Cjorbotdn / (sqrt(1 + 2.056))
Cdbn17 = (Ad17 * Cjdn17 + Pd17 * Cjorstidn + W17 * Cjorgatdn)
I17 = 2.872e-6;
Veffe17 = sqrt (I17 * 2 / (meun * Coxn * W17 / L17))
gm17 = 2 * I17 / Veffe17
rds17 = 1.75/I17
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PMOS XM16
W16 = 1e-5;
L16 = 7.2e-7;
As16 = 3.4e-12;
Ps16 = 2.068e-5;
Ad16 = 3.4e-12;
Pd16 = 2.068e-5;
Cgsp16 = 2/3 * W16 * L16 * Coxp + W16 * Lovp * Coxovp
Cgdp16 = W16 * Lovp * Coxovp
Cjsp16 = Cjorbotp / (sqrt(1 + 0))
Csbp16 = (As16 + W16 * L16) * Cjsp16 + Ps16 * Cjorstip + W16 * Cjorgatp
Cjdp16 = Cjorbotdp / (sqrt(1 + 3 -2.056))
Cdbp16 = (Ad16 * Cjdp16 + Pd16 * Cjorstidp + W16 * Cjorgatdp)
Veffe16 = sqrt (I17 * 2 / (meup * Coxp * W16 / L16))
gm16 = 2 * I17 / Veffe16
rds16 = 64 / I17
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TF derivation
C1 = Csbp16 + Cgsp16
C2 = Cgdp16
C3 = Cgdn17
C4 = Cgsn17 + Csbn17
C5 = Cdbn17 + Cdbp16
R20 = 10 / gm16 + rds16*rds17/(rds16+rds17) + 10 * rds16*rds17/(rds16+rds17)
R30 = 10/gm17 + rds16*rds17/(rds16+rds17) + 10 * rds16*rds17/(rds16+rds17)
b1 = 10*C1/gm16 + R20*C2 + R30*C3 + 10*C4/gm17 + rds16*rds17/(rds16+rds17)*C5
b2 = 10*C1/gm16*C2/gm16 + 10*C1/gm16*C3*R30 + 10*C1/gm17*C4 + 100*C1/gm17*C4/gm17 + 10*C1/gm16*C5*rds16*rds17/(rds16+rds17) + R20*C2*(10/gm17+1/gm16+10/gm16)*C3 + R20*C2*10/gm17*C4 + R20*C2*C5/gm16 + R30*C3*10/gm17*C4 + R30*C3*C5/gm17 + 10/gm17*C4*rds16*rds17/(rds16+rds17)*C5
a0 = rds16*rds17/(rds16+rds17)*gm17
a1 = 10*C1/gm16*gm17*rds16*rds17/(rds16+rds17) + R20*C2*gm17*10/gm16 + R30*C3*rds16*gm17/(rds16*gm17)
nm = [a1,a0];
de = [b2,b1,1];
TF = tf(nm,de)
bode(TF);
margin(TF);
