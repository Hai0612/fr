<template>
  <div>
    <v-card
    class="mx-auto"
    max-width="400"
  >
    <v-list>
      <v-list-item-group
        active-class="border"
        color="indigo"
      >
      <v-subheader>Danh Mục</v-subheader>
        <v-list-item
          v-for="(item, i) in listCategorys"
          :key="i"
        >
          <v-list-item-icon>
            <v-icon v-text="item.icon"></v-icon>
          </v-list-item-icon>

          <v-list-item-content @click="showByCategory(item.text)">
            <v-list-item-title v-text="item.text"></v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list-item-group>
    </v-list>
  </v-card>

  <v-card
    class="mx-auto"
    max-width="400"
  >
    <v-list>
      <v-list-item-group
        active-class="border"
        color="indigo"
      >
      <v-subheader>Giá</v-subheader>

        <v-list-item

          v-for="(item, i) in listPrices"
          :key="i+5"
        >
          <v-list-item-icon>
            <v-icon v-text="item.icon"></v-icon>
          </v-list-item-icon>

          <v-list-item-content @click="showByPrice(item.text)">
            <v-list-item-title v-text="item.text"></v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list-item-group>
    </v-list>
    
  </v-card>

 <v-card
    class="mx-auto"
    max-width="400"
  >
    <v-list>
      <v-list-item-group
        mandatory
        color="indigo"
      >
      <v-subheader>Nhãn hiệu</v-subheader>

        <v-list-item

          v-for="(item, i) in listBrands"
          :key="i+5"
        >
          <v-list-item-icon>
            <v-icon v-text="item.icon"></v-icon>
          </v-list-item-icon>

          <v-list-item-content @click="showByBrand(item.text)">
            <v-list-item-title v-text="item.text"></v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list-item-group>
    </v-list>
    
  </v-card>

   <v-card
    class="mx-auto"
    max-width="400"
  >
    <v-list>
      <v-list-item-group
        mandatory
        color="indigo"
      >
      <v-subheader>Tình trạng</v-subheader>

        <v-list-item

          v-for="(item, i) in listStates"
          :key="i+5"
        >
          <v-list-item-icon class="v-list-item__icon">
            <v-icon v-text="item.icon"></v-icon>
          </v-list-item-icon>

          <v-list-item-content @click="showByState(item.text)">
            <v-list-item-title v-text="item.text"></v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list-item-group>
    </v-list>
    
  </v-card>

  </div>
  
</template>
<script>
  export default {
    data: () => ({
      listCategorys: [
        {
          icon: 'mdi-assistant',
          text: 'Trouser',
        },
        {
          icon: 'mdi-assistant',
          text: 'Hat',
        },
        {
          icon: 'mdi-assistant',
          text: 'Socks',
        },
        {
          icon: 'mdi-assistant',
          text: 'Shirt',
        },
        {
          icon: 'mdi-assistant',
          text: 'T-shirt',
        },
      ],
        listBrands: [
        {
          icon: 'mdi-source-branch',
          text: 'Adidas',
        },
        {
          icon: 'mdi-source-branch',
          text: 'Nike',
        },
        {
          icon: 'mdi-source-branch',
          text: 'Louis Vuitton',
        },
        {
          icon: 'mdi-source-branch',
          text: 'Dolce&Gabanna',
        },
        {
          icon: 'mdi-source-branch',
          text: 'Louis Vuitton',
        },
        {
          icon: 'mdi-source-branch',
          text: 'Gucci',
        },
        {
          icon: 'mdi-source-branch',
          text: 'Zara',
        },
        {
          icon: 'mdi-source-branch',
          text: 'Chanel',
        },
      ],
      listPrices: [
        {
          icon: 'mdi-alert-circle',
          text: "0 - 500.000",
        },
        {
          icon: 'mdi-alert-circle',
          text: "Từ 500.000 - 1 triệu",
        },
        {
          icon: 'mdi-cart',
          text: "Từ 1 - 5 triệu",
        },
        {
          icon: 'mdi-cart',
          text: "Từ 5 - 10 triệu",
        },
        {
          icon: 'mdi-cart',
          text: "Trên 10 triệu",
        },
      ],
      listStates: [
        {
          icon: 'mdi-source-branch',
          text: "Sản phẩm mới",
        },
        {
          icon: 'mdi-wifi',
          text: "Sản phẩm cũ",
        },
      ]
    }),
    methods: {
      hello(item){
        console.log(item)
      }
    }
  }
</script>
<style lang="scss" scoped>
.border {
  border: 2px dashed orange;
}
.v-list-item__icon{
  margin: 13px 0px;
}
</style>