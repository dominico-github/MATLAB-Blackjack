% Program emulates the casino version of blackjack, where it is a player
% against the dealer. Includes a betting system

% Randomises RNG sequence used by randi
rng('shuffle');
% Array containing the card values for blackjack
cardValues = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10];

% Initialisation for the win/loss counter and variable states
winCounter = [0 0];
PlayAgain = "yes";
playerMoney = 100;

% Print statements to explain the rules and betting system of the game
fprintf("Welcome to blackjack. The aim of the game is to get a card total of 21");
fprintf(" or as close to it as \npossible without going over. In this version of");
fprintf(" blackjack, you play against the dealer and must \nobtain a greater total");
fprintf(" than the dealer without busting (going over 21) to win.\n");
fprintf("You have 100 dollars to bet with. The game ends when you choose or if you");
fprintf(" run out of money.\n");

% While loop to repeat the game depending on user input
while PlayAgain == "yes"
    % Random permutation of a deck of cards, converted to values between 1-13
    cardDeck = ceil(randperm(52)/4);
    % Initialisation for counters and variable states
    index = 1;
    PlayerCards = 0;
    DealerCards = 0;
    UserInput = "hit";
    Aces = 0;
    
    % Takes player input for bet amount
    bet = str2num(input('How much money would you like to bet?: ', 's'));
    % While loop to reject invalid inputs 
    while isempty(bet)|| bet > playerMoney || bet < 0 || ~isnumeric(bet)
        bet = str2num(input("Invalid input. How much would you like to bet: ", 's'));
    end
    % Reduces player's money by bet amount
    playerMoney = playerMoney - bet;
    
    % While loop to draw a card when the player hits, stopping when standing
    while UserInput == "hit"
        % Assigns blackjack value of randomly generated card to player's
        % card total
        PlayerCards = PlayerCards + cardValues(cardDeck(index));
       
        % Condition to update Aces counter if an ace is drawn
        if cardValues(cardDeck(index)) == 11
            Aces = Aces + 1;
        end
        
        % Condition when player card total is greater than 21
        if PlayerCards > 21
            % Converts ace value from 11 to 1 if player's hand contains an
            % ace 
            if Aces > 0
                PlayerCards = PlayerCards - 10;
                Aces = Aces - 1;
            % Otherwise display a bust statement
            else
                fprintf("You drew a %.f. ", cardValues(cardDeck(index)));
                fprintf("Your total is %.f. You have busted\n", PlayerCards);
                index = index + 1; % Update index for next draw
                % Terminate out of loop if the player busts
                break
            end
        end
        fprintf("You drew a %.f. ", cardValues(cardDeck(index)));
        fprintf("Your current total is %.f\n", PlayerCards);
        index = index + 1; % Update index for next draw
        
        % Takes user input for next move (hit or stand)
        UserInput = input("Input 'hit' to Hit or 'stand' to Stand: ", 's');
        % While loop to continually ask user for input if valid input is
        % not given (either hit or stand)
        while isempty(UserInput) || ~ismember(UserInput, ["hit", "stand"])
            UserInput = input("Invalid input. Input 'hit' or 'stand': ", 's');
        end
    end

    % While loop to draw cards for the dealer based on casino rules
    while DealerCards < 17
        % Assigns blackjack value of randomly generated card to dealer's
        % card total
        DealerCards = DealerCards + cardValues(cardDeck(index));
        
        % Condition to update Aces counter if an ace is drawn
        if cardValues(cardDeck(index)) == 11
            Aces = Aces + 1;
        end
       
        % Condition when player card total is greater than 21
        if DealerCards > 21
              % Converts ace value from 11 to 1 if dealer's hand contains an
              % ace
              if Aces > 0
                DealerCards = DealerCards - 10;
                Aces = Aces - 1;
              % Otherwise display bust statement
              else
                  fprintf("The Dealer has drawn a %.f. ", cardValues(cardDeck(index)));
                  fprintf("Dealer's hand is: %.f\n", DealerCards);
                  fprintf("Dealer has busted\n");
                  % Terminate out of loop if the dealer busts
                  break
              end
        end
        fprintf("The Dealer has drawn a %.f. ", cardValues(cardDeck(index)));
        fprintf("Dealer's hand is: %.f\n", DealerCards);
        index = index + 1; % Update index for next draw
    end
    
   
    % Conditional execution statements based on game outcome
    % Outcome #1: Player card is greater than Dealer (Neither busts)
    if (PlayerCards <= 21 && DealerCards <= 21) && (PlayerCards > DealerCards)
        winCounter(1) = winCounter(1) + 1;
        playerMoney = playerMoney + (2 * bet); % Return 2x bet amount
        fprintf("You win. Your score is %.f win(s) and %.f loss(es)\n", winCounter(1), winCounter(2));
        fprintf("Your current money is %.f dollars\n", playerMoney);
    % Outcome #2: Player card is lower than Dealer (Neither busts)
    elseif (PlayerCards <= 21 && DealerCards <= 21) && (DealerCards > PlayerCards)
        winCounter(2) = winCounter(2) + 1;
        fprintf("You lose. Your score is %.f win(s) and %.f loss(es)\n", winCounter(1), winCounter(2));
        fprintf("Your current money is %.f\n", playerMoney);
    % Outcome #3: Player busts whilst Dealer does not
    elseif PlayerCards > 21 && DealerCards <= 21
        winCounter(2) = winCounter(2) + 1;
        fprintf("You lose. Your score is %.f win(s) and %.f loss(es)\n", winCounter(1), winCounter(2));
        fprintf("Your current money is %.f dollars\n", playerMoney);
    % Outcome #4: Dealer busts whilst Player does not
    elseif PlayerCards <= 21 && DealerCards > 21
        winCounter(1) = winCounter(1) + 1;
        playerMoney = playerMoney + (2 * bet); % Return 2x bet amount
        fprintf("You win. Your score is %.f win(s) and %.f loss(es)\n", winCounter(1), winCounter(2));
        fprintf("Your current money is %.f dollars\n", playerMoney);
    % Outcome #5: Player and Dealer draw
    else
        fprintf("You drew with the dealer. Your score is %.f win(s) and %.f loss(es)\n", winCounter(1), winCounter(2));
        playerMoney = playerMoney + bet; % Return bet to player
        fprintf("Your current money is %.f dollars\n", playerMoney);
    end
    
    % If statement to end the game if the player is out of money
    if playerMoney == 0
        fprintf("You ran out of money, better luck next time!\n");
        break
    end
    
    % Takes user input play another round or stop
    PlayAgain = input("Input yes to play another round, or no to stop: ", 's');
    % While loop to continually ask user for input if valid input is
    % not given (either yes or no)
    while isempty(PlayAgain) || ~ismember(PlayAgain, ["yes", "no"])
            PlayAgain = input("Invalid input. Input 'yes' or 'no': ", 's');
    end
end