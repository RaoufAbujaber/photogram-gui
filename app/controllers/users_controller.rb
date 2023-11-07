class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc})
    render({ :template => "user_templates/index"})
  end
  def show
    url_username = params.fetch("path_username")
    matching_usernames= User.where({:username => url_username})
    @the_user = matching_usernames.at(0)
    
    render({ :template => "user_templates/show"})
  end
  def create
    input_username = params.fetch("query_username")

    a_new_username = User.new
    a_new_username.username = input_username

    a_new_username.save

    redirect_to("/users/" + a_new_username.username.to_s)
  end
  def update

    the_id = params.fetch("path_id")

    matching_users = User.where({ :id => the_id })

    the_user = matching_users.at(0)

    input_username = params.fetch("query_username")
    
    the_user.username = input_username
  
    the_user.save

    next_url = "/users/" + the_user.username.to_s
    redirect_to(next_url)
    
  end
end
