class Project < ActiveRecord::Base
  belongs_to :team

  auto_html_for :description do
    html_escape
    image
    youtube(width: '100%', height: 250, autoplay: false)
    link target: '_blank', rel: 'nofollow'
    twitter
    instagram
    vimeo
    hashtag
    flickr
    simple_format
  end
end
