% Project 1
pkg load communications

%1- Simulation parameters
numberOfBits = 1e6;
SNR = 0:2:31;
m = 10;
samplingInstant = 10;
BER  = [];
BER_ = [];

%2- Generate random binary data vector
binary_data = randi([0,1] , 1 , 1e6);

%3- Represent each bit with proper waveform
result = zeros(1, 10e6);
k = 0;
for i = 1:10e6
    if (mod((i - 1), 10) == 0)
        k = k + 1;
    end
    result(i) = binary_data(k);
end

for i = SNR 
    %4- Apply noise to samples
    Rx = awgn(result,i,'measured');
    size(Rx)
    %5- Apply convolution process in the receiver
    %A - Convolution
    receiver = conv(Rx,result,"same");
    size(Rx)
    receiver_ed = zeros(1,1e6);
    for i = 1:(999999)
        receiver_ed(i) = receiver((i - 1) * 10 + 5);
    end
        receiver_ed(1e6) = receiver(10e6);
    %B - Correlator
    correlator = zeros(1,1e6);
    i = 1;
    for j = 1:1e6
        x = Rx(i : i + 9);
        y = result(i : i + 9);
        correlator(j) = sum(x.*y);
        i = i + 10;
    end
    %7- Decide whether the Rx_sequence is  1  or  0’
    out = (receiver_ed > 0);
    out_ = (correlator > 0);
    %8- Compare the original bits with the detected bits.
    [err,ratio] = biterr(binary_data,out);
    [err_,ratio_] = biterr(binary_data,out_);
    %9- Save the probability of error of each SNR in matrix , BER
    BER = [BER ratio];
    BER_ = [BER_ ratio_];
end
