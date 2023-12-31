% -*- mode: octave -*-
% amount of O2 absorbed from arterial (hopefully)

% Inputs: -- basic values
% GutFlowRate: rate of blood flow to gut (l/min) -- 0.5l/min
% arterial_spO2: oxygen saturation of entering blood (%) -- 0.98
% Cb: oxygen carrying capacity (mg/g) -- 1.92 mg/g
% Hb: haemoglobin concentration (g/l) -- 140 g/l

function [gut_O2] = O2_Absorption(GutFlowRate, arterial_spO2, Cb, Hb, O2_usage)

% O2_usage is the same as gut_spO2 ???
% need to output gut_O2, not gut_spO2 ??? --> which one needed for further
% funcs??

% arterial_spO2 - arterial_spO2_new = 15 for fasting?? (need to check)
% are we deciding on a percentage of usage or bringing in a venous
% saturation?

% O2_usage = 0.15

% arterial_spO2_new = arterial_spO2 - O2_usage;
gut_O2 = 02_usage * GutFlowRate * Hb * Cb;

end
