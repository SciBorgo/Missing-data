library(magick)
library(tibble)
library(gt)
library(tidyr)

player_table_implicit <- tibble::tribble(
  ~Player,    ~Quarter,   ~Goals,
  "Coleman",   1,         0,
  "Coleman",   2,         1,
  "Coleman",   3,         2,
  "Coleman",   4,         0,
  "Koenen",    1,         1,
  "Koenen",    3,         2
)

player_table_explicit <- player_table_implicit %>% 
  pivot_wider(id_cols = Player,
              names_from = Quarter,
              values_from = Goals)

gt(player_table_implicit) %>% 
  gtsave("paper/figures/implicit.png")

gt(player_table_explicit) %>% 
  tab_style(
    style = cell_fill(color = "lightblue"),
    locations = cells_body(
      columns = vars(`2`,`4`),
      rows = is.na(`2`) | is.na(`4`)
    )
  ) %>% 
  gtsave("paper/figures/explicit.png")

img_implicit <- image_read("paper/figures/implicit.png")
img_explicit <- image_read("paper/figures/explicit.png")
img_arrow <- image_read("paper/figures/arrow.png")

img_tables <- 
image_append(c(img_implicit, 
               {image_scale(img_arrow, "10%") %>% 
                   image_border("white", geometry = "50x220x50x50")
                 },
               image_border(img_explicit, "white", geometry = "0x142+0+0")))

image_write(img_tables, "paper/figures/tables.png")
