class UserTest < ActiveRecord::Base
  attr_accessible :answer_id, :question_id, :user_id

  after_create :calculate_score

  def calculate_score
    u=User.find(self.user_id)
    if self.answer_id!=nil

      if Answer.find(self.answer_id).correct?
        u.score=u.score+1
        u.save!

      end
    end

  end
end
