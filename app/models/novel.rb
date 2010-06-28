class Novel < ActiveRecord::Base
  belongs_to :category
  has_many :tags,:dependent=>:destroy
  has_and_belongs_to_many :accounts
  has_many :chapters
  has_many :comments
  
  validates_presence_of :name
  validates_presence_of :url
  validates_presence_of :writer
  validates_presence_of :category

  after_update :save_tags
  def new_tag_attributes=(tag_attributes)
    tag_attributes.each { |attributes| tags.build(attributes) }
  end

  def existing_tag_attributes=(tag_attributes)
    tags.reject(&:new_record?).each do |tag|
      attributes=tag_attributes[tag.id.to_s]
      if attributes
        tag.attributes=attributes
      else
        tags.delete(tag)
      end
    end
  end

  def save_tags
    tags.each { |tag|tag.save(false)  }
  end
end
