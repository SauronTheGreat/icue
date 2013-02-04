class Answer < ActiveRecord::Base
  attr_accessible :correct, :name, :question_id
  belongs_to :question
end
