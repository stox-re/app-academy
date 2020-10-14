/*
  Transpilation
  Convert JSX to JS
  We use babel
*/

/*
  Needs several node packages
  babel-core
  babel-preset-react
  babel-preset-es2015
  babel-loader

  npm install --save (to update package.json)
  Preset babel in webpack.config
  Configure webpack to run files ending with .jsx through the babel loader
  Configure babel from within webpack.config.js
*/


/* Now use the latest versions:
  "@babel/core": "^7.11.6",
  "@babel/preset-env": "^7.11.5",
  "@babel/preset-react": "^7.10.4",
  "babel-loader": "^8.1.0",
  "react": "^16.13.1",
  "react-dom": "^16.13.1",
  "webpack": "^5.1.0",
  "webpack-cli": "^4.0.0"

  Create a .babelrc file with:

  {
    "presets": [
      "@babel/preset-env",
      "@babel/preset-react"
    ]
  }
*/

/* And in webpack.config.js */

const path = require('path');

module.exports = {
  context: __dirname,
  entry: './entry.jsx',
  output: {
    path: path.resolve(__dirname),
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