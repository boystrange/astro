# Pleiades

December 2024 - January 2025

![final image](final.png)

I imaged the Pleiades in three clear nights across the end of 2024 and the
beginning of 2025. For once these clear nights occurred during a new moon phase
and I could try imaging this broadband target using just a UV-IR cut filter.
Overall I collected around 140 x 300s light frames obtaining nearly 12 hours of
integration time.

I stacked and drizzled the images using **WBPP**. I calibrated the master light
frame using **SpectroPhotometricColorCalibration** after having selected a dark
region in one of the corners. I then cropped the image to remove the region with
high noise all around the border. I removed the background gradient using [Seti
Astro]'s **Automatic DBE** script, excluding the central part of the frame where
the brightest nebulosity lies.

I applied [BlurXTerminator] (default settings) to reduce the stars and used
**SCNR** to remove the green noise, followed by [NoiseXTerminator] (denoise:
0.9, iterations: 5) to smooth out the remaining noise. I did not remove the
stars at this stage because [StarXTerminator] was leaving some residual
nebulosity in the stars-only image. I stretched the image using [EZ Soft
Stretch] (target median: 0.2). At that point I could use [StarXTerminator] (with
*unscreen* enabled) to obtain a fair separation between stars and nebulosity.

At this point the starless image had a fairly strong reddish tint, which I
removed applying **SCNR** on the red channel. The tint decreased substantially,
but some magenta areas remained. So I inverted the image, used **SCNR** to
remove the green noise, and inverted the image again. Now the nebula was clean
and bluish. I used **HistogramTransformation** to remove the darkest part of the
dynamic range. In preparation of the nebula enhancement phase I created a mask
using **RangeSelection**, making sure that the mask coveret most filaments of
nebulosity. I used **CurvesTransformation** to colorize the nebula (input: 0.45,
output: 0.66) and **LocalHistogramEqualization** (kernel radius: 120, amount:
0.2) to slightly increase the contrast in the dust clouds. I removed the mask
and applied [NoiseXTerminator] (denoise: 0.9, iterations: 5) to remove the
noise.

The stars-only image had already been stretched. I just applied **SCNR** to
remove the green noise and merged it with the starless image using [ImageBlend].

![annotated image](final_annotated.png)

{% include links.md %}
