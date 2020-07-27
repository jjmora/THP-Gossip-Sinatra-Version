require 'pry'
require 'csv'
require 'comment'

class Gossip
  attr_accessor :author, :content, :comments

  def initialize(author, content, comments = "")
    @author = author
    @content = content
    @comments = []
  end

  def save
    CSV.open("db/gossip.csv", "ab") do |csv|
      csv << [@author, @content,@comments]
    end
  end

  def self.all
    all_gossips = []

    CSV.read("db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1], csv_line[2])
    end

    return all_gossips
  end

  def self.find(id)
    self.all[id.to_i]
  end

  def self.update(id, author, content, comments)
    all_gossips = self.all
    id = id.to_i
    all_gossips[id].content = content

    CSV.open("db/gossip.csv", "wb") do |csv|
      all_gossips.each do |x|
        csv << [x.author, x.content, x.comments]
      end
    end
  end

end