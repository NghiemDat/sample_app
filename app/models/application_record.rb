class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :order_page,-> {order name: "asc"}
end
