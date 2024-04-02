/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/Views/templates/**/*.{html,js,tpl}"],
  theme: {
    extend: {
      colors:{
        'primary':'#11151c',
        'secundary':'#364156', 
        'terciary':'#7d4e57',
        'cuaternary':'#347CBC',        
      },
      opacity: ['hover'],
      transitionProperty: ['hover'],
      
    },
    
    
  },
  plugins: [],
}

