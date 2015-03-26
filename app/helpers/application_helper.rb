module ApplicationHelper

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form_group has-error'
    else
      content_tag :div, capture(&block), class: 'form_group'
    end
  end

# Method takes a string as arg and returns it after rendering it with Markdown
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true, strikethrough: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  # returns what is needed for a comment partial, i.e. an array of 'topic', 'post' and 'comment' objects
  def comment_url_helper(comment)
    post = comment.post
    topic = post.topic
    [topic, post, comment]
  end


end
