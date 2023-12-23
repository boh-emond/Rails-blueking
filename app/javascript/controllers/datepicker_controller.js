import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()
import rangePlugin from "flatpickrRangePlugin";

export default class extends Controller {
static targets = ["startDateInput", "endDateInput"]

  connect() {
    console.log("hello from datepickr")
    const options = {
      mode: "range",
      minDate: "today",
      dateFormat: "d/m/Y",
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})],
      onChange: this.handleChange.bind(this),
    };


    this.fp = flatpickr(this.startDateInputTarget, options);
  }

  handleChange(selectedDates, dateStr, instance) {
    if (selectedDates.length >= 2) {
      const startDate = selectedDates[0];
      const endDate = selectedDates[selectedDates.length - 1];
      const daysDifference = this.calculateDaysDifference(startDate, endDate);


      const event = new CustomEvent("datepicker:dates-selected", {
        detail: {  startDate, endDate, daysDifference },
      });

      window.dispatchEvent(event);
    }
  }

  calculateDaysDifference(startDate, endDate) {
    const timeDifference = endDate.getTime() - startDate.getTime();
    return Math.ceil(timeDifference / (1000 * 3600 * 24));
  }
}
