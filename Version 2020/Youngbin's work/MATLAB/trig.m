function y = trig(func,x)
switch func
case 'sin'
y=sin(x);
case 'cos'
y=cos(x);
case 'tan'
y=tan(x);
otherwise
error('Not such function defined')
end

% call trig('sin',x)