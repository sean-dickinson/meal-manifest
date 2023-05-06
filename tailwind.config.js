module.exports = {
    content: [
        './app/views/**/*.{html,html.erb,erb}',
        './app/views/devise/**/*.{html,html.erb,erb}',
        './app/frontend/components/**/*.{js,ts}',
        './app/frontend/**/*.{js,ts}',
        './app/**/*.{js,ts}',
    ],
    theme: {
        container: {
            center: true,
            padding: '2rem',
        },
    },
    daisyui: {
        themes: ["night"]
    },
    plugins: [
            require("@tailwindcss/typography"),
            require("daisyui"),
        ]
}