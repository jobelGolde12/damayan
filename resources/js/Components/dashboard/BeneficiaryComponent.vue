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
    console.log("bene: ", getBeneficiary.value)
    console.log("props: ", JSON.stringify(props.bene))
},
{immediate: true}
)
</script>

<template>
    <div>
        
  <div class="container-fluid" v-if="getBeneficiary?.length !== 0 && getBeneficiary != null">
  <table class="table table-bordered">
    <tbody>
      <tr>
        <td colspan="8" class="text-center fw-bold">BENEFICIARY</td>
      </tr>

      <!-- First Beneficiary Row -->
      <tr>
        <td colspan="2"><strong>ROMALDO C. GOLPEO</strong></td>
        <td colspan="2">SPOUSE</td>
        <td colspan="2">52 YEARS OLD</td>
        <td colspan="2">1973-01-09</td>
      </tr>

      <!-- Second Beneficiary Row -->
      <tr>
        <td colspan="2"><strong>JOBELLE V. GOLPEO</strong></td>
        <td colspan="2">DAUGHTER</td>
        <td colspan="2">21 YEARS OLD</td>
        <td colspan="2">2003-06-30</td>
      </tr>
    </tbody>
  </table>
</div>

   <div class="container text-center" v-else>
            No Beneficiary
        </div>
    </div>
</template>
