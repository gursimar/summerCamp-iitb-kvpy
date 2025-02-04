%function C=myquad(a,gamau,T)
%function C=myquad(a,b,c,d,T)
function C=myquad( a,b,c,d,e,f,g,h,gamau,thetad,T)
%t = zeros(size(x));
%for j=1:numel(x)
%    t(j) = a.*quadgk(@(y) exp(-y.*x(j).*b),0,10);
%end

C = zeros(size(T));

%gama = 20 * 1e-3;
R = 8.314;



fun = @(x) ((x.^4) .* exp(x)) ./((exp(x)-1).^2);

for n = 1:length(T)
    % only integral
    %C(n) = 9*R*((T(n)/a)^3)*quad(fun,0.1,a/T(n));
    
    % integral + el
    %C(n) = gamau*T(n) + 9*R*((T(n)/a)^3)*quad(fun,0.1,a/T(n));
    
    % only einstien
    %C(n) = R*( ( ( (a/T(n))^2 * exp(a) ) / (exp(a/T(n))-1)^2 )+(((b/T(n))^2*exp(b))/(exp(b/T(n))-1)^2)+(((c/T(n))^2*exp(c))/(exp(c/T(n))-1)^2)+(((d/T(n))^2*exp(d))/(exp(d/T(n))-1)^2));
    
    % einstien + el + integ
    %C(n) = gamau*T(n) + 9*R*((T(n)/thetad)^3)*quad(fun,0.1,thetad/T(n)) + R*( ( ( (a/T(n))^2 * exp(a) ) / (exp(a/T(n))-1)^2 )+(((b/T(n))^2*exp(b))/(exp(b/T(n))-1)^2)+(((c/T(n))^2*exp(c))/(exp(c/T(n))-1)^2)+(((d/T(n))^2*exp(d))/(exp(d/T(n))-1)^2));
    
    % new model
    %C(n) = gamau*T(n) + 9*R*((T(n)/thetad)^3)*quad(fun,0.001,thetad/T(n)) + R*(sum(( (a(:)./T(n)).^2 .* exp(a(:)) ) ./ (exp(a(:)./T(n))-1).^2 ));
    
    % more einstien factors
    C(n) = gamau*T(n) + 9*R*((T(n)/thetad)^3)*quad(fun,0.1,thetad/T(n)) + R*( ( ( (a/T(n))^2 * exp(a) ) / (exp(a/T(n))-1)^2 )+(((b/T(n))^2*exp(b))/(exp(b/T(n))-1)^2)+(((c/T(n))^2*exp(c))/(exp(c/T(n))-1)^2)+(((d/T(n))^2*exp(d))/(exp(d/T(n))-1)^2)+(((e/T(n))^2*exp(e))/(exp(e/T(n))-1)^2)+(((f/T(n))^2*exp(f))/(exp(f/T(n))-1)^2)+(((g/T(n))^2*exp(g))/(exp(g/T(n))-1)^2)+(((h/T(n))^2*exp(h))/(exp(h/T(n))-1)^2));
end

