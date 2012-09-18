class Post < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  attr_accessible :content, :group, :user
end
