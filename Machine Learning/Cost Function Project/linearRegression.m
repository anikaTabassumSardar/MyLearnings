%% initialize
clear; close all; clc;

%% load the data
data = load('LinearRegression_Dataset.txt'); %dataset taken from https://people.sc.fsu.edu/~jburkardt/datasets/regression/x01.txt
X = data(: , 2); %contains brain weight, i.e. 2nd column of the dataset
Y = data(: , 3); %contains body weight, i.e. 3rd column of dataset

format long
regressionCoefficient = X\Y;
yCalc1 = regressionCoefficient*X;
scatter(X,Y)
hold on
plot(X,yCalc1)

paddedX = [ones(length(X),1) X];
yIntercept = paddedX\Y;
yCalc2 = paddedX*yIntercept;
plot(X,yCalc2,'--')
legend('Data','Slope','Slope & Intercept','Location','best');

% Although two models look similar, testing which model 
% predicts the data better by checking R^2* R^2 whose result falls between 0 and 1. 
% The higher the value of R, the better the model is at predicting the data.
Rsq1 = 1 - sum((Y - yCalc1).^2)/sum((Y - mean(Y)).^2);
Rsq2 = 1 - sum((Y - yCalc2).^2)/sum((Y - mean(Y)).^2);
disp(['Although the two models look similar, testing which model predicts the data better' ...
    ' by checking R^2* R^2 whose result falls between 0 and 1. The higher the value of R,' ...
    ' the better the model is at predicting the data.']);
disp('******************************************************');
if(Rsq2 > Rsq1)
    disp(['The Slope and Intercept model (---) predicts the data better since the R value' ...
        'of this model is ', num2str(Rsq2) , ' which is higher than the other model whose R value is ' , num2str(Rsq1)])   
end

if(Rsq1 > Rsq2)
    disp(['The Slope model (___) predicts the data better since the R value' ...
        'of this model is ', num2str(Rsq1) , ' which is higher than the other model whose R value is ' , num2str(Rsq2)])    
end

xlabel('Brain Weight')
ylabel('Body Weight')
title('Linear Regression Relation Between Brain Weight & Body Weight')
grid on

