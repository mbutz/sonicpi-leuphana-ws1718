# How to load samples

# For Windows: convert "\" to "/"
# For Mac OSX: "/Users/[name]/..."
path = "/home/marty/projects/sonicpi/playground/audio/samples/mb/"

sample path, 0 # play the 1st sample in the directory (alphabetical order)

sample path, 1 # play the 2nd sample

sample "#{path}kick.wav"

sample path, :kick # play sample with filename "kick.wav"

# There are two samples containing the sting "cow" in the directory
# "cowbell_high. wav" and "cowbell.wav"
sample path, "cow", 0
sleep 0.5
sample path, "cow", 1
