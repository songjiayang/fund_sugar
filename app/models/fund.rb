class Fund < ActiveRecord::Base
  belongs_to :fund_category, foreign_key: :category_id
end
