module SquashLargeNotes

  def merge_notes_by_type(notes_hash, type, note_struct)
    # we want to handle notes that begin with (1)
    if note_struct['label'] =~ /^\([0-9]+\)/
      # drop the prefix
      note_struct['label'] = note_struct['label'].sub(/^\([0-9]+\)\s*/, '')
    end

    # now all labels that match for this note type will be merged sans label
    super
  end

end

# def merge_notes_by_type(notes_hash, type, note_struct)
#   # If we haven't seen a note of this type yet, just take the first one
#   if !notes_hash.has_key? type
#     notes_hash[type] = note_struct
#     return
#   end
# 
#   # Otherwise, do a merge
#   if notes_hash[type]['label'].blank?
#     # Our first label
#     notes_hash[type]['label'] = note_struct['label']
#   elsif notes_hash[type]['label'] != note_struct['label']
#     # Add a secondary label as an inline label
#     note_struct['note_text']= "<span class='inline-label'>#{note_struct['label']}</span> #{note_struct['note_text']}"
#   end
# 
#   notes_hash[type]['note_text'] = "#{notes_hash[type]['note_text']}<br/><br/> #{note_struct['note_text']}"
# 
#   if note_struct.has_key?('subnotes')
#     notes_hash[type]['subnotes'] ||= []
#     notes_hash[type]['subnotes'] = notes_hash[type]['subnotes'] + note_struct['subnotes'].map{|sub|
#       sub['_inline_label'] = note_struct['label']
#       sub
#     }
#   end
# end