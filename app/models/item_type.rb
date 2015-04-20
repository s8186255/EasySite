class ItemType
  include Mongoid::Document
  field :name,type:String

  belongs_to :info_type
  has_many :items
  belongs_to :content_type

  
end
