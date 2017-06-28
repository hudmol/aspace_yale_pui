module SquashLargeNotes

  def merge_notes_by_type(notes_hash, type, note_struct)
    # we want to drop the split notation from note labels
    # ie. a label prefixed with (1) or (2) or (3)
    note_struct['label'] = note_struct['label'].sub(/^\([0-9]+\)\s*/, '')

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
