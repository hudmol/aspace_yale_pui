Resource.class_eval do

  def opac_id
    json.dig('user_defined', 'string_2')
  end

end