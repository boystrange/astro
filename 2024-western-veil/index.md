# Western Veil Nebula -- NGC 6960

July 2024

![final](final.png)

In July 2024 I had two clear nights worth of imaging from a Bortle 4 sky, so I
pointed my SharpStar 76EDPH with .8x reducer and ASI533MC Pro at the Western
Veil Nebula, a beautiful supernova remnant in the constellation Cygnus. I
collected

* 218 x 180s light frames (barely under 11 hours)
* 60 flat frames

## Linear post-processing

I worked on the x2 drizzled image since I wanted to highlight the delicate
oxygen tendrils that extend along the "top" of the nebula. Also, I wanted to
avoid stars to become too blocky. Even if this is a nebula, stars play a primary
role and I wanted them to be nice and round.

I started selecting a preview in the upper-right portion of the image and
applying **SpectroPhotometricColorCalibration** to calibrate the colors. I
didn't use any particular filter except for a standard UV-IR cut, hence the
colors were relatively accurate. Then I cropped the image to remove a thin
border were the integration was only partial.

![adbe](adbe.png){:.aside .noshadow}

I shot the target when it was high in the sky and there was little light
pollution, so the image didn't have a noticeable gradient. Nonetheless, I
decided to run [Seti Astro]'s **Automatic DBE** after having excluded any part
with nebulosity.

I then ran the standard sequence of [BlurXTerminator] (default settings),
[NoiseXTerminator] (default amount, 5 iterations) and [StarXTerminator] to
separate the nebula from the stars.

## Non-linear post-processing

![nebula](nebula.png){:.aside}

I used [Seti Astro]'s **Statistical Stretch** to perform the main stretch of the
image. I kept the *linked stretch* option enabled, since the image had been
color calibrated, and I lowered the target median to 0.2 since the nebulosity in
the image is quite sparse. Then I used **HostogramTransformation** to clip the
lower, unused part of the dynamic range. Before focusing on the nebula, I used
**CurvesTransformation** to apply a very gentle S curve on the luminosity,
pivoting the curve near the dimmest regions. This slightly darkened the
background and, above all, increased the luminosity of the nebula. I also
applied **SCNR** (amount: 0.5) to partially remove the green component from the
oxygen, so as to achieve a more bluish tone.

Before enhancing the colors, I created a mask for the colored parts of the image
with **RangeSelection**. I then used **CurvesTransformation** to colorize the
image in two steps. I also used **UnsharpMask** (standard deviation: 6.5,
amount: 0.4) to sharpen the details of the nebula, being careful not to
introduce artifacts. I removed the mask and used **BackgroundNeutralization**
(with a region of interest in the upper right corner of the image) to neutralize
the background and applied [NoiseXTerminator] once again to smooth out any noise
introduced in this phase.

## Star stretching and merging

I used [Seti Astro]'s **Star Stretch** to stretch the stars-only image. Since I
wanted the stars to be prominent and colored, I bumped up the stretching amount
to 5.5 and the color boost to 1.5, also enabling green noise removal. I obtained
the final image using [ImageBlend].

![annotated image](final_annotated.png)

{% include links.md %}
