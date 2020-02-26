all: cv.html cv.pdf cv.7

publish: cv.html cv.css
	doas cp cv.html cv.css /var/www/htdocs/emfa.nu/

clean:
	rm -f cv.html cv.pdf cv.7

cv.html: cv.mdoc
	mandoc -T html -O style=cv.css < cv.mdoc > $@

cv.pdf: cv.mdoc
	mandoc -T pdf < cv.mdoc > $@

cv.7: cv.mdoc
	mandoc < cv.mdoc > $@

.PHONY: all publish clean
