class User < ActiveRecord::Base
  self.primary_key = :id
  has_many :orders

  has_many :groups, :through => :positions
  has_and_belongs_to_many :positions

  has_secure_password

  def workshop_leader?
    #groups.include?(Group.find(33))
    true
  end

  def admin?
    # IT eller forpleining
    groups.include?(Group.find(89)) || groups.include?(Group.find(93))
  end
end
