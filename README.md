# HowTos
A Collection of How To with Python for Windows Users

## Sections
- Very Useful Sites
- Convert PDF pages to Image (helpful for TTRPG storytellers)
- Windows CLI Reference

### Very Useful Sites
- [PyMuPDF](https://pymupdf.readthedocs.io/en/latest/)
- [Pillow](https://pillow.readthedocs.io/en/stable/)
- [Python Docs](https://docs.python.org/3/howto/index.html)
- [Windows CLI Help](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)

### Convert PDF pages to Image (helpful for TTRPG storytellers)
So, let's say you are a DM/GM/Storyteller for your new TTRPG (tabletop top roleplaying game) group.
You just bought a whole bunch of books (PDFs format) that has some nice game tiles you want to use.
Here's a way, we can automate some of the boring & tedious tasks a DM faces when having to sort a huge 
digitized collection of material to use as their storytelling aids. We'll do it with Python ;) 
[Skip to code](https://github.com/DracoDaine/HowTos/blob/main/pdf_to_image.py)

#### Nifty Outside Modules to use (What I will specifically use this):
- [PyMuPDF](https://pymupdf.readthedocs.io/en/latest/)
- [Pillow](https://pillow.readthedocs.io/en/stable/) <br />
And we'll need a tried and true core python module
- [OS](https://docs.python.org/3/library/os.html)

#### Investigate some things
- I know the pages of my [Pazio Pathfinder](https://paizo.com/pathfinder) tile PDFs are:
    - Divided by grid lay in on the page itself, it's 24 by 30 squares (see reference example below) <br />
*NOTE* **I added a watermark to image, this is only for a visual example, please support Pazio's Pathfinder TTRPG** <br />
<img src="https://user-images.githubusercontent.com/121499635/219536090-b1420fc3-1cb2-4381-9a9c-c2fe37a47bb1.png" width=25% height=25%> <br />
- I want my end result to be, 50 by 50 pixels per square, but how big are the PDfs pages? Time for some code ...

#### In the Python Shell <br />
```
# Good Practice to Investigate with Code
import fitz # the PyMuPDF call sign

# make a var for filepath
filepath = r'C:\Users\Admin\Desktop\book.pdf'

# open a PDF
document = fitz.open(filepath)

# use list comprehension to grab all the pixel data of each page in order
pix_pages = [pix for page in document if (pix:=pg.get_pixmap())]

# see if we get a common width & height of a page from using the 1st as a example
width, height = pix_pages[0].get_width, pix_pages[0].get_height

# list comprehension w/booleans to check all pages width & height are equal
print(all([True if pix.get_width == width and pix.get_height == height else False for pix in pix_pages]))

# the above prints True, so now that I know they pages are equal to each other
# print values of width and height to shell
print(width, height) # Results :: (2400, 3000)

# What's my current square dimensions?
print(width/24, height/30) # Results :: (100, 100)
# Since 50 fits in 100 nice and evenly, I'll just note that we need to divide by 2 from original size of page

# Always close what you open
document.close()
```
[Moving on to Main code](https://github.com/DracoDaine/HowTos/blob/main/pdf_to_image.py)

### Windows CLI Reference
- [The Code](https://github.com/DracoDaine/HowTos/blob/main/WinCLI_refresher.bat)
