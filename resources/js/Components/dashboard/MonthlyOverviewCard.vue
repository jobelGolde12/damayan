<script setup>
import { onMounted, watch, ref, nextTick, onUnmounted, defineProps } from 'vue';
import * as echarts from 'echarts';

const props = defineProps({
  data: {
    type: Array, // <--- IMPORTANT: Changed type to Array
    // Default to an array with two empty objects/arrays for initial structure
    default: () => [{}, {}]
  }
});

let chartInstance;
const monthLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'];

// Helper function to transform the backend collection into a usable map
const transformMonthlyData = (collection) => {
  const transformedMap = {};
  // Handle cases where collection might be null/undefined or already a plain object
  if (!collection) {
    return transformedMap;
  }
  // If it's already a plain object (e.g., if backend already transformed it)
  if (typeof collection === 'object' && !Array.isArray(collection) && !collection.items) {
    return collection;
  }

  // If it's an Eloquent Collection (or similar object with an 'items' property)
  if (collection.items && typeof collection.items === 'object') {
    for (const key in collection.items) {
      if (Object.prototype.hasOwnProperty.call(collection.items, key)) {
        const item = collection.items[key];
        // Check for attributes and month property
        if (item && item.attributes && typeof item.attributes.month !== 'undefined') {
          transformedMap[item.attributes.month] = {
            total_collected: item.attributes.total_collected,
            total_disbursed: item.attributes.total_disbursed // Ensure this exists if applicable
          };
        } else if (item && typeof item.month !== 'undefined') { // Fallback if 'attributes' isn't present (e.g., if already raw data)
            transformedMap[item.month] = {
                total_collected: item.total_collected,
                total_disbursed: item.total_disbursed
            };
        }
      }
    }
  } else if (Array.isArray(collection)) { // If it's a plain array of objects (e.g., from Laravel ->toArray())
      collection.forEach(item => {
          if (item && typeof item.month !== 'undefined') {
              transformedMap[item.month] = {
                  total_collected: item.total_collected,
                  total_disbursed: item.total_disbursed
              };
          }
      });
  }

  return transformedMap;
};

const updateChart = () => {
  // IMPORTANT CHANGE: Access props.data[0] for monthlyData and props.data[1] for monthlyDisbursement
  const rawMonthlyData = props.data[0];
  const rawMonthlyDisbursement = props.data[1];

  const collectedMap = transformMonthlyData(rawMonthlyData);
  const disbursedMap = transformMonthlyData(rawMonthlyDisbursement);

  const collected = [];
  const disbursed = [];

  for (let i = 1; i <= 12; i++) {
    const collectedEntry = collectedMap[i];
    const disbursedEntry = disbursedMap[i];

    collected.push(collectedEntry ? parseFloat(collectedEntry.total_collected) || 0 : 0);
    disbursed.push(disbursedEntry ? parseFloat(disbursedEntry.total_disbursed) || 0 : 0);
  }

  chartInstance?.setOption({
    legend: {
      data: ['Collected', 'Disbursed'],
      top: '10%'
    },
    xAxis: { data: monthLabels },
    series: [
      {
        name: 'Collected',
        type: 'bar',
        data: collected,
        itemStyle: { color: '#0000ff' }
      },
      {
        name: 'Disbursed',
        type: 'bar',
        data: disbursed,
        itemStyle: { color: '#00cc00' }
      }
    ]
  }, {
    notMerge: false
  });
};

watch(
  () => props.data,
  (logData) => {
    updateChart();
    console.table("data: ", logData)
  },
  { immediate: true }
);

onMounted(async () => {
  await nextTick();

  const el = document.getElementById('monthlyChart');
  if (!el) {
    console.warn('monthlyChart element not found');
    return;
  }

  chartInstance = echarts.init(el);
  chartInstance.setOption({
    title: { text: 'Monthly Overview', left: 'center' },
    tooltip: { trigger: 'axis' },
    xAxis: {
      type: 'category',
      data: monthLabels
    },
    yAxis: { type: 'value' },
    series: []
  });
});

onUnmounted(() => {
  if (chartInstance) {
    chartInstance.dispose();
    chartInstance = null;
  }
});
</script>

<template>
  <div id="monthlyChart" style="height: 300px;" class="bg-white rounded shadow-sm p-3"></div>
</template>