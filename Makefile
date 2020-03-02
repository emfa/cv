all: cv.html cv.pdf cv.7 cv.txt

publish: cv.html cv.css cv.7 cv.txt
	doas cp cv.html cv.css cv.7 cv.txt /var/www/htdocs/emfa.nu/

clean:
	rm -f cv.html cv.pdf cv.7 cv.txt

cv.html: cv.mdoc
	mandoc -T html -O style=cv.css < cv.mdoc > $@

cv.pdf: cv.mdoc
	mandoc -T pdf < cv.mdoc > $@

cv.7: cv.mdoc
	mandoc < cv.mdoc > $@

cv.txt: cv.7
	col -b < cv.7 > cv.txt

.PHONY: all publish clean
