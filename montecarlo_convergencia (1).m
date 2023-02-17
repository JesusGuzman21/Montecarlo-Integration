clear all
clc

f = @(x) exp(-x.^2);
area_real = sqrt(pi)*erf(1)

a = -1;
b = 1;
N = 100;
j = 1; %contador

s = 0.0001 % error máximo
vector_N = zeros(1,15);
vector_N(1) = 100;
vector_error = zeros(1,15);
er = 1

while er > s
    m = 0;
    ys = f(linspace(a,b)); % 100 ys aleatorias
    lim_y = max(ys);
    
    for i = 1:N
        x = a + (b-a)*rand();
        y = rand() * lim_y;
    
        fx = f(x);
    
        if y <= fx
            m = m+1;
        end
    end
    
    area = (b-a)* (m/N);
    
    er = abs(area-area_real); % no deja usar palabra error
    vector_error(j) = er
    
    hold on
    plot(N, er,'o', 'markersize', 12)
    ylim([0,0.05])
    xlim([0,N])
    hold on

    N = N*10;
    vector_N(j+1) = N;
    j = j+1;

end

hold off

% x = vector_N
% y = vector_error
% plot(x,y)
