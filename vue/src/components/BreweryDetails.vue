<template>
  <div id="brewery-component">
    <div id="brewery-grid-container">
      <div id="brewery-logo">
        <img :src="brewery.imageURL" alt="brewery logo" />
      </div>

      <div id="brewery-name">
        <h3>{{ brewery.name }}</h3>
      </div>
    </div>

    <br />

    <div id="brewery-info">
      <h5>Find Us Here</h5>
      <p>{{ brewery.address }}</p>
      <p>{{ brewery.phoneNumber }}</p>
      <p>{{ brewery.email }}</p>
      <a :href="brewery.igLink">Instagram</a>
      <br />
      <a :href="brewery.fbLink">Facebook</a>
      <br />
      <h5>About Us</h5>
      <p>{{ brewery.aboutUs }}</p>
      <h5>Hours of Operation</h5>
      <p>Monday: {{ brewery.mondayHours }}</p>
      <p>Tuesday: {{ brewery.tuesdayHours }}</p>
      <p>Wednesday: {{ brewery.wednesdayHours }}</p>
      <p>Thursday: {{ brewery.thursdayHours }}</p>
      <p>Friday: {{ brewery.fridayHours }}</p>
      <p>Saturday: {{ brewery.saturdayHours }}</p>
      <p>Sunday: {{ brewery.sundayHours }}</p>
    </div>
  </div>
</template>

<script>
import breweryService from "@/services/BreweryService";

export default {
  data() {
    return {
      breweryRouted: {},
    };
  },
  components: {},
  props: ['brewery'],
  created() {
    const thisId = this.$route.params.id;
    return breweryService.getBreweryById(thisId).then((response) => {
      this.breweryRouted = response.data;
    });
  },
};
</script>

<style scoped>
#brewery-component {
  font-family: "Nunito Sans", sans-serif;
  height: 100%;
  width: 100%;
}

#brewery-grid-container {
  display: grid;
  grid-template-areas: "img name";
  grid-template-columns: 1fr 5fr;
  width: 100%;
  height: fit-content;
  text-align: center;
  align-items: center;
}

#brewery-info > p,
a {
  font-size: 0.75rem;
  margin: 0.2rem;
  margin: 0;
}

#brewery-info > a {
  text-decoration: none;
}

#brewery-info > h5 {
  margin-top: 0.3rem;
  margin-bottom: 0.3rem;
  text-decoration: underline;
}

#brewery-name > h3 {
  grid-area: "name";
}

#brewery-logo > img {
  max-height: 100%;
  max-width: 100%;
  margin: 0;
  grid-area: "img";
}

#brewery-details {
  grid-area: "details";
}
</style>
