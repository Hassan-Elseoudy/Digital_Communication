function NRZ = Dig_NRZ(Number_of_bits,T_P,Binary_Data)

% Non - return to zero code %
NRZ = Binary_Data.*2 - 1;
NRZ(length(NRZ) + 1) = NRZ(Number_of_bits);
subplot(6,1,3)
Time = 0 : T_P : T_P * (Number_of_bits);
stairs(Time , NRZ);
title('Non-return to zero');
grid on
