---
layout: target
---

# Horsehead Nebula and Flame Nebula

![final image](final.png)

## Acquisition

I imaged this target using a SharpStar 76EDPH with an Optolong L-ENHANCE filter
in November and December 2024. I wanted to get this classic nebula "right". I
obtained more than 16 hours of integration time.

## Linear processing

I performed a color calibration using **SpectrophotometricColorCalibration**
after selecting a dark region of the background. For this I needed the boosted
mode of the **ScreenTranferFunction**, since this region of the sky is almost
entirely filled with nebulosity. I then rotated the image by 180 degrees, so
that the horsehead would be "aiming up". I used **DynamicCrop** to slightly crop
the frame so as to get rid of the outermost border with a lower signal-to-noise
ration. I then used **GradientCorrection** (default settings) to remove the
slight gradient. I then used [BlurXTerminator] (default settings) to deconvolve
the image, [NoiseXTerminator] (denoise: 0.9, iterations: 5) to reduce noise and
[StarXTerminator] (*unscreen* disabled) to separate the nebula from the stars.

## Non-linear processing

![starless image](nebula.png){:.aside}

I used **EZ Soft Stretch** (target median: 0.2) in the [EZ Processing Suite] to
stretch the nebula and then **HistogramTransformation** to clip the lower part
of the dynamic range. I switched to the Foraxx palette using my **PixelMath**
process. I increased the saturation of the image with **CurvesTransformation**
(input: 0.47, output: 0.51). I didn't feel the need to use a mask since most of
the image included nebulosity anyway. I increased the contrast using
**MultiscaleLinearTransform** (layer 2: 0.3, layer 3: 0.1, no noise reduction).
I then used [NoiseXTerminator] again to reduce the noise.

I stretched the stars with [Seti Astro] **Star Stretch** script (star stretch:
5.52, green noise enabled) and then merged nebula and stars with [ImageBlend].

## Things to be improved

When processing this target I always tend to resort to the Foraxx palette
because I cannot seem to obtain a nice separation between the yellow in the
flame nebula and the purplish-red in the horsehead nebula. I think the problem
lies in the dual narrowband filters I've been using, which filter out much of
the yellow light. The only way to prove this conjecture is to have a chance to
shoot this target with a broadband filter only.

![annotated image](final_annotated.png)

{% include links.md %}
