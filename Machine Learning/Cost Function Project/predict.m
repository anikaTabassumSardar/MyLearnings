function p = predict(theta, X)
m = size(X, 1);
X = [ones(m, 1) X];

p = round(sigmoid(X * theta));
end