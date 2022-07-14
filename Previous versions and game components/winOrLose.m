% Program containing the various outcome scenarios (win, loss or draw) 
% for the blackjack game.

% Arbitrary values used to test the outcome scenarios
Player = 20; 
Dealer = 18;

% Outcome #1: Player card is greater than Dealer (Neither busts)
if (Player <= 21 && Dealer <= 21) && (Player > Dealer)
    disp("You win");
% Outcome #2: Player card is lower than Dealer (Neither busts)
elseif (Player <= 21 && Dealer <= 21) && (Dealer > Player)
    disp("You lose");
% Outcome #3: Player busts whilst Dealer does not
elseif Player > 21 && Dealer <= 21
    disp("You lose");
% Outcome #4: Dealer busts whilst Player does not
elseif Player <= 21 && Dealer > 21
    disp("You win");
% Outcome #5: Player and Dealer draw
else
    disp("You drew");
end