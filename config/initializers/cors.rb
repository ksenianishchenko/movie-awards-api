Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://calm-reaches-93104.herokuapp.com'
    resource '*',
      headers: :any,
      methods: [:get, :post, :patch, :put, :delete, :options, :head],
      credentials: true
  end
end
