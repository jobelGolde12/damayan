<script setup>
import { onMounted } from 'vue';
import * as echarts from 'echarts';

onMounted(() => {
  const pieChart = echarts.init(document.getElementById('pieChart'));
  pieChart.setOption({
    title: {
      text: 'YEAR',
      left: 'right',
      top: 10,
      textStyle: { fontSize: 18, fontWeight: 'bold' }
    },
    tooltip: { trigger: 'item' },
    legend: { orient: 'vertical', left: 'left' },
    series: [
      {
        name: 'Fund Overview',
        type: 'pie',
        radius: '70%',
        center: ['50%', '60%'],
        data: [
          { value: 40000, name: 'Total Fund Collected', itemStyle: { color: '#0000ff' } },
          { value: 30000, name: 'Total Fund Disbursed', itemStyle: { color: '#00cc00' } },
          { value: 10000, name: 'Available Balance', itemStyle: { color: '#ffa500' } }
        ],
        label: { fontSize: 8 },
        emphasis: {
          itemStyle: {
            shadowBlur: 10,
            shadowOffsetX: 0,
            shadowColor: 'rgba(0, 0, 0, 0.5)'
          }
        }
      }
    ]
  });
});
</script>

<template>
  <div id="pieChart" style="height: 300px;" class="bg-white rounded shadow-sm p-3"></div>
</template>
