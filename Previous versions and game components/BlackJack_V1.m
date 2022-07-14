% Program emulates the casino version of blackjack, where it is a player
% against the dealer.

% Randomises RNG sequence used by randi
rng('shuffle');

% Random permutation of a deck of cards, converted to values between 1-13
cardDeck = ceil(randperm(52)/4);

% Array containing the card values for blackjack
cardValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10];

% Initialisation for counters and variable states
index = 1;
PlayerCards = 0;
DealerCards = 0;
UserInput = 1;

% While loop to draw a card when the player hits, stopping when standing
while UserInput == 1
    % Assigns blackjack value of randomly generated card to player's
    % card total
    PlayerCards = PlayerCards + cardValues(cardDeck(index));
    index = index + 1;
    disp(PlayerCards);
    % Takes user input for next move (hit or stand)
    UserInput = input("Enter 0 to stand or 1 to hit: " );
    % Condition to display a statement if player busts
    if PlayerCards > 21 
        disp("You have busted");
    end
end

% While loop to draw cards for the dealer based on casino rules
while DealerCards < 17
    % Assigns blackjack value of randomly generated card to dealer's
    % card total
    DealerCards = DealerCards + cardValues(cardDeck(index));
    index = index + 1;
    disp(DealerCards);
    % Condition to display a statement if dealer busts
    if DealerCards > 21
        disp("Dealer has busted");
    end
end

% Conditional execution statements based on game outcome

% Outcome #1: Player card is greater than Dealer (Neither busts)
if (PlayerCards <= 21 && DealerCards <= 21) && (PlayerCards > DealerCards)
    disp("You win");
% Outcome #2: Player card is lower than Dealer (Neither busts)
elseif (PlayerCards <= 21 && DealerCards <= 21) && (DealerCards > PlayerCards)
    disp("You lose");
% Outcome #3: Player busts whilst Dealer does not
elseif PlayerCards > 21 && DealerCards <= 21
    disp("You lose");
% Outcome #4: Dealer busts whilst Player does not
elseif PlayerCards <= 21 && DealerCards > 21
    disp("You win");
% Outcome #5: Player and Dealer draw
else
    disp("You drew");
end