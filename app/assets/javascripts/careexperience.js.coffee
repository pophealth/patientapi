###*
@namespace scoping into the hquery namespace
###
this.hQuery ||= {}


# =require core.coffee
###*
This represents all care experience.
@class
@augments hQuery.CodedEntry
@exports CareExperience as hQuery.CareExperience
###
class hQuery.CareExperience extends hQuery.CodedEntry
  constructor: (@json) ->
    super(@json)
  

  ###*
  Value returns the value of the result. This will return an object. The properties of this
  object are dependent on the type of result.
  ###
  value: -> @json['value']
