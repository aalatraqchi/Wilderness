# Wilderness

## URL: https://www.youtube.com/watch?v=hsxekIqpdtU&ab_channel=AshrafAl-Atraqchi

### Credit:

### DevJeeper : https://www.youtube.com/@DevJeeper

### OpenGameArt : https://opengameart.org/

### MoikMellah : https://opengameart.org/users/moikmellah

### Resources: Tiled, STI, anim8, cron

At first, I was planning to make a website for my personal use, a website that would benefit me in some way. The problem with that was me not being able to come up with clear ideas
that I was sure I wanted to pursue. I ended up making a 2D platformer game with LOVE2D and Lua because it was easier for me to think of a game idea and I have much more experience
with game development. I enjoyed delving deep into gaming concepts and mechanics that exist in many games which is why I ultimately decided to do this as my final project. I first
began by testing functions and getting used to LOVE2D in the main.lua file before expanding the game much further. I then immediately made the player.lua file after getting
comfortable with LOVE then I began testing the fundamentals of what my game would be. This was mostly possible with the help of DevJeeper's tutorials on YouTube which allowed me to
move quickly and understand much more. He showed me how to code and implement most of the most fundamental aspects of a platformer and I added a twist and a bit of my own features on
top of what he taught me.

Although I wasn't exactly sure what type of platformer game it would be (levels, story, survival, etc.), I already knew that my game would be combat focused with eliminating enemies
being the primary focus. I first drew a rectangle in player.lua then programmed the movement and properties of the player before going deeper into concepts like animations. I then
built the physics world in main.lua using the built-in box_2d physics engine and created a map with collisions using the STI library and Tiled. Before moving forward, I had to now
implement the animated body of the player using the anim8 library because it was hard to visualize combat with a rectangle. I found amazing spritesheets on OpenGameArt with the
author being MoikMellah. I used his art for the player and all enemies in my game. I implemented animations for idle, walk, jump, attack, and crouch, which was made super easy to add
with the anim8 library.

I then made the first and weakest enemy, the skeleton. I made a seperate file called skeleton.lua specifically for all the features. I then made all the properties, movement, and
animations similar to the player. This is where I hit the largest road block while working on this project. I got the player and skeleton movements down, I got the animations down,
the combat seemed perfect, all was good except the damage. I could not get the player to take damage periodically with each attack from the skeleton. This required the use of timing
so I decided to use LOVE's built in getTime() function and try to get the skeleton to periodically hit and periodically deal damage to the player. This idea worked for adding
intervals between the skeleton attacking and going idle to allow for a window so that the player could time attacks when the skeleton is idle and not take any damage. However, I
could not find a way to take damage from the player or skeleton every t seconds to make the combat more fluid and realistic. Due to being stuck on that, I took a break from working
on the project, then I came back and completed other aspects of the game first. I worked on camera.lua and gui.lua, which allowed the camera to move with the player as he moved
across the map and displayed his health in the top left corner. These were much easier to implement and much more straight forward. That was the case until I found the free cron
library online that had built in functions to allow me to do exactly what I was trying to do. The cron library allowed me to update a variable that called a function every t seconds.
I then implemented the skeleton taking damage and the player taking damage using the cron.every function, then updated them in their respective combat functions so that they would
work while the skeleton and player are attacking each other. This took a lot of tweaking of the timing of animations, and taking damage when appropriate (for example, the player not
taking damage while blocking).

Finally, after a few weeks (and breaks in between) of working on the combat between the skeleton and player, I implemented the map.lua file to concatenate the loading of the maps and
allow for multiple levels based off the name of the map (1.lua, 2.lua, etc.). I created 3 more maps to make it 4 total levels and then implemented the goblin and centurion enemies
which had files nearly identical to the skeleton. The main changes to the files were the properties of the enemies (health, speed, damage) and timing of attack animations and how
frequent the player takes damage to them. I tried to make the goblin more tough than the skeleton, and the centurion the most tough to add variety in difficulty to the game.

Overall, I think this project was very successful and I am most content with the knowledge I gained on my own while working on this. I do believe it isn't the most polished game, but
I like the way I designed it for the most part. Although even the design can be improved, because adding more enemies will be more tedious, I think it is good enough to easily add
more levels and expand on the combat. I may find myself coming back to improve this project in the future, and I am very happy that I took this course and appreciate the knowledge I
received from it in less than 3 months. This Was CS50!
