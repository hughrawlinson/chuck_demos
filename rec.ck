2 => int status;
now + 5::minute => time maxLength;

// should be one sample in "production"
1::second => dur resolution;

me.arg(0) => string filename;
if( filename.length() == 0 ) "foo.wav" => filename;
dac => Gain g => WvOut w => blackhole;
filename => w.wavFilename;
<<<"writing to file:", "'" + w.filename() + "'">>>;
.5 => g.gain;

// temporary workaround to automatically close file on remove-shred
null @=> w;

while( status > 1 && now < maxLength) {
    resolution => now;
    // vm shred count => status
}
