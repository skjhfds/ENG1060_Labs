function Velocity_corrected_5Points = Velocity_Correction(velocity)
Velocity_corrected_5Points=zeros(1,length(velocity));
for i = 3:length(velocity)-2
    Velocity_corrected_5Points(i)=mean(velocity(i-2:i+2))
end