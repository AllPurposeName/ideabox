class Idea < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true, length: { minimum: 4, maximum: 65  }
  validates :body, presence: true, length: { minimum: 4 }

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
