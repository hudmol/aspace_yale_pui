#Record.include(FilterZeroExtents)
Record.class_eval do

  alias_method :parse_extents_pre_aspace_yale_pui, :parse_extents
  def parse_extents
    json['extents'] = ASUtils.wrap(json['extents']).select {|ext|
      ext['number'] != '0'
    }

    parse_extents_pre_aspace_yale_pui
  end

end


Record.include(SquashLargeNotes)