class HomeController < ApplicationController

  def index
    @users = User.all
    if params[:search].present?
      last_name = ''
      unless params[:search].split.length < 2
        last_name = params[:search].split.last
      end
      @users = @users.where("first_name =? and last_name =?",params[:search].split.first,last_name)
    end
  end

  def search
    @first_names = User.select("first_name,last_name").where("lower(first_name) like ?","%#{params[:query].downcase}%")
    @last_names = User.select("first_name,last_name").where("lower(last_name) like ?","%#{params[:query].downcase}%")
    render json: { first_name: @first_names.as_json(:methods => [:name]),
           last_name: @last_names.as_json(:methods => [:name]) }
  end

end

