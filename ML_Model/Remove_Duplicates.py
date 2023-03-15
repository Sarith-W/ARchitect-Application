from PIL import Image
import os
import imagehash

# Set the directory containing the images
directory = "/Users/sarithwijesundera/Downloads/full_dataset/organized_furniture"

# Create an empty dictionary to store the image hashes
hashes = {}

# Iterate over each file in the directory
for filename in os.listdir(directory):
    # Check that the file is an image
    if filename.endswith(".jpg") or filename.endswith(".jpeg") or filename.endswith(".png"):
        # Open the image and calculate its hash
        with Image.open(os.path.join(directory, filename)) as img:
            hash = imagehash.average_hash(img)
        # Check if the hash is already in the dictionary
        if hash in hashes:
            # If the hash is a duplicate, delete the file
            os.remove(os.path.join(directory, filename))
            print("Removed duplicate image:", filename)
        else:
            # If the hash is not a duplicate, add it to the dictionary
            hashes[hash] = filename

print("Done!")

#%%
