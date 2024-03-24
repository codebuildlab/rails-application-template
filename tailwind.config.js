const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  theme:{
    fontFamily:{
      'sans': ["Open Sans", ...defaultTheme.fontFamily.sans],
      // 'roboto': ['Roboto', ...defaultTheme.fontFamily.sans],
      // 'poppins': ['Roboto', ...defaultTheme.fontFamily.sans]
    }    
  },
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ]
}
