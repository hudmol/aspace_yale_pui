ArchivalObject.class_eval do

  private

  def parse_identifier
    if json.dig('_composite_identifier')
      return json.dig('_composite_identifier').gsub(/Series [0-9]+/) {|s|
        "Series #{romanize(s[/[0-9]+/].to_i)}"
      }
    end

    if @level == 'series' && json.dig('component_id') && json.dig('component_id') =~ /^[0-9]+$/
      romanize(json.dig('component_id').to_i)
    else
      super
    end
  end


  ROMAN_NUMBERS = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I",
    0 => "",
  }


  def romanize(number)
    return '' if number == 0

    ROMAN_NUMBERS.each do |value, letter|
      return ( letter * (number / value)) << romanize(number % value) if value <= number
    end

    return romanize(number % value)
  end

end