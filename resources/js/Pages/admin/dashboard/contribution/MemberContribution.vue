<script setup>
import { Head, Link } from '@inertiajs/vue3';
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { defineProps, watch, ref } from 'vue';
import HeaderComponent from '@/Components/dashboard/HeaderComponent.vue';

const props = defineProps({
  contributions: {
    type: Array,
    default: () => []
  }
})
let getContributions = ref([]);
watch(
  () => props.contributions,
  (newData) => {
    getContributions.value = newData;
    console.log("members: " , getContributions.value)
  },
  {immediate: true}
)
const formatDate = (dateString) => {
    const options = { year: "numeric", month: "long", day: "numeric" };
    return new Date(dateString).toLocaleDateString(undefined, options);
};

const puroks = ['PUROK 1', 'PUROK 2', 'PUROK 3', 'PUROK 4']
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
        <span>ALL MEMBERS</span>
        <div>
          <span v-for="purok in puroks" :key="purok" class="mx-2"
                :class="{ 'fw-bold text-success': purok === 'PUROK 2' }">
            {{ purok }}
          </span>
        </div>
      </div>

      <div class="table-responsive mt-3">
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
            <tr v-for="(contri, index) in getContributions" :key="index">
              <td><i class="bi bi-person"></i></td>
              <td class="text-start">{{ contri?.member_contribution.first_name }} {{ contri?.member_contribution.middle_name }} {{ contri?.member_contribution.last_name }}</td>
              <td>{{ contri?.amount || 'N/A' }}</td>
              <td>
                <span v-if="contri?.created_at">{{ formatDate(contri?.created_at) }}</span>
                <span v-else class="text-muted">Pending</span>
              </td>
              <td>{{ contri?.collector || 'N/A' }}</td>
              <td>{{ contri?.purok || 'N/A'}}</td>
              <td>
                <span v-if="contri?.status === 'Paid'" class="badge bg-success">Paid</span>
                <span v-else class="badge bg-secondary">Pending</span>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
        </AdminLayout>
    </div>
</template>