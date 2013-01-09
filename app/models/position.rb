class Position < ActiveRecord::Base
  self.primary_key = :id
  belongs_to :user
  has_and_belongs_to_many :users
  has_and_belongs_to_many :groups
end
