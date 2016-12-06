# bULAR - the batch Udacity Lecture Audio Ripper
CMD script using VLC to transcode Udacity lectures into audio for listening offline in the car, exercising, etc.

My time in the OMSCS program has taught me to take advantage of every opportunity to stay on top of the Udacity lectures that we are responsible for watching every week. To create another avenue for doing this, I looked for a way to convert those lectures into audio files so that I could listen to them as I commute. 

##Dependencies##
For now , a Windows machine and [VLC](http://www.videolan.org/vlc/), an open source media player/transcoder/slicer/dicer/etc. When installing VLC you'll want to be mindful of the installation options, which are maybe too aggressive in taking over your defaults.

###Download the lecture files###
![get your lecture files here](http://torylawson.com/archives/how-to-turn-udacity-lectures-into-an-mp3/udacity_downloadables.png "get your lecture files here") This part is easy: there's a special button, enabled I think at the discretion of the professor, which allows you to download the video lecture files. These will come in a .zip file, which you can then extract to a directory. 

###Now for the script###
The script will take all the video files in the current directory and then turn those into a single .mp3 file, so you'll probably want to keep individual sections separate unless they are short.

One or two comments on the script: first of all, obviously, use it at your own risk. Second, I want to make it do multiple directories and leave a single mp3 in each directory, but that's not done yet, so, sorry. Finally, you'll notice it converts to wav before it combines and transcodes to mp3. This is because transcoding directly to mp3 from mp4 seems to be tricky somehow, and the output always seemed to be the wrong speed for me. Also, because the combining step also transcodes (so that the time information is correct), it's less lossy this way. Unfortunately this also means that the files are huge, so you might want to experiment with that middle step.

Next steps are to do the multiple directory thing and convert this to a real language so it's readable and maybe not Windows-specific. Because we only use a couple codecs we might want to consider just using them directly, too.
