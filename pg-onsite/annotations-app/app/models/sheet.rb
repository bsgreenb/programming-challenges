class Sheet < ApplicationRecord
  belongs_to :project

  validates_presence_of :project

  has_many :annotations
end
