require('spec_helper')

describe Question do
  describe('#survey') do
    it "tells you which survey it belongs to" do
      test_survey = Survey.create({:name => "survey1"})
      test_question = Question.create({:text => "text", :survey_id => test_survey.id})
      expect(test_question.survey).to eq test_survey
    end
  end
  describe '#answers' do
    it "returns all the answers for the question" do
      test_survey = Survey.create({:name => "favorite things"})
      test_question = Question.create({
        :text => "what is your favorite color?",
        :survey_id => test_survey.id
      })
      test_answer_1 = Answer.create({
        :text => "Purple",
        :survey_id => test_survey.id,
        :question_id => test_question.id
      })
      test_answer_2 = Answer.create({
        :text => "Purple",
        :survey_id => test_survey.id,
        :question_id => test_question.id
      })
      expect(test_question.answers).to eq [test_answer_1, test_answer_2]
    end
  end
end
