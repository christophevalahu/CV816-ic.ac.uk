function [phi] = thetaToPhi(theta)
%FULLANGLES Summary of this function goes here
%   Detailed explanation goes here

N = length(theta);
phi = zeros(N, 1);
phi(1) = theta(1);

for i=1:(N-1)
    phi(i+1) = phi(i) + theta(i+1);
end

end

