extract pages
-------------

    pdftk full.pdf cat 12-15 output extract.pdf

rotate all pages
----------------

    pdftk 2020-02-06_204954.pdf rotate 1-3down output  2020-02-06_204954_rotated.pdf

    (page numbers seem to be mandatory, it tells them when using 0..9999 or similar)
