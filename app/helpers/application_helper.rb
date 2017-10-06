module ApplicationHelper

	def current_user_followers(user_id)
    
    
    count = 0
    User.all.each do |followers|
      if followers.following.include?(user_id)
        count += 1
      end
    end 

    return count
   end 


   def tweet_count(user_id)

   	tweets = []
   	tweets = Tweet.where(user_id: user_id)

   	return tweets.length

   end	

   def top_tweeter
    user_id =  Tweet.all.group_by { |h| h['user_id']}.to_a.max_by {|x| x[1].length}.first 
    user = User.find(user_id)
    return user
   end

end
