function V = value_det_QA_olof(oldV, T, R, discount_factor, p)

S = size(T,1);

% w =squeeze(T(:,1,:)); % Is the probability matrix for the action 1.
% The first row represents standing in the first row and where it will end
% up if taking action 1/up.


Rcol = R(:,1);
V = zeros(S,1);
for s=1:S
  action = p(s); % Action in state s, given policy p
  matr = squeeze(T(:,action,:)); % Probability matrix for that action. Constant.
  row = matr(s,:); % Probability row for state s.
  
  V(s) = Rcol(s) + row * oldV * discount_factor;

end
V(10) = 1; % Set absorbing states to constant values.
V(11) = -1;