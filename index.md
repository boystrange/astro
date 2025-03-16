# Astrophotography Journal

When you become passionate about astrophotography, you want to do it all the
time. Since I live in a place where most nights are cloudy or foggy, I had to
find an alternative way to "do astrophotography" in at least some of those
nights as well. This journal is meant to be just that.

## Targets

<div class="row">
    {% for target in site.data.log %}
        <div class="col">
            <a class="card shadow" href="{{ target.key }}/index.html">
                <img alt="{{ target.title }}" src="{{ target.key }}/final.png"/>
                {{ target.title }}
            </a>
        </div>
    {% endfor %}
</div>
{{ targets }}

## Tools

* [PixInsight Process for RGB to Foraxx palette conversion](RGBtoForaxx.xpsm)

All pictures are licensed under a [Creative Commons Attribution-ShareAlike 4.0
License](https://creativecommons.org/licenses/by-sa/4.0/) <i class="fa-brands
fa-creative-commons"></i> <i class="fa-brands fa-creative-commons-by"></i> <i
    class="fa-brands fa-creative-commons-sa"></i>
