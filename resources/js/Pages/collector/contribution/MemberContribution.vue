<script setup>
import { Head, Link } from '@inertiajs/vue3';
import CollectorLayout from '@/Layouts/CollectorLayout.vue';
import { defineProps, watch, ref } from 'vue';
import PurokComponentForCollector from '@/Components/dashboard/contribution/PurokComponentForCollector.vue';
const props = defineProps({
  member: {
    type: Array,
    default: () => []
  },
  selectedPurok: {
    type: String,
    default: () => ''
  }
})
let getMember = ref([]);
let getSelectedPurok = ref('');
watch(
  () => props.member,
  (newData) => {
    getMember.value = newData;
    // console.log("member: " , getMembers.value)
  },
  {immediate: true}
)
watch(
  () => props.selectedPurok,
  (newData) => {
    getSelectedPurok.value = newData;
  },
  {immediate: true}
)
const formatDate = (dateString) => {
    const options = { year: "numeric", month: "long", day: "numeric" };
    return new Date(dateString).toLocaleDateString(undefined, options);
};
function formatAmount(value) {
  if (value == null) return 'N/A';
  return parseFloat(value); 
}

</script>
<template>
    <Head title="Member contribution"/>
    <div>
        <CollectorLayout>

             <div class="container">
    <div class="bg-light  p-2">
         <div>
          <h6 class="mt-4 ms-2">Payment Contribution</h6>
        </div>
        <div>
          <PurokComponentForCollector :activePurok="getSelectedPurok"/>
        </div>

      <div class="table-responsive mt-3" v-if="getMember.length > 0">
        <table class="table table-bordered table-hover align-middle text-center">
          <thead class="table-light">
            <tr>
              <th>ID</th>
              <th>NAME</th>
              <th>CONTACT NO.</th>
              <th>PUROK</th>
              <th>STATUS</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(mem, index) in getMember" :key="index">
              <td>{{ mem?.id }}</td>
              <td class="text-start">{{ mem?.first_name }} {{ mem?.middle_name }} {{ mem?.last_name }}</td>
              <td>{{ mem?.contact_number || 'undefined' }}</td>
              <td>
                {{ mem?.purok || 'N/A' }}
              </td>
              <td>
                <button class="status-button">Paid</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="container mt-4 text-center" v-else>
        <img src="../../../../images/not_found.svg" alt="No Data" class="not-found-image image-rounded">
        <h5 class="fw-light">No contribution found in <span class="text-success"> {{ getSelectedPurok || 'N/A' }}</span>.</h5>
      </div>
    </div>
  </div>
        </CollectorLayout>
    </div>
</template>

<style scoped>
.not-found-image{
  width: 200px;
  margin: auto;
  margin-bottom: 2rem;
}
.status-button {
  background-color: #0CF32F;
  color: #333;
  border: none;
  padding: 0.3rem .7rem;
  border-radius: 0.25rem;
  cursor: pointer;
}
</style>