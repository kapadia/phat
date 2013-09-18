# Run script to get versioned dependencies

mkdir -vp lib
mkdir -vp lib/images

curl -k "http://cdn.leafletjs.com/leaflet-0.6.4/leaflet.js" -o "lib/leaflet.js"
curl -k "http://cdn.leafletjs.com/leaflet-0.6.4/leaflet.css" -o "lib/leaflet.css"
curl -k "https://raw.github.com/mbostock/d3/v3.3.3/d3.js" -o "lib/d3.js"
curl -k "https://raw.github.com/Leaflet/Leaflet/master/dist/images/marker-shadow.png" -o "lib/images/marker-shadow.png"
curl -k "https://raw.github.com/Leaflet/Leaflet/master/dist/images/marker-icon.png" -o "lib/images/marker-icon.png"
curl -k "https://raw.github.com/Leaflet/Leaflet/master/dist/images/layers.png" -o "lib/images/layers.png"
curl -k "https://raw.github.com/Leaflet/Leaflet/master/dist/images/layers-2x.png" -o "lib/images/layers-2x.png"
curl -k "https://raw.github.com/Leaflet/Leaflet/master/dist/images/marker-icon-2x.png" -o "lib/images/marker-icon-2x.png"