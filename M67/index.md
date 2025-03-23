# M67

5 February 2025

![final image](final.png)

I collected 60 x 60s light frames on this target with a SharpStar 76EDPH and a
planetary ASI585MC camera with an Astronomik L2 filter. I pre-processed the
frames using **WBPP** and used **SpectroPhotometricColorCalibration** to
calibrate the colors. The smooth gradient was removed using
**AutomaticBackgroundExtractor** (function degree: 1). I then applied
[BlurXTerminator] (default settings) and [NoiseXTerminator] (denoise: 0.9,
iterations: 5). I stretched the image using [Seti Astro]'s **Star Stretch**
(stretch amount: 5.5, color boost: 1.4) and enabling green noise removal. I then
darkened the image with **HistogramTransformation** and applied
**BackgroundNeutralization** (working mode: Target background, target
background: 0.1) after having selected a dark patch in the lower left corner to
remove a dim red cast from the background.

I tried the above workflow also after having run the **Repaired HSV Separation**
script, but I didn't notice any significant improvement. In fact, the "repaired"
image had slightly smaller star halos, which is most colored part of the stars.
The images featured in this page are "unrepaired".

![annotated image](final_annotated.png)

{% include links.md %}
