<script setup>
import { ref, defineProps, watch } from 'vue'
import { router, Head, Link } from '@inertiajs/vue3'
import CollectorLayout from '@/Layouts/CollectorLayout.vue'

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

 const trashMember = (id) => {
      if (confirm('Are you sure you want to trash this member?')) {
        router.delete(route('deleteMember', {id: id}), {
          onSuccess: () => {
            console.log('Member trashed')
          },
        })
      }
    }

const toggleMemberStatus = (member) => {
  const newStatus = member.status === 'active' ? 'inactive' : 'active'

  router.put(route('toggleMemberStatus', { id: member.id }), {
    status: newStatus
  }, {
    onSuccess: () => {
      member.status = newStatus
      console.log(`Member ${member.id} status changed to ${newStatus}`)
    }
  })
}
</script>

<template>
  <Head title="Registered members" />
    <CollectorLayout>
        <div class="main-section bg-light">


            <div>
              <h5 class=" mb-3 ms-3 fw-light">Registered Members</h5>
            </div>

    <div class="table-responsive">
      <table class="table table-bordered align-middle text-center">
        <thead class="table-light">
          <tr>
            <th>ID</th>
            <th><i class="bi bi-person"></i> NAME</th>
            <th>AGE</th>
            <th>CONTACT NO.</th>
            <th>PUROK</th>
            <th>ACTION</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(member, index) in getMembers" :key="index">
            <td>{{ index + 1 }}</td>
            <td>{{ member?.first_name }} {{ member?.middle_name }} {{ member?.last_name }}</td>
            <td>{{ member.age }}</td>
            <td>{{ member.contact_number }}</td>
            <td>{{ member.purok }}</td>
            <td>
              <Link 
              :href="route('viewMemberInfo', {id: member?.id})" 
              class="btn btn-sm btn-outline-dark me-1 border-0"
              >
                <i class="bi bi-eye fs-5"></i>
              </Link>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
    </CollectorLayout>
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
