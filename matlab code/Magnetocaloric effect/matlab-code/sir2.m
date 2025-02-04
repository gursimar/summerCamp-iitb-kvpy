close all;
clear all;
clc

gama = 20 * 1e-3;
N = 6 * 1e23;
thetad = 350;
R = 8.314;

T = 0:0.1:600;
f = @(x) ((x.^4) .* exp(x)) ./((exp(x)-1).^2);

C = linspace (0,0,length(T));

figure
title('Integral part of the equation \int {x^4e^x}/{(e^x-1)^2}dx')

for n=1:length(T)
    C(n) = gama*T(n) + 9*N*R*((T(n)/thetad)^3)*quad(f,0,thetad/T(n));
end

plot (T,C);
title('Specific heat capacity (Constant volume)');
title(texlabel(f,'literal'))
ylabel('Specific heat capacity (C)');
xlabel ('Temperature (K)');
gtext('Constant for higher values of T')
%annotation('textbox',[500 14*1e25 2 2])

