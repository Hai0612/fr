<template>
  <v-form
    ref="form"
    v-model="valid"
    lazy-validation
  >
    <v-text-field
      v-model="email"
      :counter="10"
      :rules="nameRules"
      label="Contact Information"
      required
    ></v-text-field>
    <h3>Shipping Address</h3>
    <v-row>
        <v-col cols="6">
            <v-text-field
            v-model="firstname"
            :rules="emailRules"
            label="First Name"
            required
            ></v-text-field>
        </v-col>
        <v-col cols="6">
            <v-text-field
            v-model="lastname"
            :rules="emailRules"
            label="Last Name"
            required
            ></v-text-field>
        </v-col>
    </v-row>
    <v-text-field
      v-model="company"
      :rules="emailRules"
      label="Company(optional)"
      required
    ></v-text-field>
    <v-text-field
      v-model="address"
      :rules="emailRules"
      label="Address"
      required
    ></v-text-field>
    <v-text-field
      v-model="select"
      :rules="[v => !!v || 'Item is required']"
      label="Item"
      required
    ></v-text-field>
    <v-select
      v-model="city"
      :items="items"
      :rules="[v => !!v || 'Item is required']"
      label="City"
      required
    ></v-select>
    <v-text-field
      v-model="phone"
      label="Phone(optional)"
      required
    ></v-text-field>

    <v-checkbox
      v-model="checkbox"
      :rules="[v => !!v || 'You must agree to continue!']"
      label="Do you agree?"
      required
    ></v-checkbox>

    <v-btn
      :disabled="!valid"
      color="success"
      class="mr-4"
      @click="validate"
    >
      Validate
    </v-btn>

    <v-btn
      color="error"
      class="mr-4"
      @click="reset"
    >
      Reset Form
    </v-btn>
  </v-form>
</template>
<script>
  export default {
    data: () => ({
      valid: true,
      name: '',
      nameRules: [
        v => !!v || 'Name is required',
        v => (v && v.length <= 10) || 'Name must be less than 10 characters',
      ],
      email: '',
      emailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
      ],
      select: null,
      items: [
        'Ha Noi',
        'Ho Chi Minh',
        'Da Nang',
        'Hue'
      ],
      checkbox: false,
    }),

    methods: {
      validate () {
        this.$refs.form.validate()
      },
      reset () {
        this.$refs.form.reset()
      },
      resetValidation () {
        this.$refs.form.resetValidation()
      },
    },
  }
</script>