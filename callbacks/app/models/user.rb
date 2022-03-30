class User < ApplicationRecord
    before_create :greeting_message
    after_create :check_name
    after_update :check_name
    after_save :saved

    def greeting_message
        puts "Hey! it runs before you create an object!"
    end

    def check_name
        if self.name.present?
            puts "=====Welcome #{self.name}====="
        else
            puts "=====Name not provided====="
        end
    end

    def saved
        puts "=====record saved====="
        puts "=======total records:#{User.count}}======="
    end

    after_initialize do |user|
        puts "You have initialized an object!"
    end
end
