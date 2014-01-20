ENV['RACK_ENV'] = 'test'

# SimpleCov must be loaded before the Sinatra DSL and the application code.

require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'sinatra'
require 'test/unit'
require 'rack/test'
require 'base64'
require 'json'
require 'timecop'
require 'sinatra/cross_origin'
require './main'

class ApplicationTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

#  def make_a_company(company)
#    post '/api/companies', company.to_json
#    assert_equal 201, last_response.status

#    company = JSON.parse(last_response.body)
#    refute_nil company['id']
#    assert_equal Fixnum, company['id'].class
#    assert_equal "/company/#{company['id']}", last_response.headers['Location']

#    company['id'].to_s
#  end
  
#  def test_add_and_retrieve_company
#    # Create a new company, then retrieve it and
#    # assert that we get the same stuff back!

#    company = {
#        "subject" => "Don't forget",
#        "content" => "Test add and retrieve note!"
#    }

#    company_id = make_a_company(company)

#    # Retrieve the note we just created
##    returned_company = retrieve_company(company_id)

#    # Check we got the same note back!
##    note.each_key do |k|
##      refute_nil returned_note[k]
##      assert_equal note[k], returned_note[k]
##    end
#  end

#  def test_delete_non_existent_company_only_id
#    delete '/api/company/BLOOTYWOOTY'
#    assert_equal 404, last_response.status
#  end

  def test_empty_get_companies
    get '/api/companies'
    assert_equal 200, last_response.status
  end

  def test_empty_get_company_by_id
    get '/api/company/1'
    assert_equal 404, last_response.status
  end

  def test_delete_non_existent_company
    delete '/api/company/1'
    assert_equal 404, last_response.status
  end

  def test_empty_get_company_by_name
    get '/api/company/NAME'
    assert_equal 404, last_response.status
  end

# poprawna i nie porawna, tzn. bez required ..
  def test_prepare_company_correct_data
    company = {
       "name" => "company name",
       "address" => "company address",
       "city" => "company city",
       "country" => "company country"
    }
    post '/api/companies', company.to_json
    assert_equal 201, last_response.status
  end

  def test_prepare_company_incorrect_data
    company = {
       "city" => "company city",
       "country" => "company country"
    }
    post '/api/companies', company.to_json
    assert_equal 404, last_response.status
  end

#  def test_get_the_company_check_status
#    get '/api/company/1'
#    assert_equal 201, last_response.status
#  end

#  def test_get_the_company_check_body_has_id
#    get '/api/company/1'
#    company = JSON.parse(last_response.body)
#    refute_nil company['id']
#  end

#  def test_typecheck
#    assert_raise( RuntimeError ) { SimpleNumber.new('a') }
#  end
 
#  def test_failure
#    assert_equal(3, SimpleNumber.new(2).add(2), "Adding doesn't work" )
#  end

end
