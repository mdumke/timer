#!/usr/bin/env bash

print_usage_info () {
  echo -e "timer - Minimalistic countdown timer\n"
  echo -e "Usage: timer MINUTES\n"
  echo -e "Available options:\n"
  echo -e "  -h,--help\tShow this help text"
  echo -e "  -t,--test\tCheck if sound works"
  echo -e "  MINUTES\tTime to count down in minutes"
}

play_sound () {
  speaker-test -t wav -r 44100 -w $HOME/lib/timer/gong.wav -l 1 > /dev/null
}

if [[ $# -eq 0 ]] || [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
  print_usage_info
  exit
fi

if [[ "$1" == "--test" ]] || [[ "$1" == "-t" ]]; then
  play_sound
  exit
fi

i=$(($1 * 60))

while [[ "$i" -gt 0 ]]; do
  echo $i | awk '{printf "\rtime remaining: %s", strftime("%-M:%S", $0)}'
  i=$(( i - 1))
  sleep 1
done

play_sound
