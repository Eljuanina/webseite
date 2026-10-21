---
layout: page
title: media
permalink: /media/
description: Articles and media coverage
nav: true
nav_order: 5
---

<div class="projects">
  {% assign items = site.projects | where: "category", "media" | sort: "importance" %}
  <div class="row row-cols-1 row-cols-md-2">
  {% for project in items %}
    <div class="col mb-4">
      <a href="{{ project.redirect }}" target="_blank">
        <div class="card h-100 hoverable">
          {% if project.preview %}
            {% assign src = project.preview %}{% unless src contains '://' %}{% assign src = src | relative_url %}{% endunless %}
            <img src="{{ src }}" alt="{{ project.title }}" class="card-img-top" style="width:100%;aspect-ratio:16/9;object-fit:cover">
          {% endif %}
          <div class="card-body">
            <h2 class="card-title">{{ project.title }}</h2>
            {% if project.subtitle %}<p class="card-text" style="font-weight:600;margin-bottom:0.4rem">{{ project.subtitle }}</p>{% endif %}
            <p class="card-text" style="font-style:italic;margin-bottom:0.6rem">{{ project.description }}</p>
            {% if project.source %}<p class="card-text" style="font-size:0.9rem;margin-bottom:0">{{ project.source }}</p>{% endif %}
          </div>
        </div>
      </a>
    </div>
  {% endfor %}
  </div>
</div>
