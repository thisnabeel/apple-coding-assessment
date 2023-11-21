// javascript/weather_controller.js
import { Controller } from "@hotwired/stimulus";
import API from "./api";

const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

export default class extends Controller {
  static targets = ["suggestions", "input", "forecast"];

  connect() {
    console.log("hello");
  }

  select(e) {
    this.inputTarget.value = e.target.innerHTML;
    this.suggestionsTarget.innerHTML = "";
    const forecastTarget = this.forecastTarget;

    const payload = {
      place_id: e.target.getAttribute("place_id"),
    };

    API("/weather/forecast", payload, "POST", forecastTarget);
  }

  searchInput() {
    const suggestionsTarget = this.suggestionsTarget;
    const inputTarget = this.inputTarget;

    const value = inputTarget.value;

    const payload = {
      address: value,
    };

    API("/address/suggestions", payload, "POST", suggestionsTarget);
  }
}
