# load the necessary packages
library(hexSticker) # hexSticker generator
library(magick)     # Advanced image processing
library(sysfonts)   # font selection
library(tidyverse)

# Create your first sticker------------------
pine_img <- image_read('r ladies gaborone.jpg')

fonts_dataset <- font_files()

#font_add("Old English", "OLDENGL.TTF")

sticker(
  subplot = pine_img,
  package = " ",
  s_width = 5,
  s_height = 1.2,  #change size of image in the hex
  s_x = 1.05,
  s_y = 1,   #vertical position of inside logo
  p_size = 10,
  h_fill = 'white',
  h_color = 'purple',
  h_size = 7,    #outside hex
  #url = "www.pineapples2go.com",
  u_size = 8,
  u_color = 'purple',
  spotlight = T,
  l_y = 4,
  l_x = 4,
  l_width = 0.5,
  l_height = 0.5,
  l_alpha = 1,
  p_color = 'purple',
  p_family = "Old English"
) %>% print()



ggsave("rladiesgaboronehexsticker.png", width = 12, height = 15)


