<template>
  <div class="footer">
    <p>Developed by The A Team &copy; 2022</p>
  </div>
</template>

<script>
export default {
  name: "footer-component",
};
</script>

<style>
.footer {
  font-family: "Nunito Sans", sans-serif;
  text-align: center;
  background-color: #919aa1;
  color: #f8f9fa;
  width: 100vw;
  padding-top: 0.5%;
  padding-bottom: 0.5%;
}

.footer > p {
  margin: 0;
}
</style>