<script setup>
import { ref, defineProps, watch } from 'vue'
import { router, Head, Link } from '@inertiajs/vue3'
import AdminLayout from '@/Layouts/AdminLayout.vue'
import HeaderComponent from '@/Components/dashboard/HeaderComponent.vue'

const props = defineProps({
  members: {
    type: Array,
    default: () => []
  }
})
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
  <Head title="Registered members" />
    <AdminLayout>
        <div class="main-section bg-light">
          <HeaderComponent />


     <div class="container-fluid d-flex flex-row justify-content-between align-items-center mb-2">
            <div>
              <h5 class=" mb-3 ms-3 fw-light">Registered Members</h5>
            </div>
            <div>
                 <Link :href="route('addNewMember')" class="btn btn-primary d-flex align-items-center">
                  <i class="bi bi-person-plus me-2 fs-5"></i> Add Member
                </Link>
            </div>
     </div>

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
          <tr v-for="(member, index) in getMembers" :key="index">
            <td>{{ index + 1 }}</td>
            <td>{{ member?.first_name }} {{ member?.middle_name }} {{ member?.last_name }}</td>
            <td>{{ member.gender || 'N/A' }}</td>
            <td>{{ member.age }}</td>
            <td>{{ member.contact_number }}</td>
            <td>{{ member.purok }}</td>
            <td>
              <div class="form-check form-switch d-inline-flex justify-content-center">
                <input class="form-check-input" type="checkbox" v-model="member.status" />
              </div>
            </td>
            <td>
              <Link :href="route('viewMemberInfo', {id: member?.id})" class="btn btn-sm btn-outline-dark me-1">
                <i class="bi bi-eye"></i>
              </Link>
              <Link :href="`/members/${member.id}/edit`" class="btn btn-sm btn-outline-dark me-1">
                <i class="bi bi-pencil"></i>
              </Link>
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
</style>
