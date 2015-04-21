module UserExt
  extend ActiveSupport::Concern

  included do
    belongs_to :role
  end

end
