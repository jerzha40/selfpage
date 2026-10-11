---
layout: archive
permalink: /publications/
title: "Publications and Preprints"
author_profile: true
---

Research outputs appear below as they are documented. **Preprints are not automatically peer-reviewed publications.**

{% if site.publications.size > 0 %}
  {% assign entries = site.publications | sort: "date" | reverse %}
  {% for post in entries %}
    {% include archive-single.html %}
  {% endfor %}
{% else %}
  *No publications or preprints have been added yet.*
{% endif %}
