class DefaultImageService
  BASE_URL = "https://#{ENV['S3_BUCKET_NAME_2']}.s3.#{ENV['AWS_REGION']}.amazonaws.com/images/"

  # 画像のパスをリストで定義
  IMAGES = [
    "#{BASE_URL}top-image.jpg",
    "#{BASE_URL}icon_1.png",
    "#{BASE_URL}icon_2.png",
    "#{BASE_URL}icon_3.png",
    "#{BASE_URL}icon_4.png",
    "#{BASE_URL}icon_5.png",
    "#{BASE_URL}icon_6.png",
    "#{BASE_URL}icon_7.png",
    "#{BASE_URL}icon_8.png",
    "#{BASE_URL}icon_9.png",
    "#{BASE_URL}icon_10.png",
    "#{BASE_URL}icon_11.png",
    "#{BASE_URL}icon_12.png"
  ]


  # 指定された画像のURLを返す
  def self.image_url(index)
    IMAGES[index] if index.between?(0, IMAGES.size - 1)
  end
end