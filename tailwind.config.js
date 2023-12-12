/** @type {import('tailwindcss').Config} */
module.exports = {
    content: ["./src/**/*.{html,js}"],
    theme: {
        extend: {
            colors: {
                bleu: {
                    start: '#021B79',
                    end: '#0575E6',
                    angle: '106.92deg',
                },
            },
            backgroundImage: {
                'logo': "url('/src/assets/img/Logo.png')",
                'logo1': "url('/src/assets/img/Logo1.png')",
                'logo2': "url('/src/assets/img/Logo2.png')"
            },
        },
    },
    plugins: [],
}