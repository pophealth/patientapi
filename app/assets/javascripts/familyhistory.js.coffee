###*
@namespace scoping into the hquery namespace
###
this.hQuery ||= {}


# =require core.coffee
###*
This represents all  family history.
@class
@augments hQuery.CodedEntry
@exports FamilyHistory as hQuery.FamilyHistory
###
class hQuery.FamilyHistory extends hQuery.CodedEntry
  constructor: (@json) ->
    super(@json)

  ###*
  @returns {CodedValue}
  ###
  relationshipToPatient: -> hQuery.createCodedValue @json['relationshipToPatient']

  ###*
  @returns {CodedValue}
  ###
  onsetAge: -> new hQuery.Scalar @json['onsetAge']
