<script setup>
import { Head, Link } from '@inertiajs/vue3';
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { defineProps, watch, ref } from 'vue';
import HeaderComponent from '@/Components/dashboard/HeaderComponent.vue';
import Purok from '@/Components/dashboard/contribution/Purok.vue';
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
    // console.log("member: " , getMember.value)
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
        <AdminLayout>
          <HeaderComponent />

             <div class="container">
    <div class="bg-light  p-2">
    <div class="container-fluid d-flex flex-row justify-content-between align-items-center px-0 mb-2">
        <div>
          <h6 class="mt-4">Payment Contribution</h6>
        </div>
        <div>
            <Link :href="route('contributions.add')" class="btn btn-success">Add Contribution</Link>
        </div>
    </div>
      <div class="d-flex justify-content-between text-muted small">
        <span class="text-success">ALL MEMBERS</span>
        <div>
          <Purok :activePurok="getSelectedPurok"/>
        </div>
      </div>

      <div class="table-responsive mt-3" v-if="getMember.length > 0">
        <table class="table table-bordered table-hover align-middle text-center">
          <thead class="table-light">
            <tr>
              <th>ID</th>
              <th>NAME</th>
              <th>AMOUNT</th>
              <th>DATE</th>
              <th>COLLECTOR</th>
              <th>PUROK</th>
              <th>STATUS</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(mem, index) in getMember" :key="index">
              <td>{{ mem?.id }}</td>
              <td class="text-start">{{ mem?.first_name }} {{ mem?.middle_name }} {{ mem?.last_name }}</td>
              <td>{{ formatAmount(mem?.contributions[0]?.amount) }}</td>
              <td>
                <span v-if="mem?.contributions[0]?.payment_date">{{ formatDate(mem?.contributions[0]?.payment_date) }}</span>
                <span v-else class="text-muted">...</span>
              </td>
              <td>{{ mem?.contributions[0]?.collector || 'N/A' }}</td>
              <td>{{ mem?.contributions[0]?.purok || 'N/A'}}</td>
              <td>
                <span v-if="mem?.contributions[0]?.status === 'paid'" class="badge bg-success">Paid</span>
                <span v-else class="">...</span>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="container mt-4 text-center" v-else>
        <img src="../../../../../images/not_found.svg" alt="No Data" class="not-found-image image-rounded">
        <h5 class="fw-light">No contribution found in <span class="text-success"> {{ getSelectedPurok || 'N/A' }}</span>.</h5>
      </div>
    </div>
  </div>
        </AdminLayout>
    </div>
</template>

<style scoped>
.not-found-image{
  width: 200px;
  margin: auto;
  margin-bottom: 2rem;
}
</style>