<template>
  <div id='map-area'>
    <div>
    <h2>Find Breweries</h2>
    <GmapAutocomplete
        @place_changed='setPlace'
    />
    <button @click='addMarker'>
        Add
      </button>
    </div>
    <br>
    <GmapMap @
      :center='center'
      :zoom='12'
      style='width:40%;  height: 400px;'
      id="map"
    >
    <GmapInfoWindow 
    :options="infoWindowOptions"
    :position="infoWindowPosition"
    :opened="infoWindowOpened"
    @click="activeBrewery = m"
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
        @click="center=m.position"
      />
    </GmapMap>
    
  </div>
</template>

<script>
import breweryService from '@/services/BreweryService'

export default {
    name: 'GoogleMap',
    data() {
        return {
            center: { lat: 36.545341, lng: -94.489761 },
            currentPlace: null,
            markers: [],
            places: [],
            breweries: [],
            infoWindowOptions : {

            },
            infoWindowPosition: {
              lat:"",
              lng:"",

            },
            infoWindowOpened: false,
            activeBrewery : {}
    }
  },
  created() {
    return breweryService.getBreweries().then(
      (response) => {
        this.breweries = response.data
        this.addListMarkers()
      });
  },
  mounted() {
    this.geolocate();
    
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
    addListMarkers() {
      this.breweries.forEach((b) => {
        const marker = {
          lat: b.gpsLocation.lat,
          lng: b.gpsLocation.lng
        }

        this.markers.push({ position: marker })
      })
    },
    // getCoordinates() {
    //   this.breweries.forEach((b) => {
    //     breweryService.getBreweryCoords(b.address).then(
    //       (response) => {
    //           const latitude = response.results.geometry.location.lat;
    //           const longitude = response.results.geometry.location.lng;
    //           console.log({latitude, longitude})
    //       }
    //     )
    //   })
    // },
    geolocate: function() {
      navigator.geolocation.getCurrentPosition(position => {
        this.center = {
          lat: position.coords.latitude,
          lng: position.coords.longitude,
        };
      });
    }
  },
}
</script>

<style>

#map {
  display: flex;
  justify-content: center;
}

</style>