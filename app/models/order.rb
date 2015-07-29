class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_line_items
end
