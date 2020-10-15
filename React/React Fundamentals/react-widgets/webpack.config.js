const path = require('path');

module.exports = {
  context: __dirname,
  entry: './src/widgets.jsx',
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