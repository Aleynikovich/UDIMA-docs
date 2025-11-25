N=100;
resultadosTrapz  =   zeros(N,1);
resultadosSimp  =   zeros(N,1);
x = zeros(N/2,1);
for i = 1 : 1 : N
    x(i) = i;
    resultadosSimp(i) = simp13(i*2);
    resultadosTrapz(i) = trapz(0,2*pi,@(x) abs(x*sin(x^2)),i);
endfor

plot(x,resultadosSimp)
title("Comparacion Trapz y Simp13");
  legend('Simp', 'Trapz');
  xlabel("x");
  ylabel("Resultado");
hold on
plot(x,resultadosTrapz)
legend('Simp', 'Trapz');
hold off







