require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
require('./lib/address')
require('./lib/phone')
require('./lib/email')
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
  index = params.fetch("address-contact-index").to_i
  contact = $contacts[index]
  contact.add_address(address)
  redirect "/"
end

post('/phone/new') do
  phone = Phone.new({
    :area_code => params.fetch("area-code"),
    :number => params.fetch("phone-number"),
    :type => params.fetch("phone-type")
  })
  index = params.fetch("phone-contact-index").to_i
  contact = $contacts[index]
  contact.add_phone(phone)
  redirect "/"
end

post('/email/new') do
  email = Email.new({
      :address => params.fetch("email-address"),
      :type => params.fetch("email-type")
  })
  index = params.fetch("email-contact-index").to_i
  contact = $contacts[index]
  contact.add_email(email)
  redirect "/"
end

get('/**/new') do
  redirect '/'
end