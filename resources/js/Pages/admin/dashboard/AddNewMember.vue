<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { Head,Link, useForm } from '@inertiajs/vue3';
import { ref, watch, defineProps } from 'vue';

const props = defineProps({
    beneficiary: {
        type: Array,
        default: () => []
    }
})
const beneficiarytemp = useForm({
    name: '',
    relation: '',
    age: '',
    birth_date: '',
})
const beneficiary = ref([]);
watch(
 () => props.beneficiary,
 (newBene) => {
    beneficiary.value = newBene;
    console.log("beneficiary => " , beneficiary.value);
    console.log("props => " , JSON.stringify(props.beneficiary));
 },
 {immediate: true}
)
const form =  useForm({
         first_name: '',
         last_name: '',
         address: '',
         contact_number: '',
         date_of_birth: '',
         registration_date: '',
         purok: '',
         age: '',
         middle_name: '',
         status: '',
         occupation: '',
         address: '',
         gender: ''

})
const submit = () => {
    form.post(route('addMemberPost'), {
        onSuccess: () => alert('Member added'),
        onError: (err) => console.log('An error occured => ', err),
    })
}
 const addBeneficiaryFunc = () =>{
    beneficiarytemp.post(route('addBeneficiary'));
 }
 const deleteBeneficiary = (index, getId) => {
    beneficiary.value.pop(index);
    beneficiarytemp.delete(route('deleteBeneficiary', {id: getId}));
}


</script>
<template>
    <Head title="Add new member" />
    <AdminLayout>
    <div>
        <div class="container-fluid  d-flex flex-row justify-content-center align-items-center main-container">

            <div class="container mt-5">
                <form @submit.prevent="submit" class="form">
                    <div class="row mb-3">
                        <div class="col col-6">
                            <input type="text" class="form-control" placeholder="Last name" v-model="form.last_name">
                        </div>
                        <div class="col col-6">
                            <label>Birth date</label>
                            <input type="date" class="form-control" placeholder="Birth date" v-model="form.date_of_birth">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col col-6">
                            <input type="text" class="form-control" placeholder="First name" v-model="form.first_name" required>
                        </div>
                        <div class="col col-6">
                            <label>age</label>
                            <input type="date" class="form-control" placeholder="Age" v-model="form.age" required>
                        </div>
                    </div>

                     <div class="row mb-3">
                        <div class="col col-6">
                            <input type="text" class="form-control" placeholder="Middle name" v-model="form.middle_name" required>
                        </div>
                        <div class="col col-6">
                            <input type="text" class="form-control" placeholder="Gender" v-model="form.gender" required>
                        </div>
                    </div>

                      <div class="row mb-3">
                        <div class="col col-6">
                            <input type="text" class="form-control" placeholder="Status" v-model="form.status" required>
                        </div>
                        <div class="col col-6">
                            <input type="number" class="form-control" placeholder="Purok" v-model="form.purok" required>
                        </div>
                    </div>

                     <div class="row mb-3">
                        <div class="col col-6">
                            <input type="text" class="form-control" placeholder="Occupation" v-model="form.occupation" required>
                        </div>
                        <div class="col col-6">
                            <input type="number" class="form-control" placeholder="Contact no." v-model="form.contact_number" required>
                        </div>
                    </div>

                     <div class="row mb-3">
                        <div class="col col-6">
                            <label >Registration date</label>
                            <input type="date" class="form-control" placeholder="Registration date" v-model="form.registration_date" required>
                        </div>
                        <div class="col col-6">
                            <input type="text" class="form-control" placeholder="Address" v-model="form.address" required>
                        </div>
                    </div>
                    

                    <div class="container text-center mt-5 fs-4" v-if="beneficiary !=  undefined && beneficiary.length < 1">No beneficiary added</div>
                    <div v-else>
                    <h5 class="text-dark fw-light pt-2">Beneficiary</h5>
                         <table class="table table-responsive">
                        <thead class="thead">
                            <tr>
                                <th>Name</th>
                                <th>Relation</th>
                                <th>Age</th>
                                <th>Bithdate</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody class="tbody">
                            <tr class="tr" v-for="(data, index) in beneficiary" :key="data.id">
                                <td class="td">{{ data?.name }}</td>
                                <td class="td">{{ data?.relation }}</td>
                                <td class="td">{{ data?.age }}</td>
                                <td class="td">{{ data?.birthDate }}</td>
                                <th>
                                    <button class="btn btn-danger" @click="deleteBeneficiary(index, data.id)">
                                        Delete
                                    </button>
                                </th>
                            </tr>
                        </tbody>
                    </table>
                    </div>

                    <div class="container-fluid d-flex flex-row justify-content-between align-items-center">
                        <div>
                            <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Add Beneficiary
                            </button>
                        </div>

                        <div class="d-flex flex-row gap-2 align-items-center">
                            <button class="btn btn-success">Save</button>
                        </div>
                    </div>
                </form>




                <!-- Add beneficiary modal  -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Add beneficiary</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form @submit.prevent="addBeneficiaryFunc" class="form">
            <input type="text" placeholder="Name" class="form-control mb-2" v-model="beneficiarytemp.name" required>
            <input type="text" placeholder="Relation" class="form-control mb-2" v-model="beneficiarytemp.relation" required>
            <input type="number" placeholder="Age" class="form-control mb-2" v-model="beneficiarytemp.age" required>
            <label>Date of birth</label>
            <input type="date" placeholder="Bithdate" class="form-control mb-2" v-model="beneficiarytemp.birth_date" required>

             <div class="container d-flex justify-content-end gap-2 mt-1">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary"  data-bs-dismiss="modal">Save changes</button>
            </div>
        </form>
      </div>
     
    </div>
  </div>
</div>

            </div>
        </div>    
    </div>
    </AdminLayout>
</template>

<style scoped>
.main-container{
    height: 100%;
}
</style>