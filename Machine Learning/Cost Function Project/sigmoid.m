function g = sigmoid(z)
    g = 1 ./(1 + exp(-z));
end


%The main reason why we use sigmoid function 
% is because it exists between (0 to 1). 
% Therefore, it is especially used for models where 
% we have to predict the probability as an output.
% Since probability of anything exists only between 
% the range of 0 and 1, sigmoid is the right choice.