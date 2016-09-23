###*
@namespace scoping into the hquery namespace
###
this.hQuery ||= {}

# =require core.coffee


###*
@class CauseOfDeath
@exports CauseOfDeath as hQuery.CauseOfDeath
###
class hQuery.CauseOfDeath
  constructor: (@json) ->

  ###*
  @returns {hQuery.Date}
  ###
  timeOfDeath: -> new hQuery.dateFromUtcSeconds @json['timeOfDeath']

  ###*
  @returns {int}
  ###
  ageAtDeath: -> @json['ageAtDeath']

###*
@class hQuery.Condition

This section is used to describe a patients problems/conditions. The types of conditions
described have been constrained to the SNOMED CT Problem Type code set. An unbounded
number of treating providers for the particular condition can be supplied.
@exports Condition as hQuery.Condition
@augments hQuery.CodedEntry
###
class hQuery.Condition extends hQuery.CodedEntry

  constructor: (@json) ->
    super(@json)

  ###*
   @returns {Array, hQuery.Provider} an array of providers for the condition
  ###
  providers: ->
    for  provider in @json['treatingProviders']
      new Provider provider

  ###*
  Diagnosis Priority
  @returns {int}
  ###
  diagnosisPriority: -> @json['priority']

  ###*
  Ordinality
  @returns {CodedValue}
  ###
  ordinality: -> hQuery.createCodedValue @json['ordinality']

  ###*
  age at onset
  @returns {int}
  ###
  ageAtOnset: -> @json['ageAtOnset']


  ###*
  cause of death
  @returns {hQuery.CauseOfDeath}
  ###
  causeOfDeath: -> new hQuery.CauseOfDeath @json['causeOfDeath'] if  @json['causeOfDeath']

  ###*
  problem status
  @returns {hQuery.CodedValue}
  ###
  problemStatus: -> hQuery.createCodedValue  @json['problemStatus']

  ###*
  comment
  @returns {String}
  ###
  comment: -> @json['comment']

  ###*
  This is a description of the level of the severity of the condition.
  @returns {CodedValue}
  ###
  severity: -> hQuery.createCodedValue @json['severity']

  ###*
  @returns {CodedValue}
  ###
  reaction: ->  new hQuery.createCodedValue @json['reaction']

  ###*
  @returns {CodedValue}
  ###
  laterality: -> hQuery.createCodedValue @json['laterality']

  ###*
  @returns {CodedValue}
  ###
  anatomicalLocation: -> hQuery.createCodedValue @json['anatomical_location']
