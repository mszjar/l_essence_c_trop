import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";


// Connects to data-controller="flatpicker"
export default class extends Controller {
  static values = {datesUnavailable: Array}
  connect() {
    console.log(this.datesUnavailableValue);
    flatpickr(".datepicker", {
      disable:
      this.datesUnavailableValue,
      inline: true
      // mode:'range'
    });
  }


  //changeDate (event) {
    //const value = event.currentTarget.value
    //this.startDateTarget.value = value.split("to", 1);
    //this.endDateTarget.value = value.split("to") [2])
}
