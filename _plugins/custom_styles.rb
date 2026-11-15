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
      font-size: 1.05rem !important;
    }
  </style>
CSS

Jekyll::Hooks.register([:pages, :posts, :documents], :post_render) do |doc|
  next unless doc.output_ext == ".html"
  next unless doc.output.include?("</head>")

  doc.output = doc.output.sub("</head>", "#{CUSTOM_CSS}</head>")
end