% Script to study conditional expectations of jointly distributed random
% variables.
% Template by Peter J Thomas, instructor of MATH380 course.
% X and Y are jointly distributed (see below).  We numerically approximate
% the conditional expectation of one, given the other, by conditional
% sampling.

nsamp=1e4;              % Total number of samples.
X=rand(nsamp,1);        % X is uniformly distributed between 0 and 1.
Y=rand(nsamp,1).*X;     % For each X, Y is randomly distributed between 0 and X.
nbin=50;                % Number of bins for computing histograms.
dx=1/nbin;              % Bin spacing along x-axis.
dy=1/nbin;              % Bin spacing along y-axis.
EXgivenY=nan(nbin,1);   % This array will hold the expected value of X, given Y.
VXgivenY=nan(nbin,1);   % This array will hold the variance of X, given Y.
EYgivenX=nan(nbin,1);   % This array will hold the expected value of Y, given X.
VYgivenX=nan(nbin,1);   % This array will hold the variance of Y, given X.
for j=1:nbin            % cycle through the bins from 0 to 1 in steps of dx and dy, respectively.
    xmin=dx*(j-1);      % This is the lower boundary of the current bin (for X).
    xmax=dx*j;          % This is the upper boundary of the current bin (for X).
    EYgivenX(j)=mean(Y(find((X>=xmin).*(X<xmax))));         % Mean of all Y values when X is in the given bin.
    VYgivenX(j)=(std(Y(find((X>=xmin).*(X<xmax))))).^2;     % Variance of all Y values when X is in the given bin.
    ymin=dy*(j-1);      % This is the lower boundary of the current bin (for Y).
    ymax=dy*j;          % This is the upper boundary of the current bin (for Y).
    EXgivenY(j)=mean(X(find((Y>=ymin).*(Y<ymax))));         % Mean of all X values when Y is in the given bin.
    VXgivenY(j)=(std(X(find((Y>=ymin).*(Y<ymax))))).^2;     % Variance of all X values when Y is in the given bin.
end

%% Stop and calculate by hand what E[X|Y=y] and E[Y|X=x] should be!  

%keyboard % type "dbcont" at command line to continue.  Or comment this line out.

%% Plot the output.  Does it match your calculations?

figure

subplot(2,1,1)
xplot=(1:nbin)*dx-dx/2; % points to plot along x axis
plot(xplot,EYgivenX)    % plot E[Y|X] (empirically)
hold on
plot(xplot,sqrt(VYgivenX)+EYgivenX,'--') % plot mean + 1 sd (empirical)
plot(xplot,-sqrt(VYgivenX)+EYgivenX,'--') % plot mean - 1 sd (empirical)

%%% The function for the theoretical curve: Filled in by Thao Nguyen %%%
EYgivenXexact=@(x)x/2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

plot(xplot,EYgivenXexact(xplot),':')
xlabel('x','FontSize',20)
ylabel('E[Y|X=x]','FontSize',20)
set(gca,'FontSize',20)
legend('E[Y|X=x]','mean+1sd','mean-1sd','y=x/2','Location','NW')
title('Conditional Expectations','FontSize',20)

subplot(2,1,2)
yplot=(1:nbin)*dy-dy/2;
plot(yplot,EXgivenY)
hold on
plot(yplot,sqrt(VXgivenY)+EXgivenY,'--')
plot(yplot,-sqrt(VXgivenY)+EXgivenY,'--')

%%% The function for the theoretical curve: Filled in by Thao Nguyen %%%
EXgivenYexact=@(y)(y-1)/log(y);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

plot(yplot,EXgivenYexact(yplot),':')
xlabel('y','FontSize',20)
ylabel('E[X|Y=y]','FontSize',20)
axis([0 1 0 1])
set(gca,'FontSize',20)
legend('E[X|Y=y]','mean+1sd','mean-1sd','x=(y-1)/ln(y)','Location','SE')

