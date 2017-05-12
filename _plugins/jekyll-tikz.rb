# Authored my Maxfan http://github.com/Maxfan-zone http://maxfan.org
# This is used to convert tikz code into svg file and load in you jekyll site
#
# Install:
#
#   1. Copy this file in your _plugins/ directory. You can customize it, of course.
#   2. Make sure texlive and pdf2svg are installed on your computer.
#
# Input:
#   
#   {% tikz filename %}
#     \tikz code goes here 
#   {% endtikz %}
#
# This will generate a /img/post-title-from-filename/filename.svg in your jekyll directory
# 
# And then return this in your HTML output file:
#   
#   <embed src="/img/post-title-from-filename/tikz-filename.svg" type="image/svg+xml" />
#   
# Note that it will generate a /_tikz_tmp directory to save tmp files.

#
# Modified by David F. Barrero http://github.com/dfbarrero
#

module Jekyll
  module Tags
    class Tikz < Liquid::Block
      def initialize(tag_name, markup, tokens)
        super

        @file_name = markup.split('|')[0].strip!
        libraries = markup.split('|')[1].strip!
        parameters = markup.split('|')[2].strip!
        
#        system("echo --- filename: #{@file_name}")
#        system("echo --- libraries: #{libraries}")
#        system("echo --- parameters: #{parameters}")

        @header = <<-'END'
        \documentclass{standalone}
        \usepackage{tikz}
        \usepackage{pgfplots}
        END
        
        if libraries.length != 0
            @header = @header + "\\usetikzlibrary{#{libraries}}"
        end

        @header += <<-'END'
        \begin{document}
        \begin{tikzpicture}
        END

        @header = @header + "[" + parameters + "]"

        @footer = <<-'END'
        \end{tikzpicture}
        \end{document}
        END
      end

      def render(context)
        tikz_code = @header + super + @footer

        baseurl = context["site"]["baseurl"]
        prefix = "tizk_img"

        tmp_directory = File.join(Dir.pwd, "_tikz_tmp", File.basename(context["page"]["url"], ".*"))
        tex_path = File.join(tmp_directory, "#{@file_name}.tex")
        pdf_path = File.join(tmp_directory, "#{@file_name}.pdf")
        FileUtils.mkdir_p tmp_directory

        dest_directory = File.join(Dir.pwd, prefix, File.basename(context["page"]["url"], ".*"))
        dest_path = File.join(dest_directory, "#{@file_name}.svg")
        FileUtils.mkdir_p dest_directory

        #system("echo tmp_directory:  #{tmp_directory}")
        #system("echo dest_path: #{dest_path}")

        # if the file doesn't exist or the tikz code is not the same with the file, then compile the file
        if !File.exist?(tex_path) or !tikz_same?(tex_path, tikz_code) or !File.exist?(dest_path)
          File.open(tex_path, 'w') { |file| file.write("#{tikz_code}") }
          system("pdflatex -output-directory #{tmp_directory} #{tex_path}")
          system("pdf2svg #{pdf_path} #{dest_path}")
        end
  
        web_dest_path = File.join(baseurl, prefix, File.basename(context["page"]["url"], ".*"), "#{@file_name}.svg")
        "<embed src=\"#{web_dest_path}\" type=\"image/svg+xml\" />"
      end

      private

      def tikz_same?(file, code)
        File.open(file, 'r') do |file|
          file.read == code
        end
      end

    end
  end
end

Liquid::Template.register_tag('tikz', Jekyll::Tags::Tikz)
