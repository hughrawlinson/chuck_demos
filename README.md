# ChucK Demos

This is a project for me to be able to write ChucK code, commit it to this
repo, and have it appear on SoundCloud via the magic of continuous integration.

## Usage

1. Register a SoundCloud API Application, note the client id and client secret
1. [Fork this repository](https://github.com/hughrawlinson/chuck_demos/fork)
2. Go to travis-ci.com, log in, and turn on CI for your fork
3. Set the 'SOUNDCLOUD&#95;USERNAME', 'SOUNDCLOUD&#95;PASSWORD',
   'SOUNDCLOUD&#95;CLIENT&#95;ID', and 'SOUNDCLOUD&#95;CLIENT&#95;SECRET'
   environmental variables in your Travis project. Make sure to leave the
   'Display value in build log' toggle off, otherwise people can grab your
   creds!
4. Write some cool ChucK code
5. Commit the ChucK code to the 'code' directory of your fork

Once the code gets built on Travis, you will see it appear on your SoundCloud
profile.

## Notes

I apologise for the fact that you have to use your credentials, the SoundCloud
API doesn't have a great way to authenticate users without a server. If you
have a better idea, I'd welcome a pull request!

This repo uses my own ChucK debian package because the one in the Ubuntu repos
is egregiously out of date and I'm using a recent-ish ChucK feature to handle
recording of the audio. Feel free to use my packagecloud repository to grab
the debian package if you'd like.

## Contributing
I'm all for contributions to this project, but no need to send me ChucK code
that sends me audio - fork this project and put it on your own SoundCloud page.
Other than that, I love Pull Requests. Send me one!
