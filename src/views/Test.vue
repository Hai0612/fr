<template>
  <div>
    <v-card class="mx-auto" max-width="500">
      <v-list-group no-action sub-group>
        <template v-slot:activator>
          <v-list-item-content>
            <v-list-item-title>Danh mục</v-list-item-title>
          </v-list-item-content>
        </template>
        <v-list-item-group v-model="model">
          <template v-for="(item, i) in listCategorys">
            <v-divider v-if="!item" :key="`divider-${i}`"></v-divider>

            <v-list-item
              @click="showItem(item)"
              v-else
              :key="`item-${i}`"
              :value="item"
              active-class="deep-purple--text text--accent-4"
            >
              <template v-slot:default="{ active }">
                <v-list-item-content>
                  <v-list-item-title v-text="item">
                    
                  </v-list-item-title>
                  
                </v-list-item-content>

                <v-list-item-action>
                  <v-checkbox
                    :input-value="active"
                    color="deep-purple accent-4"
                  ></v-checkbox>
                </v-list-item-action>
              </template>
            </v-list-item>
          </template>
        </v-list-item-group>
      </v-list-group>
    </v-card>

    <v-card class="mx-auto" max-width="500">
      <v-list-group no-action sub-group>
        <template v-slot:activator>
          <v-list-item-content>
            <v-list-item-title>Nhãn hiệu</v-list-item-title>
          </v-list-item-content>
        </template>
        <v-list-item-group v-model="model">
          <template v-for="(item, i) in listBrands">
            <v-divider v-if="!item" :key="`divider-${i}`"></v-divider>

            <v-list-item
              @click="showItem(item)"
              v-else
              :key="`item-${i}`"
              :value="item"
              active-class="deep-purple--text text--accent-4"
            >
              <template v-slot:default="{ active }">
                <v-list-item-content>
                  <v-list-item-title v-text="item"></v-list-item-title>
                </v-list-item-content>

                <v-list-item-action>
                  <v-checkbox
                    :input-value="active"
                    color="deep-purple accent-4"
                  ></v-checkbox>
                </v-list-item-action>
              </template>
            </v-list-item>
          </template>
        </v-list-item-group>
      </v-list-group>
    </v-card>

    <v-card class="mx-auto" max-width="500">
      <v-list-group no-action sub-group>
        <template v-slot:activator>
          <v-list-item-content>
            <v-list-item-title>Giá</v-list-item-title>
          </v-list-item-content>
        </template>
        <v-list-item-group v-model="model">
          <template v-for="(item, i) in listPrices">
            <v-divider v-if="!item" :key="`divider-${i}`"></v-divider>

            <v-list-item
              @click="showItem(item)"
              v-else
              :key="`item-${i}`"
              :value="item"
              active-class="deep-purple--text text--accent-4"
            >
              <template v-slot:default="{ active }">
                <v-list-item-content>
                  <v-list-item-title v-text="item"></v-list-item-title>
                </v-list-item-content>

                <v-list-item-action>
                  <v-checkbox
                    :input-value="active"
                    color="deep-purple accent-4"
                  ></v-checkbox>
                </v-list-item-action>
              </template>
            </v-list-item>
          </template>
        </v-list-item-group>
      </v-list-group>
    </v-card>

    <v-card class="mx-auto" max-width="500">
      <v-list-group no-action sub-group>
        <template v-slot:activator>
          <v-list-item-content>
            <v-list-item-title>Tình trạng</v-list-item-title>
          </v-list-item-content>
        </template>
        <v-list-item-group v-model="model">
          <template v-for="(item, i) in listStates">
            <v-divider v-if="!item" :key="`divider-${i}`"></v-divider>

            <v-list-item
              @click="showItem(item)"
              v-else
              :key="`item-${i}`"
              :value="item"
              active-class="deep-purple--text text--accent-4"
            >
              <template v-slot:default="{ active }">
                <v-list-item-content>
                  <v-list-item-title v-text="item"></v-list-item-title>
                </v-list-item-content>

                <v-list-item-action>
                  <v-checkbox
                    :input-value="active"
                    color="deep-purple accent-4"
                  ></v-checkbox>
                </v-list-item-action>
              </template>
            </v-list-item>
          </template>
        </v-list-item-group>
      </v-list-group>
    </v-card>
  </div>
</template>
<script>
export default {
  data: () => ({
    listCategorys: ["Trouser", "Hat", "", "Socks", "Shirt" ,"T-shirt"],
    listBrands: ["Nice", "Elvi", "Adidas", "Chanel" ,"Balenciaga"],
    listPrices: ["0 - 500.000", "Dưới 1 triệu" , "Từ 1 - 5 triệu", "Từ 5 - 10 triệu", "Trên 10 triệu"],
    listStates: ["Sản phẩm mới", "Sản phẩm cũ"],

    model: ["Carrots"],
  }),
  methods: {
    showItem(item) {
      console.log(item);
    },
  },
};
</script>