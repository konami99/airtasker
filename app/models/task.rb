class Task < ApplicationRecord
  validates :subject, :content, presence: true
end
