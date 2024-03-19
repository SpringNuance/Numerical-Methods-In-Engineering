function [f, X] = GroupData(x)
% x - set of data
N = fix(min(x))-1; % smallest group
M = fix(max(x));   % largest group
m = length(N+1:M); % group size
n = length(x);     % number of data
X = N+(1:m)';      % group midpoints
f = zeros(m,1);
for k = 1:n
    for j = 1:m
        if x(k)>=X(j)-0.5 && x(k)<X(j)+0.5
            f(j) = f(j)+1;
        end
    end
end