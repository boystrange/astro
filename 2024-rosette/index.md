# Rosette Nebula -- Caldwell 49

![final](final.png)

I've always been fascinated by the Rosette Nebula since I started watching
videos about astrophotography. Its shape, dust layers, combination of colors and
star field are mesmerizing and from time to time I find myself staring at it for
minutes. No wonder I elected the rosette to be my first "serious"
astrophotography project, meaning extended integration time in the most
favorable conditions for imaging.

## Data acquisition and pre-processing

I collected data on the rosette nebula from the 26th to the 30th of December
2024 using a SharpStar 76EDPH with .8x reducer and an ASI533MC Pro with Optolong
L-ENHANCE filter, resulting in:

* 331 x 300s light frames (27.58 hours)
* 30 x 10ms flat frames

I used a master bias from my calibration library to calibrate the flat frames,
but since then I started taking longer flats (>3s) and corresponding flat darks
at each imaging session.

I stacked the data using **WBPP**, disabling all of the silly "fast" features
(fast integration and fast drizzling) that had appeared in the newly released
version of PixInsight. I really wanted to be sure to obtain the highest quality
master light frame. I also enabled 2x drizzling, considering the large amount of
collected data and the fact that I dither regularly.

## Linear post-processing

![DBE](dbe.png){:.aside}

With my hardware setup the rosette fills almost entirely the frame. For this
reason, I preferred using **DynamicBackgroundExtraction** in order to remove the
gradient by carefully choosing the sample points one by one. I set the tolerance
to 1.8 and generated 8 small samples per row, also considering that the star
field is quite packed in this region of the sky. I avoided any patch of
nebulosity, still making sure that there was a fair amount of samples all along
the border of the image.

I then used [BlurXTerminator] and [StarXTerminator] with default settings and
applied [NoiseXTerminator] (strength = 0.9, iterations: 5) to the starless
image. I brought this image to the non-linear state using Seti Astro's
**Statistical Stretch**. The recommended setting for stretching nebulae with
this script is 0.25, but I found that this is too much in this case, probably
because the nebula fills the frame almost entirely. Therefore, I lowered the
stretch amount to 0.15 to prevent excessive stretching. Also, I chose an
**unlinked** stretch, which resulted in nice colors at the end of the
post-processing phase.

## Non-linear post-processing of the nebula

![foraxx](foraxx.png){:.aside}

Right after stretching, plenty of details were visible but the internal part of
the rosette had a weird greenish tint. I used **HistogramTransformation** to
clip the lower unused part of the dynamic range and darken the image a little.
Then, I used **GHS** to strengthen the red channel (stretch factor: 0.44, local
intensity: 0.05, symmetry point: 0.1). I found that it is important to perform
this step to increase the red/yellow part and to reduce the blue one in later
processing phases. I then used my RGB to Foraxx palette **PixelMath** process to
bring out the yellow. This change of palette made the green tint disappear.

![final nebula](final_nebula.png){:.aside}

Before enhancing colors and details, I used **RangeSelection** to create a mask
that would protect the darker areas. I then applied three gentle colorize curves
using **ColorTransformation** to boost the colors of the rosette. Without the
previous enhancement of the red channel, the red part would turn out much
smaller and less noticeable, and the blue part would oversaturate quickly. I
experimented with other "boosts" of the blue/green channels, but they didn't
produce notably better results.

With the mask on, I used **LocalHistogramEqualization** (kernel radius: 64,
amount: 0.2) and **UnsharpMask** (standard deviation: 4, amount: 0.5) to enhance
structure and details. I finished off applying **BackgroundNeutralization**
(after having defined a dark preview in the upper-right corner) and
[NoiseXTerminator] once more.

## Star stretching and merging

To stretch the stars I used Seti Astro's **Star Stretch** script with default
settings. I then merged the nebula and the stars using [ImageBlend].

![final immage annotated](final_annotated.png)

[BlurXTerminator]: https://www.rc-astro.com/software/bxt/
[StarXTerminator]: https://www.rc-astro.com/software/sxt/
[NoiseXTerminator]: https://www.rc-astro.com/software/nxt/
[ImageBlend]: https://cosmicphotons.com/scripts/
