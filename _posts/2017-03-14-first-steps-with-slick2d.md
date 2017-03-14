---
title:  "First steps with Slick2D"
date:   2017-02-17 15:33:25 +0100
#tags: jekyll update
---

Slick2D is a Java-based game engine. It provides, through a relatively simple API, all the basic features needed to succesfully develop a simple videogame. Its simplicity makes implementation of interesting games easy, but it is not so simple that hides the game architecture to the programmer. This makes Slick2D a good choice for educational purposes.

<!--
On the contrary that stat-of-the-art game engines such as Unreal or Source, Slick2D is focused on 2D games, with limited graphical capabilities among other limitations. 
//# This means that Slick2D is not a game engine suiteable for professional game development. There are several game engines designed for simplicity, like GameMaker or even Unity, they provide an IDE with simplified programming languages that make them suiteable without need of strong programming skills.

Slick2D does not provide state-of-the-art features but neither simplicity. What makes this game engine interesting is its good balance between complexity and simplicity. It is simple enought to let easy implementationg of interesting games but not so simple that hides the game architecture to the programmer. This makes Slick2D a good choice for educative purposes, but poorly prepared for high-end projects. 
-->

If you want a powerful, fully maintained, Java-based game engine, I would recommend you using [libgdx][libGDX] instead. If you prefere developing games without worry about programming, GameMaker or even Unity may be better choices.

## Slick2D documentation
Perhaps one of the most relevant problems using Slick2D is the limited availability of documentation, at least when compared with other projects. There is an [official wiki][slick2d-wiki], but it only covers some very specific features. However, there are interesting tutorials which makes worth a visit to the wiki. Another interesting resource is the [forum][slick2d-forum], which contains interesting technical discussions along with more general ones and even full videogames.

As long as I know, the only book about Slick2D is [Anatomy of a Game Engine][slick2d-book], by R. G. Badwin. This book covers all the main features needed to develop a game, and given the lack of alternatives, reading it is almost a must.

The lack of manuals makes [JavaDoc][slick2d-javadoc] one of the most valuable tools, handling it is a must when dealing with slick2D.

In my opinion, the best way to learn Slick2D is by reading code. Slick2D source code comes with a collection of demos showing the main features, and is an excellent learning resource. In order to make full use of these demos, we first need to install and set-up a development environment.

## Slick2D on NetBeans
We will use NetBeans for no real reason, the procedure that follows applies more or less unmodified to any other IDE.

1. Download and unzip Slick2D.
2. Click on "File->New project".
3. We want to import Slick2D source code into NetBeans, so select "Java proyect with Existing Sources".
4. Fill out the form with a proyect name and the project folder, which must be the root folder that contains the source code.
5. Specify which folder actually stores the source code, so select "Add Folder..." and pick-up the `src` folder. Leave test package folder empty.
6. Finish code import.

Once these steps are performed, NetBeans should contain a new project with the Slick2D source code. However, in order to be able to compile it, we must configure its libraries. Go to the project properties by right-clicking the mouse on the root project tree, select "Libraries" and add all the jar files contained in ``lib``.

There is one final step left. Slick2D depends on native code to work properly, and its location must be configured. We do that in project properties->Run; "VM Options" must contain the path to the native library, one possible configuration might be ``-Djava.library.path=.``. The exact path could be different in your computer, so be careful. 

{: .notice--warning}

Tip: Try to use a relative path instead of an absolute one, otherwise the configuration most likely will fail when used in other computer.

Testing the installation is pretty simple, just run any file contained in the package ``org.newdawn.slick.tests``. This package is quite important becauseit contains lots of extremely useful code examples.

## Slick2D programming model

One of the things I like about Slick2D is its programming model, which clearly shows how the main loop operates. All the programming model of Slick2D is based on two fundamental methods: ``update()`` and ``render()``:

- ``update()`` is invoked by the main loop each time that the game state has to be updated. This method must contain all the code needed to maintain the game state.

- ``render()`` is invoked by the main loop each time that the game has be rendered. This method must contain the code that renders the game state into a frame. The number of times this method is run per second determines the FPS.

In addition two these two methods, there is a third fundamental method, ``init()``. It is invoked one time at the beginning of the game execution, and it is usually in charge of loading all the resources needed by the game (images, sprites, sprite sheets, sound, music, etc).

The general form of a simple Slick2D game looks like the following code.

{% highlight java %}
public class MyGame extends BasicGame {
	public void init(GameContainer container) throws SlickException {
		...
	}

	public void render(GameContainer container, Graphics g) {
		...
	}

	public void update(GameContainer container, int delta) {
		...
	}
}
{% endhighlight %}

Basically, programming a Slick2D game is all about implementing those three methods. Please observe that our class must inherit from the ``BasicGame`` class, which is the one that executes all the nasty stuff (game loop, input handling, etc) behind the scenes thanks to OOP magic, making our job much more simpler.

{: .notice--primary} 

An example of a hello world in Slick2D can be found [here][slick2d-hello]. Download it into your IDE, run it and try to understand its (naïve) code.

## Recommended Slick2D demos

IMHO, the best way to understand Slick2D is exploring its rich collection of demos, located in the package ``org.newdawn.slick.tests``. One almost could program an entire videogame just by merging those demos.

In increasing complexity ordering, I would recommend to study the following demos:

- DoubleClick
- FontTest
- AnimationTest
- SoundTest
- InputTest

The following demos provide the basic skeleton to implement a complete videogame, including its states, GUI and level loading:

- GUITest
- StateBasedTest
- TileMapTest

[libgdx]: http://libgdx.badlogicgames.com/
[slick2d-site]: http://slick.ninjacave.com/
[slick2d-hello]: http://slick.ninjacave.com/wiki/index.php?title=Hello_World
[slick2d-forum]: http://slick.ninjacave.com/forum/
[slick2d-book]: https://www.google.es/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwiU5Zf8mdbSAhXos1QKHQpUC-4QFggaMAA&url=https%3A%2F%2Fcnx.org%2Fexports%2Fa0e2d2ac-7534-4994-ba68-7063820f42d6%4013.6.pdf%2Fanatomy-of-a-game-engine-13.6.pdf&usg=AFQjCNEyYID8FkV-85AA-QuFYjCVfMILmw&sig2=Dq6gy52LjeQpzuPx0KukKw
[slick2d-wiki]: http://slick.ninjacave.com/wiki/index.php?title=Main_Page
[slick2d-javadoc]: http://slick.ninjacave.com/javadoc/
