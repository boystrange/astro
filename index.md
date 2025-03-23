# Astrophotography Journal

A collection of my best astrophotographs and of their workflows.

## Targets

<div class="row">
    {% for target in site.data.log %}
        <div class="col">
            <a class="card shadow" href="{{ target.key }}">
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

## Messier Objects

<ul class="messier">
{% for i in (1..110) %}
    {% assign object = "M" | append: i %}
    {% for target in site.data.log %}
        {% if target.objects contains object %}
            <li>
                {{ object }} in <a href="{{ target.key }}">{{ target.title }}</a>
            </li>
        {% endif %}
    {% endfor %}
{% endfor %}
</ul>

## Tools

* [PixInsight Process for RGB to Foraxx palette conversion](RGBtoForaxx.xpsm)

All pictures are licensed under a [Creative Commons Attribution-ShareAlike 4.0
License](https://creativecommons.org/licenses/by-sa/4.0/) <i class="fa-brands
fa-creative-commons"></i> <i class="fa-brands fa-creative-commons-by"></i> <i
    class="fa-brands fa-creative-commons-sa"></i>
