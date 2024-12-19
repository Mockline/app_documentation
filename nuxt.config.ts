
export default defineNuxtConfig({
  future: {
    compatibilityVersion: 4
  },
  modules: [
    'mockline',
    '@nuxt/content'
  ],
  devtools: { enabled: true },
  compatibilityDate: '2024-07-09',

  mdc: {
    highlight: {
      theme: {
        dark: 'github-dark',
        default: 'github-dark',
        light: 'github-dark',
      }
    },
  },


  routeRules: {
    '/getting-started/installation': { redirect: '/getting-started/installation/nuxt', prerender: false }
  },
})
