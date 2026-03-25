source "https://rubygems.org"

# Jekyll core
gem "jekyll", "~> 4.3"

# SCSS/Sass support
gem "jekyll-sass-converter", "~> 3.0"

# Optional plugins (GitHub Pages supports these)
group :jekyll_plugins do
  gem "jekyll-seo-tag"
  gem "jekyll-feed"
  gem "jekyll-sitemap"
end

group :jekyll_plugins do
  gem "jekyll-fa-icons"
end

group :jekyll_plugins do
  gem "jekyll-feed"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
platforms :mingw, :x64_mingw, :mswin do
  gem "wdm"
end

