function MLI = Dig_MLI(Number_of_bits,T_P,Binary_Data)

% Multi-level Transmission
MLI = [];
MLI(1) = 0;
flag = 0;
for i = 1 : 1 : Number_of_bits
    if Binary_Data(i) == 1
        flag = flag + 1;
        if flag == 1
            MLI(i + 1) = 1;
            j = i;
        else
            MLI(i + 1) = MLI(j)* -1;
            j = i;
        end
    else    
        MLI(i + 1) = MLI(i);
    end
end
if Binary_Data(i) == 1
    flag = flag + 1;
    if flag == 1
        MLI(i + 2) = 1;
        j = i;
    else
        MLI(i + 2) = MLI(j)* -1;
        j = i;
    end
end
    
if Binary_Data(i) == 0
    MLI(i + 2) = MLI(i + 1);
end
Time = T_P * -1 : T_P : T_P * (Number_of_bits);
subplot(6,1,5)
stairs(Time , MLI);
title('Multi-level Transmission');
grid on
