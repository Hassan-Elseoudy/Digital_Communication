pkg load communications
binary_data = randi([0 1] , 1 , 1e6);
binary_data = binary_data.*20 - 10;
BER = [];
SNR = 0:2:31;
for i = SNR 
	%Add some noise to generated bits
 	Rx = awgn(binary_data,i,'measured');
 	result = ((Rx > 0)* 20) - 10;
	%X-oring result and generated random bits
        C = bitxor(binary_data,result);
	% Getting err ratio
	err = (abs(sum(C)) / 10.0);
        err_ratio = err * 1.0 / length(result);
        BER = [BER err_ratio];
end
semilogy(SNR,BER,'mo-')
title('Error')
xlabel('SNR')
ylabel('BER')