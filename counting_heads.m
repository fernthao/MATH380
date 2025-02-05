nsamp = 1000;
P1=[];

for n=1:100
    % generate 2 independent samples of n coin toss
    T1 = round(rand(nsamp,n));
    T2 = round(rand(nsamp,n));

    % count number of heads in each toss
    T1_h = sum(T1, 2); % sum along the rows, 1 := head
    T2_h = sum(T2, 2);

    % count number of samples that has same number of heads in each toss
    D = T1_h - T2_h; % nsamp x 1, Si = difference in # of heads at sample i
    S = (D == 0); % nsamp x 1 binary vector, Si = 1 where # heads are same
    p = (sum(S,1))/nsamp; % # samp where heads are same / total # of samp
    P1 = [P1, p];
end

N=1:100;
loglog(N,P1);

hold on
P2 = (factorial(2.*N))./((factorial(N).*factorial(N)).*4.^N);
plot(N, P2);
hold off;
