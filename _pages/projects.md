---
layout: page
title: events
permalink: /projects/
description: Events and lecture series organized with the d\carb future economy forum
nav: true
nav_order: 3
display_categories: [events, lectures]
---

<!-- pages/projects.md -->
<div class="projects">
{% for category in page.display_categories %}
  <a id="{{ category }}" href=".#{{ category }}">
    <h2 class="category">{{ category }}</h2>
  </a>
  {% assign sorted_projects = site.projects | where: "category", category | sort: "importance" %}
  <div class="row row-cols-1 row-cols-md-2">
  {% for project in sorted_projects %}
    <div class="col mb-4">
      <a href="{% if project.redirect %}{{ project.redirect }}{% else %}{{ project.url | relative_url }}{% endif %}">
        <div class="card h-100 hoverable">
          {% if project.img %}
            {% include figure.liquid loading="eager" path=project.img sizes="400px" alt="event thumbnail" class="card-img-top" %}
          {% endif %}
          <div class="card-body">
            <h2 class="card-title">{{ project.title }}</h2>
            <p class="card-text" style="font-style:italic;margin-bottom:0.6rem">{{ project.description }}</p>
            {% if project.panels %}
              <ul class="card-text" style="padding-left:1.1rem;margin-bottom:0;font-size:0.9rem">
              {% for panel in project.panels %}
                <li>{{ panel }}</li>
              {% endfor %}
              </ul>
            {% endif %}
          </div>
        </div>
      </a>
    </div>
  {% endfor %}
  </div>
{% endfor %}
</div>
