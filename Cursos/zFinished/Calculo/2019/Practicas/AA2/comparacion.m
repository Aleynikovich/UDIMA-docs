i = 2;

while (1.3333 <= simp13(i) && simp13(i) < 1.3334) ~= true
    i = i + 2;
endwhile

simp13(i)
disp(i)
disp("Es el numero adecuado de subdivisiones para conseguir 4 decimales correctos")


% for i=2 : 2 : 100
% digits(32)
%     if ((1.3333 <= simp13(i)) && (simp13(i) < 1.3334))
%         simp13(i)
%         disp(i)
%         disp("Es el numero adecuado de subdivisiones para conseguir 4 decimales correctos")
%         break
%     endif
% endfor

