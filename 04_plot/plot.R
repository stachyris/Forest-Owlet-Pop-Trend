# Load necessary libraries
library(ggplot2)
library(scales)

# Set working directory
setwd("Robin_Lab_stuff/FO_PSMC")

# Function to read PSMC data
read_psmc_data <- function(prefix, indices) {
  data_list <- lapply(indices, function(i) {
    path <- paste0(prefix, i, ".txt")
    boot.iter <- read.table(path)
    data.frame(year = boot.iter[-1, 1], Ne = boot.iter[-1, 2], iteration = as.factor(i))
  })
  do.call(rbind, data_list)
}

# Read data for Jungle Owlet (JO), Spotted Owlet (SO), and Forest Owlet (FO)
jo_data <- read_psmc_data("JO/JO1_aut-8c-combined.", 0:100)
so_data <- read_psmc_data("SO/SOT_aut-8c-combined.", 0:100)
fo_data <- read_psmc_data("FO/FO_100x_combined.", 0:100)

# Combine data for legend
legend_data <- rbind(
  data.frame(label = "Forest Owlet", color = "coral3"),
  data.frame(label = "Jungle Owlet", color = "cornflowerblue"),
  data.frame(label = "Spotted Owlet", color = "black")
)

# Read and add main lines for each data group
jo_main <- read.table("JO/JO1_aut-8c-combined.0.txt")
so_main <- read.table("SO/SOT_aut-8c-combined.0.txt")
fo_main <- read.table("FO/FO_100x_combined.0.txt")

# Plotting
p <- ggplot() +
  geom_line(data = jo_data, aes(x = year/1000, y = Ne, group = iteration, color = "Jungle Owlet"), 
            alpha = 0.1, size = 0.8) +
  geom_line(data = so_data, aes(x = year/1000, y = Ne, group = iteration, color = "Spotted Owlet"), 
            alpha = 0.1, size = 0.8) +
  geom_line(data = fo_data, aes(x = year/1000, y = Ne, group = iteration, color = "Forest Owlet"), 
            alpha = 0.1, size = 0.8) +
  geom_line(data = jo_data[1, , drop = FALSE], aes(x = year/1000, y = Ne, color = "Jungle Owlet"), size = 2.5) +
  geom_line(data = so_data[1, , drop = FALSE], aes(x = year/1000, y = Ne, color = "Spotted Owlet"), size = 2.5) +
  geom_line(data = fo_data[1, , drop = FALSE], aes(x = year/1000, y = Ne, color = "Forest Owlet"), size = 2.5) +
  geom_line(data = jo_main, aes(x = V1/1000, y = V2), color = "cornflowerblue", size = 1.0) +
  geom_line(data = so_main, aes(x = V1/1000, y = V2), color = "black", size = 1.0) +
  geom_line(data = fo_main, aes(x = V1/1000, y = V2), color = "coral3", size = 1.0) +
  scale_x_log10(limits = c(5,500)) +
  scale_y_continuous(limits = c(0, 50)) +
  labs(
    x = "Years Ago (10^3)",
    y = "Effective Population Size (10^4)"
  ) +
  theme_transparent() +
  theme(
    legend.position = c(0.9, 0.9),
    legend.title = element_blank()
  ) +
  geom_vline(xintercept = c(6, 22, 120), linetype = "dashed", color = "darkgrey") +
  annotate("text", x = 119.85, y = 48, label = "LIG", size = 5) +
  annotate("text", x = 21.63997, y = 48, label = "LGM", size = 5) +
  annotate("text", x = 5.928641, y = 48, label = "MDH", size = 5) +
  scale_color_manual(values = legend_data$color, labels = legend_data$label) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16),
    axis.title = element_text(size = 14),
    axis.text = element_text(size = 12),
    legend.text = element_text(size = 12),
    legend.key.size = unit(1, "cm")
  )

p
ggsave("FO_PSMC.pdf", plot = p, dpi = 600, width = 11.69 , height = 8.27, units = "in")
ggsave("FO_PSMC.jpg", plot = p, dpi = 600, width = 11.69 , height = 8.27, units = "in")
ggsave("FO_PSMC.tiff", plot = p, dpi = 600, width = 11.69 , height = 8.27, units = "in")
