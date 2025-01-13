# My Notes While Learning GODOT

## Project Organization

### Style Guide
- snake_case: folders, files
- PascalCase: nodes
- third-party recourses: in a top-level `addons` folder

### .gdignore
- Prevents Godot from importing certain files
- Once the folder is ignored, resources in that folder can't be loaded anymore using the load() and preload() methods. 
- Ignoring a folder will also automatically hide it from the FileSystem dock, which can be useful to reduce clutter.
- It stays empty, instead of listing files to ignore. We ignore the entire folder.

---

## Version Control Systems

- Using Git from inside the editor is supported with an official plugin.

### Using a cloned repository
- Create a new project
- Project path should be the same as the cloned repository
- Choose a name for the project
- Choose renderer:
  - Compatibility: 2D games, all platforms, OpenGL 3, fastest renderer for 2D games
  - Mobile: Mobile games, less functionality, not needed for 2D games
  - Forward+: 3D games, only desktop, slower for 2D, more functionality
- Create & Edit

---

## Folder Structure
Godot considers that a project exists in any folder that contains a project.godot text file, even if the file is empty. The folder that contains this file is your project's root folder.

### res://
- The root of the project
- contains a project.godot file

### user://
- To store persistent data files, like the player's save or settings files
- The user:// prefix points to a different directory on the user's device
- The directory pointed at by user:// is created automatically and guaranteed to be writable to, even in an exported project.
- The location of the user:// folder depends on what is configured in the Project Settings

### addons/
- Third-party resources

### core/
- this is the main logic of the game
  - game manager: controls the game
  - common systems: score, power-ups
  - constants and settings
  - utilities

### gameplay/
- all game objects
  - ball, paddle, blocks, power-ups

### levels/
- main game scene
- different configurations of levels
- level templates

### ui/
- main menu
- HUD (heads-up display): score, lives
- pause menu
- game over screen

### assets/
- all resources
  - sprites
  - sounds
  - music
  - fonts
  - particle effects

---

## Singletons (Autoload)

The Singleton pattern is a useful tool for solving the common use case where you need to store persistent information between scenes. 
In our case, it's possible to reuse the same scene or class for multiple singletons as long as they have different names.

Using this concept, you can create objects that:
- Are always loaded, no matter which scene is currently running.
- Can store global variables such as player information.
- Can handle switching scenes and between-scene transitions.
- Act like a singleton, since GDScript does not support global variables by design.
- SEE HOW TO ADD AUTOLOAD SINGLETONS: https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html

---

## Signals

A built-in type representing a signal of an Object.

---

## Input Mapping

- Input actions are a way to abstract input events into high-level actions.

1. Project Settings -> Input Map
2. Add a new action
3. Name the action
4. Add a new event
! Snake case for the action name
! Deadzone: the minimum value for the input to be considered active