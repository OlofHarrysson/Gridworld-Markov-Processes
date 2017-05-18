function p = demo_olof(action_cost)

% Do the example in ch 17 (p501) of Russell and Norvig
% (1,1) is top left corner.

r = 3; c = 4; p = 0.8;
obstacle = zeros(r,c); obstacle(2,2)=1;
terminal = zeros(r,c); terminal(1,4)=1; terminal(2,4)=1;
absorb = 0; % TODO: Changed this to 0
wrap_around = 0;
noop = 0;
T = mk_grid_world(r, c, p, obstacle, terminal, absorb, wrap_around, noop);
% Add rewards for terminal states
nstates = r*c + 1;
if noop
  nact = 5;
else
  nact = 4;
end
R = action_cost*ones(nstates, nact);
R(10,:) = 1;
R(11,:) = -1;
R(nstates,:) = 0;
discount_factor = 1;

% Q has one col for every action and one row for every state.
% If you take the max of a row, that corresponds to the best action.
% Q = Q_from_V(V, T, R, discount_factor);
% [V, p] = max(Q, [], 2);


% T: World rules. Details unclear. More info in mk_grid_world
% T: Dim= states * states * nactions
% R: nrows=states, ncols=actions. Rewards somehow?

[p,V] = policy_itr_olof(T, R, discount_factor);
p = reshape(p,[3 4]);