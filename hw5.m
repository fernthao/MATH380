nsamp = 1000;
A = rand(1, nsamp);
B = rand(1, nsamp);
C = rand(1, nsamp);

b2 = B.*B;
ac4 = 4.*A.*C;
D = b2 >= ac4;
disp(sum(D)/nsamp);
