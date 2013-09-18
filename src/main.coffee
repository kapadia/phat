
buffer = 8338.5
height = 25948
DOMReady = ->
  
  mapOptions =
    minZoom: 2
    maxZoom: 9
    touchZoom: true
  
  tileOptions =
    noWrap: true
    attribution: "Hubble Space Telescope PHAT"
  
  map = L.map('map', mapOptions).setView([0, 0], 3)
  # layer = L.tileLayer("http://www.andromedaproject.org.s3.amazonaws.com/phat-tiles/{tilename}.jpg", tileOptions)
  console.log "HERE"
  layer = L.tileLayer('tiles/PHATp25-v1_F475W-tiles/{tilename}.jpg', {noWrap: true, attribution: "Hubble Space Telescope PHAT"})
  
  layer.getTileUrl = (tilePoint) ->
    zoom = @_getZoomForUrl()
    convertTileUrl = (x, y, s, zoom) ->
      pixels = Math.pow(2, zoom)
      d = (x + pixels) % (pixels)
      e = (y + pixels) % (pixels)
      f = "t"
      g = 0
      while g < zoom
        pixels = pixels / 2
        if e < pixels
          if d < pixels
            f += "q"
          else
            f += "r"
            d -= pixels
        else
          if d < pixels
            f += "t"
            e -= pixels
          else
            f += "s"
            d -= pixels
            e -= pixels
        g++
      x: x
      y: y
      src: f
      s: s
    url = convertTileUrl(tilePoint.x, tilePoint.y, 1, zoom)
    
    return "tiles/PHAT-color-tiles/#{url.src}.jpg"
  layer.addTo(map)
  
  height = 9271
  width = 25948
  buffer = height + (width - height)
  
  x = 7773
  y = 14266
  
  # point = map.unproject([x + 0.5 * buffer, y + 1000], 7)
  # marker = L.marker(point).addTo(map)
  
  #
  # Plot corners of image to determine correct transformation
  #
  # point = map.unproject([0, 0], 10)
  # marker = L.marker(point).addTo(map)
  # 
  # point = map.unproject([0, 0.5 * buffer], 7)
  # marker = L.marker(point).addTo(map)
  
  # point = map.unproject([width + 0.5 * buffer, height + 8000], 7)
  # marker = L.marker(point).addTo(map)
  
  # for i in [0..8]
  #   point = map.unproject([width + 0.5 * buffer, height + i * 1000], 7)
  #   marker = L.marker(point).addTo(map)


window.addEventListener('DOMContentLoaded', DOMReady, false)