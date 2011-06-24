class Folder < ActiveRecord::Base

  belongs_to :user
  belongs_to :investor
  has_many :documents

end