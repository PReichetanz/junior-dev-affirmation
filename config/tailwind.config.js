const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
      colors: {
        "blue-dark": "#22577A",
        "blue-medium": "#38A3A5",
        "green-dark": "#57CC99",
        "green-medium": "#80ED99",
        "green-light": "#C7F9CC",
      },
      boxShadow: {
        "green-light": "0.3px 0.5px 0.7px hsl(126, 81, 88 / 0.36), 0.8px 1.6px 2px -0.8px hsl(126, 81, 88 / 0.36), 2.1px 4.1px 5.2px -1.7px hsl(126, 81, 88 / 0.36), 5px 10px 12.6px -2.5px hsl(126, 81, 88 / 0.36);"
      }
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
  ],
};
