# Moon-Mars Conjunction (March 2025)

![final](final.png)

On 8 March 2025 at around 22:00 the moon and Mars were close enough to fit
inside the sensor of the ASI533MC Pro connected to my Askar FMA180 Pro. I wanted
to try capturing a moon/planet conjunction, but I knew that the moon's
brightness would have made things quite difficult. During the imaging session I
captured

* 60 x 3s light frames (for the starry background)
* 60 x 3ms light frames (for the moon details)
* 50 x 1.28s flat frames
* 50 x 1.28s dark frames

using an Astronomik UV-IR cut filter.

## Preprocessing

I used **WBPP** to process and stack all these files, lowering both the
calibration exposure tolerance and the post-calibration exposure tolerance to 0
so that PixInsight wouldn't try stacking all light frames together. As it
happened, stacking failed for the 3ms light frames anyway, likely because of the
lack of stars (Mars and the Moon were crossing
[Gemini](https://en.wikipedia.org/wiki/Gemini_(constellation)), in a region with
relatively few bright stars). This was a big deal, since the point of throwing
the 3ms lights to **WBPP** was only to obtain the debayered files automatically,
which I could stack later on with **FFTRegistration**.

### Star field stacking

This is the result of stacking the 3s lights. The brightness of the moon
(possibly along with some humidity in the air) caused a huge halo which proved
quite challenging to deal with.

![stack 3s](stack3s.png)

### Moon stacking

In order to stack the moon from the 3ms light frames, I used
**FFTRegistration**. I added the debayered frames created by **WBPP** and
selected the 30th frame as reference frame. In this way, the resulting stack
showed the moon positioned roughly half way from the start to the end of the
imaging session. There was no need to specify an output directory, since all I
wanted was the stacked image.

![FFTRegistration](FFTRegistration.png)

Both stacks turned out to have a green cast likely due to the Astronomik UV-IR
filter I used while capturing frames.

![stack 3ms](stack3ms.png)

## Post-processing of the star field

I tried to reduce the halo by running **ABE**. Given that the halo had a very
irregular shape, I raised the function degree to **11**. It took a lot of trial
and error to find the degree resulting in the "best" star field, the one with
the least amount of residual halo and that yielded fewer artifacts later on. The
result was not perfect, but it was OK: I was going to use just the stars from
this image anyway and I added a mild artificial glow towards the end of
post-processing.

![stars ABE](stack_abe.png)

Next I used [BlurXterminator] as if I were processing a plain nebula photo.
Since I was only interested in reducing stars (and Mars), I disabled nonstellar
sharpening. This also reduced any artifact that deconvolution could have
introduced and that could later be mistaken for a star. Then, I ran
[StarXterminator] to remove the stars. There were some residual artifacts around
the moon, which I had to remove with **CloneStamp**. Finally, I used Set Astro's
[StarStretch] to stretch the stars. I enabled the option to remove the green
noise and I **decreased the stretch amount to 4** so as to reduce the amount of
artifacts that became visible after the stretching and also not to have the
dimmest stars visible. The point was that around the moon (where the bright halo
was strongest) there was going to be a starless zone and if the rest of the sky
was packed with stars such zone would be very noticeable, once the moon was
inserted back. So, I though it was better seeing fewer stars but with the
illusion of a more uniform star field across the whole image.

![halo removed](only_stars.png)

It was time to get rid of the remaining moon artifacts using **CloneStamp**. I
generally hate using this tool, but there was no other way around the problem.

![stars CloneStamp](stars_clone_stamp.png)

As I was using **CloneStamp**, I realized that there was still a dim trace of
the moon's halo such that the hole left by the moon was still noticeable. Since
the moon would not fill this hole entirely, I though it was better to darken the
background. To this aim, I created a star mark with **StarMask** and used
**CurvesTransformation** to clip the background to 0. Then, I used
**SimplexNoise** with amount 0.02 and scale 1 to restore a minimal noisy
background, so that it was not exactly black (no astro photo should have a
perfectly black background!).

![stars with artificial noise added](stars_noise.png)

## Post-processing of the moon

I used **ColorCalibration** to get rid of the green cast. To do so, I created
two previews in the moon stack, a small one surrounding a bright crater and a
larger one in the background. Color calibration resulted is a neutral moon.

![moon calibrated](moon_calibrated.png)

I used **CurvesTransformation** for brightening the moon and for adding a little
bit of contrast with a gentle S curve, being careful not to overexpose the
brightest craters. I also increased saturation in two steps, so that the moon
regained some color. Finally, I used [BlurXterminator] with default settings to
sharpen the details.

![moon sharpened](moon_brightness.png)

## Final image composition

I like the script [ImageBlend] by Mike Cranfield for merging images. Here I used
it twice. First of all, as explained in this [Adam Block's
video](https://www.youtube.com/watch?v=DQjs2yB_MAw), I used [ImageBlend] to add
a little bit of **glow** to the moon. The general idea is to combine the image
of the moon with itself, tweaking the filter parameters until we obtain a fairly
realistic halo.

![moon glow](make_halo.png)

Then I used [ImageBlend] once again to merge the moon (with halo) and the starry
background. I rotated the image by 180 degrees and used **DynamicCrop** to
remove a ~50 pixels border around the image, where the **FFTRegistration**
didn't have enough pixels to integrate.

As a final step, I also generated an annotated version of the image. To that
aim, I needed to plate solve the image again. **ImageSolver** needed some help
and I searched for the star **47 Geminorum**, which I knew (from the automatic
plate solving done by **WBPP**) was in the picture. I also entered the exact
date in which the images were captured, as well as the focal length of the
telescope (174mm) and the pixel size (3.76). In **AnnotateImage** it was
important to check "Planets" so that Mars could be properly annotated.

![final with annotations](final_ann.png)

[BlurXterminator]: https://www.rc-astro.com/software/bxt/
[StarXterminator]: https://www.rc-astro.com/software/sxt/
[ImageBlend]: https://cosmicphotons.com/scripts/
[StarStretch]: https://www.setiastro.com/pjsr-scripts
