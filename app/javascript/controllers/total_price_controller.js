import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-price"
export default class extends Controller {
  static targets = ["total", "endDateInput"];
  static values = { days: Number }

  connect() {
    console.log("hello from totalprice")
    window.addEventListener("datepicker:dates-selected", (event) => {
      const { startDate, endDate, daysDifference } = event.detail;

      this.startDateValue = startDate;
      this.endDateValue = endDate;
      this.daysValue = daysDifference;

      this.calculateTotal();
      this.toggleEndDateVisibility();

    });
  }

  calculateTotal() {

    const day = this.daysValue;
    const price = document.querySelector(".price-per-day").innerHTML;
    const total_price = day * price;
    this.totalTarget.textContent = `${day}x${price}=${total_price}€`;
    this.totalTarget.classList.add('text-awesome');
  }
  toggleEndDateVisibility() {
    this.endDateInputTarget.classList.remove("d-none");
  }
}
