<script>
import axios from "axios";
export default {
  data: function () {
    return {
      message: "Welcome to Cities!",
      cities: [],
      newCityParams: {},
      currentCity: {},
      editCityParams: {}
    };
  },
  created: function () {
    this.indexCities();
  },
  methods: {
    indexCities: function () {
      axios.get("/cities").then(response => {
        console.log("index cities", response.data)
        this.cities = response.data
      })
    },
    createCity: function () {
      axios.post("/cities", this.newCityParams).then(response => {
        console.log("creating city", response.data)
        this.cities.push(response.data)
      })
    },
    showCity: function (city) {
      this.currentCity = city
      this.editCityParams = city
      document.querySelector("#show-city").showModal()
    },
    updateCity: function (city) {
      axios.patch(`/cities/${city.id}`, this.editCityParams).then(response => {
        console.log("updating city", response.data)
        this.currentCity = {}
      })
    },
    destroyCity: function (city) {
      axios.delete(`/cities/${city.id}`).then(response => {
        console.log("deleting city", response)
      })
    }
  },
};
</script>

<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <p>Add Another City</p>
    <p>Name: <input type="text" v-model="newCityParams.name"></p>
    <p>State: <input type="text" v-model="newCityParams.state"></p>
    <p>Population: <input type="text" v-model="newCityParams.population"></p>
    <button @click="createCity()">Create!</button>
    <div v-for="city in cities" v-bind:key="city">
      <p>{{ city.name }}</p>
      <button @click="showCity(city)">More Info</button>
      <dialog id="show-city">
        <form method="dialog">
          <p>Name: {{ currentCity.name }}</p>
          <p>State: {{ currentCity.state }}</p>
          <p>Population: {{ currentCity.population }}</p>
          <p>Edit Info</p>
          <p>Name: <input type="text" v-model="editCityParams.name"></p>
          <p>State: <input type="text" v-model="editCityParams.state"></p>
          <p>Population: <input type="text" v-model="editCityParams.population"></p>
          <button @click="destroyCity(currentCity)">Destroy</button>
          <button @click="updateCity(currentCity)">Update</button>
          <button>Close</button>
        </form>
      </dialog>
    </div>
  </div>
</template>

<style></style>