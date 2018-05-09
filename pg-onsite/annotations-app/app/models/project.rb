class Project < ApplicationRecord
  has_many :sheets

  validates_presence_of :name
end
