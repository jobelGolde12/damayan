<script setup>
import { defineProps, ref, watch } from 'vue';
const props = defineProps({
  recent: {
    type: Array,
    default: () => []
  }
})
const getRecent = ref([]);
watch(
    () => props.recent,
    (data) => {
        getRecent.value = data;
    }, {immediate: true}
)
</script>

<template>
  <div>
        <div class="table-responsive" v-if="getRecent.length > 0">
        <h5 class="fw-light">Recent Contributions</h5>
        <table class="table table-bordered table-striped">
        <thead class="table-light">
            <tr>
            <th>DATE</th>
            <th>AMOUNT</th>
            <th>MEMBERS</th>
            <th>COLLECTOR</th>
            <th>PUROK</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(item, index) in recent" :key="index">
            <td>{{ item.date }}</td>
            <td>{{ item.amount }}</td>
            <td>{{ item.members }}</td>
            <td>{{ item.collector }}</td>
            <td>{{ item.purok }}</td>
            </tr>
        </tbody>
        </table>

            <div class="container text-muted text-center">
                <p>No recent contribution data.</p>
            </div>
  </div>
  </div>
</template>
