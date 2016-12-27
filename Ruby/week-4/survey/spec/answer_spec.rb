require('spec_helper')

describe Answer do
  describe '#question' do
    it "returns the question that the answer belongs to" do
      test_survey = Survey.create({:name => "Favorite Things"})
      test_question = Question.create({
        :text => "What is your favorite color?",
        :survey_id => test_survey.id
        })
      test_answer = Answer.create({
        :text => "Green",
        :survey_id => test_survey.id,
        :question_id => test_question.id
      })
      expect(test_answer.question).to eq test_question
    end
  end
  describe '#survey' do
    it "returns the survey that the answer belongs to" do
      test_survey = Survey.create({:name => "Favorite Things"})
      test_question = Question.create({
        :text => "What is your favorite color?",
        :survey_id => test_survey.id
        })
      test_answer = Answer.create({
        :text => "Green",
        :survey_id => test_survey.id,
        :question_id => test_question.id
      })
      expect(test_answer.survey).to eq test_survey
    end
  end
end
