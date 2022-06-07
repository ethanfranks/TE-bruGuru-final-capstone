<template>
  <div id="map-area">
    <div>
      <h2 id="map-search-header">Find Breweries</h2>
      <GmapAutocomplete @place_changed="setPlace" />
      <button @click="centerMap">Go!</button>
    </div>
    <br />
    <GmapMap
      @tilesloaded="filterMarkers"
      :center="center"
      :zoom="12"
      id="map"
    >
      <GmapInfoWindow
        @
        :options="infoWindowOptions"
        :position="infoWindowPosition"
        :opened="infoWindowOpened"
      >
        <div class="info-window">
          <h2>BreweryName</h2>
          <h5>Hours:</h5>
          <p>Address</p>
        </div>
      </GmapInfoWindow>
      <GmapMarker
        :key="index"
        v-for="(m, index) in markers"
        :position="m.position"
        :clickable="true"
        @click="toggleInfoWindow(m, index)"
      />
    </GmapMap>
  </div>
</template>

<script>
import breweryService from "@/services/BreweryService";

export default {
  name: "GoogleMap",
  data() {
    return {
      map: null,
      center: { lat: 36.545341, lng: -94.489761 },
      currentPlace: null,
      currentMarkers: [],
      markers: [],
      places: [],
      breweries: [],
      infoWindowOptions: {
        content: "",
        maxWidth: 300,
        pixelOffset: { width: 0, height: -35 },
      },
      infoWindowPosition: {
        lat: "34.0676609",
        lng: "-117.662575",
      },
      infoWindowOpened: false,
      activeBrewery: null,
    };
  },
  created() {
    return breweryService.getBreweries().then((response) => {
      this.breweries = response.data;
      this.breweries.map((b) => {
        let marker = {
          position: {
            lat: b.gpsLocation.lat,
            lng: b.gpsLocation.lng,
          },
          infoText:
            `<strong>${b.name}<br></strong>` +
            `${b.address}<br>` +
            `<a href="/brewery/${b.id}" onclick="clickHomeLink(${b})">View home page</a>`,
        };
        this.markers.push(marker);
      });
    });
  },
  mounted() {
    this.geolocate();
    this.$refs.googleMapRef.$mapPromise.then((map) => {
      this.map = map;
    });
  },
  methods: {
    setPlace(place) {
      this.currentPlace = place;
    },
    addMarker() {
      if (this.currentPlace) {
        const marker = {
          lat: this.currentPlace.geometry.location.lat(),
          lng: this.currentPlace.geometry.location.lng(),
        };
        this.markers.push({ position: marker });
        this.places.push(this.currentPlace);
        this.center = marker;
        this.currentPlace = null;
      }
    },
    filterMarkers() {
      this.currentMarkers = this.markers.filter(marker =>
        marker.getVisible() && this.map.getBounds().contains(marker.getPosition())
      );
    },
    toggleInfoWindow: function (marker, idx) {
      this.infoWindowPosition = marker.position;
      this.infoWindowOptions.content = marker.infoText;
      if (this.activeBrewery === idx) {
        this.infoWindowOpened = !this.infoWindowOpened;
      } else {
        this.infoWindowOpened = true;
        this.activeBrewery = idx;
      }
    },
    centerMap() {
      this.center = {
        lat: this.currentPlace.geometry.location.lat(),
        lng: this.currentPlace.geometry.location.lng(),
      };
    },
    clickHomeLink(brewery) {
      this.$router.push({
        name: "brewery-details",
        params: { id: brewery.id },
      });
    },

    geolocate: function () {
      navigator.geolocation.getCurrentPosition((position) => {
        this.center = {
          lat: position.coords.latitude,
          lng: position.coords.longitude,
        };
      });
    },
  },
};
</script>

<style>
#map-area {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 70%;
  height: 100%;
}

#map {
  width: 100%;
  height: 70%;
}

#map-search-header {
  margin: 0;
}

</style>