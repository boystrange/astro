---
layout: target
---

# M35

6 February 2025

![final image](final.png)

I gathered 120 x 60s frames on this target using the SharpStar 76EDPH and an
ASI585MC with an Astronomik L2 filter. I stacked and drizzled the image using
**WBPP** and performed color calibration with
**SpectroPhotometricColorCalibration**. I then cropped the image with
**DynamicCrop** to leave out any stacking artifact along the borders. I removed
the gradient using **AutomaticBackgroundExtractor** with function degree set to
1, given that the grandient was gentle and linear. I then applied
[BlurXTerminator] (default settings) and [NoiseXTerminator] (denoise: 0.9,
iterations: 5). I finished the linear post-processing phase with [Seti Astro]'s
**Star Stretch**, enabling green noise removal and slightly increasing the
stretch amount to 5.5 and the color boost as well. I noticed that some fait
green halos had remained around the brightest stars. Therefore I inverted the
image, applied **SCNR**, and inverted the image back. The halos were gone and
the image was done.

![annotated image](final_annotated.png)

{% include links.md %}
