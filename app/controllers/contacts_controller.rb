class ContactsController < ApplicationController
    def index
        if current_user
            @contacts = current_user.contacts
            render "index.html.erb"
        else
            flash[:error] = "Must be logged in"
            redirect_to "/login"
        end

    end
    def new 
        render "new.html.erb"
    end

    def create
        address = params[:address]
        coordinates = Geocoder.coordinates(address)
        @contact = Contact.new({first_name: params[:first_name], middle_name: params[:middle_name],last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], bio: params[:bio], latitude: coordinates[0], longitude: coordinates[1], user_id: current_user.id})
        @contact.save
        render "create.html.erb"
    end

    def show
        @contact = Contact.find_by(id: params[:id])
        render "show.html.erb"
    end

    def edit
        @contact = Contact.find_by(id: params[:id])
        render "edit.html.erb"
    end

    def update
        contact = Contact.find_by(id: params[:id])
        contact.update({first_name: params[:first_name], middle_name: params[:middle_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], bio: params[:bio], latitude: params[Geocoder.coordinates(:address)]})
        contact.save
        flash[:succes] = "Contact Updated"
        redirect_to "/contacts/#{contact.id}"
        
    end
    def destroy
        @contact = Contact.find_by(id: params[:id])
        @contact.destroy
        render "destory.html.erb"
    end

end
