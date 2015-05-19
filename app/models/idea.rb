class Idea < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  enum status: %w(Swill Hooch Cordial)
  def quality
    if status == "Swill"
      "Scallywag's Swill!"
    elsif status == "Hooch"
      "Powder Monkey's Hooch"
    else
      "Old Salt's Cordial!"
    end
  end
end
