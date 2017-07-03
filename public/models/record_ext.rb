Record.class_eval do

  alias_method :parse_extents_pre_aspace_yale_pui, :parse_extents
  def parse_extents
    zero_extents = []
    ASUtils.wrap(json['extents']).each_with_index do |ext, i|
      if  ext['number'] == '0'
        type = I18n.t("enumerations.extent_extent_type.#{ext['extent_type']}", default: ext['extent_type'])
        display = ext['container_summary'] || type # show type if container_summary is blank
        display << I18n.t('extent_phys_details',:deets => ext['physical_details']) unless  ext['physical_details'].blank?
        display << I18n.t('extent_dims', :dimensions => ext['dimensions']) unless  ext['dimensions'].blank?

        zero_extents << {
          'display' => display,
          '_inherited' => ext.dig('_inherited'),
          '_index' => i, # capture the extent's index so we can retain the subrecord order
        }
      end
    end

    result = parse_extents_pre_aspace_yale_pui

    # plug in the custom display string for zero extents
    zero_extents.each do |ext|
      result[ext['_index']] = ext
    end

    result
  end

end


Record.include(SquashLargeNotes)