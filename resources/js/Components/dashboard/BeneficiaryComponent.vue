<script setup>
import { defineProps, ref, watch } from 'vue';

const props = defineProps({
    bene: {
        type: Array,
        default: () => []
    }
});
let getBeneficiary = ref([]);
watch( 
() => props.bene,
(newData) => {
    getBeneficiary.value = newData; 
},
{immediate: true}
)

const formatDate = (dateString) => {
    const options = { year: "numeric", month: "long", day: "numeric" };
    return new Date(dateString).toLocaleDateString(undefined, options);
};
</script>

<template>
    <div>
        
  <div class="container-fluid" v-if="getBeneficiary?.length !== 0 && getBeneficiary != null">
  <table class="table table-bordered">
    <tbody>
      <tr>
        <td colspan="8" class="text-center fw-bold">BENEFICIARY</td>
      </tr>

      <tr v-for="(data, index) in getBeneficiary" :key="index">
        <td colspan="2"><strong>{{ data.name }}</strong></td>
        <td colspan="2">{{ data.relation }}</td>
        <td colspan="2">{{ data.age }} YEARS OLD</td>
        <td colspan="2">{{ formatDate(data.birth_date) }}</td>
      </tr>
    </tbody>
  </table>
</div>

   <div class="container text-center" v-else>
            No Beneficiary
        </div>
    </div>
</template>
