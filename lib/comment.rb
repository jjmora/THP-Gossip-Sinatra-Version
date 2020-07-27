require 'gossip'

class Comment
  attr_accessor :comment_content, :gossip_id

  def initialize(comment_content, gossip_id)
    @comment_content = comment_content
    @gossip_id = gossip_id
  end

  # def save
  #   all_data = Gossip.all
  #   # p all_data
  #   # puts "Comment content"
  #   # puts @comment_content
  #   # puts "id gossip"
  #   # puts @gossip_id
  # end


  def update(id, comment)
    all_gossips = Gossip.all
    id = id.to_i
    puts "id comment"
    puts all_gossips[id].comments 
    all_gossips[id].comments << comment
    puts id
    puts "comment"
    puts comment
    CSV.open("db/gossip.csv", "wb") do |csv|
      all_gossips.each do |x|
        csv << [x.author, x.content, x.comments]
      end
    end
  end
  
end