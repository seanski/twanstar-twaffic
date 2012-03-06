markers = []
getIncidents = ->
  $.get "/incidents/latest.json", (incidents) ->
    for marker in markers
      marker.setMap null
      $("#incident_list").html("")
    markers.length = 0
    for incident in incidents
      buildMarker incident
      $("#incident_list").append("""
        <h2>#{incident.description}</h2>
        <p>#{incident.reported_at}<</p>

                  """)
  for marker in markers
    marker.setMap map

buildMarker = (incident) ->
  latlng = new google.maps.LatLng(incident.latitude, incident.longitude)
  opts =
    position: latlng
    map: map
    title: incident.description

  markers.push new google.maps.Marker opts

$(document).ready ->
  getIncidents()
  setInterval getIncidents, 60000

