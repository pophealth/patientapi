###*
@namespace scoping into the hquery namespace
###
this.hQuery ||= {}


# =require core.coffee
###*
@class
@augments hQuery.CodedEntry
@exports Language as hQuery.Language
###
class hQuery.Language extends hQuery.CodedEntry
  constructor: (@json) ->
    super(@json)

  ###*
  @returns {hQuery.CodedValue}
  ###
  modeCode: -> hQuery.createCodedValue @json['modeCode']

  ###*
  @returns {String}
  ###
  preferenceIndicator: -> @json['preferenceIndicator']
