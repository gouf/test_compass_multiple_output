require 'compass/import-once/activate'
# Require any additional compass plugins here.

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "stylesheets"
sass_dir = "sass"
images_dir = "images"
javascripts_dir = "javascripts"

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
# line_comments = false

preferred_syntax = :scss

#STANDARD RUBY CONFIG FILES SETTINGS FOR COMMAND LINE COMPASS WATCH
environment = :development
firesass = false

css_dir         = "css"
sass_dir        = "sass"
extensions_dir  = "sass-extensions"
images_dir      = "images"
javascripts_dir = "js"

output_style = :expanded

relative_assets = true


#PREPROS SETTINGS FOR MUTIPLE OUTPUTS
require 'fileutils'

on_stylesheet_saved do |file|
  if file.match('.min') == nil
    require 'compass'

    Compass.add_configuration(
        {
            :css_dir => "css.min",
            :sass_dir => "sass",
            :output_style => :compressed
        },
        'min' #ADDING A CONFIG REQUIRES A NAME
    )
    Compass.compiler.compile('sass/Master.scss', 'css.min/Master.css')

  end
end
