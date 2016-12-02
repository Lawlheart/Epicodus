class Contact
  attr_reader :first_name, :last_name, :job, :company
  define_method(:initialize) do |attrs|
    @first_name = attrs.fetch(:first_name)
    @last_name = attrs.fetch(:last_name)
    @job = attrs.fetch(:job)
    @company = attrs.fetch(:company)
  end
  define_method(:name) do
    "#{@first_name} #{last_name}"
  end
end
