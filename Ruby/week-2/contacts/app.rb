require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
also_reload('lib/**/*.rb')

$contacts = []

get('/') do
  @contact_list = $contacts
  erb(:index)
end

post('/contact/new') do
  contact = Contact.new({
      :first_name => params.fetch("first-name"),
      :last_name => params.fetch("last-name"),
      :job => params.fetch("job"),
      :company => params.fetch("company")
  })
  $contacts.push(contact)
  redirect "/"
end