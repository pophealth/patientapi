###*
@namespace scoping into the hquery namespace
###
this.hQuery ||= {}


# =require core.coffee
###*
This represents all interventional, surgical, diagnostic, or therapeutic procedures or
treatments pertinent to the patient.
@class
@augments hQuery.CodedEntry
@exports Procedure as hQuery.Procedure
###
class hQuery.Procedure extends hQuery.CodedEntry
  constructor: (@json) ->
    super(@json)
    @_facility = new hQuery.Facility @json['facility'] if @json['facility']


  facility: -> @_facility
  facilityArrival: -> @_facility?.startDate()
  facilityDeparture: -> @_facility?.endDate()
  ###*
  @returns {hQuery.Actor} The provider that performed the procedure
  ###
  performer: -> new hQuery.Actor @json['performer'] if @json['performer']

  ###*
  @returns {hQuery.CodedValue} A SNOMED code indicating the body site on which the
  procedure was performed
  ###
  site: -> new hQuery.CodedValue @json['site']?['code'], @json['site']?['code_system']

  ###*
  @returns {hQuery.CodedValue} A SNOMED code indicating where the procedure was performed.
  ###
  source: ->
    hQuery.createCodedValue @json['source']

  ###*
  @returns {Date} The actual or intended start of an incision.
  ###
  incisionTime: -> hQuery.dateFromUtcSeconds @json['incisionTime'] if @json['incisionTime']

  ###*
  Ordinality
  @returns {CodedValue}
  ###
  ordinality: -> hQuery.createCodedValue @json['ordinality']

  ###*
  @returns {hQuery.CodedValue} A code indicating the approach body site on which the
  procedure was performed
  ###
  anatomicalApproach: -> new hQuery.CodedValue @json['anatomicalApproach']?['code'], @json['anatomicalApproach']?['code_system']

  ###*
  @returns {hQuery.CodedValue} A  code indicating the body site on which the
  procedure was performed
  ###
  anatomicalLocation: ->
    #backwards compatibility with older patient records.  site was used for anatomicalLocation
    at = @json['anatomicalLocation']
    if at? then new hQuery.CodedValue(at['code'], at['code_system']) else @site()

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
  radiationDose: ->  new hQuery.createCodedValue @json['radiationDose']

  ###*
  @returns {CodedValue}
  ###
  radiationDuration: ->  new hQuery.createCodedValue @json['radiationDuration']

  ###*
  The resulting status of a procedure as defined in the QDM documentation. This is different
  than the status_code associated with the `CodedEntry` object, which relates to the data criteria
  status as defined in health-data-standards/lib/hqmf-model/data_criteria.json.
  @returns {CodedValue}
  ###
  qdmStatus: ->  new hQuery.createCodedValue @json['qdm_status']
