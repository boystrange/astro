# Small Sagittarius Star Cloud

July 2024

![final image](final.png)

I've always been fascinated by this region of the sky, despite the fact that
it's "simply" a very packed star field without bright or colorful nebulae. I
imaged this target on two summer nights using the Askar FMA180 Pro connected to
an ASI585MC planetary camera. Since I was going to take short exposures (60
seconds) and no intensive stretching was required, I preferred using an uncooled
camera with small pixels rather than a cooled camera with larger pixels. Overall
I collected 218 light frames.

After stacking and drizzling the image with **WBPP**, I used
**SpectroPhotometricColorCalibration** also selecting a dark area in the
upper-right corner as region of interest. There are black patches in the image,
but those are dark clouds.

This target is so packed with stars and dim background nebulosity that any
attempt at using a sophisticated background extraction tool would be vane.
Considering that the target had be imaged for a limited amount of time and that
the gradient seemed to be smooth and simple, I used
**AutomaticBaxkgroundExtractor** with function degree 1 to subtract the
gradient. Then I used [BlurXTerminator] (default settings) and
[NoiseXTerminator] (denoise: 0.9, iterations: 5) followed by **SCNR** to remove
any green noise.

Any attempt at separating the stars from the background nebulosity always left a
very noisy background full of artifacts. Also, there wasn't really much to
stretch in the nebulosity itself. Therefore I decided to proceed without
[StarXTerminator]. I used [Seti Astro]'s **Star Stretch** tool to bring the whole
image to non-linear state. I decreased the stretching amount to 4 and increased
the color boost to 1.2. The image ended up being very bright, so I used
**HistogramTransformation** (shadows: 0.25, midtones: 0.43) to bring it back to
a reasonable brightness. At that point I felt that the image needed no further
processing.

![annotated image](final_annotated.png)

{% include links.md %}
