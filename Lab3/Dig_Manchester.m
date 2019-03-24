function Manchester = Dig_Manchester(Number_of_bits,T_P,Binary_Data)

Manchester = [];
for i = 1 : 1 : Number_of_bits
    Manchester(i * 2 - 1) = (Binary_Data(i) == 1) * 2 - 1;
    Manchester(i * 2) = (Binary_Data(i) == 0) * 2 - 1;  
end
Manchester(length(Manchester) + 1) = Manchester(length(Manchester)) * -1;
Time = 0 : T_P / 2 : T_P * (Number_of_bits);
subplot(6,1,4)
stairs(Time , Manchester);
title('Manchester Coding');
grid on
