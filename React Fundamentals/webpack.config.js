// webpack.config.js
// NB: For Rails projects, make sure to locate your bundle.js file in
// app/assets/javascripts so that it's included in the Rails asset pipeline.

var path = require('path');

module.exports = {
  entry: "./frontend/my_app.jsx",
  output: {
      path: path.resolve(__dirname, 'app', 'assets', 'javascripts'),
      filename: "bundle.js"
  },
  devtool: 'source-map',
  resolve: {
    extensions: ['.js', '.jsx', '*']
  }
};

/*
 webpack.config.js accepts a devtool key that can be used to enable useful tools,
 particularly source-map. A source map makes it possible for you to see the line numbers
  of your original source code when errors are raised. This is generally not possible because your bundle.js
   does not maintain the line numbers from the files it is bundling.

*/

/* Sample webpack config */
// webpack.config.js

var path = require('path');

module.exports = {
  entry: './frontend/entry.jsx',
  output: {
    filename: './bundle.js',
  },
  module: {
    rules: [
      {
        test: [/\.jsx?$/],
        exclude: /(node_modules)/,
        use: {
          loader: 'babel-loader',
          query: {
            presets: ['@babel/env', '@babel/react']
          }
        },
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    extensions: ['.js', '.jsx', '*']
  }
};