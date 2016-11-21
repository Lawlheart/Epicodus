require('sinatra')
require('sinatra/reloader')

class String
  define_method(:titleize) do
    split.map(&:capitalize).join(" ")
  end
end

get('/') do
  @characters = [{
      code_name: "joker",
      weapons: "knives, handguns",
      persona: "arsene",
      arcana: "fool",
      type: "dark",
      weakness: "ice, light"
  }, {
      code_name: "skull",
      weapons: "bludgeons, shotguns",
      persona: "captain kidd",
      arcana: "chariot",
      type: "electric",
      weakness: "unknown"
  }, {
      code_name: "panther",
      weapons: "whips, SMGs",
      persona: "carmen",
      arcana: "lovers",
      type: "fire",
      weakness: "ice"
  }, {
      code_name: "mona",
      weapons: "cutlasses, slingshots",
      persona: "zorro",
      arcana: "magician",
      type: "wind",
      weakness: "unknown"
  }]
  erb(:home)
end

get('/report_form') do
  erb(:report_form)
end


get('/report_confirmation') do
  @sighted = params.fetch('sighted')
  @description = params.fetch('description')
  @date = params.fetch('date')
  erb(:report_confirmation)
end