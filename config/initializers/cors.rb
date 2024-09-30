Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://study-room-rails7.onrender.com'
    resource '*', headers: :any, methods: [:get, :post, :options, :delete, :put]
  end
end