function I = simp13(arg)
    f = @(x) abs(x*sin(x^2));
    a = 0;
    b = 2*pi;
    n = arg;
    h = (b - a) / n;
    s = f(a) + f (b);
    if(rem(n,2)~=0)
        error('Tiene que usar un numero par de subdivisiones');
    end

    for i = 1 : 2 : n - 1 
        s = s + 4 *f(a + i*h);
    end

    for i = 2 : 2 : n - 2
        s = s + 2 * f(a + i *h);
    end

    I = h / 3 * s;
    return;
endfunction

