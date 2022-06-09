<template>
  <div class="footer">
    <img src="../assets/bruGuru.svg" id="bruGuru-logo">
    <p>Developed by bruGuru TEam &copy; 2022</p>
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
  background-color: #9D9D9D;
  color: #f8f9fa;
  width: 100vw;
  padding-top: 0.2%;
  padding-bottom: 0.2%;
  display: flex;
  justify-content: center;
  align-items: center;
}

.footer > p {
  margin: 0;
  font-size: 0.65rem;
  display: inline-block;
}

#bruGuru-logo {
  height: 2%;
  width: 2%;
  display: inline-block;
  padding-right: 1%;
}
</style>