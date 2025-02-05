nsamp = 1000;
U = rand(1, nsamp);
V = randsrc(1, nsamp,[0.2 0.4 0.6 0.8]);
X = max(U, V);
average = mean(X);

disp("Empirical average for " + nsamp + " samples: " + average);
