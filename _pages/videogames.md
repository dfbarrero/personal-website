---
title: Videogames
permalink: /videogames/
layout: single
header:
  overlay_image: /assets/img/vegas.jpg
  overlay_filter: 0.5 # same as adding an opacity of 0.5 to a black background
  caption: "Photo credit: [**dfbarrero**](https://www.flickr.com/photos/dfbarrero/)"
  #cta_label: "More Info"
  #cta_url: "https://unsplash.com"
#header:
#  video:
#	id: rQw8VGJsfCg
#	provider: youtube
---

These are videogames developed by former students that agreed to publish them.

# Academic year 2015-16

<ol>
{% for game in site.data.videogames %}
{% if game.year == "2015-6" %}
    <h2>{{ game.name}} </h2>
    <p><strong>Team leader:</strong> {{ game.leader}} <br>
    <strong>Development team</strong>: {{ game.team}} </p>
    <p><a href="{{site.url}}/{{site.baseurl}}/{{game.download}}">→ Download ({{game.size}}MB)</a> </p>

    {% if game.screenshot %}
        <img src="{{site.url}}/{{site.baseurl}}/{{game.screenshot}}" alt="{{game.name}} screenshot">
    {% endif %}
    {% if game.youtube %}
<iframe width="560" height="315" src="https://www.youtube.com/embed/{{game.youtube}}" frameborder="0" allowfullscreen></iframe>
    {% endif %}

    <br>
{% endif %}
{% endfor %}
</ol>

# Academic year 2014-15

<ol>
{% for game in site.data.videogames %}
{% if game.year == "2014-5" %}
    <h2>{{ game.name}} </h2>
    <p><strong>Team leader:</strong> {{ game.leader}} <br>
    <strong>Development team</strong>: {{ game.team}} </p>
    <p><a href="{{site.url}}/{{site.baseurl}}/{{game.download}}">→ Download ({{game.size}}MB)</a> </p>

    {% if game.screenshot %}
        <img src="{{site.url}}/{{site.baseurl}}/{{game.screenshot}}" alt="{{game.name}} screenshot">
    {% endif %}
    {% if game.youtube %}
<iframe width="560" height="315" src="https://www.youtube.com/embed/{{game.youtube}}" frameborder="0" allowfullscreen></iframe>
    {% endif %}

    <br>
{% endif %}
{% endfor %}
</ol>


