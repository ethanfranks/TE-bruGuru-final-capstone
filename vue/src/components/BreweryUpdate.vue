<template>

  <div>
    {{brewery}}
<form v-on:submit.prevent="submitForm" class="breweryForm">
    <div class="status-message error" v-show="errorMsg !== ''"></div>
    <div class="form-group">
             <label for="Name">Name:</label>
      <input id="name" type="text" class="form-control" v-model="brewery.name" autocomplete="off" />
           <label for="number">Phone Number:</label>
      <input id="number" type="tel" class="form-control" v-model="brewery.phone" autocomplete="off" />
           <label for="email">Email:</label>
      <input id="email" type="email" class="form-control" v-model="brewery.email" autocomplete="off" />
           <label for="url">IG Link:</label>
      <input id="ig_url" type="url" class="form-control" v-model="brewery.ig_link" autocomplete="off" />
       <label for="url">FB Link:</label>
      <input id="fb_url" type="url" class="form-control" v-model="brewery.fb_link" autocomplete="off" />
       <div class="form-group">
      <label for="history">About Us:</label>
      <textarea id="history" class="form-control" v-model="brewery.about_us"></textarea>
       <label for="hours">Hours:</label>
   <textarea id="hours" class="form-control" v-model="brewery.hours"></textarea>
         <!-- BREWERY IMAGERY?!?!! -->
         <label for="Address">Address:</label>
         <textarea id="address" class="form-control" v-model="brewery.street_address"></textarea>
          <label for="food">Food Available: Yes</label>
         <input id="food" type="checkbox" class="form-control" v-model="brewery.food_available">
      <input id="submit" type="submit" v-model="brewery.submit"/>
   
    </div>
    </div>
</form>
  </div>
</template>

<script>
import BreweryService from '@/services/BreweryService';
export default {
  data() {
    return {
      brewery: {
          brewery_id: this.$route.params.id,
          brewery_name:'',
          email:'',
          phone: '',
          ig_link: '',
          fb_link: '',
          about_us: '',
          hours: '',
          images: '',
          street_address:'',
          food_available:'',

     },
     updatedBrewery:{},
     
      errorMsg:''
        };
    },
    methods:{
      sendUpdate() {
return BreweryService.updateBrewery(this.brewery).then(response => 
this.brewery = response.data)
      }
      }
    };
</script>