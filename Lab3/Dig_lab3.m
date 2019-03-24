clear all
clc
pkg load signal
T_P = 1
binary_data = randi([0 1] , 1 , 10)
a_ = Dig_NRZ(10,T_P,binary_data);
b_ = Dig_Ami(10,T_P,binary_data);
c_ = Dig_MLI(10,T_P,binary_data);
d_ = Dig_Manchester(10,T_P,binary_data);
e_ = Dig_NRZI(10,T_P,binary_data);
f_ = Dig_RZ(10,T_P,binary_data);

%periodogram (a);
%stem(a)
%%%%
%stem(periodogram(a_,rectwin(length(a_)),length(a_),1))
%stem(periodogram(b_,rectwin(length(b_)),length(b_),1))
%stem(periodogram(c_,rectwin(length(c_)),length(c_),1))
%stem(periodogram(d_,rectwin(length(d_)),length(d_),1))
%stem(periodogram(e_,rectwin(length(e_)),length(e_),1))
%stem(periodogram(f_,rectwin(length(f_)),length(f_),1))
%%%%
