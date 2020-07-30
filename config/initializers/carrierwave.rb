unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV["AWS_ACCESS_ID"],
      aws_secret_access_key: ENV["AES_SECRET_KEY"],
      region: 'ap-northeast-1'
    }
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'trash-man-db-production'
    config.cache_storage = :fog
  end
end