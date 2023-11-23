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
            }
        },
    },
    plugins: [],
}

