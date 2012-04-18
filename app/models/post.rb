class Post < ActiveRecord::Base

  validates_presence_of :title, :message => 'can not be empty'
  validates_presence_of :content, :message => 'can not be empty'

end
