% Calculation total Basal Metabolic Rate (BMR)
% Inputs:
% Gender
% Weight (kg)
% Height (cm)
% Age (years)

function[basal_metabolic_rate] = BMR(gender, weight, height, age)

% Gender: male = 0
% Gender: female = 1

if gender == 0
    basal_metabolic_rate = 88.362 + 