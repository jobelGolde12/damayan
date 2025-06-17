
<script setup>
import { defineProps, ref, watch } from 'vue';
const props = defineProps({
    contributions: {
        type: Array,
        default: () => []
    }
});
let getContributions = ref([]);
watch(() => props.contributions, (newContributions) => {
    getContributions.value = newContributions;
    console.log("Contributions from table:  ", getContributions.value);
}, { immediate: true });
</script>

<template>
    <div>
        <div class="container">
            <table class="table" v-if="getContributions.length > 0">
                <thead class="thead">
                    <tr>
                        <th class="bg-light">ID</th>
                        <th class="bg-light">NAME</th>
                        <th class="bg-light">CONTACT NO.</th>
                        <th class="bg-light">PUROK</th>
                        <th class="bg-light">STATUS</th>
                    </tr>
                </thead>

                <tbody>
                    <tr v-for="contribution in getContributions" :key="contribution.id">
                        <td class="bg-light">{{ contribution.id }}</td>
                        <td class="bg-light">
                            {{ contribution?.member_contribution.first_name }}
                            {{ contribution?.member_contribution.middle_name }}
                            {{ contribution?.member_contribution.last_name }}
                        </td>
                        <td class="bg-light">
                            {{ contribution?.member_contribution.contact_number }}
                        </td>
                        <td class="bg-light">
                            {{ contribution?.member_contribution.purok }}
                        </td>
                        <td class="bg-light">
                            <i class="bi bi-check-circle text-success fs-5 text-center" v-if="contribution?.status == 'paid'"></i>
                            <i class="bi bi-ban text-danger fs-5 text-center" v-else></i>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div v-else class="text-center">
                <p class="text-muted">No contributions found.</p>   
                </div>
        </div>
    </div>
</template>


<style lang="css" scoped>

</style>