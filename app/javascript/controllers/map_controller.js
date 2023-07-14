import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Object
  };
  static targets = ["map", "container"];

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.containerTarget,
      style: "mapbox://styles/mapbox/streets-v10"
    });

    this.element.addEventListener('shown.bs.modal', (e) => {
      console.log("Hi");
      this.map.resize();
    })

    this.#addMarkersToMap();
    this.#fitMapToMarkers();

  }

  #addMarkersToMap() {
      const popup = new mapboxgl.Popup().setHTML(this.markersValue.info_window_html);
      const markerColor = document.createElement("div");
      markerColor.innerHTML =
        "<i class='fa-sharp fa-solid fa-location-dot fa-2xl' style='color: #76ac71;'></i>";
      new mapboxgl.Marker(markerColor)
        .setLngLat([ this.markersValue.lng, this.markersValue.lat ])
        .setPopup(popup)
        .addTo(this.map);
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.markersValue.lng, this.markersValue.lat ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  /*resizeMap(event) {
    console.log("Hi");
    this.map.resize();
  }*/
}
