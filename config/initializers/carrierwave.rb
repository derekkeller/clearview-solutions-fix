if Rails.env == 'production'
  CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'

  config.s3_access_key_id = '154PWE5D42YYB3PZE782'
  config.s3_secret_access_key = 'G6fmqXsOxciQ8tVjV4lYR69WN6PpqUnFjulXPl9y'
  config.s3_bucket = "documentsbucket"
  end
end