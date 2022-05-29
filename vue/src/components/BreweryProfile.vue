<template>
  <div>
<form v-on:submit.prevent="submitForm" class="breweryForm">
    <div class="status-message error" v-show="errorMsg !== ''"></div>
    <div class="form-group">
             <label for="Name">Name:</label>
      <input id="name" type="text" class="form-control" v-model="brewery.name" autocomplete="off" />
           <label for="number">Phone Number:</label>
      <input id="number" type="tel" class="form-control" v-model="brewery.number" autocomplete="off" />
           <label for="email">Email:</label>
      <input id="email" type="email" class="form-control" v-model="brewery.email" autocomplete="off" />
           <label for="url">Social Media Link:</label>
      <input id="url" type="url" class="form-control" v-model="brewery.url" autocomplete="off" />
       <div class="form-group">
      <label for="history">About Us:</label>
      <textarea id="history" class="form-control" v-model="brewery.history"></textarea>
       <label for="hours">Hours:</label>
      <select id="tag" class="form-control" v-model="brewery.date">
        <option value="Monday">Monday</option>
         <input id="time" type="text" class="form-control" v-model="brewery.date" autocomplete="off" />
        <option value="Tuesday">Tuesday</option>
         <input id="time" type="text" class="form-control" v-model="brewery.date" autocomplete="off" />
        <option value="Wednesday">Wednesday</option>
         <input id="time" type="text" class="form-control" v-model="brewery.date" autocomplete="off" />
            <option value="Thursday">Thursday</option>
             <input id="time" type="text" class="form-control" v-model="brewery.date" autocomplete="off" />
         <option value="Friday">Friday</option>
          <input id="time" type="text" class="form-control" v-model="brewery.date" autocomplete="off" />
        <option value="Saturday">Saturday</option>
         <input id="time" type="text" class="form-control" v-model="brewery.date" autocomplete="off" />
         <option value="Sunday">Sunday</option>
         <input id="time" type="text" class="form-control" v-model="brewery.date" autocomplete="off" />
         <!-- BREWERY IMAGERY?!?!! -->
         <label for="Address">Address:</label>
      <input id="address" type="text" class="form-control" v-model="brewery.name" autocomplete="off" />
      </select>
    </div>
    </div>
</form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      brewery: {
          name:'',
          email:'',
          number: '',
          link: '',
          history: '',
          hours: '',
          images: '',
          address:''

      }, 
      errorMsg:''
        };
    },
    }
</script>