require("sinatra")
require("sinatra/reloader")
require('sinatra/activerecord')
also_reload("lib/**/*.rb")
require("pg")
require('./lib/survey')
require('./lib/question')
require('./lib/answer')

get('/') do
  redirect '/surveys'
end

get('/surveys') do
  @surveys = Survey.all
  erb(:survey_list)
end

get('/surveys/:id') do
  @survey = Survey.find(params.fetch("id").to_i) rescue redirect("/surveys")
  erb(:survey_detail)
end

post('/surveys') do
  @survey = Survey.new({:name => params.fetch('new-survey-name')})
  if @survey.save
    redirect "/surveys"
  else
    erb(:errors)
  end
end

#update survey
patch('/surveys/:id') do
  new_survey_name = params.fetch("new-survey-name")
  @survey = Survey.find(params.fetch("id").to_i)
  @survey.update({:name => new_survey_name})
  @surveys = Survey.all()
  erb(:survey_list)
end

delete('/surveys/:id') do
  Survey.find(params.fetch("id").to_i).destroy
  redirect '/surveys'
end


#going back to individual survey page
post('/questions') do
  survey_id = params.fetch('new-question-survey-id').to_i
  @question = Question.create({:text => params.fetch('new-question-text'), :survey_id => survey_id})
  redirect "/surveys/#{survey_id}"
end

delete('/questions/:id') do
  survey_id = params.fetch('survey-id')
  Question.find(params.fetch("id").to_i).destroy
  redirect("/surveys/#{survey_id}")
end
