# Timer

Minimalistic command-line based countdown timer based on Bash. Plays a soundfile after the set time is expired.

```txt
Usage: timer MINUTES [SECONDS]

Available options:
  -h,--help   Show this help text
  -t,--test   Check if sound works
  MINUTES     Minutes to count down (up to 60)
  SECONDS     Optional: additional seconds to count down"
```

Place this code into `$HOME/lib/timer` and symlink `timer.sh` to somewhere in your `$PATH`. To use other paths, update the `play_sound` function in `timer.sh`.

Credits: The soundfile is taken from [airtaxi](https://freesound.org/people/airtaxi/sounds/76886/), published on [freesound.org](https://freesound.org).
