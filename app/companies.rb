# encoding: UTF-8

# get companies
get '/api/companies' do
  format_response(Company.all, request.accept)
end

# get the company
get '/api/company/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  format_response(company, request.accept)
end

# add the company
post '/api/companies' do
  data = JSON.parse request.body.read
  # check required
  company = Company.create(
    name: data['name'],
    address: data['address'],
    city: data['city'],
    country: data['country'],
    email: data['email'],
    phone_number: data['phone_number'],
    created_at: Time.now.utc,
    updated_at: Time.now.utc
  )
  halt 404 if company.id.nil?
  status 201
  format_response(company, request.accept)
end

# update
put '/api/company/:id' do
  data = JSON.parse request.body.read
  company ||= Company.get(params[:id]) || halt(404)
  # check required
  halt 500 unless company.update(
    name: data['name'],
    address: data['address'],
    city: data['city'],
    country: data['country'],
    email: data['email'],
    phone_number: data['phone_number'],
    updated_at: Time.now.utc
  )
#  %w(subject content).each do |key|
#    if !data[key].nil? && data[key] != company[key]
#      company[key] = data[key]
#      company['updated_at'] = Time.now.utc
#    end
#  end

  format_response(company, request.accept)
end

# delete the comapany
delete '/api/company/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  halt 500 unless company.destroy
end

