function [GutNew, GutOut] = GutCalc(GutFlowRate, Gut, Arterial, step)
    % Parameters
    Vmax = 10; % Maximum reaction velocity 
    Km = Vmax/2; % Michaelis constant 
    HenrysConst = 0.03; % Henry's constant for O2 in water at body temp [mol/L*atm]

    % Input concentrations
    % Input will be from food, GIT will output to vascular system
    SpO2_in = Arterial.SpO2;
    PCO2_in = Arterial.PCO2;
    Glucose_in = Arterial.Glucose;
    Insulin_in = Arterial.Insulin;

    % Michaelis-Menten kinetics for glucose metabolism
    Glucose_usage = Vmax * Glucose_in / (Km + Glucose_in);
    
    % Update using the metabolism rate
    GutNew.Glucose = Gut.Glucose - step * Glucose_usage;
    GutOut.Glucose = Glucose_in - step * Glucose_usage;

    % Oxygen absorption using Henry's Law and Fick's law of diffusion
    k = 0.1; % Mass transfer coefficient
    O2_absorption = HenrysConst * SpO2_in + k * (Gut.SpO2 - Arterial.SpO2);
    CO2_production = Glucose_usage + (1 - SpO2_in) * O2_absorption / HenrysConst;
    GutNew.SpO2 = Gut.SpO2 - step * O2_absorption;
    GutOut.SpO2 = SpO2_in - step * O2_absorption;

    % CO2 production
    GutNew.PCO2 = Gut.PCO2 + step * CO2_production;
    GutOut.PCO2 = PCO2_in + step * CO2_production;

    GutNew.Insulin = Gut.Insulin;
    GutOut.Insulin = Insulin_in;
end

