class Role < ActiveRecord::Base
    has_many :auditions
    def actors
        self.auditions.map{|audition| audition.actor}
        # or self.audition.pluck(:actor)
        # both ways work
    end

    def location
        self.auditions.pluck(:location)
    end
        
    def lead
        hired = self.auditions.find_by(hired: true) || "no actor has been hired for this role"           
    
    end

    def understudy
        self.auditions.where(hired: true).second|| "no actor has been hired for understudy"
    end
end