class Product < ApplicationRecord
	has_many :order_items, dependent: :destroy




	default_scope { where(active: true) }
end
