class Faq < ActiveRecord::Base
  attr_accessible :answer, :question

  validates_presence_of :answer, :question
end
