require "spec_helper"
require "rspec_api_documentation/dsl"

resource "User Registration and Authentication" do
  let(:parsed_response) { JSON.parse(response_body) }
  let(:user) { create(:user, email: "jonathan.soeder@gmail.com", password: "password1", password_confirmation:"password1") }

  post "/api/sessions" do
    parameter :email, "The user's email address", :required => true
    parameter :password, "The user's password", :required => true

    example "Obtaining a user's authentication token" do
      existing_user = user
      do_request(email: existing_user.email, password: "password1")
      parsed_response["authentication_token"].should_not be_nil
    end

  end

  post "/api/profiles" do
    parameter :email, "The user's email address", :required => true, :scoped => :user
    parameter :password, "The user's password. Must be at least 6 characters long", :required => true, :scoped => "user"
    parameter :password_confirmation, "The user's password. Must be at least 6 characters long", :required => true, :scoped => "user"
    parameter :first_name, "The user's first name", :required => false, :scoped => :user
    parameter :last_name, "The user's last name", :required => false, :scoped => :user
    parameter :city, "The user's city", :required => false, :scoped => :user
    parameter :state, "The user's state", :required => false, :scoped => :user
    parameter :bio, "The user's biography paragraph", :required => false, :scoped => :user

    example "Registering a user" do
      user_params = {
        user: {
          email: Faker::Internet.email,
          password: "password",
          password_confirmation: "password",
          first_name: "Jonathan",
          last_name: "Soeder",
          city: "Chicago",
          state: "Illinois",
          bio:"Jonathan Soeder is also known on the streets as the people's champ"
        }
      }

      do_request(user_params)

      status.should == 200
      parsed_response['id'].should_not be_nil
      parsed_response['authentication_token'].should_not be_nil
    end
  end

end
