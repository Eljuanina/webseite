---
layout: page
title: events
permalink: /projects/
description: Events and lecture series organized with the d\carb future economy forum
nav: true
nav_order: 3
display_categories: [events, lectures]
# older event files that are replaced by the newer cards below (hidden from the overview)
events_with_videos: [1_evidence_based_policy, 2_wahl_spezial, 3_critical_minerals, 4_green_innovation, 5_climate_resilient]
---

<div class="projects">
{% for category in page.display_categories %}
  <a id="{{ category }}" href=".#{{ category }}">
    <h2 class="category">{{ category }}</h2>
  </a>

  {% if category == "lectures" %}
  <p>All nine sessions of the lecture series <a href="{{ '/projects/beyond-carbon/' | relative_url }}"><strong>Beyond Carbon: Debating the Future</strong></a>, University of Zurich, spring semester 2026.</p>
  {% assign sorted_projects = site.projects | where: "category", "lecture-session" | sort: "importance" %}
  {% else %}
  {% assign sorted_projects = site.projects | where_exp: "p", "p.category == 'events' or p.category == 'event-session'" | sort: "importance" %}
  {% endif %}

  <div class="row row-cols-1 row-cols-md-2">
  {% for project in sorted_projects %}
    {% if page.events_with_videos contains project.slug %}{% continue %}{% endif %}
    <div class="col mb-4">
      <a href="{% if project.redirect %}{{ project.redirect }}{% else %}{{ project.url | relative_url }}{% endif %}">
        <div class="card h-100 hoverable">
          {% if project.preview %}
            {% assign src = project.preview %}{% unless src contains '://' %}{% assign src = src | relative_url %}{% endunless %}
            <img src="{{ src }}" alt="{{ project.title }}" class="card-img-top" style="width:100%;aspect-ratio:16/9;object-fit:cover">
          {% endif %}
          <div class="card-body">
            <h2 class="card-title">{% if project.session %}{{ project.session }}. {% endif %}{{ project.title }}</h2>
            {% if project.subtitle and project.subtitle != project.title %}
              <p class="card-text" style="font-weight:600;margin-bottom:0.4rem">{{ project.subtitle }}</p>
            {% endif %}
            <p class="card-text" style="font-style:italic;margin-bottom:0.6rem">{{ project.description }}</p>
            {% if project.speakers %}
              <p class="card-text" style="font-size:0.9rem;margin-bottom:0.2rem"><strong>Speakers:</strong> {% for s in project.speakers %}{{ s.name }}{% unless forloop.last %}, {% endunless %}{% endfor %}</p>
              {% if project.moderators %}
              <p class="card-text" style="font-size:0.9rem;margin-bottom:0"><strong>Moderation:</strong> {% for s in project.moderators %}{{ s.name }}{% unless forloop.last %}, {% endunless %}{% endfor %}</p>
              {% endif %}
            {% endif %}
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
