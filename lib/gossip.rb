require 'pry'
require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []

    CSV.read("db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end

    return all_gossips
  end

  def self.find(id)
    self.all[id.to_i]
  end

  def self.update(author, content)
    print 'Author'
    puts author
    print 'Content'
    puts content
    all_gossips = self.all
    p all_gossips
    match = all_gossips.index(all_gossips.find{|x| x.author == author})
    
    match = match.to_i
    puts match
    all_gossips[match].content = content

    p all_gossips

    CSV.open("db/gossip.csv", "wb") do |csv|
      all_gossips.each do |x|
        csv << [x.author, x.content]
      end
    end

  end

end
