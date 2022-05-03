class Dev < ActiveRecord::Base
    has_many :freebies 
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.any? do |freebie| 
            freebie.item_name == item_name
        end
    end

    def give_away(dev, freebie)
        give_freebie = Freebie.find_by(:item_name => freebie)
        gift_dev = Dev.find_by(:name => dev)

        give_freebie.update(:dev => gift_dev) unless give_freebie.dev != self
    end
end
