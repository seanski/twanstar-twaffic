markers = []
infowindow = null
getIncidents = ->
  $.get "/incidents/latest.json", (incidents) ->
    for marker in markers
      marker.setMap null
      $("#incident_list").html("")
    markers.length = 0
    for incident in incidents
      buildMarker incident
      buildSidebar incident
  for marker in markers
    marker.setMap map

buildMarker = (incident) ->
  latlng = new google.maps.LatLng(incident.latitude, incident.longitude)
  opts =
    position: latlng
    map: map
    title: incident.description
  marker = new google.maps.Marker opts
  markers.push marker
  google.maps.event.addListener marker, 'click', =>
    try
      infowindow.close()
    inc =
      description: incident.description
      location: incident.location
      date: incident.reported_at
    opts =
      content: $("#sidebar_item").render(inc)
    infowindow = new google.maps.InfoWindow opts
    infowindow.open(map, marker)


buildSidebar = (incident) ->
  inc =
    description: incident.description
    location: incident.location
    date: incident.reported_at

  $("#incident_list").append($("#sidebar_item").render(inc))

$(document).ready ->
  getIncidents()
  setInterval getIncidents, 60000

