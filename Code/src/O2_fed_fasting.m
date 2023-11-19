% amount of O2 absorbed from arterial (hopefully)

% Inputs:
% GutFlowRate: rate of blood flow to gut (l/min)
% arterial_spO2: oxygen saturation of entering blood (%)
% Cb: oxygen carrying capacity (mg/g)
% Hb: haemoglobin concentration (g/l)

function [gut_O2, gut_spO2, gut_CO2] = O2_fed_fasting(time_since_last_meal, GutFlowRate, arterial_spO2, Cb, Hb)

if time_since_last_meal == -1
    O2_usage = 0.15;
else
    O2_usage = 0.65;
end
gut_spO2 = O2_usage;

% arterial_spO2 - arterial_spO2_new = 15 for fasting?? (need to check)

% O2_usage = 0.15

%arterial_spO2_new = arterial_spO2 - O2_usage;

gut_O2 = O2_usage * GutFlowRate * Hb * Cb;
% gut_O2 in mg/min

%change units to g/min
gut_O2_g = gut_O2 / 1000;

%change units to mol
%O2: 32 g/mol
gut_O2_mol = gut_O2_g / 32;

gut_CO2_mol = gut_O2_mol;

%CO2: 44 g/mol
gut_CO2_g = gut_CO2_mol * 44;

gut_CO2 = gut_CO2_g * 1000;

end