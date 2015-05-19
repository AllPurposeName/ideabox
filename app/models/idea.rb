class Idea < ActiveRecord::Base
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
