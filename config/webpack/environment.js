const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    'window.jQuery': 'jquery',
    Popper: ['popper.js', 'default'],
  })
);

// Set supported properties only
environment.config.set('node', {
  __dirname: false,
  __filename: false,
  global: true,
});

module.exports = environment;
  