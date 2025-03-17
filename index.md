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
                <ul class="details">
                    <li><b>{{ target.title }}</b></li>
                    <li><i>Scope:</i> {{ target.scope }}</li>
                    <li><i>Filter:</i>
                    {% if target.filter %}
                    {{ target.filter }}
                    {% else %}
                    none
                    {% endif %}
                    </li>
                    <li><i>Camera:</i>
                    {% if target.camera %}
                    {{ target.camera }}
                    {% else %}
                    N/A
                    {% endif %}
                    </li>
                    <li><i>Integration time:</i>
                    {% if target.integration < 2 %}
                    {{ target.integration | times: 60 | round }} minutes
                    {% else %}
                    {{ target.integration }} hours
                    {% endif %}
                    </li>
                </ul>
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
