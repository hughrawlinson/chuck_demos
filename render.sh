#!/bin/bash

# Create data directory if it doesn't exist
mkdir -p data;

# Look for all ChucK files
for i in $( ls code | grep .ck ); do
  echo $i
  if [ ! -f data/$i.wav ];
  then
    # render pcm data
    echo "data/$i.wav is being rendered"
    chuck -s $(echo "code/$i") rec.ck:$(echo "data/$i.wav")
      else
    echo "data/$i.wav is cached"
  fi
  # Check if sound was actually created
  vol=$(sox "data/$i.wav" -n stat 2>&1 | grep "Maximum amplitude" | awk '{ print $3; }')
  if [[ $(echo "$vol < 0.1" | bc) -eq 1 ]];
  then
    echo "$i is silent! Not uploading"
  elif [ -z $TRAVIS_PULL_REQUEST ] || [ $TRAVIS_PULL_REQUEST == false ] 
  then
    echo "This is a pull request, skipping SoundCloud upload"
  else
    bundle exec ruby upload.rb $i.wav
  fi
done
