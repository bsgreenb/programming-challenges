class Annotation < ApplicationRecord
  belongs_to :sheet

  validates_associated :sheet
  validates_presence_of :content
end
