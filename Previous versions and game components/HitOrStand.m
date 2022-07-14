% Program for the hit and stand mechanism for the blackjack game

% Initialisation of the 'hit' state and card value counter
hit = 1;
n = 0;

% While loop to draw a card when the player hits, stopping when standing
while hit == 1
    % Randomly generates an integer between 1-11 and adds to card value 
    n = n + randi(11);
    disp(n);
    % Takes user input for next move (hit or stand)
    hit = input("Enter 0 to stand or 1 to hit: " );
end