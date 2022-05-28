<template>
  <div class="home">
    <h1>Home</h1>
    <p>{{permissions}}</p>
    <div id='admin-section'>
      <router-link v-if="isAdmin()" v-bind:to="{name: 'admin'}">Admin Portal</router-link>
    </div>
    <div v-if="isBrewer()">Brewer</div>
    <div>User</div>
  </div>
</template>

<script>

export default {
  name: "home",
  data () {
    return {
      permissions : this.$store.state.user.authorities
    }
  },
  methods : {
    isAdmin () {
      for(let i = 0; i < this.permissions.length; i++){
        if(this.permissions[i].name == 'ROLE_ADMIN'){
          return true
        }
      }
    },
    isBrewer () {
      for(let i = 0; i < this.permissions.length; i++){
        if(this.permissions[i].name == 'ROLE_BREWER'){
          return true
        }
      }
    },
  }
};
</script>

<style scoped>

</style>
