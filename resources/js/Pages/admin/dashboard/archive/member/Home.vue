<script setup>
import { ref, defineProps, watch } from 'vue'
import { router, Head, Link } from '@inertiajs/vue3'
import AdminLayout from '@/Layouts/AdminLayout.vue'

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

 const deletePermanently = (id) => {
      if (confirm('Are you sure you want to delete this member permanently?')) {
        router.delete(route('archive.deleteMember', {id: id}), {
          onSuccess: () => {
            alert('Member deleted successfully...')
          },
          onError: (err) => console.log('An error occured while deleting data.', err)
        })
      }
    }

</script>

<template>
  <Head title="Registered members" />
    <AdminLayout>
        <div class="main-section bg-light">


     <div class="container-fluid d-flex flex-row justify-content-between align-items-center mb-2">
           <div class="container-fluid d-flex flex-row justify-content-between px-0 align-items-center">
                <div>
                     <div>
                       <h5 class="fw-semibold">Archived</h5>
                    </div>
                </div>
                <div>
                    <Link :href="route('officialArchive.viewOfficials')" class="btn btn-success">Officials</Link>
                </div>
           </div>
     </div>

    <div class="table-responsive" v-if="getMembers.length">
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
                <input class="form-check-input" type="checkbox"
              :checked="member.status === 'active'"
              title="can't modify"
              disabled
              />

              </div>
            </td>
            <td>
              <Link :href="route('archive.view', {id: member?.id})" class="btn btn-sm btn-outline-dark me-1" title="view info.">
                <i class="bi bi-eye"></i>
              </Link>
              <button class="btn btn-sm btn-outline-dark" @click="deletePermanently(member.id)" title="delete permanently">
                <i class="bi bi-trash"></i>
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <div class="container text-center mt-3">
        <h5 class="text-dark fw-light">No Member's Archive Data.</h5>
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
