# encoding: UTF-8

class Company
  include DataMapper::Resource

  Company.property(:id, Serial)
  Company.property(:name, Text, :required => true)
  Company.property(:address, Text, :required => true)
  Company.property(:city, Text, :required => true)
  Company.property(:country, Text, :required => true)
  Company.property(:email, Text)
  Company.property(:phone_number, Text)
  #directors #owners as files
  Company.property(:created_at, DateTime)
  Company.property(:updated_at, DateTime)

#  Company.property(:path, FilePath, :required => true)
#  property :path,   FilePath, :required => true
end
