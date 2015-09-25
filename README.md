# Rock Paper Scissors

Usage:

```bash
$ ruby rps.rb
You are playing against strategy 'default'.
Type 'r', 'p' or 's'.
>r
I chose 's'. You win!
You won 1 times.
You lost 0 times.
We tied 0 times.
Type 'r', 'p' or 's'.
>p
I chose 's'. You lose!
You won 1 times.
You lost 1 times.
We tied 0 times.
Type 'r', 'p' or 's'.
>s
I chose 'r'. You lose!
You won 1 times.
You lost 2 times.
We tied 0 times.
Type 'r', 'p' or 's'.
>q
You won 1 times.
You lost 2 times.
We tied 0 times.
Bye.
```

You can start the game with four different strategies for the bot:

```bash
$ ruby rps.rb           # default strategy: picks a random element
$ ruby rps.rb last_move # picks an element to win against your last move
$ ruby rps.rb favorite  # picks an element to win against your most frequent move
$ ruby rps.rb cheating  # picks an element to win against your current move
```
