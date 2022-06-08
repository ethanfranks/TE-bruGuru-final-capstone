<template>
  <div id="brewery-component">
    <div id="brewery-flex-container">
        <h3>{{ brewery.name }}</h3>
        <div id="brewery-logo-container">
          <img v-if="onerror" src="https://blog.spoongraphics.co.uk/wp-content/uploads/2017/craft-brewery-logos/24.jpg" alt="brewery logo">
        </div>
    </div>
    
    <div id="brewery-info">
      <h5>Find Us Here</h5>
      <p>{{ brewery.address }}</p>
      <p>{{ brewery.phoneNumber }}</p>
      <p>{{ brewery.email }}</p>
      <a :href="brewery.igLink">Instagram</a>
      <br>
      <a :href="brewery.fbLink">Facebook</a>
      <br>
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
      breweryRoute: {},
    };
  },
  props: ['brewery'],
  components: {
    
  },
  created() {
    const thisId = this.$route.params.id;
    return breweryService.getBreweryById(thisId).then((response) => {
      this.breweryRoute = response.data;
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

  #brewery-flex-container {
    display: flex;
    flex-direction: column;
    width: 100%;
    max-height: 25%;
    align-items: center;
    justify-content: center;
    
  }

  #brewery-info > p, a {
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

  #brewery-logo-container {
    height: 100%;
    width: 100%;
  }

  #brewery-logo > img {
    max-height: fit-content;
    max-width: fit-content;
    margin: 0;
    grid-area: "img";
  }

  #brewery-details {
    grid-area: "details";
  }
</style>