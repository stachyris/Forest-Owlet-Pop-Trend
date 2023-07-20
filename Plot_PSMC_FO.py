import matplotlib.pyplot as plt
import numpy as np
from matplotlib.patches import Patch

# Create the plot and set axis limits and scale
plt.figure(figsize=(10, 6))
plt.ylim(0, 30)
plt.xlim(1, 700)
plt.xscale("log")


def plot_shaded_area(start, end, color, alpha, label):
    plt.fill_between([start, end], 0, 30, color=color, alpha=alpha)
    plt.annotate(label, xy=(start, 2), xytext=(start, 25), fontsize=12,
                 ha="left", va="bottom", color="black", weight="bold")

# Add shaded areas for MDH, LGM, and LIG
plot_shaded_area(7, 5, "lightgray", 0.5, "MDH")
plot_shaded_area(26, 18, "lightblue", 0.5, "LGM")
plot_shaded_area(140, 100, "lightgreen", 0.5, "LIG")

# Read and plot data for Jungle Owlet
for i in range(101):
    path = f"final_text_output/JO_9.60_2.40.{i}.txt"
    boot_iter = np.loadtxt(path)
    ya = boot_iter[1:, 0]
    ne = boot_iter[1:, 1]
    ya_pl = ya[ya > 4999]
    ne_pl = ne[ya > 4999]
    plt.plot(ya_pl / 1000, ne_pl, color="cornflowerblue", alpha=0.1, linewidth=0.8, label="_nolegend_")

# Read and plot data for Spotted Owlet
for i in range(101):
    path = f"final_text_output/SO_9.68_2.42.{i}.txt"
    boot_iter = np.loadtxt(path)
    ya = boot_iter[1:, 0]
    ne = boot_iter[1:, 1]
    ya_pl = ya[ya > 4999]
    ne_pl = ne[ya > 4999]
    plt.plot(ya_pl / 1000, ne_pl, color="black", alpha=0.1, linewidth=0.8, label="_nolegend_")

# Read and plot data for Forest Owlet
for i in range(101):
    path = f"final_text_output/FO_15.76_3.94.{i}.txt"
    boot_iter = np.loadtxt(path)
    ya = boot_iter[1:, 0]
    ne = boot_iter[1:, 1]
    ya_pl = ya[ya > 4999]
    ne_pl = ne[ya > 4999]
    plt.plot(ya_pl / 1000, ne_pl, color="coral", alpha=0.1, linewidth=0.8, label="_nolegend_")

# Legend
legend_elements = [
    Patch(facecolor="coral", edgecolor="coral", label="Forest Owlet"),
    Patch(facecolor="cornflowerblue", edgecolor="cornflowerblue", label="Jungle Owlet"),
    Patch(facecolor="black", edgecolor="black", label="Spotted Owlet")
]
plt.legend(handles=legend_elements, loc="upper left")

# Read and plot main data for each species
jo = np.loadtxt("final_text_output/JO_9.60_2.40.0.txt")
jo_ya = jo[1:, 0]
jo_ne = jo[1:, 1]

fo = np.loadtxt("final_text_output/FO_15.76_3.94.0.txt")
fo_ya = fo[1:, 0]
fo_ne = fo[1:, 1]

so = np.loadtxt("final_text_output/SO_9.68_2.42.0.txt")
so_ya = so[1:, 0]
so_ne = so[1:, 1]

plt.plot(so_ya / 1000, so_ne, color="black", linewidth=2.5, label="Jungle Owlet")
plt.plot(jo_ya / 1000, jo_ne, color="cornflowerblue", linewidth=2.5, label="Spotted Owlet")
plt.plot(fo_ya / 1000, fo_ne, color="coral", linewidth=2.5, label="Forest Owlet")

# Set labels and title
plt.xlabel("Years ago (10^3)")
plt.ylabel("Effective Population Size (10^4)")
plt.title("Combined PSMC Results")

# Show the plot
plt.show()
