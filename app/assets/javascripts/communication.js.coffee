###*
@namespace scoping into the hquery namespace
###
this.hQuery ||= {}


# =require core.coffee
###*
This represents all  communications.
@class
@augments hQuery.CodedEntry
@exports Communication as hQuery.Communication
###
class hQuery.Communication extends hQuery.CodedEntry
  constructor: (@json) ->
    super(@json)

  ###*
  @returns {CodedValue}
  ###
  direction: ->  new hQuery.createCodedValue @json['direction']

