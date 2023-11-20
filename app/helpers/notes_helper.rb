require "redcarpet"

module NotesHelper
  class FaeScribeRenderer < Redcarpet::Render::HTML
    def paragraph(text)
      process_custom_tags("<p>#{text.strip}</p>\n")
    end

    def list_item(text, list_type)
      "<li>#{process_custom_tags(text)}</li>\n"
    end

    def header(text, level)
      "<h#{level}>#{process_custom_tags(text)}</h#{level}>"
    end

    def link(url, title, content)
      %(<a href="#{url}">#{content}</a>)
    end

    private

    def internal_link(note_name)
      note = Note.find_by(name: note_name)
      return "[[#{note_name}]]" unless note

      url = Rails.application.routes.url_helpers.note_path(note)
      title = note.name
      content = note.name

      link(url, title, content)
    end

    def process_custom_tags(text)
      matches = text.to_enum(:scan, /\[\[(.*?)\]\]/).map { Regexp.last_match }

      if matches.any?
        matches.each { |match| text.sub!(match[0], internal_link(match[1])) }
      end

      text
    end
  end

  # class InternalLinksProcessor
  #   attr_reader :note_name, :note_class
  #
  #   def initialize(note_name, note_class = Note)
  #     @note_name = note_name
  #     @note_class = note_class
  #   end
  #
  #   def process_custom_tags(text)
  #     matches = text.to_enum(:scan, /\[\[(.*?)\]\]/).map { Regexp.last_match }
  #
  #     if matches.any?
  #       matches.each { |match| text.sub!(match[0], internal_link(match[1])) }
  #     end
  #
  #     text
  #   end
  #
  #   def internal_link
  #     return "[[#{note_name}]]" unless note
  #
  #     url = Rails.application.routes.url_helpers.note_path(note)
  #     title = note.name
  #     content = note.name
  #
  #     link(url, title, content)
  #   end
  #
  #   def link(url, title, content)
  #     %(<a href="#{url}">#{content}</a>)
  #   end
  #
  #   private
  #
  #   def note
  #     note_class.find_by(note_name)
  #   end
  # end

  def markdown(input)
    # Redcarpet docs recommend instantiating renderer object first before use.
    options = [:hard_wrap, :autolink, :no_intra_emphasis, :fenced_code_blocks]
    renderer = FaeScribeRenderer.new(
      filter_html: true, hard_wrap: true
    )
    parser = Redcarpet::Markdown.new(renderer,
      autolink: true, no_intra_emphasis: true)

    parser.render(input).html_safe
  end
end
