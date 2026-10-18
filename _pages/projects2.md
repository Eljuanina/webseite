---
layout: page
title: events 2
permalink: /projects2/
description: Events and lecture series organized with the d\carb future economy forum
nav: true
nav_order: 3
display_categories: [events, lectures]
lecture_series: "Beyond Carbon: Debating the Future"
lectures:
  - title: "1. Clean Comparative Advantage: How Countries can benefit from Decarbonisation"
    speakers: "Laura Anadon, Stephane Hallegatte, Ralph Ossa; moderated by Johanna Schiele"
    url: https://www.sustainability.uzh.ch/de/forschung-lehre/lehre/beyondcarbon/sitzung1.html
  - title: "2. How Can Aviation Emissions Be Reduced Most Effectively?"
    speakers: "Katharina Michaelowa, Linde Warland, Andreas I. Mueller; moderated by Bjarne Steffen"
    url: https://www.sustainability.uzh.ch/de/forschung-lehre/lehre/beyondcarbon/sitzung2.html
  - title: "3. Is Environmentalism a New Religion?"
    speakers: "Michael Coors, Achim Wambach; moderated by Patrick Bernau"
    url: https://www.sustainability.uzh.ch/de/forschung-lehre/lehre/beyondcarbon/sitzung3.html
  - title: "4. Think Negative: Carbon Dioxide Removal and Carbon Offsets"
    speakers: "Johanna Puetz, Sophie Wenger, Jan Wurzbacher; moderated by Lisa Mangertseder"
    url: https://www.sustainability.uzh.ch/de/forschung-lehre/lehre/beyondcarbon/sitzung4.html
  - title: "5. Riding down the Learning Curve for Clean Technologies"
    speakers: "Greg Nemet, Alessio Terzi; moderated by Florian Müller"
    url: https://www.sustainability.uzh.ch/de/forschung-lehre/lehre/beyondcarbon/sitzung5.html
  - title: "6. Field Experiments for Net Zero"
    speakers: "Randomized controlled trials for measuring which climate interventions work"
    url: https://www.sustainability.uzh.ch/de/forschung-lehre/lehre/beyondcarbon/sitzung6.html
  - title: "7. The Power of Procurement"
    speakers: "Moderated by Olga Chiapinelli"
    url: https://www.sustainability.uzh.ch/de/forschung-lehre/lehre/beyondcarbon/sitzung7.html
  - title: "8. Green Finance"
    speakers: "Debjani Bhattacharyya, Markus Leippold, Scott Ryan; moderated by Nadine Strauss"
    url: https://www.sustainability.uzh.ch/de/forschung-lehre/lehre/beyondcarbon/sitzung8.html
  - title: "9. Greening Growth, Carbon Pricing, Carbon Dioxide Removal"
    speakers: "Closing session with Ottmar Edenhofer and J. Doyne Farmer"
    url: https://www.sustainability.uzh.ch/de/forschung-lehre/lehre/beyondcarbon/sitzung10.html
---

<!-- Version 2: events as in version 1, each lecture as its own card linking to its recap -->
<div class="projects">
{% for category in page.display_categories %}
  <a id="{{ category }}" href=".#{{ category }}">
    <h2 class="category">{{ category }}</h2>
  </a>
  <div class="row row-cols-1 row-cols-md-2">
  {% if category == "lectures" %}
    {% for lecture in page.lectures %}
    <div class="col mb-4">
      <a href="{{ lecture.url }}" target="_blank">
        <div class="card h-100 hoverable">
          <div class="card-body">
            <h2 class="card-title">{{ lecture.title }}</h2>
            <p class="card-text" style="font-style:italic;margin-bottom:0.6rem">{{ page.lecture_series }}</p>
            <p class="card-text" style="font-size:0.9rem;margin-bottom:0">{{ lecture.speakers }}</p>
          </div>
        </div>
      </a>
    </div>
    {% endfor %}
  {% else %}
    {% assign sorted_projects = site.projects | where: "category", category | sort: "importance" %}
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
  {% endif %}
  </div>
{% endfor %}
</div>