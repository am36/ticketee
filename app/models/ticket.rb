class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :author, class_name: "User"
  belongs_to :state
  before_create :assign_default_state
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags, uniq: true
  attr_accessor :tag_names
  validates :name, presence: true
  validates :description, presence: true
  mount_uploader :attachment, AttachmentUploader
  searcher do
            label :tag, from: :tags, field: "name"
            label :state, from: :state, field: "name"
  end
  
  
  def tag_names=(names)
    @tag_names = names
    names.split.each do |name|
      self.tags << Tag.find_or_initialize_by(name: name)
    end
  end
  
  
  private
  def assign_default_state
    self.state ||= State.default
  end
  
end
