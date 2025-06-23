<script setup>
import { onMounted, watch, nextTick, onUnmounted, defineProps } from 'vue';
import * as echarts from 'echarts';

const props = defineProps({
  data: {
    type: Array,
    default: () => [{}, []], // [collectedDataMap, disbursedDataMap]
  },
});

let chartInstance;
const monthLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'];

const updateChart = () => {
  if (!chartInstance) return;

  const collectedMap = props.data[0] || {};
  const disbursedMap = props.data[1] || {};

  const collected = [];
  const disbursed = [];

  for (let i = 1; i <= 12; i++) {
    const collectedEntry = collectedMap[i];
    const disbursedEntry = disbursedMap[i];

    collected.push(collectedEntry ? parseFloat(collectedEntry.total_collected || 0) : 0);
    disbursed.push(disbursedEntry ? parseFloat(disbursedEntry.total_disbursed || 0) : 0);
  }

  // Debugging output
  // console.table(
  //   monthLabels.map((label, index) => ({
  //     month: label,
  //     collected: collected[index],
  //     disbursed: disbursed[index],
  //   }))
  // );

  chartInstance.setOption({
    title: { text: 'Monthly Overview', left: 'center' },
    tooltip: { trigger: 'axis' },
    legend: {
      data: ['Collected', 'Disbursed'],
      top: '10%',
    },
    xAxis: {
      type: 'category',
      data: monthLabels,
    },
    yAxis: {
      type: 'value',
      minInterval: 1,
      splitLine: { show: true },
      axisLine: { show: true },
    },
    series: [
      {
        name: 'Collected',
        type: 'bar',
        data: collected,
        itemStyle: {
          color: '#0000ff',
          borderColor: '#333',
          borderWidth: 1,
        },
        label: {
          show: true,
          position: 'top',
        },
      },
      {
        name: 'Disbursed',
        type: 'bar',
        data: disbursed,
        itemStyle: {
          color: '#00cc00',
          borderColor: '#333',
          borderWidth: 1,
        },
        label: {
          show: true,
          position: 'top',
        },
      },
    ],
  }, {
    notMerge: false,
  });

  chartInstance.resize();
};

watch(
  () => props.data,
  () => {
    updateChart();
    // console.log("Chart data received:", JSON.stringify(props.data));
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
      data: monthLabels,
    },
    yAxis: { type: 'value' },
    series: [],
  });

  updateChart();
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
