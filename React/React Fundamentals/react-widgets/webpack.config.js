const path = require('path');
const dotenv = require('dotenv');
const webpack = require('webpack');

module.exports = () => {
  const env = dotenv.config().parsed;

  // reduce it to a nice object, the same as before
  const envKeys = Object.keys(env).reduce((prev, next) => {
    prev[`process.env.${next}`] = JSON.stringify(env[next]);
    return prev;
  }, {});

  return {
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
    },
    plugins: [
      new webpack.DefinePlugin(envKeys)
    ]
  };
};