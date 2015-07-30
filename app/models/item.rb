class Item < ActiveRecord::Base
  belongs_to :category
  has_many :reviews

    # It returns the articles whose titles contain one or more words that form the query
  def self.search1(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%") 
  end
   def self.search2(query)
    # where(:title, query) -> This would return an exact match of the query
    where("description like ?", "%#{query}%") 
  end
end
