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

end
