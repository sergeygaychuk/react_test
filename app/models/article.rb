class Article < ApplicationRecord
  belongs_to :story

  enum source: { blog: 'blog', facebook: 'facebook', tweet: 'tweet', other: 'other' }

  validates :name, :source, :story_id, :content, presence: true

  scope :by_name, -> (name) { where("name like '%#{name}%'") }
  scope :by_content, -> (content) { where("content like '%#{content}%'") }
  scope :by_source, -> (source) { where(source: source) }
  scope :by_story, -> (story_id) { where(story_id: story_id) }
end
