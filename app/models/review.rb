class Review < ActiveRecord::Base
  belongs_to :item
  belongs_to :customer
end