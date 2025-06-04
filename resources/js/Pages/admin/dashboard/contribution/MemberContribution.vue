<script setup>
import { Head, Link } from '@inertiajs/vue3';
import AdminLayout from '@/Layouts/AdminLayout.vue';
import HeaderComponent from '@/Components/dashboard/HeaderComponent.vue';
const puroks = ['PUROK 1', 'PUROK 2', 'PUROK 3', 'PUROK 4']

const members = [
  { name: "Juvy V. Gopeo", amount: 100, date: "March 20, 2025", collector: "Milanie", purok: 2, status: "Paid" },
  { name: "Virgie G. Malinao", amount: 100, date: "March 20, 2025", collector: "Milanie", purok: 2, status: "Paid" },
  { name: "Mary Jane V. Golde", amount: 100, date: "March 20, 2025", collector: "Milanie", purok: 2, status: "Paid" },
  { name: "Caren G. Delariarte", amount: 100, date: "March 20, 2025", collector: "Milanie", purok: 2, status: "Paid" },
  { name: "Roosbelt C. Gimoro", amount: 100, date: "March 20, 2025", collector: "Milanie", purok: 2, status: "Paid" },
  { name: "Melva C. Delariarte", amount: 100, date: "March 20, 2025", collector: "Milanie", purok: 2, status: "Paid" },
  { name: "Milanie G. Gimoro", amount: 100, date: "March 20, 2025", collector: "Milanie", purok: 2, status: "Paid" },
  { name: "Jiji V. Gimoro", amount: 100, date: "March 20, 2025", collector: "Milanie", purok: 2, status: "Paid" },
  { name: "Lorilyn P. Gimoro", amount: 100, date: null, collector: "Milanie", purok: 2, status: "Pending" },
  { name: "Emireta Gimoro", amount: 100, date: null, collector: "Milanie", purok: 2, status: "Pending" },
  { name: "Emireta Gimoro", amount: 100, date: null, collector: "Milanie", purok: 2, status: "Pending" },
]
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
            <Link :href="route('login')" class="btn btn-success">Add Contribution</Link>
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
            <tr v-for="(member, index) in members" :key="index">
              <td><i class="bi bi-person"></i></td>
              <td class="text-start">{{ member.name }}</td>
              <td>{{ member.amount }}</td>
              <td>
                <span v-if="member.date">{{ member.date }}</span>
                <span v-else class="text-muted">Pending</span>
              </td>
              <td>{{ member.collector }}</td>
              <td>{{ member.purok }}</td>
              <td>
                <span v-if="member.status === 'Paid'" class="badge bg-success">Paid</span>
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