function BMI_group = categorise_BMI (ID, BMI_list)
bmi = BMI_list(ID,4);
if bmi < 18.5
    BMI_group = 'Under weight';
else
    if 25.5 < bmi
        if 30 < bmi
            BMI_group = 'Obese';
        else
            BMI_group = 'Overweight';
        end
    else
        BMI_group = 'Normal';
    end
end