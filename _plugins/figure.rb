module Yegor
  class FigureBlock < Liquid::Tag
    def initialize(tag, markup, tokens)
      super
      opts = markup.strip.split(/\s+/, 3)
      @src = opts[0].strip
      @width = opts[1].strip
    end

    def render(_context)
      html = "<figure><img src='#{CGI.escapeHTML @src}'" \
      " style='max-width:100%;width:#{@width}px;'" \
      " alt='figure'/></figure>\n\n"
    end
  end
end

Liquid::Template.register_tag('figure', Yegor::FigureBlock)
