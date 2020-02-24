cv.html: cv.mdoc
	mandoc -T html < cv.mdoc > $@

cv.pdf: cv.mdoc
	mandoc -T pdf < cv.mdoc > $@

cv.7: cv.mdoc
	mandoc < cv.mdoc > $@

all: cv.html cv.pdf cv.7

clean:
	rm -f cv.html cv.pdf cv.7

.PHONY: all clean
