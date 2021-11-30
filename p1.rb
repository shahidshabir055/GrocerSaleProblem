class States
    @@no_of_states =0
    def initialize(name)
        @state = name
        @@no_of_states+=1
    end
    def display()
        puts "state name #@state_name"
    end
    def total_no_of_states()
        puts "total numbet of states #@@no_of_states"
    end
    def iseligible(age)
        if(age>=18)
            puts "You are eligible"
        else
            puts "Not eligible"
        end
    end

end
#create objects
first = States.new("Assam")
second =States.new("kashmir")
third = States.new("kash")
#call methods
puts "Enter age"
a=gets.chomp.to_i
first.iseligible(a)
first.total_no_of_states()
