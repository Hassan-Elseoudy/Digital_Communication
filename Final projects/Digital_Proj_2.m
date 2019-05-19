pkg load communications

numberOfBits = 1e6;

SNR = 10.^( (0:2:31) ./10);
BER = [];

%Generate random binary data vector
binary_data = randi([0 1] , 1 , numberOfBits);

OOK = binary_data;
PRK = (2 * binary_data) - 1;

for i = numberOfBits
    FSK(i) = (binary_data(i) == 0) * 1 + (binary_data(i) == 1) * (0 + 1i);
end

for i = 1 : 16
	%Power
	pow_ = mean(binary_data.^2);
	%Noise
	noise = (sqrt(pow_./(2 * SNR(i)) * (randn(size(binary_data)) +1j * randn(size(binary_data)))));
	%Add some noise to generated bits
 	Rx = noise + binary_data;
 	%Decide whether the Rx_sequence is ‘1’ or ‘0’
 	result = (Rx >= 0.5);
	%Compare the original bits with the detected bits.
    	[err,ratio] = biterr(binary_data,result);
	%Save the probability of error of each SNR in matrix , BER
	BER = [BER ratio];
end

semilogy(SNR,BER);                                                    
grid on;

BER = [];
for i = 1 : 16
	%Power
	pow_ = mean(PRK.^2);
	%Noise
	noise = sqrt(pow_./(2 * SNR(i)) * (randn(size(PRK)) + 1j * randn(size(PRK))));
	%Add some noise to generated bits
 	Rx = noise + PRK;
 	%Decide whether the Rx_sequence is ‘1’ or ‘0’
 	result = (Rx >= 0.5);
	%Compare the original bits with the detected bits.
    	[err,ratio] = biterr(binary_data,result);
	%Save the probability of error of each SNR in matrix , BER
	BER = [BER err_ratio];
end

semilogy(SNR,BER);                                                    
grid on;

BER = [];

for i = 1 : 16
    %Power
	pow_ = mean(abs(FSK).^2);
	%Noise
	noise = sqrt(pt2./(2*SNR(i))*(randn(size(FSK))+1j*randn(size(FSK))));
	%Add some noise to generated bits
 	Rx = noise + FSK;
 	%Decide whether the Rx_sequence is ‘1’ or ‘0’
 	A_ = gt(imag(Rx),real(Rx));
	%Compare the original bits with the detected bits.
    	B_ = xor(A_,binary_data)
	%Save the probability of error of each SNR in matrix , BER
	C_(i) = sum(B_,2);
end
BER_= C_ ./ 1e6;
hold on;
semilogy((0 : 2 : 31),BER_);
QAM = 0.25 * (2 * erfc(sqrt(2 * SNR/5)) + erfc(3 * sqrt(2 * SNR/5)) + erfc(5 * sqrt(2 * SNR/5)))

semilogy((0 : 2 : 31),QAM)
