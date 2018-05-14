OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "543554996042497", "b165ac4c68be2fc33d027b50eecb41d2"
end