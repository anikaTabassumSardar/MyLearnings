function plotData(X, y)
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Find Indices of Positive and Negative Examples
pos = find(y==1);
neg = find(y == 0);

% Plot Examples
plot(X(pos, 1), X(pos, 2), 'k+', 'LineWidth', 2, 'MarkerSize', 7)
hold on
plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 7);

end