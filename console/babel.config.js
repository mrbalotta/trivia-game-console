module.exports = {
    presets: [
        ["@babel/preset-env"],
        ['@babel/preset-typescript']
    ],
    plugins: [
        ["@babel/plugin-proposal-class-properties"],
        ['babel-plugin-wildcard-import', { 
            changeExtensions: { enabled: true, extensions: { ts: 'js' } } 
        },
        ]
    ]
}