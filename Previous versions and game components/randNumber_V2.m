% Program to generate a random value between 1 and 11. Array is used to 
% mimic true playing card odds

% Randomises RNG sequence used by randi
rng('shuffle');

% Array containing the card values for blackjack
cardValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11];

% Randomly generates an integer between 1 and 14
index = randi(14);

% Determines the card value for the randomly generated integer
n = cardValues(index);


fprintf("Index is %.f\n", index);
fprintf("n is %.f\n", n);