%La función toma como argumentos el límite inferior de integración,
%el límite superior de integración y el número de trapezoides 
%en el que queremos dividir el área
function  I = trapz (arg1, arg2, arg3, arg4)    

%Límites de integración
a = arg1;
b = arg2;

%Función a calcular numéricamente
f = arg3;

%Número de trapezoides
n = arg4;    

%Altura de cada trapezoide
h = (b - a) / n;    

%Primera y última parte de la integral
s = 0.5 * (f(a) + f(b));    

%Suma de todos los términos intermedios
for i = 1 : n - 1
    s = s + f(a + i * h);
end

%Total
I = h * s
return;
end


