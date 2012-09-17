class Group < ActiveRecord::Base
  belongs_to :user
  attr_accessible :status, :title
end
