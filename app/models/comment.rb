class Comment < ActiveRecord::Base
## associations
belongs_to :chef
belongs_to :recipe

## validations
## Make sure a comment belongs to a Chef and a recipe
validates :chef_id, presence: true
validates :recipe_id, presence: true
validates :body, presence: true, length: {minimum: 5, maximum: 200}


end
