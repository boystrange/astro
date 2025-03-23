# Great Orion Nebula

December 2024

![final image](final.png)

The Great Orion Nebula is one of the few deep-sky objects that are visible with
naked eye but it is also quite challenging to photograph, for different reasons.
Its core is very bright and it is easy to overexpose. In addition, the nebula is
surrounded by diffuse dust clouds and dimmer nebulosity, so it is not always
easy to find "free" patches of sky in the gradient removal phase. Personally,
I've also found it difficult to obtain the combination of colors that I have in
mind for the nebula. I imaged M42 in the last few days of December 2024, while I
was waiting for another target to raise above the roof. Overall I collected 105
x 300s and 78 x 60s light frames.

I stacked the light frames using **WBPP**, obtaining two master light frames
corresponding to the 60s and 300s exposures. I then used **HDRComposition** to
combine these master frames and obtain a new one where the core of the nebula is
not overexposed. In fact, I could see the four stars forming the so-called
trapezium in the resulting composition. I rotated the composed image by 180
degrees, so that the "running man" and M42 formed a diagonal from the upper-left
to the lower-right corners of the image.

Since the nebula is surrounded by dust, I decided not to use any sophisticated
gradient removal tool. Luckily, the gradient seemed to be weak. I used
**AutomaticBackgroundExtractor** with function degree 1 to subtract the
background. After that I used **BackgroundNeutralization** after selecting a
region of interest in the upper-right corner of the image, where the nebulosity
is relatively low. This yielded an image with a greenish tint, to be corrected
at later stages.

![background extracted](abe.png){:.aside}

I used [BlurXTerminator] (default settings) and [NoiseXTerminator] (denoise:
0.9, iterations: 5). Trying to separate the nebula from the stars at this stage
resulted in a number of artifacts being left in the stars-only image. Therefore,
I decided to perform first a preliminary stretch to the image using [Seti
Astro]'s **Statistical Stretch** script (target median: 0.1, unlinked mode).
Applying [StarXTerminator] (with uncreen stars selected) at this point produced
a clean stars-only image.

To recover some of the structure in the inner core of the nebula I used
**HDRMultiscaleTransform** (number of layers: 9, on lightness only). Now I
wanted to stretch the image a little bit more and to try rebalance the colors so
as to get rid of the green tint and turn the inner core from salmon-orange to
purplish. I used **GHS** on the red channel (stretch factor: 0.8, local
intensity: 0.8, symmetry point: 0.18) to boost the red. The I applied **GHS** on
the blue channel (stretch factor: 0.5, local intensity: 1.7, symmetry point:
0.3) to boost the blue. Finally, I applied **GHS** in RGB mode (stretch factor:
0.5, local intensity: 2.2, symmetry point: 0.2) to stretch the image a little
bit more and bring out some dim details in the surrounding dust cloud. When the
dust "finger" in the lower-left corner of the image is visible, that for me is
the indicator that the stretch is enough.

![nebula only](nebula.png){:.aside}

I created a mask with **RangeSelection** (lower limit: 0.15, smoothness: 66) to
protect the darkest regions of the image. I applied **CurvesTransformation**
(input: 0.45, output: 0.55) to boost the colors. With the mask still applied, I
also used **LocalHistogramEqualization** (kernel radius: 150, amount: 0.2) to
increase contrast between different regions of the core. At this point some
traces of the green tint had resurfaced, so I applied
**BackgroundNeutralization** again followed by **SCNR**. I concluded the work on
the nebula with an application of [NoiseXTerminator] (same settings as before).

I removed the green noise from the stars-only image with **SCNR** and then used
**CurvesTransformation** (same settings as before) to boost the colors. I
finished combining nebula and stars with the [ImageBlend] script.

![annotated image](final_annotated.png)

{% include links.md %}
