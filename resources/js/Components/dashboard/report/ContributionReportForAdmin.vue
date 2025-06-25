<script setup>
import { defineProps, ref, watch } from 'vue';
const props = defineProps({
  contributions: {
    type: Array,
    default: () => []
  }
})
const getContributions = ref([]);
watch(
    () => props.contributions,
    (data) => {
        getContributions.value = data;
    }, {immediate: true}
)
</script>

<template>
  <div>
    <div class="table-responsive mb-4" v-if="getContributions.length > 0">
    <h5 class="fw-light">Contributions Report</h5>
    <table class="table table-bordered table-striped">
      <thead class="table-light">
        <tr>
          <th>COLLECTOR</th>
          <th>PUROK</th>
          <th>ASSIGNED MEMBERS</th>
          <th>PAID</th>
          <th>UNPAID</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in contributions" :key="index">
          <td><i class="bi bi-person me-2"></i>{{ item.collector }}</td>
          <td>{{ item.purok }}</td>
          <td>{{ item.assigned }}</td>
          <td>{{ item.paid }}</td>
          <td>{{ item.unpaid }}</td>
        </tr>
      </tbody>
    </table>
  </div>

            <div class="container text-muted text-center">
                <p>No contribution data.</p>
            </div>
  </div>
</template>
