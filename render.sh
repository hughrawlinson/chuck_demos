#!/bin/bash

# Create data directory if it doesn't exist
if [ ! -f data ];
then
  mkdir data;
fi

# Look for all ChucK files
for i in $( ls code | grep .ck ); do
  echo $i
  if [ ! -f data/$i.wav ];
  then
    # render pcm data
    echo "data/$i.wav is being rendered"
    chuck -s $(echo "code/$i") rec.ck:$(echo "data/$i.silent.wav")
    # trim silence
    sox "data/$i.silent.wav" "data/$i.wav" silence 1 0.1 0.1% reverse silence 1 0.1 0.1% reverse
    # clean up
    rm "data/$i.silent.wav"
      else
    echo "data/$i.wav is cached"
  fi
  # Check if sound was actually created
  vol=$(sox "data/$i.wav" -n stat 2>&1 | grep "Maximum amplitude" | awk '{ print $3; }')
  if [ $(echo "$vol < 0.1" | bc) -eq 1 ];
  then
    echo "$i is silent! Not uploading"
  else
    python upload.py data/$i.wav
  fi
done