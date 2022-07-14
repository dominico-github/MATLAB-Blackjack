% Program containing the win / loss counter for the blackjack game. 

% Initialisation of the counter
Counter = [0 0];

% Arbitrary assignment for variable to test the scenarios
hasWon = true;

% Scenario #1: Player has won
if hasWon == true
    % Update win component of counter
    Counter(1) = Counter(1) + 1;
% Scenario #2: Dealer has won
elseif hasLost == false
    % Update loss component of counter
    Counter(2) = Counter(2) + 1;
end

% Print statement to display the win / loss counter
fprintf("Your score is %.f win(s) and %.f loss(es)\n", Counter(1), Counter(2));