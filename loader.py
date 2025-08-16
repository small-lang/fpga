import numpy as np


raw = np.fromfile('build', dtype=np.uint16)
bit_width = 16
limit = 2 ** bit_width
pad_size = limit - len(raw)

#who doesn't like to be padded OwO
padded = np.pad(raw, (0, pad_size), mode='constant', constant_values=(0))
rendered = "\n".join([
    bin(x)[2:].rjust(16, "0")
    for x in padded
])

with open("src/prog.mem", "w") as f:
    f.write(rendered)
