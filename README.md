# Ruby Tic Tac Toe

This is a practice of making a terminal-based Tic Tac Toe game in __Ruby__ using _object-oriented_ principles.

### To Run the Game

Simply clone the repository and type `ruby runner.rb` in the terminal.

### Future Improvements

This is the Minimum Viable Product. I would like to add the following improvements as I continue to work on the code:

1. **Improve Efficiency**

   Currently, the winning methods rely on checking the state of the Board object for each possible winning pattern. If this were a program that was relying on getting this information from the database, that would be close to 5 times the database is pinged each time a move is made and is checked to see if there is a winning pattern present. I would instead capture the state of the board once and run the win detection algorithms off of the snapshot.

   Note: The lag between the player move, computer move, and displaying messages is intentional for user experience as seen in the `sleep()` method added in `runner.rb`.  

2. **DRY Up the Code**

   The running of the win detection in the `runner.rb` file is repeated so I would like to condense that down to one method that would live either in the `runner.rb` file itself or the Game object.

   The win detection algorithm (`.uniq.count == 1`) is repeated in each of the pattern checking methods. That can be refactored into its own method and used by all of the other methods.

3. **Board Visualization**

   Currently, I'm using symbols of either *X* or *O* because having them as strings with double quotes around them unaligned the board too much. I couldn't find a way to display the strings without the quotes so using the symbol takes up only one space for the colon as opposed to one space on each side of the string. Ideally, the *X* and *O* can be displayed with no quotes or colons the way integers are.

   However, the ultimate goal would be to have a board that actually resembles a tic tac toe hash board instead of three stacked arrays.

4. **Create Tests**

   Creating RSpec tests would allow for a much faster development time as I can see if any changes would disrupt my win detection algorithms. (But I'd be lying if I said it wasn't fun having to play tic tac toe each time I made a change to see if it worked.)
