class Group < ActiveRecord::Base
  self.primary_key = :id
  belongs_to :section
  belongs_to :festival
  has_and_belongs_to_many :positions

  scope :organization_groups, :conditions => {:section_id => nil, :festival_id => nil}

  def users
    @users = []
    self.positions.each do |p|
      p.users.each do |u|
        if u.id > 1
          @users << u
        end
      end            
    end
    return @users.uniq{|x| x.id}
  end
end

