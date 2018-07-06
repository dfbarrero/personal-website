# personal-website
Source code of my personal web site, available on http://atc1.aut.uah.es/~david.

# Usage
1. Edit the _config.yml file to customize its settings.
2. Edit the _bibliography/references.bib file and introduce your own references. BibTeX and links are automatically generated. Available fields are: 
  - webpdf: path to the PDF file (recommended assets/pdfs)
  - dataset: path to a dataset file (recommended assets/datasets)
  - url: URL to the publisher's web page
  - poster: path to a poster file (recommended assets/pdfs)
3. Edit the _data/projects to customize your projects. It is self-explained.
4. Delete the "Videogames" section, most likely you will not need it. Do that editing _data/navigation.yml
5. Customize the home page editting _layouts/home.html.
5. Add any new section you would need. Copy any file in _pages, and use it as template to edit your own content. Insert the navigation item in _data/navigation.yml

Test site with `bundle exec jekyll serve` and build site with `bundle exec jekyll build`.


There are some images in assets/imgs you can use as headers. Use them at your convenience.

# Contributors
This website has been made with Jekyll and the [minimal-mistakes](https://github.com/mmistakes/minimal-mistakes) theme.
