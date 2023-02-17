# Automating Some Boring Stuff Examples
# Example in 'Extracting Images from PDFs'
# Suggested Python packages to use: Pillow, PyMuPDF, & OS 

# Case Usage:
#	You have a directory full of PDFs, that has TTRPG map tiles.
#	You want to extract the images from them, to build a map.
# Your PDFs images are in pixels of 2400x3000, meaning by grid overlay is
# 100x100 pixels, because I've 24x30 (see image).
# And let's keep everything organized by named folders, & use page numbers
# as image names.

###  What's inside my example directory of C:\Users\Admin\Desktop\Books
##   r"C:\Users\Admin\Desktop\Books\PZO4075 - Forest Starter Set.pdf", and more ....

# Onward to code!!

## Detailed Step-By-Step Explaination (below this is a shorthanded version, wrapped in a function)
import fitz # PyMuPDF
from PIL import Image # pillow
from os import listdir, mkdir, path # importing only what's needed from os

# we need the directory path for the PDFs
filepath_to_books = r"C:\Users\Admin\Desktop\Books"

# fetch a list of what's in the directory
 books = listdir(filepath_to_books)
 # about 60 books, each with 2 or more pages each way too much to do by hand ...

# let's iterate through list, so we don't miss anything
for filename in books:
    # I will make folders by Pazio books id, the 'PZ00000'
    new_folder = filename.split(' - ')[0]
    # let's make a directory name
    new_dir = path.join(filepath_to_books, new_folder)
    # make a new sub-directory in main folder of filepath_to_books
    mkdir(new_dir)
    # Now let's open the book
    book = fitz.open(path.join(filepath_to_books, filename))
    # With the specific book opened, let's iterate through the pages
    for page in book:
        # let's get the image raw data
        pix = page.get_pixmap()
        # we'll convert it to a PNG image, but neead to get a filename for it
        # so, since each book has pages, we'll use page number as reference
        img_filename = f"page_{page.number}.png"
        # extracting the actual image from byte code, standard is RGB (red, green, blue) format
        image = Image.frombytes("RGB", (pix.width, pix.height), pix.samples)
        # I want this to be 50x50 pixels, which means I need to resize my image by 50%
        # current width & height is (2400, 1500)
        image = image.resize((1200, 1500))
        # Now let's save this image in the correct folder as a PNG image type
        image.save(path.join(new_dir, img_filename), "PNG")
        # and we're done with that page, if there's another page it will go to next
        # if there's no more pages, we'll head on to the next book
    # but before we go to the next book, good practice to close out the current one
    book.close()
    # Now this will cycle to next book    


## Putting it altogether in function, because I want to be lazily efficent in shorthand
import fitz # PyMuPDF
from PIL import Image # pillow
from os import path, listdir, mkdir # importing only what's needed from os

def extract_imgs(dir_path:str, resize_to:list[int, int], sep=' ') -> None:
    bks = listdir(dir_path)
    for bk in bks:
        newDir = path.join(dir_path, bk.split(sep)[0])
        mkdir(newDir)
        doc = fitz.open(path.join(dir_path, bk))
        for pg in doc:
            pix = pg.get_pixmap()
            fn_img = f"page_{pg.number}.png"
            img = Image.frombytes("RGB", (pix.width, pix.height), pix.samples)
            if not isinstance(resize_to, type(None)):
                img = img.resize(resize_to)
            img.save(path.join(newDir, fn_img), 'PNG')
        doc.close()

# Usage (w/example) will look like :: extract_imgs(r"C:\Users\Admin\Desktop\Books", (1200, 1500), ' - ')
