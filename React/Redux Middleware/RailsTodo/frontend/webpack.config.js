const path = require('path');

module.exports = () => {
  return {
    context: __dirname,
    entry: './frontend/todo_redux.jsx',
    output: {
      path: path.join(__dirname, '../app/assets/javascripts/'),
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