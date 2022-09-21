<template>
  <div class="paginating-container pagination-default" v-if="pageData.last_page > 1">
    <ul class="pagination">
      <li :class="[ ((pageData.current_page == 1) ? 'prev disabled' : 'prev') ]"  
      v-if="pageData.current_page != 1">
        <a
          :href="'?page='+pageData.current_page"
          @click.prevent="pageClicked(pageData.current_page-1)"
          aria-label="Previous"
         
        >Prev</a>
      </li>
      <li
        v-for="pageNo in range(paginateLoop, numberOfPage)"
        :class="[ ((pageData.current_page == pageNo) ? 'active' : '') ]"
        :key="pageNo+'key'"
      >
        <a :href="'?page='+pageNo" @click.prevent="pageClicked(pageNo)">{{ pageNo }}</a>
      </li>

      <li :class="[ ((pageData.current_page == pageData.last_page) ? 'disabled next' : 'next') ]"
                v-if="pageData.current_page != pageData.last_page"
        >
        <a
          :href="'?page='+pageData.current_page"
          @click.prevent="pageClicked(pageData.current_page+1)"
          aria-label="Next"

        >Next</a>
      </li>
    </ul>
  </div>
</template>

<script type="text/javascript">
import { EventBus } from "../../vue-assets";

export default {
  props: ["pageData"],

  data() {
    return {};
  },

  methods: {
    range(start, count) {
      return Array.apply(0, Array(count)).map(function(element, index) {
        return index + start;
      });
    },

    pageClicked(page) {
      this.$parent.pageClicked(page);
    }
  },

  computed: {
    paginateLoop() {
      let pageData = this.pageData;
      if (pageData.last_page > 11) {
        if (pageData.last_page - 5 <= pageData.current_page) {
          return pageData.last_page - 10;
        }
        if (pageData.current_page > 6) {
          return pageData.current_page - 5;
        }
      }
      return 1;
    },
    numberOfPage() {
      if (this.pageData.last_page < 11) {
        return this.pageData.last_page;
      } else {
        return 11;
      }
    }
  }
};
</script>

<style scoped>
/* .disabled {
		cursor: not-allowed;
	}

	.active a{

		background-color: #E3106E !important;
		color: #fff !important;
	} */
</style>