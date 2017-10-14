// our patch
Centroid cent => blackhole;
Flux flux => blackhole;

FFT fft =^ cent;
fft =^ flux;

LPF filter => fft;
filter => dac;

SawOsc saw => Gain g1 => filter;
TriOsc tri => Gain g2 => filter;
SqrOsc sqr => Gain g3 => filter;

// set parameters
512 * 16 => fft.size;
// set hann window
Windowing.hann(512) => fft.window;
// set sine frequency
440 => saw.freq => tri.freq => sqr.freq;
// compute srate
second / samp => float srate;

// control loop
while( true )
{
    // upchuck: take fft then centroid
    flux.upchuck();
    cent.upchuck();
    // print out centroid
    Math.randomf() => float g1val => g1.gain;
    Math.randomf() => float g2val => g2.gain;
    Math.randomf() => float g3val => g3.gain;
    Math.random2(500,20000) => float filterFreq => filter.freq;
    Math.randomf() => float filterQ => filter.Q;
    <<< filterFreq >>>;
    <<< filterQ >>>;
    <<< g1val >>>;
    <<< g2val >>>;
    <<< g3val >>>;
    <<< cent.fval(0) * srate / 2 >>>;
    <<< flux.fval(0) >>>;
    
    // advance time
    fft.size()::samp => now;
}
