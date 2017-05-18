function [p, V, Q, iter] = policy_itr_olof(T, R, discount_factor)

S = size(T,1);
A = size(T,2);
p = zeros(S,1);
Q = zeros(S, A);
oldQ = Q;

oldp = ones(S,1); % Set initial policy to up in every state
% oldp = oldp + 1; % Sets initial policy to right. Wont work with down/left
% because it doesnt reach the end goal. Infinite minus

iter = 1;
done = 0;
while ~done
  iter = iter + 1;
  V = value_itr_olof(T, R, discount_factor, oldp);
  Q = Q_from_V_olof(V, T, R, discount_factor);
  [V, p] = max(Q, [], 2);
  if isequal(p, oldp) | approxeq(Q, oldQ, 1e-3)
    % if we just compare p and oldp, it might oscillate due to ties
    % However, it may converge faster than Q
    done = 1;
  end
  oldp = p;
  oldQ = Q;
end

