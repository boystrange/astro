# Astrophotography Journal

All pictures are licensed under a [Creative Commons Attribution-ShareAlike 4.0
License](https://creativecommons.org/licenses/by-sa/4.0/) <i class="fa-brands
fa-creative-commons"></i> <i class="fa-brands fa-creative-commons-by"></i> <i
    class="fa-brands fa-creative-commons-sa"></i>

<div class="gallery">
    {% for target in site.data.log %}
        <div class="target shadow">
            <h5 class="target-title">{{ target.title }}</h5>
            <a href="{{ target.key }}">
                <img alt="{{ target.title }}" src="{{ target.key }}/final.png"/>
            </a>
        </div>
            <!-- <div class="card-content">
                <p class="title is-4">{{ target.title }}</p>
                <p class="subtitle is-6">{{ target.sessions | last | date: '%d %B %Y' }}</p>
                <p>Scope: <strong>{{ target.scope }}</strong></p>
                {% if target.filter %}
                    <p>Filters:
                        <strong>{{ target.filter }}</strong>
                    </p>
                {% endif %}
                {% if target.camera %}
                    <p>Camera: <strong>{{ target.camera }}</strong></p>
                {% endif %}
                <p>Integration time:
                    <strong>
                        {% if target.integration < 2 %}
                            {{ target.integration | times: 60 | round }} minutes
                        {% else %}
                            {{ target.integration }} hours
                        {% endif %}
                    </strong>
                </p>
                <p>Main objects:
                    {% for obj in target.objects %}
                        <span class="tag is-dark">{{ obj }}</span>
                    {% endfor %}
                </p>
            </div>
            <footer class="card-footer">
                <a class="card-footer-item" href="{{ key }}">Workflow</a>
                <a class="card-footer-item" href="{{ target.href }}">More</a>
            </footer> -->
        <!-- </div> -->
    {% endfor %}
</div>

<!-- ## Messier Objects

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

* [PixInsight Process for RGB to Foraxx palette conversion](RGBtoForaxx.xpsm) -->

