if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_movie-awards', domain: 'https://calm-reaches-93104.herokuapp.com/'
else
  Rails.application.config.session_store :cookie_store, key: '_movie-awards'
end
