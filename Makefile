# Makefile for asterane.github.io

.PHONY: serve publish

serve: publish
	@echo "Serving..."
	bundle exec jekyll serve

publish: publish.el
	@echo "Publishing..."
	emacs --batch --load publish.el --funcall asterane-publish
	@rm -rvf *.html~
	@echo -e '---\nlayout: default\ntitle: Sitemap\n---\n' |\
	cat - sitemap.html > temp && mv temp sitemap.html

clean:
	@echo "Cleaning directory..."
	@rm -rvf *.elc
	@rm -rvf .jekyll-cache
	@rm -rvf _site
	@rm -rvf _posts
	@rm -rvf css
	@rm -rvf img
	@rm -rvf *.html*
