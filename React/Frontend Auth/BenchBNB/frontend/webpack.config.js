const path = require('path');

module.exports = () => {
  return {
    context: __dirname,
    entry: './bench_bnb.jsx',
    output: {
      path: path.join(__dirname, '../app/javascript/packs/'),
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
};