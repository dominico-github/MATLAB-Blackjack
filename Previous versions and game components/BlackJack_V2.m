% Program emulates the casino version of blackjack, where it is a player
% against the dealer.

% Randomises RNG sequence used by randi
rng('shuffle');
% Array containing the card values for blackjack
cardValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10];

% Initialisation for the win/loss counter and variable state
winCounter = [0 0];
PlayAgain = 1;

% While loop to repeat the game depending on user input
while PlayAgain == 1
    % Random permutation of a deck of cards, converted to values between 1-13
    cardDeck = ceil(randperm(52)/4);
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
        fprintf("Your current total is %.f\n", PlayerCards);
        % Condition to display a statement if player busts
        if PlayerCards > 21 
            fprintf("You have busted\n");
            % Terminate out of loop if the player busts
            break
        end
        % Takes user input for next move (hit or stand)
        UserInput = input("Enter 0 to stand or 1 to hit: " );
    end

    % While loop to draw cards for the dealer based on casino rules
    while DealerCards < 17
        % Assigns blackjack value of randomly generated card to dealer's
        % card total
        DealerCards = DealerCards + cardValues(cardDeck(index));
        index = index + 1;
        fprintf("Dealer's hand is: %.f\n", DealerCards);
        % Condition to display a statement if dealer busts
        if DealerCards > 21
            fprintf("Dealer has busted\n");
        end
    end
    
    % Conditional execution statements based on game outcome
    % Outcome #1: Player card is greater than Dealer (Neither busts)
    if (PlayerCards <= 21 && DealerCards <= 21) && (PlayerCards > DealerCards)
        winCounter(1) = winCounter(1) + 1;
        fprintf("You win\n");
        fprintf("Your score is %.f win(s) and %.f loss(es)\n", (1), winCounter(2));
    % Outcome #2: Player card is lower than Dealer (Neither busts)
    elseif (PlayerCards <= 21 && DealerCards <= 21) && (DealerCards > PlayerCards)
        winCounter(2) = winCounter(2) + 1;
        fprintf("You lose\n");
        fprintf("Your score is %.f win(s) and %.f loss(es)\n", winCounter(1), winCounter(2));
    % Outcome #3: Player busts whilst Dealer does not
    elseif PlayerCards > 21 && DealerCards <= 21
        winCounter(1) = winCounter(2) + 1;
        fprintf("You lose\n");
        fprintf("Your score is %.f win(s) and %.f loss(es)\n", winCounter(1), winCounter(2));
    % Outcome #4: Dealer busts whilst Player does not
    elseif PlayerCards <= 21 && DealerCards > 21
        winCounter(1) = winCounter(1) + 1;
        fprintf("You win\n");
        fprintf("Your score is %.f win(s) and %.f loss(es)\n", winCounter(1), winCounter(2));
    % Outcome #5: Player and Dealer draw
    else
        fprintf("You drew with the dealer\n");
        fprintf("Your score is %.f win(s) and %.f loss(es)\n", winCounter(1), winCounter(2));
    end

    % Takes user input to repeat the game or stop
    PlayAgain = input("Enter 1 to play again or 0 to stop: ");
end