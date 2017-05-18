
nrows = 5; ncols = 5;
obstacle = zeros(nrows, ncols);
terminal = zeros(nrows, ncols);
psucc_act = 1.0;
absorb = 0;
wrap_around = 0;
noop = 0;


nrows = 4; ncols = 3;
obstacle = zeros(nrows, ncols);
obstacle(2,2) = 1;
obstacle(4,3)=1;
terminal = zeros(nrows, ncols);
psucc_act = 0.8;
absorb = 0;
wrap_around = 1;
noop = 0;

[T, T2] = mk_grid_world(nrows, ncols, psucc_act, obstacle, terminal, absorb, wrap_around, noop);

[A, A2] = mk_grid2(nrows, ncols, psucc_act, obstacle, terminal, absorb, wrap_around, noop);
