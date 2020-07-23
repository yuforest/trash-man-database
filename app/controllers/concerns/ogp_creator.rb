class OgpCreator
  require 'mini_magick'
  BASE_IMAGE_PATH = './app/assets/images/ogp-background.jpg'
  GRAVITY = 'northwest'
  TEXT_POSITION = '70,110'
  FONT = './app/assets/fonts/komorebi-gothic-P.ttf'
  FONT_SIZE = 45
  INDENTION_COUNT = 23
  ROW_LIMIT = 10

  def self.build(text)
    text = prepare_text(text)
    image = MiniMagick::Image.open(BASE_IMAGE_PATH)
    image.combine_options do |config|
      config.font FONT
      config.fill 'black'
      config.gravity GRAVITY
      config.pointsize FONT_SIZE
      config.draw "text #{TEXT_POSITION} '#{text}'"
    end
  end

  private
  def self.prepare_text(text)
    text.to_s.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
  end
end