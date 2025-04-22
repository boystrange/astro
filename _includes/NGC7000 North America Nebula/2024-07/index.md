
## Pre-processing

1. WBPP con canali separati, questo permette di salvare più frame per alcuni
   canali

## Linear post-processing

1. DynamicCrop
2. GradientCorrection (default settings): immagini da zona con relativamente
   poca illuminazione, gradiente debole e nebulosità diffusa
3. BackgroundNeutralization con ROI nella nebulosa scura centrale
4. Scripts > Render > PSFImage per leggere FWHM (3.055)
5. BlurX con PSF manuale
6. NoiseX (denoise: 0.9, iterations: 5)
7. StarX
3. BackgroundNeutralization con ROI nella nebulosa scura centrale

## Nebula

1. Extract Ha
2. Extract Oiii
3. Statistical Stretch (EZ Soft Stretch a 0.20 con 0.1 altro parametro)
4. GHS per contrasto

## Stretch Ha

1. Statistical stretch (target median: 0.20, curves boost: 0.00, convergence)
2. GHS (factor: 0.7, local intensity: 3, symmetry point: 0.35, protect shadows: 0.15)
3. GHS (factor: 0.44, local intensity: 15, symmetry point: 0.16, protect highlights: 0.26)
4. GHS (factor: 0.44, local intensity: 1.310, symmetry point: 0.16, protect highlights: 0.20)

## Stretch Oiii

1. Statistical stretch (target median: 0.17, curves boost: 0.1, convergence)
2. GHS (factor: 0.52, local intensity: 4.57, symmetry point: 0.17, protect shadows: 0.06, protect highlights: 0.28)
3. GHS (factor: 0.96, intensity: 0, symmetry point: 0.31)

## Foraxx

1. make HO
2. make foraxx
3. CurvesTransformation S-curve luminance ((0.085, 0.085), (0.17, 0.17), (0.38, 0.42), (0.79, 0.83))
4. SCNR 0.5 green
5. luminance mask convolved
6. ColorSaturation 1 step * 2
7. MultiscaleLinearTransform (layer 2: 0.2, layer 1: 0.1)

## Stars

1. Seti Astro's Star Stretch (green noise removal enabled)

blend stars