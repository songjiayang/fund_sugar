class FundCategory < ActiveRecord::Base

  belongs_to :parent, class_name: 'FundCategory'
  has_many :children, class_name: 'FundCategory', foreign_key: :parent_id
  has_many :funds, foreign_key: :category_id

  scope :not_parent, -> { where('parent_id IS NOT NULL') }

  store :meta

end
