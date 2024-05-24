class Article < ApplicationRecord
	include Visible

	has_many :comments, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true, length: { minimum: 10}
  validates :status, presence: true, inclusion: { in: %w[draft published archived] }

  enum status: { draft: 'draft', published: 'published', archived: 'archived' }

end
