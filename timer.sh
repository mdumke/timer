#!/usr/bin/env bash

print_usage_info () {
  echo -e "timer - Minimalistic countdown timer\n"
  echo -e "Usage: timer MINUTES [SECONDS]\n"
  echo -e "Available options:\n"
  echo -e "  -h,--help\tShow this help text"
  echo -e "  -t,--test\tCheck if sound works"
  echo -e "  MINUTES\tMinutes to count down (up to 60)"
  echo -e "  SECONDS\tOptional: additional seconds to count down"
}

play_sound () {
  speaker-test -t wav -r 44100 -w $HOME/lib/timer/gong.wav -l 1 > /dev/null
}

# display usage information if needed
if [[ $# -eq 0 ]] || [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
  print_usage_info
  exit
fi

# check for test flag
if [[ "$1" == "--test" ]] || [[ "$1" == "-t" ]]; then
  play_sound
  exit
fi

# main countdown loop
seconds=${2:-0}
i=$(($1 * 60 + $seconds))

while [[ "$i" -ge 0 ]]; do
  echo $i | awk '{printf "\rtime remaining: %s", strftime("%-M:%S", $0)}'
  i=$(( i - 1))
  sleep 1
done

play_sound
