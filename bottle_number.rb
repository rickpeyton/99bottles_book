class BottleNumber
  
  def self.for(number)
    case number
    when 6
      BottleNumber6
    when 1
      BottleNumber1
    when 0
      BottleNumber0
    else
      BottleNumber
    end.new(number)
  end
  
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def container
    "bottles"
  end

  def pronoun
    "one"
  end

  def quantity
    number.to_s
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def successor
    BottleNumber.for(number - 1)
  end
end