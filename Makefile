# Makefile for asterane.github.io

.PHONY: serve publish

serve: publish
	@echo "Serving..."
	bundle exec jekyll serve --host=0.0.0.0

publish: publish.el
	@echo "Publishing..."
	emacs --batch --no-init-file --load publish.el --funcall asterane-publish
	@rm -rvf *.html~
	@rm -rvf */*.html~
#	@echo -e '---\nlayout: default\ntitle: Sitemap\n---\n' |\
#	cat - sitemap.html > temp && mv temp sitemap.html

clean:
	@echo "Cleaning directory..."
	@find org -maxdepth 1 -mindepth 1 -type d -exec basename {} \; |\
	xargs rm -rvf
	@rm -rvf .jekyll-cache
	@rm -rvf _site
	@rm -rvf *.html*
	@rm -rvf *.elc
