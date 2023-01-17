# Godot Advanced Interactive Grass

https://user-images.githubusercontent.com/4955051/212629846-a7fd14d3-2c29-40dc-b2f6-67c454265f65.mp4

This is an attempt at a more complex system for interactive grass. Where many entities can influence the grass and the grass has state (the grass can stay bent for a while before correcting itself after an entity walked through it).

The implementation is based mostly on this GDC talk about God of War's grass system (the part about interactive vegetation). https://youtu.be/MKX45_riWQA

This is still pretty rough, it mostly shows the idea of the system.

* NOTE: This implementation Samples the viewport shader inside itself, which can cause undefined behaviour. This is not the correct way of doing this and should be changed. I'll see about changing this at some point.
