require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

$rolodex = Rolodex.new

get '/' do
	erb :index
end

get '/contacts' do 
	erb :contacts
end

get '/contacts/new' do 
	erb :new_contact
end

# get '/contacts/edit' do
# 	erb :edit_contact
# end

# get '/contacts/delete' do
# 	erb :delete_contact
# end

post '/contacts' do
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:notes])
		$rolodex.add_contact(new_contact)
		redirect to('/contacts')
end


