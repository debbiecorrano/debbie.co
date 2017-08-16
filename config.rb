::Sass.load_paths << File.join(root, "node_modules")


# Page options, layouts, aliases and proxies
# ----------------------------------------------

page '/*.xml',      layout: false
page '/*.json',     layout: false
page '/*.txt',      layout: false

set :css_dir,       'assets/stylesheets'
set :js_dir,        'assets/javascripts'
set :images_dir,    'assets/images'
set :fonts_dir,     'assets/fonts'
set :templates_dir, 'views'

set :trailing_slash, true

ignore '*/**/.gitkeep'
ignore 'assets/javascripts/application.js'
ignore 'assets/javascripts/**/*.js'
ignore 'assets/stylesheets/**/*'


# Proxy pages
# ----------------------------------------------

# Netlify _redirects file
proxy "_redirects", "/proxy-templates/netlify-redirects", ignore: true


# Extensions
# ----------------------------------------------

# Activate directory indexes
activate :directory_indexes
page "/#{config[:templates_dir]}/404.html", :directory_index => false

# Activate I18n
activate :i18n, :templates_dir => config[:templates_dir], :mount_at_root => :en_US

# Active external pipeline
activate :external_pipeline,
         name: :webpack,
         command: build? ? "npm run build:assets" : "npm run start:assets",
         source: ".tmp/webpack",
         latency: 1


# Development-specific configuration
# ----------------------------------------------
configure :development do

  # Output pretty html
  ::Slim::Engine.set_options :pretty => true

end


# Build-specific configuration
# ----------------------------------------------
configure :build do

  # Active autoprefixer
  activate :autoprefixer do |config|
    config.browsers = ['last 2 versions']
  end

  # Activate gzip
  activate :gzip

  # Minify HTML
  activate :minify_html, remove_comments: true

  # Minify CSS
  activate :minify_css

  # Add asset fingerprinting to avoid cache issues
  activate :asset_hash, ignore: [/^.*.js/]

  # Enable cache buster
  activate :cache_buster

end
