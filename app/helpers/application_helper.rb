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

end
