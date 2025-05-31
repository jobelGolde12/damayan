<script setup>
import { ref, defineProps } from 'vue'
import { router } from '@inertiajs/vue3'
import AdminLayout from '@/Layouts/AdminLayout.vue'

const props = defineProps({
  members: {
    type: Array,
    default: () => []
  }
})
const members = ref([
  { id: 1, name: 'Juvy V. Gopeo', gender: 'Female', age: 40, contact: '09001122330', street: 1, status: true },
  { id: 2, name: 'Virgie G. Malinao', gender: 'Female', age: 40, contact: '09001122330', street: 1, status: true },
  { id: 3, name: 'Mary Jane V. Golde', gender: 'Female', age: 40, contact: '09001122330', street: 1, status: true },
  { id: 4, name: 'Caren G. Delariarte', gender: 'Female', age: 40, contact: '09001122330', street: 2, status: true },
  { id: 5, name: 'Roosbelt C. Gimoro', gender: 'Male', age: 40, contact: '09001122330', street: 2, status: true },
  { id: 6, name: 'Melva C. Delariarte', gender: 'Female', age: 40, contact: '09001122330', street: 2, status: true },
  { id: 7, name: 'Melanie G. Gimoro', gender: 'Female', age: 40, contact: '09001122330', street: 3, status: true },
  { id: 8, name: 'Jiji V. Gimoro', gender: 'Female', age: 40, contact: '09001122330', street: 3, status: true },
  { id: 9, name: 'Lorilyn P. Gimoro', gender: 'Female', age: 40, contact: '09001122330', street: 4, status: true },
  { id: 10, name: 'Emireta Gimoro', gender: 'Female', age: 40, contact: '09001122330', street: 4, status: true },
])
let getMembers = ref([]);
watch(
  () => props.members,
  (newMember) => {
    getMembers.value = newMember;
  },
  {immediate: true}
)
const deleteMember = (id) => {
  if (confirm('Are you sure you want to delete this member?')) {
    members.value = members.value.filter(member => member.id !== id)
  }
}


</script>

<template>
    <AdminLayout>
        <div class="main-section bg-light">
    <div class="d-flex align-items-center mb-3 header container-fluid py-2">
      <button class=" me-2">
        <i class="bi bi-list fs-2 "></i>
      </button>
      <h4 class="mb-0 fw-bold">PROTECT DAMAYAN SYSTEM</h4>
    </div>

    <h5 class=" mb-3 ms-3 fw-light">Registered Members</h5>

    <div class="table-responsive">
      <table class="table table-bordered align-middle text-center">
        <thead class="table-light">
          <tr>
            <th>ID</th>
            <th><i class="bi bi-person"></i> NAME</th>
            <th>GENDER</th>
            <th>AGE</th>
            <th>CONTACT NO.</th>
            <th>STREET</th>
            <th>STATUS</th>
            <th>ACTION</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(member, index) in members" :key="index">
            <td>{{ index + 1 }}</td>
            <td>{{ member.name }}</td>
            <td>{{ member.gender }}</td>
            <td>{{ member.age }}</td>
            <td>{{ member.contact }}</td>
            <td>{{ member.street }}</td>
            <td>
              <div class="form-check form-switch d-inline-flex justify-content-center">
                <input class="form-check-input" type="checkbox" v-model="member.status" />
              </div>
            </td>
            <td>
              <inertia-link :href="`/members/${member.id}`" class="btn btn-sm btn-outline-dark me-1">
                <i class="bi bi-eye"></i>
              </inertia-link>
              <inertia-link :href="`/members/${member.id}/edit`" class="btn btn-sm btn-outline-dark me-1">
                <i class="bi bi-pencil"></i>
              </inertia-link>
              <button class="btn btn-sm btn-outline-dark" @click="deleteMember(member.id)">
                <i class="bi bi-trash"></i>
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
    </AdminLayout>
</template>

<style scoped>
.main-section {
  width: 100%;
  height: 100%;
  overflow-x: hidden;
  overflow-y: scroll;
}

.table th,
.table td {
  vertical-align: middle;
}
.header{
    background: #D4F3F9;
}
</style>
