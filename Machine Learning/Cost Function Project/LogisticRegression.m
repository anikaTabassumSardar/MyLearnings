%% initialize
clear; close all; clc;

%% load the data
data = load('trainingData.txt');
X = data(: , 1:2); %contains scores, i.e. 1st and second column of dataset
Y = data(:, 3); %contains acceptance result, i.e. 3rd column of dataset

%% plot the training data set 
plotData(X, Y); %cleaner custom plot
%plot(X, Y); %default
legend('Accepted', 'Not Accepted');
xlabel('Score 1');
ylabel('Score 2');
title('Logistic Regression for Exam Scores and Univ. Acceptance')
% %% compute the cost and gradient
[m,n] = size(X); 

% The initial theta values will be set to zero and the correct values will be determined later by the optimization algorithm. We need (n+1) theta values
initialTheta = zeros((n+1),1);

%the cost and gradient vector will be determined by the costFunction
[J, grad] = costFunction(initialTheta, X, Y); %J is the cost and grad is the gradient

%optimization algorithm
options = optimset('GradObj', 'on', 'MaxIter', 400);

%Find minimum of unconstrained multivariable function
theta = fminunc(@(t)costFunction(t, X, Y), initialTheta, options);

%check the accuracy of the prediction
predictions = predict(theta, X);
accuracy = mean(double(predictions == Y) * 100)