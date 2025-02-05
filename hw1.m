nsamp = 1000;
D1 = []; % number of samples with at least 1 pair
D2 = []; % number of samples with at least 2 pairs

for n=1:100

    % generate 1000 samples of n birthdays
    R = randi(365,[n, nsamp]);
    
    % sort, generate difference vector
    S = sort(R, 1);
    dS = diff(R,1,1);
    
    % count repeats
    repeats = (dS==0);
    nrepeats = sum(repeats,1); 
    
    % count samples with at least some number of repeats
    at_least_one_pair = (nrepeats >= 1);
    at_least_two_pairs = (nrepeats >= 2 );

    nsamples_with_at_least_one_pair = sum(at_least_one_pair);
    nsamples_with_at_least_two_pairs = sum(at_least_two_pairs);

    D1 = [D1, nsamples_with_at_least_one_pair];
    D2 = [D2, nsamples_with_at_least_two_pairs];

end

ave1 = mean(D1);
ave2 = mean(D2);
fprintf("The average number of times there is at least 1 pair of duplicate birthdays is %.2f out of 1000 samples.\n", ave1);
fprintf("The average number of times there is at least 2 pairs of duplicate birthdays is %.2f out of 1000 samples.\n", ave2);

%{

Answer to question in 1c: For n=38, about 90/1000 samples contain at least 1 pair of
duplicate birthdays, and about 5/1000 contain at least two pairs. Thus, it
is quite surprising to find more than 1 pair of duplicate in our class of
38 people.

%}
