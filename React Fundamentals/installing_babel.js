/*
  npm install @babel/core @babel/preset - env @babel/preset-react babel-loader

  //webpack.config.js

  const path = require('path');

  module.exports = {
    context: __dirname,
    entry: './src/entry.jsx',
    output: {
      path: path.resolve(__dirname) + '/dist/',
      filename: 'bundle.js',
    },
    module: {
      rules: [
        {
          test: /\.jsx?$/,
          exclude: /(node_modules)/,
          use: {
            loader: 'babel-loader'
          },
        }
      ]
    },
    devtool: 'source-map',
    resolve: {
      extensions: ['.js', '.jsx', '*']
    }
  };


  // In .babelrc

  {
    "presets": [
      "@babel/preset-env",
      "@babel/preset-react"
    ]
  }

*/

