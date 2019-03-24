function RZ = Dig_RZ(Number_of_bits,T_P,Binary_Data)

% Return to Zero

RZ = [];
for i = 1 : 1 : Number_of_bits
        RZ(i * 2 - 1) = (Binary_Data(i) == 1) * 2 - 1;
        RZ(i * 2) = 0;
end
RZ(length(RZ) + 1) = 0;
Time = 0 : T_P / 2 : T_P * (Number_of_bits);
subplot(6,1,1)
stairs(Time , RZ);
title('Return to zero');
