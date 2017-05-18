function Q = Q_from_V_olof(V, T, R, discount_factor)
% Q(s,a) = R(s,a) + sum_s' T(s,a,s') * gamma * V(s')

S = size(T,1); % Number of states
A = size(T,2); % 4. Number of actions
Q = zeros(S,A);

for a=1:A
  temp1 = R(:,a);
  Q(:,a) = temp1(1:end-1) + squeeze(T(:,a,:))*discount_factor*V;
end

