<script setup>
import AdminLayout from '@/Layouts/AdminLayout.vue';
import { Head,Link, useForm } from '@inertiajs/vue3';
import { ref } from 'vue';

const beneficiarytemp = useForm({
    name: '',
    relation: '',
    age: '',
    birthDate: '',
})
const beneficiary = ref([]);
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
         occupation: ''
})
const submit = () => {

}
 const addBeneficiaryFunc = () =>{
    beneficiary.value.push(beneficiarytemp);
    // beneficiarytemp.name = '';
    // beneficiarytemp.relation = '';
    // beneficiarytemp.relation = '';
    // beneficiarytemp.birthDate = '';
    beneficiarytemp.reset();
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
                            <input type="date" class="form-control" placeholder="Birth date" v-model="form.birthDate">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col col-6">
                            <input type="text" class="form-control" placeholder="First name" v-model="form.last_first">
                        </div>
                        <div class="col col-6">
                            <input type="number" class="form-control" placeholder="Age" v-model="form.age">
                        </div>
                    </div>

                     <div class="row mb-3">
                        <div class="col col-6">
                            <input type="text" class="form-control" placeholder="Middle name" v-model="form.middle_name">
                        </div>
                        <div class="col col-6">
                            <input type="text" class="form-control" placeholder="Gender" v-model="form.gender">
                        </div>
                    </div>

                      <div class="row mb-3">
                        <div class="col col-6">
                            <input type="text" class="form-control" placeholder="Status" v-model="form.status">
                        </div>
                        <div class="col col-6">
                            <input type="text" class="form-control" placeholder="Purok" v-model="form.purok">
                        </div>
                    </div>

                     <div class="row mb-3">
                        <div class="col col-6">
                            <input type="text" class="form-control" placeholder="Occupation" v-model="form.occupation">
                        </div>
                        <div class="col col-6">
                            <input type="text" class="form-control" placeholder="Contact no." v-model="form.contact_number">
                        </div>
                    </div>

                    <div class="container text-center mt-5 fs-4" v-if="beneficiary.length < 1">No beneficiary added</div>
                    <table class="table table-responsive" v-else>
                        <thead class="thead">
                            <tr>
                                <th>Name</th>
                                <th>Relation</th>
                                <th>Age</th>
                                <th>Bithdate</th>
                            </tr>
                        </thead>

                        <tbody class="tbody">
                            <tr class="tr" v-for="data in beneficiary">
                                <td class="td">{{ data?.name }}</td>
                                <td class="td">{{ data?.relation }}</td>
                                <td class="td">{{ data?.age }}</td>
                                <td class="td">{{ data?.birthDate }}</td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="container-fluid d-flex flex-row justify-content-between align-items-center">
                        <div>
                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Add Beneficiary
                            </button>
                        </div>

                        <div class="d-flex flex-row gap-2 align-items-center">
                            <button class="btn btn-danger">Edit</button>
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
            <input type="date" placeholder="Bithdate" class="form-control mb-2" v-model="beneficiarytemp.birthDate" required>

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