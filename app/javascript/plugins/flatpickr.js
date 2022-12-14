import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// const initFlatpickr = () => {
//   flatpickr(".datepicker", {});
// }

const initFlatpickr = () => {
  flatpickr("#range_start", {
    altInput: true,
    plugins: [new rangePlugin({ input: "#range_end"})],
    inline: true
  });
}

export { initFlatpickr };
