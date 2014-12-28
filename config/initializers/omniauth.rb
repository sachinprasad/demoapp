OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,'410519075791307', 'e267dd9837f7d5cdddd7f67f22e427ea'
end

