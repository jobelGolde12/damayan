import { defineStore } from "pinia";

export const toggleNav = defineStore('change', {
  state: () => ({
    value: false
  }),
  actions: {
    change() {
      this.value = !this.value;
      localStorage.setItem('toggleNav', this.value);
    },
    init() {
      this.value = localStorage.getItem('toggleNav') === 'true';
    }
  }
});
