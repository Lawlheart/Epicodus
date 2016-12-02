class Contact
  attr_reader :first_name, :last_name, :job, :company, :address_list
  define_method(:initialize) do |attrs|
    @first_name = attrs.fetch(:first_name)
    @last_name = attrs.fetch(:last_name)
    @job = attrs.fetch(:job)
    @company = attrs.fetch(:company)
    @address_list = []
  end
  define_method(:name) do
    "#{@first_name} #{last_name}"
  end
  define_method(:add_address) do |new_address|
    @address_list.push(new_address)
  end
end
