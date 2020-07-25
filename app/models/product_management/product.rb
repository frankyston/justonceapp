module ProductManagement
  class Product < ApplicationRecord
    self.table_name = 'products'

    acts_as_tenant :home

    has_many :category_products, class_name: 'ProductManagement::CategoryProduct'
    has_many :categories, through: :category_products, class_name: 'ProductManagement::Category'

    validates :name, presence: true
  end
end
