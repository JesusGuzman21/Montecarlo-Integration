clear all
clc

f = @(x) exp(-x.^2);  % función a integrar
area_real = sqrt(pi)*erf(1) 

a = -1;
b = 1;  % limites x
m = 0;
N = 100000;  % iteraciones

ys = f(linspace(a,b)); % 100 ys aleatorias
lim_y = max(ys);  % limite y

for i = 1:N
    x = a + (b-a)*rand();
    y = rand() * lim_y;

    fx = f(x);

    if y <= fx
        m = m+1;
    end
end

area = (b-a)* (m/N)

error = abs(area-area_real)