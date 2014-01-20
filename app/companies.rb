# encoding: UTF-8

#get '/some/:file' do |file|
#  file = File.join('/some/path', file)
#  send_file(file, :disposition => 'attachment', :filename => File.basename(file))
#end

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

## <<<< api server part.








## >>>> ui server part:

get '/h5/js/angular.js' do
  content_type 'application/javascript', :charset => 'utf-8'
  send_file './h5/js/angular.js'
end

get '/h5/js/angular-route.js' do
  content_type 'application/javascript', :charset => 'utf-8'
  send_file './h5/js/angular-route.js'
end

get '/h5/js/app.js' do
  content_type 'application/javascript', :charset => 'utf-8'
  send_file './h5/js/app.js'
end

get '/h5/css/style.css' do
  content_type 'text/css', :charset => 'utf-8'
  send_file './h5/css/style.css'
end

get '/' do
  content_type 'text/html', :charset => 'utf-8'

  headers 'Access-Control-Allow-Origin' => '*'
  headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With,X-HTTP-Method-Override,Cache-Control,Accept'
  headers 'Access-Control-Allow-Methods' => 'HEAD,GET,POST,PUT,DELETE,OPTIONS'

  send_file './h5/html/index.html'
end

get '/h5/html/parts/mainView.html' do
  content_type 'text/html', :charset => 'utf-8'
  send_file './h5/html/parts/mainView.html'
end

get '/h5/html/parts/displayAllView.html' do
  content_type 'text/html', :charset => 'utf-8'
  send_file './h5/html/parts/displayAllView.html'
end

get '/h5/html/parts/addNewCompanyView.html' do
  content_type 'text/html', :charset => 'utf-8'
  send_file './h5/html/parts/addNewCompanyView.html'
end

get '/h5/html/parts/displayCompanyView.html' do
  content_type 'text/html', :charset => 'utf-8'
  send_file './h5/html/parts/displayCompanyView.html'
end

get '/h5/html/parts/editCompanyView.html' do
  content_type 'text/html', :charset => 'utf-8'
  send_file './h5/html/parts/editCompanyView.html'
end



















#options "*" do
#  response.headers["Allow"] = "HEAD,GET,PUT,DELETE,OPTIONS"

#  # Needed for AngularJS
#  response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"

#  halt HTTP_STATUS_OK
#end



## Redirects user to index if a company is not found
#not_found do
#        flash[:notice] = " ! NotFound ! "
#        # /h5/html/index
#        redirect '/index'
#end

