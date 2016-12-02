require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
require('./lib/address')
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

post('/address/new') do
  address = Address.new({
    :local => params.fetch("local"),
    :city => params.fetch("city"),
    :state => params.fetch("state"),
    :zip => params.fetch("zip"),
    :type => params.fetch("address-type")
  })
  index = params.fetch("contact-index").to_i
  contact = $contacts[index]
  contact.add_address(address)
  redirect "/"
end