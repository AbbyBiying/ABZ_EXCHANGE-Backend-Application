class RichMarkerBuilder extends Gmaps.Google.Builders.Marker

  create_infowindow: ->
    return null unless _.isString @args.infowindow

    boxText = document.createElement("div")
    boxText.setAttribute("class", 'yellow')
    boxText.innerHTML = @args.infowindow
    @infowindow = new InfoBox(@infobox(boxText))

    @bind_infowindow()

  infobox: (boxText)->
    content: boxText
    pixelOffset: new google.maps.Size(-140, 0)
    boxStyle:
      width: "280px"

@buildMap = (markers) ->
  handler = Gmaps.build 'Google', { builders: { Marker: RichMarkerBuilder} }

  handler.buildMap { provider: { maxZoom: 30}, internal: {id: 'map'} }, ->
    handler.map.centerOn({ lat: 40, lng: -75 })
    markers = handler.addMarkers (markers)
    handler.bounds.extendWith(markers)
    handler.fitMapToBounds()
