function [V, Q, iter] = value_itr_olof(T, R, discount_factor, p)
% Solve Bellman's equation iteratively.
% [V, Q, niter] = value_iteration(T, R, discount_factor, oldV)
% oldV is an optional staring point.

S = size(T,1);
V = zeros(S,1); % Set initial state values to 0, except for absorbing states
V(10) = 1;
V(11) = -1;
oldV = V;

done = 0;
thresh = 1e-4;
iter = 1;
while ~done
  iter = iter + 1;
   V = value_det_QA_olof(oldV, T, R, discount_factor, p);
  if approxeq(V, oldV, thresh), done = 1; end
  oldV = V;
end
