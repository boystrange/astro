# Jellyfish Nebula

January 2025

![final image](final.png)

## Acquisition

I imaged the Jellyfish Nebula on a streak of clear nights in January 2025 using
a SharpStar 76EDPH reduced at 0.8, an Optolong L-ULTIMATE filter and an ASI533MC
Pro. Overall I collected more than 18 hours of exposition time on this target.

## Linear processing

I rotated and cropped the image so that it roughly had a 3x2 aspect ratio. I
used [Seti Astro]'s **Automatic DBE** to remove the background gradient (which
was barely noticeable anyway), followed by [BlurXTerminator] (default settings),
[NoiseXTerminator] (denoise: 0.9, iterations: 5) and [StarXTerminator] to
separate the nebula from the stars.

## Non-linear processing

![nebula](nebula.png){:.aside}

I used [Seti Astro]'s **Statistical Stretch** script to stretch the image
(target median: 0.25), followed by **HistogramTransformation** to clip the lower
end of the dynamic range. I then applied by **PixelMatch** process to convert
the RGB image to the Foraxx palette. I enhanced the nebula in two steps with
**CurvesTransformation**. First, I increased brightness and contrast with an
S-curve on the RGB channels (from 0.09 to 0.08 and from 0.32 to 0.35). Then, I
colorized the image (from 0.35 to 0.44) to obtain a "firey red" appearence.
These steps had introduced a slight tint to the dark background, so I applied
**BackgroundNeutralization** to restore it. At this point I wanted to remove the
halo around *Propus*, the bright star in the upper-right corner of the image. I
used **CloneStamp** with a fairly large radius (around 100 pixels) and half
opacity, working my way from the top-right corner towards the nebula. I finished the processing of the nebula applying [NoiseXTerminator] once again.

I stretched the stars-only image using [Seti Astro]'s **Star Stretch** (with
green noise removal enabled) and merged nebula and stars with [ImageBlend].

## To be improved

The top of the jellyfish and the brightest filaments along its "tentacles" are
rich in oxygen and therefore are supposed to be blueish. I tried to enhance the
green and blue channels to emphasize these regions, but they were very noisy and
I didn't like the final result. For this reason I fell back using the Foraxx
palette, which produces a more monotone image but with instense colors.

![annotated image](final_annotated.png)

## Wide-field version

![wide-field image](final_wide.png){:.aside}

At the end of January 2025 I also tried imaging the jellyfish nebula with the
FMA180 Pro, so as to have both the nebula and [M35](../2025-M35) in the same
frame. Here is the result of that attempt, in which I collected 146 x 300s light
frames resulting in slightly more than 12 hours of integration time. The
processing is very similar to that of the Jellyfish alone. However, I lowered
the target median used in **Statistical Stretch** since the nebula here covers a
much smaller portion of the image. Also, I had to work harder with the
**CloneStamp** tool not only to remove the halo around Propus, but also to get
rid of residual artifacts left behind by [StarXTerminator] in the densely packed
cluster NGC 2158.

I'm not particularly happy of this framing, because the two interesting objects
are too far away and close to the borders of the image. Perhaps using a 135mm
lens would be better in this case.

![wide-field annotated image](final_wide_annotated.png)

{% include links.md %}
