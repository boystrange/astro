---
layout: target
---

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
region in one of the corners. Following the instructions found on the
[PixInsight YouTube channel](https://www.youtube.com/@PixInsight), I did not
select the exact sensor of my camera but left "Ideal QE Curve" instead. I then
cropped the image to remove the region with high noise all around the border and
rotated the image by 90 degrees clockwise so that it had a more natural
orientation. I removed the background gradient using [Seti Astro]'s **Automatic
DBE** script, excluding the central part of the frame where the brightest
nebulosity lies.

I applied [BlurXTerminator] to reduce the stars and deconvolve the image, but
increased *Sharpen Stars* to 0.65 because the stars in this image are very large
(bright). Also, I found out that not reducing stars enough causes issues to
[StarXTerminator] and stalls plate solving. I used [NoiseXTerminator] (denoise:
0.9, iterations: 5) to denoise the image and used [StarXTerminator] (*unscreen*
disabled) to separate the stars and the nebula.

I stretched the image using **EZ Soft Stretch** (target median: 0.2) from [EZ
Processing Suite]. For this image I preferred using this script instead of [Seti
Astro]'s **Statistical Stretch** because it seemed to bring out more the
background dust in the image (which I had initially mistaken for background
noise or a calibration error...). I then used **HistogramTransformation** to
remove the darkest part of the dynamic range. One side effect of **EZ Soft
Stretch** is that it compresses the pixels at the very low end of the dynamic
range. This does not seemed to have an impact on the quality of the image, but
it meant that the number of pixels clipped by **HistogramTransformation** was
slightly higher than I would normally allow. At this point the starless image
had a fairly strong reddish tint, which I removed applying **SCNR** on the red
channel. The tint decreased substantially, but some magenta areas remained. So I
inverted the image, used **SCNR** to remove the green noise, and inverted the
image again. Now the nebula was clean and bluish.

I used **CurvesTransformation** to increase saturation (input: 0.35, output:
0.48). Normally I would do this by first creating a mask to protect the darkest
areas of the image. In this case I decided not to do that because the darkest
areas were already quite colorless (after the two applications of **SCNR**). I
used **LocalHistogramEqualization** (kernel radius: 120, amount: 0.2) to
slightly increase the contrast in the dust clouds. To keep the noise in the
darkest areas under control, it was important to use a mask created using
**RangeSelection**. I removed the mask and applied [NoiseXTerminator] (denoise:
0.9, iterations: 5) to remove the noise. I also applied **SNCR** at half the
strength to decrease some green noise here and there in the background.

I stretched the stars-only image using [Seti Astro]'s **Star Stretch** with
green noise removal enabled. I merged the starless and the stars-only images
using [ImageBlend].

![annotated image](final_annotated.png)

{% include links.md %}
