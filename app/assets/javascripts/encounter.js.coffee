###*
@namespace scoping into the hquery namespace
###
this.hQuery ||= {}


# =require core.coffee

###*
An Encounter is an interaction, regardless of the setting, between a patient and a
practitioner who is vested with primary responsibility for diagnosing, evaluating,
or treating the patients condition. It may include visits, appointments, as well
as non face-to-face interactions. It is also a contact between a patient and a
practitioner who has primary responsibility for assessing and treating the
patient at a given contact, exercising independent judgment.
@class An Encounter is an interaction, regardless of the setting, between a patient and a
practitioner
@augments hQuery.CodedEntry
@exports Encounter as hQuery.Encounter
###
class hQuery.Encounter extends hQuery.CodedEntry
  constructor: (@json) ->
    super(@json)
    @_admitTime = hQuery.dateFromUtcSeconds @json['admitTime'] if @json['admitTime']
    @_dischargeTime = hQuery.dateFromUtcSeconds @json['dischargeTime'] if @json['dischargeTime']
    @_facility = new hQuery.Facility @json['facility'] if @json['facility']

  ###*
  @returns {String}
  ####
  dischargeDisposition: -> @json['dischargeDisposition']

  ###*
  A code indicating the priority of the admission (e.g., Emergency, Urgent, Elective, et cetera) from
  National Uniform Billing Committee (NUBC)
  @returns {CodedValue}
  ###
  admitType: -> hQuery.createCodedValue @json['admitType']

  ###*
  Date and time at which the patient was admitted for the encounter
  @returns {Date}
  ###
  admitTime: -> @_admitTime

  ###*
  Date and time at which the patient was discharged for the encounter
  @returns {Date}
  ###
  dischargeTime: -> @_dischargeTime

  ###*
  @returns {hQuery.Actor}
  ###
  performer: -> new hQuery.Actor @json['performer'] if @json['performer']

  ###*
  @returns {hQuery.Organization}
  ###
  facility: -> @_facility
  facilityArrival: -> @_facility?.startDate()
  facilityDeparture: -> @_facility?.endDate()

  ###*
  @returns {hQuery.CodedEntry}
  ###
  reasonForVisit: -> new hQuery.CodedEntry @json['reason'] if @json['reason']

  ###*
  @returns {Integer}
  ###
  lengthOfStay: ->
    return 0 unless @startDate()? && @endDate()?
    Math.floor((@endDate() - @startDate()) / (1000 * 60 * 60 * 24))

  ###*
  @returns {CodedValue}
  ###
  method: ->  new hQuery.createCodedValue @json['method']

  ###*
  @returns {CodedValue}
  ###
  reaction: ->  new hQuery.createCodedValue @json['reaction']
  ###*
  @returns {CodedValue}
  ###
  transferTo: -> hQuery.createCodedValue @json['transferTo']

  ###*
  @returns {CodedValue}
  ###
  transferFrom: -> hQuery.createCodedValue @json['transferFrom']

  ###*
  @returns {CodedValue|CodedValue[]}
  ###
  diagnosis: ->
    if @json['diagnosis']?['codes']
      # Support for diagnosis with multiple codes
      hQuery.createCodedValues @json['diagnosis']['codes']
    else
      hQuery.createCodedValue @json['diagnosis']

  ###*
  @returns {CodedValue|CodedValue[]}
  ###
  principalDiagnosis: ->
    if @json['principalDiagnosis']?['codes']
      # Support for principal diagnosis with multiple codes
      hQuery.createCodedValues @json['principalDiagnosis']['codes']
    else
      hQuery.createCodedValue @json['principalDiagnosis']
