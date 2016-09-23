###*
@namespace scoping into the hquery namespace
###
this.hQuery ||= {}


# =require core.coffee
###*
This represents all care experience.
@class
@augments hQuery.CodedEntry
@exports Assessment as hQuery.Assessment
###
class hQuery.Assessment extends hQuery.CodedEntry
  constructor: (@json) ->
    super(@json)

  ###*
  @returns {CodedValue}
  ###
  method: -> hQuery.createCodedValue @json['method']
