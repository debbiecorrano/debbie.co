const path = require('path');
const webpack = require('webpack');
const CleanWebpackPlugin = require('clean-webpack-plugin');

module.exports = (options) => ({
  entry: {
    application: './source/assets/javascripts/application.js',
  },
  output: {
    path: __dirname + '/.tmp/webpack',
    filename: 'assets/javascripts/[name].bundle.js',
  },
  module: {
    loaders: [
      {
        test: /source\/assets\/javascripts\/.*\.js$/,
        exclude: /node_modules|\.tmp/,
        loader: 'babel-loader',
        query: {
          compact: false,
          presets: ['es2015'],
        }
      }
    ]
  },
  plugins: [
    new CleanWebpackPlugin(['.tmp']),
    new webpack.DefinePlugin({
      __DEVELOPMENT__: JSON.stringify(JSON.parse(process.env.NODE_ENV === 'development' || false)),
      __PRODUCTION__: JSON.stringify(JSON.parse(process.env.NODE_ENV === 'production' || false)),
    })
  ],
  stats: {
    colors: true
  },
  devtool: 'source-map'
});
