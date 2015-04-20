class Attachment::Image < Attachment::Asset
  mount_uploader :asset, Attachment::ImageUploader

  belongs_to :product
  belongs_to :product_case
end
