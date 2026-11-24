# _plugins/custom_styles.rb
#
# Injects a small <style> block into every rendered HTML page.
# This sidesteps the gem-owned Tailwind / SCSS pipeline entirely,
# so it works regardless of which CSS entry file the gem uses.

CUSTOM_CSS = <<~CSS
  <style>
    /* Local override: reduce social / CV / mail icon sizes */
    .contact-icons i,
    .contact-icons svg,
    .social i,
    .social svg {
      font-size: 1.6rem !important;
    }

    /* Scrollable news/announcements box: fixed height shows ~5 items */
    .announcements {
      max-height: 400px;
      overflow-y: scroll;
      padding-right: 0.5rem;
    }

    /* Clickable publication titles */
    .publications .title a {
      color: inherit;
      text-decoration: none;
    }
    .publications .title a:hover {
      text-decoration: underline;
      text-underline-offset: 3px;
    }
  </style>
CSS

CUSTOM_JS = <<~JS
  <script>
    document.addEventListener('DOMContentLoaded', function () {
      document.querySelectorAll('.publications .title').forEach(function (titleEl) {
        // skip if the title already contains a link
        if (titleEl.querySelector('a')) return;

        var container = titleEl.closest('li') || titleEl.closest('article') || titleEl.parentElement;
        if (!container) return;

        // pick the best URL: HTML > Website > DOI > PDF
        var priority = ['HTML', 'Website', 'DOI', 'PDF'];
        var links = Array.from(container.querySelectorAll('a[href]'));
        var target = null;
        for (var i = 0; i < priority.length && !target; i++) {
          target = links.find(function (a) {
            return a.textContent.trim() === priority[i];
          });
        }
        if (!target) return;

        var wrapper = document.createElement('a');
        wrapper.href = target.getAttribute('href');
        wrapper.target = '_blank';
        wrapper.rel = 'noopener noreferrer';
        while (titleEl.firstChild) wrapper.appendChild(titleEl.firstChild);
        titleEl.appendChild(wrapper);
      });
    });
  </script>
JS

Jekyll::Hooks.register([:pages, :posts, :documents], :post_render) do |doc|
  next unless doc.output_ext == ".html"
  next unless doc.output.include?("</head>")
  next unless doc.output.include?("</body>")

  doc.output = doc.output.sub("</head>", "#{CUSTOM_CSS}</head>")
  doc.output = doc.output.sub("</body>", "#{CUSTOM_JS}</body>")
end
