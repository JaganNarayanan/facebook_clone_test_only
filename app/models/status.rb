class Status < ActiveRecord::Base
  validates_length_of :content, :minimum => 10
  validates :content, presence: true
  validates :title, :length => {:minimum => 8}
  validates :title, presence: true
  belongs_to :user
  has_many :likes, dependent: :destroy

  def self.first
    @statuses = Status.order("id DESC").all
    return @statuses.first
  end

end
