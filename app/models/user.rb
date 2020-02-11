# The following resource was helpful in writing this class: https://cis.gvsu.edu/~kurmasz/Teaching/Courses/W20/CIS658/LectureNotes/DemoScripts/RailsDemo03.html
class User < ApplicationRecord
  has_many :bugs, dependent: :destroy

  validates :fname, :lname, :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}, 
        format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'is invalid'}
  validates :thumbnail, allow_blank: true, 
        format: {with: /.\.(jpg)|(png)|(gif)/, message: 'only allows .jpg, .png, or .gif.'}
end
