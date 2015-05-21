class Modifier
  attr_reader  :status, :div, :link

  def initialize(status, num)
    @status = status
    @link = links[num]
    @div = divs[num]
  end


  def divs
    case status
    when "Swill"
      { 0 => "glyphicon glyphicon-thumbs-up col-md-offset-4 col-md-4",
        1 => "glyphicon glyphicon-remove-circle col-md-4 itemId" }
    when "Hooch"
      { 0 => "glyphicon glyphicon-thumbs-down col-md-4",
        2 => "glyphicon glyphicon-thumbs-up col-md-4",
        1 => "glyphicon glyphicon-remove-circle col-md-4 itemId" }
    else
      { 0 => "glyphicon glyphicon-thumbs-down col-md-offset-4 col-md-4",
        1 => "glyphicon glyphicon-remove-circle col-md-4 itemId" }
    end
  end

  def links
    case status
    when "Swill"
      { 0 => "down", 1 => "remove" }
    when "Hooch"
      { 0 => "down", 1 => "up", 2 => "remove" }
    else
      { 0 => "up", 1 => "remove" }
    end
  end
end
