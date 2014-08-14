class Item < ActiveRecord::Base
  belongs_to :product
  belongs_to :shop

  has_many :skus
  accepts_nested_attributes_for :skus

  delegate :name, to: :product
end
