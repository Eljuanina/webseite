---
layout: page
title: events 2
permalink: /projects2/
description: Events and lecture series organized with the d\carb future economy forum
nav: true
nav_order: 3
display_categories: [events, lectures]
---

<!-- Version 2: every panel or session as its own card -->
<div class="projects">
{% for category in page.display_categories %}
  <a id="{{ category }}" href=".#{{ category }}">
    <h2 class="category">{{ category }}</h2>
  </a>
  {% assign sorted_projects = site.projects | where: "category", category | sort: "importance" %}
  {% for project in sorted_projects %}
    {% assign event_url = project.url | relative_url %}
    {% if project.redirect %}{% assign event_url = project.redirect %}{% endif %}
    <div style="margin-top:2rem">
      <h3 style="margin-bottom:0.2rem"><a href="{{ event_url }}">{{ project.title }}</a></h3>
      <p style="font-style:italic;margin-bottom:0.8rem">{{ project.description }}</p>
      {% if project.panels %}
        <div class="row row-cols-1 row-cols-md-3">
        {% for panel in project.panels %}
          <div class="col mb-3">
            <a href="{{ event_url }}">
              <div class="card h-100 hoverable">
                <div class="card-body">
                  <p class="card-text" style="font-weight:600;margin-bottom:0">{{ panel }}</p>
                </div>
              </div>
            </a>
          </div>
        {% endfor %}
        </div>
      {% endif %}
    </div>
  {% endfor %}
{% endfor %}
</div>
