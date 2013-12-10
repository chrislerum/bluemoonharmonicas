module ApplicationHelper
  def full_title(page_title)
    base_title = "Blue Moon Harmonicas"
    if page_title.empty?
      base_title
    else
      raw "#{page_title} | #{base_title}"
    end
  end
  def markdown_and_replace(text)
    text.gsub!(/:([a-z0-9_]+):/) do |match|
      snippet = Snippet.find_by_shortcut($1)
      snippet ? "#{snippet.text}" : ""
    end
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

end
