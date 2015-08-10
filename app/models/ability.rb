class Ability
  include CanCan::Ability

  def initialize(user)
  	user ||= User.new # guest user (not logged in)
  	if user.admin?
  		can :show, :all
  		# puts "++++++++++++++++++"
       can :update, Interviewer do |x|
        puts "anaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        puts x.user_id
        puts user.id
        x.user_id == user.id
      end
  	else
  		# can :update, User
  		puts "$$$$$$$$$$$$$$$"
  		can :show, Interviewee do |x|
  			# puts "hereeeeeeeeeeeeeeeeeeee"
  			# puts "user : #{ x.user_id}"
  			x.user_id == user.id
  		end

      can :show, Interview do |x|
        # puts "anaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        # puts x.interviewee.user_id
        # puts user.id
        x.interviewee.user_id == user.id
      end

      

  		# can :create, Question
  	end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
