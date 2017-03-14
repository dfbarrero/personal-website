---
title: Notes
permalink: /notes/
layout: single
header:
  overlay_image: /assets/img/chino.jpg
  overlay_filter: 0.5 # same as adding an opacity of 0.5 to a black background
  caption: "Photo credit: [**dfbarrero**](https://www.flickr.com/photos/dfbarrero/)"
  #cta_label: "More Info"
  #cta_url: "https://unsplash.com"

---

<ul class="post-list">
    {% for post in site.posts %}
      <li>
        <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>

          <a class="post-link" href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
      </li>
    {% endfor %}
</ul>

<p class="rss-subscribe">Subscribe <a href="{{ "/feed.xml" | relative_url }}">via RSS</a></p>

