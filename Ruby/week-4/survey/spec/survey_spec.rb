require('spec_helper')

describe Survey do
  describe '#questions' do
    it 'returns an array of all the questions in the survey' do
      test_survey = Survey.create(:name => "survey1")
      test_q1 = test_survey.questions.new({:text => "Question 1?"})
      test_q2 = test_survey.questions.new({:text => "Question 2?"})
      expect(test_survey.questions).to eq [test_q1, test_q2]
    end
  end

  describe 'new survey creation' do
    it "blocks creation of survey if name is empty" do
      test_survey = Survey.new({:name => ""})
      expect(test_survey.save).to eq false
    end
    it "converts the survey name to capitalized" do
      survey = Survey.create({:name => "the survey formerly known as prince"})
      expect(survey.name).to eq "The Survey Formerly Known As Prince"
    end
  end
end
