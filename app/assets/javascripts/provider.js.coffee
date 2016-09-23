###*
@namespace scoping into the hquery namespace
###
this.hQuery ||= {}


# =require core.coffee
###*
@class

@exports Provider as hQuery.Provider
###
class hQuery.Provider
  constructor: (@json) ->

  ###*
  @returns {hQuery.Person}
  ###
  providerEntity: -> new hQuery.Person @json['providerEntity'] if @json['providerEntity']

  ###*
  @returns {hQuery.DateRange}
  ###
  careProvisionDateRange: -> new hQuery.DateRange @json['careProvisionDateRange'] if @json['careProvisionDateRange']

  ###*
  @returns {hQuery.CodedValue}
  ###
  role: -> hQuery.createCodedValue @json['role']

  ###*
  @returns {String}
  ###
  patientID: -> @json['patientID']


  ###*
  @returns {hQuery.CodedValue}
  ###
  providerType: -> hQuery.createCodedValue @json['providerType']


  ###*
  @returns {String}
  ###
  providerID: -> @json['providerID']

  ###*
  @returns {hQuery.Organization}
  ###
  organizationName: -> new hQuery.Organization @json
