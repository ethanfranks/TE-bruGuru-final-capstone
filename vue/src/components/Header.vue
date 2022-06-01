<template>
  <div>
    <img src="" alt="" />
    <h1>Brewery Finder</h1>
    <nav>
      <router-link v-bind:to="{ name: 'home' }">Home |</router-link>
      <router-link v-bind:to="{ name: 'account' }"> Account | </router-link>
      <router-link v-bind:to="{ name: isLoggedIn ? 'login' : 'logout'}">
        {{isLoggedIn ? 'Logout' : 'Login'}}
      </router-link>
    </nav>
  </div>
</template>

<script>
export default {
  data() {
    return {
      permissions: this.$store.state.user.authorities,
    };
  },
  methods: {
    isLoggedIn() {
      for (let i = 0; i < this.permissions.length; i++) {
        if (this.permissions[i].name != "") {
          return true;
        }
      }
    },
  },
};
</script>

<style>
</style>