% ThreshV = {};
% ThreshV = ones(1,2); % Each row is a new policy, and for what threshhold reward
threshV = struct;
ind = 0; % index for threshV
oldp = ones(1,1);
action_cost = -1/25;

startV = -3;
endV = 0;
nItr = 100;
y = linspace(startV,endV,nItr);
for i=y(1:nItr)
    action_cost = i;
    
    p = demo_olof(action_cost);
    finalp = reshape(p,[3 4]);

    p = demo_russel_changed(action_cost);
    russelp = reshape(p(1:end-1),[3 4]);

    if ~isequal(finalp,russelp)
        error('Russels policy is not equal to Olofs, Terminating program execution')
    end

    if ~isequal(finalp, oldp)
        ind = ind+1;
%         threshV(ind).policy = finalp;
%         threshV(ind).a_cost = action_cost;
        policy = finalp
        action_c = action_cost
        
        oldp = finalp;
    end

end

disp('############################## END OF PROGRAM ##############################')