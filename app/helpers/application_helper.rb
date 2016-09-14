module ApplicationHelper

  # Better notifications.
  # level: success, info, warning, error
  # messages: the string array of messages
  # position: Top Right, Bottom Right, Bottom Left,
  #           Top Left, Top Full Width, Bottom Full Width,
  #           Top Center, Bottom Center
  def notify(level, messages, position = 'bottom-left', duration = '9000')
    str = ''
    messages.each do |m|
      str += "toastr['#{level}'](" + '"' + m + '"' + '); '
    end
    html = <<-HTML
      <script type='text/javascript'>
        toastr.options = {
          'closeButton': true,
          'debug': false,
          'newestOnTop': false,
          'progressBar': false,
          'positionClass': 'toast-#{position}',
          'preventDuplicates': true,
          'onclick': null,
          'showDuration': '1000',
          'hideDuration': '1000',
          'timeOut': '#{duration}',
          'extendedTimeOut': '1000',
          'showEasing': 'swing',
          'hideEasing': 'linear',
          'showMethod': 'fadeIn',
          'hideMethod': 'fadeOut'
        }
        #{str}
      </script>
    HTML

    html.html_safe
  end

  def alternate_locales
    aval_locales_but_current = I18n.available_locales - [locale]
    aval_locales_but_current.map{ |l| yield(l) }.join.html_safe
  end

  def markdown(text)
    markdown_parser = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML,
      hard_wrap: true, autolink: true,
      quote: true, fenced_code_blocks: true,
      strikethrough: true, tables: true,
      space_after_headers: true, superscript: true,
      underline: true, highlight: true, footnotes: true
    )
    markdown_parser.render(text).html_safe
  end
end
