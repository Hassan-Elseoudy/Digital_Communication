function NRZinverted = Dig_NRZI(Number_of_bits,T_P,Binary_Data)

NRZinverted = [];
NRZinverted(1) = 1;
for i = 1 : 1 : Number_of_bits
    if Binary_Data(i) == 1
        NRZinverted(i + 1) = NRZinverted(i) * -1;
    else
        NRZinverted(i + 1) = NRZinverted(i);
    end
end
if Binary_Data(Number_of_bits) == 1
    NRZinverted(i + 2) = NRZinverted(i + 1) * -1;
else
    NRZinverted(i + 2) = NRZinverted(i + 1);
end
Time = T_P * - 1 : T_P : T_P * (Number_of_bits);
subplot(6,1,2)
stairs(Time , NRZinverted);
title('Non return to zero inverted');
grid on
