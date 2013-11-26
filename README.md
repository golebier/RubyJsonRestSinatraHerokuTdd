RubyJsonRestSinatraHerokuTdd
============================

A small test of ruby power:

 --> Web service:

   -->  REST / JSON, Ruby, Sinatra, API:

     --> Create new company

     --> Get a list of all companies

     --> Get details about a company

     --> Update a company

     --> Attach pdf-versions ...

   --> Company attributes:

     --> Company ID

     --> Name

     --> Address

     --> City

     --> Country

     --> E-mail (not required)

     --> Phone Number (not required)

     --> One or more directors and beneficial owners.

  --> Prepare:

        bundle

        rake migrate

  --> Run/Start:

        rackup

  --> Usage:

	curl -X POST -d '{"name": "AN", "address": "AA", "city": "AC", "country": "ACr"}' http://localhost:9292/api/companies
//{"id":1,"name":"AN","address":"AA","city":"AC","country":"ACr","email":null,"phone_number":null,"created_at":"2013-11-26T19:14:35+00:00","updated_at":"2013-11-26T20:14:35+01:00"}

	curl -X GET http://localhost:9292/api/companies
//[{"id":1,"name":"AN","address":"AA","city":"AC","country":"ACr","email":null,"phone_number":null,"created_at":"2013-11-26T19:14:35+00:00","updated_at":"2013-11-26T20:14:35+01:00"}]

	curl -X GET http://localhost:9292/api/company/1
//{"id":1,"name":"AN","address":"AA","city":"AC","country":"ACr","email":null,"phone_number":null,"created_at":"2013-11-26T19:14:35+00:00","updated_at":"2013-11-26T20:14:35+01:00"}

        curl -X DELETE http://localhost:9292/api/company/1

	curl -X PUT -d '{"email": "AEm", "phone_number": "APn"}' http://localhost:9292/api/company/1
//{"id":1,"name":null,"address":null,"city":null,"country":null,"email":"AEm","phone_number":"APn","created_at":"2013-11-26T19:14:35+00:00","updated_at":"2013-11-26T20:26:27+01:00"}

	curl -X POST -d '{"address": "CA", "city": "CC", "country": "CCr"}' http://localhost:9292/api/companies
//Without output, when required lack

  --> Tests:

	bundle exec ruby tests/app_tests.ru

      or

        bash RunCurlTests

Toolchain:

   Ruby (Sinatra)

   Ember, Bootstrap, jQuery

   Less

   PostgreSQL/MySQL/MongoDB

DONE:

   Data versioning

TODO:

   Mongodb not sqlite3

   file attachment

   JS Client

   Hiroku deployment


