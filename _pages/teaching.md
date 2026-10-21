---
layout: page
permalink: /teaching/
title: teaching
description:
nav: true
nav_order: 6
intro: >-
  Nils teaches courses on climate economics, energy policy and experimental methods at the *University of Zurich*,
  and has taught in MBA and executive education programmes at *HEC Paris*, *ETH Zurich* and the *Hertie School* in Berlin.
  He has also supervised MSc dissertations at the *University of Oxford* and the *London School of Economics*.
institutions:
  - name: University of Zurich
    logo: /assets/img/teaching/uzh.png
    courses:
      - title: "Evidence Data Lab: Experimental Approaches to Campus Decarbonization"
        term: Spring 2025 and Spring 2026
        course_id: experimental-campus-decarbonization
        description: >-
          Organizations that want to decarbonize can choose between many measures, and these need to be tested to make sure
          that expected emission reductions turn into real ones. In this course, students learn how to design and run a
          randomized controlled trial (RCT) on the UZH campus: what makes a good RCT, the intuition and mathematics behind it,
          how to identify the need for one through a literature review, and how to write a pre-analysis plan.
          The lab secured CHF 30k in UZH funding.
  - name: HEC Paris
    logo: /assets/img/teaching/hec.png
    courses:
      - title: Climate Policy and Green Growth
        term: 2023
        description: >-
          Lecture in the MBA Climate & Business Certificate on the economics of climate policy and on how green growth
          strategies can reconcile decarbonization with economic development. Nils has also taught executive trainings
          on energy policy at HEC.
  - name: ETH Zurich
    logo: /assets/img/teaching/eth.png
    courses:
      - title: Executive Training on Energy Policy
        term: 2023 to 2025
        description: >-
          Executive education sessions on energy and climate policy, the economics of the energy transition and the
          evidence on which policies work.
  - name: Hertie School
    logo: /assets/img/teaching/hertie.png
    courses:
      - title: Executive Training Programme on Data Management in the Public Sector
        term: On behalf of GIZ
        url: https://www.hertie-school.org/en/customised/giz-data-management
        description: >-
          A six-day programme in Berlin, designed by Hertie School Executive Education for the Deutsche Gesellschaft für
          Internationale Zusammenarbeit (GIZ), for 25 public-sector professionals from Armenia, Azerbaijan, Georgia,
          Moldova and Ukraine. Participants learned to analyse data for policy-making, understand causal relationships,
          evaluate policy interventions and communicate evidence to decision-makers. Nils taught as one of the programme experts.
      - title: Executive Training on Energy Policy
        term: 2023 to 2025
        description: >-
          Executive education sessions on energy and climate policy for practitioners from government and the public sector.
  - name: MSc Dissertation Supervision
    logo:
    courses:
      - title: University of Oxford and London School of Economics
        description: >-
          Supervision of MSc dissertations by Nigel Yao (University of Oxford, distinction), Lewis Morrey (LSE)
          and Apurva Munjal (LSE).
---

<style>
  .teach-row { margin-top: 2.5rem; align-items: center; }
  .teach-logo { display: flex; align-items: center; justify-content: center; min-height: 140px; }
  .teach-logo img { max-width: 85%; max-height: 150px; object-fit: contain; }
  .teach-logo .teach-name { font-size: 1.8rem; font-weight: 600; text-align: center; }
  .teach-course { border-bottom: 1px solid var(--global-divider-color); padding: 0.9rem 0; }
  .teach-course summary { cursor: pointer; list-style: none; display: flex; justify-content: space-between; align-items: flex-start; }
  .teach-course summary::-webkit-details-marker { display: none; }
  .teach-course summary::after { content: "⌄"; font-size: 1.4rem; line-height: 1; margin-left: 1rem; transition: transform 0.2s; }
  .teach-course[open] summary::after { transform: rotate(180deg); }
  .teach-title { font-size: 1.25rem; font-weight: 600; color: var(--global-theme-color); margin: 0; }
  .teach-term { margin: 0.3rem 0 0; }
  .teach-body { margin-top: 0.8rem; }
  .teach-label { font-weight: 600; color: var(--global-theme-color); letter-spacing: 0.03em; margin-bottom: 0.6rem; }
</style>

{{ page.intro | markdownify }}

{% for inst in page.institutions %}
<div class="row teach-row">
  <div class="col-md-5 teach-logo">
    {% assign logo_file = nil %}
    {% if inst.logo %}{% assign logo_file = site.static_files | where: "path", inst.logo | first %}{% endif %}
    {% if logo_file %}
      <img src="{{ inst.logo | relative_url }}" alt="{{ inst.name }}">
    {% else %}
      <div class="teach-name">{{ inst.name }}</div>
    {% endif %}
  </div>
  <div class="col-md-7">
    {% for c in inst.courses %}
    <details class="teach-course">
      <summary>
        <div>
          <p class="teach-title">{{ c.title }}</p>
          {% if c.term %}<p class="teach-term">{{ c.term }}</p>{% endif %}
        </div>
      </summary>
      <div class="teach-body">
        <p class="teach-label">Course Description</p>
        {{ c.description | markdownify }}
        {% if c.course_id %}
          {% assign course = site.teachings | where: "course_id", c.course_id | first %}
          {% if course %}<p><a href="{{ course.url | relative_url }}">Course page with schedule and slides</a></p>{% endif %}
        {% endif %}
        {% if c.url %}<p><a href="{{ c.url }}" target="_blank">More about the programme</a></p>{% endif %}
      </div>
    </details>
    {% endfor %}
  </div>
</div>
{% endfor %}
