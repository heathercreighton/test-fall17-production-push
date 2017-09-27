class Tweet < ApplicationRecord

	belongs_to :user
	has_many :tweet_tags
	has_many :tags, through: :tweet_tags

	before_validation :link_check, on: :create
	validates :message, presence: true, length: {maximum: 140, too_long: "A tweet is only 140 max. Everybody knows that!"}, on: :create
	after_validation :apply_link, on: :create


	private

 	def link_check
      check = false
      if self.message.include? "http://" 
         check = true
      elsif self.message.include? "https://"
         check = true
      elsif self.message.include? "www"
      	check = true
      else
           check = false
      end	
    
      

   #    if check == true
   #  	arr = self.message.split
			# index = arr.map{ |x| x.include? "http"}.index(true)
   #    self.link = arr[index]
   #    if arr[index].length > 23
   #  	    arr[index] = "#{arr[index][0..20]}..."	
   #    end
    				
   #      self.message = arr.join(" ")
   #    end
  
   	link_index = 0
    if check == true
    	arr = self.message.split

    	arr.each_with_index do |a, index|

    	if a.include? "http" 
				link_index = index
				 self.link = arr[index]
			elsif a.include?"www"
    		link_index = index
				self.link = "https://#{arr[index]}"
      end
     end 

	    if arr[link_index].length > 23
	    	arr[link_index] = "#{arr[link_index][0..20]}..."	
	    end
    				
     self.message = arr.join(" ")
    end

  end	

  






  def apply_link
  	

	#   arr = self.message.split
	#   index = arr.map { |x| x.include? "http" }.index(true)
	 
	#  	if index
	# 		url = arr[index] #equals shortened url
	# 		arr[index]= "<a href='#{self.link}' target='_blank'>#{url}</a>"

	# 	end

	# self.message = arr.join(" ")

	# end

 arr = self.message.split
	  arr.each_with_index do |a, index|
	 
		 	if a.include? 'http' or a.include? "www"
				url = arr[index] #equals shortened url
				arr[index]= "<a href='#{self.link}' target='_blank'>#{url}</a>"
			end	
		
		end

		self.message = arr.join(" ")

	end

end
