<template>
  <div class="home">
    <h1>Home</h1>
    <p>Test for Admin/Brewer/User</p>
    <div id='admin-section'>
      <router-link v-if="isAdmin" v-bind:to="{name: 'admin'}">Admin Portal</router-link>
    </div>
    <div v-if="isBrewer">Brewer</div>
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
      if(Object.values(this.permissions).includes('ROLE_ADMIN')) {
        return true
      }
    },
    isBrewer () {
      if(Object.values(this.permissions).includes('ROLE_BREWER')) {
        return true
      }
    },
  }
};
</script>

<style scoped>

</style>
