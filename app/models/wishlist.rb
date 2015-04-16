class Wishlist < ActiveRecord::Base
  belongs_to :resume
  belongs_to :language
end
