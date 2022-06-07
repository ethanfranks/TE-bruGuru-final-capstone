<template>
  <div id="brewery-component">
    <div id="brewery-grid-container">
      <div id="brewery-logo">
        <img src="https://images.squarespace-cdn.com/content/v1/5866ed881b631bf419fd5898/1483383396256-A8YN1EBAY1ZJJJIIISCU/Wood+logo+700x800+%28374x640%29.jpg" alt="">
      </div>

      <div id="brewery-name">
        <h3>{{ brewery.name }}</h3>
      </div>

      <div id="brewery-info">
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
    
  </div>
</template>

<script>
import breweryService from "@/services/BreweryService";

export default {
  data() {
    return {
      brewery: {},
    };
  },
  components: {
    
  },
  created() {
    const thisId = this.$route.params.id;
    return breweryService.getBreweryById(thisId).then((response) => {
      this.brewery = response.data;
    });
  },
};
</script>

<style scoped>
  #brewery-component {
    font-family: "Nunito Sans", sans-serif;
  }

  #brewery-grid-container {
    display: grid;
    grid-template-areas: 
      "img name"
      "details details";
    grid-template-columns: 1fr 2fr;
    /* grid-template-rows: 1fr 4fr; */
    width: 100%;
    height: 100%;
  }

  #brewery-component > p, a {
    font-size: 0.75rem;
    margin: 0.2rem;
  }

  #brewery-component > h5 {
    margin: 0.3rem;
    text-decoration: underline;
  }

  #brewery-name > h3 {
    grid-area: "name";
    margin: 0.3rem;
  }

  #brewery-logo > img {
    max-height: 100%;
    max-width: 30%;
    margin: 0;
    grid-area: "img";
  }

  #brewery-details {
    grid-area: "details";
  }
</style>