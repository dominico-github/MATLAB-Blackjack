% Function to display the rules of the game. Initially was in the game code,
% it was turned into a function call to reduce clutter of the code.

function rules()
    fprintf("Welcome to blackjack. The aim of the game is to get a card total of 21");
    fprintf(" or as close to it as \npossible without going over. In this version of");
    fprintf(" blackjack, you play against the dealer and must \nobtain a greater total");
    fprintf(" than the dealer without busting (going over 21) to win.\n");
    fprintf("You have 100 dollars to bet with. The game ends when you choose or if you");
    fprintf(" run out of money.\n");
end
