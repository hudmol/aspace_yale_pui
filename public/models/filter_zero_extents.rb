# module FilterZeroExtents
# 
#   def parse_extents
#     json['extents'] = ASUtils.wrap(json['extents']).select {|ext|
#       ext['number'] != '0'
#     }
# 
#     super
#   end
# 
# end