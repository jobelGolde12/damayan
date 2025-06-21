<script setup>
import { Head } from '@inertiajs/vue3';
import CollectorLayout from '@/Layouts/CollectorLayout.vue';
import HeaderComponent from '@/Components/dashboard/HeaderComponent.vue';
import CurrentMothCard from '@/Components/dashboard/CurrentMothCard.vue';
import CurrentYearCard from '@/Components/dashboard/CurrentYearCard.vue';
import MonthlyOverviewCard from '@/Components/dashboard/MonthlyOverviewCard.vue';
</script>

<template>
  <Head title="Collector dashboard" />

  <CollectorLayout>
    <div class="container-fluid mx-0 px-0 home-container">
      <HeaderComponent />
      <h2 class="fw-normal fs-5 my-4 ps-3">Analytics Dashboard</h2>

      <div class="row g-4">
        <!-- Bar Chart -->
        <div class="col-md-8">
          <CurrentMothCard />
        </div>

        <!-- Pie Chart -->
        <div class="col-md-4">
          <CurrentYearCard />
        </div>
      </div>

      <!-- Monthly Line Chart -->
      <div class="row mt-4">
        <div class="col-12">
          <MonthlyOverviewCard />
        </div>
      </div>
    </div>
  </CollectorLayout>
</template>

<style scoped>
.home-container {
  width: 100%;
  height: 100%;
  overflow-x: hidden;
  overflow-y: scroll;
}
</style>
