class ContentType
  include Mongoid::Document

  field :name,type:String

  has_many :item_types
end
