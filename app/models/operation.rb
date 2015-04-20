class Operation
  include Mongoid::Document

  field :name,type:String
  field :controller,type:String
  field :action,type:String

  belongs_to :info_type

end
