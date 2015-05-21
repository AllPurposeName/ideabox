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

  def modifiers
    if status == "Swill" || status == "Cordial"
    [Modifier.new(status, 0), Modifier.new(status, 1)]
    else
    [Modifier.new(status, 0), Modifier.new(status, 1), Modifier.new(status, 2)]
    end
  end

  def limited_body
    body.truncate(100)
  end
end
