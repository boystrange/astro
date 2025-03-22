# Pinwheel Galaxy

June 2024

![final image](final.png)

I imaged M101 in two consecutive nights of June 2024 from a Bortle 4 sky,
collecting 200 x 180s light frames.

I stacked and drizzled the image using **WBPP** and calibrated colors with
**SpectroPhotometricColorCalibration**, after having selected a dark patch of
the image as region of interest. After cropping the image with **DynamicCrop**,
I used **AutomaticBackgroundExtractor** (function degree: 4) to remove the light
gradient. I found that neither Seti Astro's **Automatic DBE** nor
**DynamicBackgroundExtractor** with carefully placed sample points did a good
job, both leaving a dim greenish halo around the border of the image.
****AutomaticBackgroundExtractor**, on the contrary, produced an almost
perfectly flat image.

![galaxies](galaxy.png){:.aside}

I went ahead using [BlurXTerminator] (default settings) and [NoiseXTerminator]
(noise reduction: 0.9, iterations: 5). I also applied **SCNR** to get rid of the
green noise. I didn't use [StarXTerminator] at this stage, though, for it turned
out to remove colored patched from the inner parts of the galaxy at least on the
drizzled version of the image. Therefore I first brought the image to the
non-linear state using Seti Astro's **Statistical Stretch** (target median: 0.1)
and only then separated galaxies and stars with [StarXTerminator].

I darkened the background a bit using **HistogramTransformation** (shadows:
0.05, midtones: 0.4) making sure the median stayed around 0.1. Before enhancing
the galaxy, I created and applied a mask to protect the dark zones. I then
applied **MultiscaleMedianTransform** (layer 1: 0.2, layer 2: 0.1) to enhance
details and colorized the galaxies with **CurvesTransformation** (input: 0.4,
output: 0.55). At that point I removed the mask, applied [NoiseXTerminator] once
again with the same settings as before.

I increased the saturation on the stars-only image with an application of
**CurvesTransformation** (input: 0.4, output: 0.65). Then I merged galaxies and
stars using [ImageBlend].

![annotated image](final_annotated.png)

[BlurXTerminator]: https://www.rc-astro.com/software/bxt/
[StarXTerminator]: https://www.rc-astro.com/software/sxt/
[NoiseXTerminator]: https://www.rc-astro.com/software/nxt/
[ImageBlend]: https://cosmicphotons.com/scripts/
