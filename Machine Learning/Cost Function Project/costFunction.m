function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION computes cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = size(X, 1); % number of training examples
X = [ones(m,1) X];

h = sigmoid(X * theta);

J = (-1/m) * sum(y .* log(h) + (1-y) .* log(1-h));
grad = zeros(size(theta, 1), 1);

for i = 1: size(grad),
    grad(i) = (1/m) .* sum((h-y) .* X(:, i));
end
