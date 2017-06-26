module SquashLargeNotes

  def merge_notes_by_type(notes_hash, type, note_struct)
    # we want to handle notes that begin with (1)
    if note_struct['label'] =~ /^\([0-9]+\)/
      # drop the prefix
      note_struct['label'] = note_struct['label'].sub(/^\([0-9]+\)\s*/, '')
    end

    # now all labels that match for this note type will be merged sans label
    super

    # finally remove duplicate labels from sub notes
    if notes_hash[type] && notes_hash[type]['subnotes']
      ASUtils.wrap(notes_hash[type]['subnotes']).each do |sub|
        if notes_hash[type]['label'] == sub['_inline_label']
          sub.delete('_inline_label')
        end
      end
    end
  end

end
