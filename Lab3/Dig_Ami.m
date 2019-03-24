function AMI = Dig_Ami(Number_of_bits,T_P,Binary_Data)

AMI = [];
AMI(1) = 1;
ptr = 1;
for i = 2 : 1 : Number_of_bits
    if Binary_Data(i) == 1
        AMI(i) = AMI(ptr)* -1;
        ptr = i;
    else
        AMI(i) = 0;
    end
end

if Binary_Data(Number_of_bits) == 1
    AMI(Number_of_bits + 1) = AMI(Number_of_bits)* -1;   
else
    AMI(Number_of_bits + 1) = 0;
end
Time = 0 : T_P : T_P * (Number_of_bits);
subplot(6,1,6)
stairs(Time , AMI);
title('Alternative M Inversion');
grid on