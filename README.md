# ISG research group website
Source code of the group web site, available on http://isg.aut.uah.es/. Based on https://github.com/dfbarrero/personal-website

Do not modify minimal-mistakes version!.

# Compilation

On Ubuntu:

1.- Install Ruby and Jekyll ```sudo apt install jekyll'''

2.- Install bundle ```sudo gem install bundler -v '2.0.1' '''

3.- Install dependencies ```bundler install'''

4.- Compile ```bundle exec jekyll build'''

5.- website available in *_site*, copy it to *ISG-UAH*

6.- You can test the website with ```bundle exec jekyll serve'''


# Usage
1. Edit the _config.yml file to customize its settings.
2. Edit the _bibliography/references.bib file and introduce your own references. BibTeX and links are automatically generated. Available fields are: 
  - webpdf: path to the PDF file (recommended assets/pdfs)
  - dataset: path to a dataset file (recommended assets/datasets)
  - url: URL to the publisher's web page
  - poster: path to a poster file (recommended assets/pdfs)
3. Edit the _data/projects to customize your projects. It is self-explained.
4. Customize the home page editting _layouts/home.html.
5. Add any new section you would need. Copy any file in _pages, and use it as template to edit your own content. Insert the navigation item in _data/navigation.yml

There are some images in assets/imgs you can use as headers. Use them at your convenience.

# Contributors
This website has been made with Jekyll and the [minimal-mistakes](https://github.com/mmistakes/minimal-mistakes) theme.
