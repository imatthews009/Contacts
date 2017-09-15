class Contact < ApplicationRecord
    belongs_to :user
    def friendly_update_time
        updated_at.strftime("%A, %d %b %Y %l:%M %p")
    end
    def full_name
        return "#{first_name} #{last_name}"
    end

    def japan_number
        return "+81 #{phone_number}"
    end

    def self.find_all_johns
        Contact.where(first_name: "John")
    end
    



end
