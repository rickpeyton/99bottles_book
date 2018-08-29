# 99 Bottles of OOP Recap

- [99 Bottles of OOP Recap](#99-bottles-of-oop-recap)
  - [Key Concepts](#key-concepts)
    - [TDD and Triangulation](#tdd-and-triangulation)
    - [Shameless Green](#shameless-green)
    - [When to refactor](#when-to-refactor)
    - [SOLID Design Principles](#solid-design-principles)
      - [Open-Closed Expanded](#open-closed-expanded)
    - [Refactoring](#refactoring)
      - [Refactoring Code Smells](#refactoring-code-smells)
        - [Identifying code-smells](#identifying-code-smells)
      - [Flocking Rules](#flocking-rules)
    - [Embrace Polymorphism](#embrace-polymorphism)
      - [Notes on conditionals](#notes-on-conditionals)
        - [Comparison Operators](#comparison-operators)
  - [Other bits](#other-bits)
    - [Judging Code](#judging-code)
    - [Naming](#naming)
    - [What does Good Code look like?](#what-does-good-code-look-like)
    - [DRY](#dry)
    - [Immutability](#immutability)
    - [Liskov Substitution](#liskov-substitution)

> make the change easy (warning: this may be hard), then make the easy change - Kent Beck

Strive for simplicity. Don’t abstract too soon. Focus on smells. Concentrate on difference. Take small steps. Follow the Flocking Rules. Refactor under green. Fix the easy problems first. Work horizontally. Seek stable landing points. Be disciplined. Don’t chase the shiny thing.

Deal with new requirements by first refactoring existing code to be open to them, and then writing new code to meet them. Achieving openness is usually the more challenging task, but can be sought in absolute safety if you have tests that act as a wall at your back.

You may need better tests. If so, writing them will save you money.

## Key Concepts

### TDD and Triangulation

Kent Beck describes triangulation as a way to "conservatively drive abstraction with tests." Triangulation requires writing several tests at once, which means you’ll have multiple simultaneous broken tests. The idea is to write one bit of code which makes all of the tests pass. Triangulation is meant to force you to converge upon the correct abstraction in your code.

### Shameless Green

Write the simplest code that makes the tests pass.

Shameless Green is neither clever nor changeable, it is the best initial solution to many problems.

Most programmers have a powerful urge to do more, but sometimes it's best to stop right here.

One of the biggest challenges of design is knowing when to stop, and deciding well requires making judgements about code.

You must resist being clever for its own sake... It is incumbent upon you to accept the hard task and write simpler code.

Writing Shameless Green means optimizing for understandability, not changeability, and patiently tolerating duplication if doing so will help reveal the underlying abstraction.

Think of the path to Shameless Green as running on a horizontal axis. Some changes propel you forward along this path and help you quickly reach green, while others are speculative and possibly distracting tangents in a vertical direction. You should complete the entire horizontal path before indulging in any vertical digressions.

### When to refactor

Spending time "improving" code based purely on aesthetics may not be the best use of your precious time.

A good way to know that you’re using limited time wisely is to be driven by changes in requirements. The arrival of a new requirement tells you two things, one very specific, the other more general.

Specifically, a new requirement tells you exactly how the code should change. Waiting for this requirement avoids the need to speculate about the future. The requirement reveals exactly how you should have initially arranged the code.

More generally, the need for change imposes higher standards on the affected code. **Code that never changes obviously doesn’t need to be very changeable, but once a new requirement arrives, the bar is raised. Code that needs to be changed must be changeable.**

### SOLID Design Principles

The SOLID acronym was coined by Michael Feathers and popularized by Robert Martin. Each letter stands for a well-known principle in object-oriented design. Here’s a formal definition of each one:

S - Single Responsibility
The methods in a class should be cohesive around a single purpose.

O - Open-Closed
Objects should be open for extension, but closed for modification.

L - Liskov Substitution
Subclasses should be substitutable for their superclasses.

I - Interface Segregation
Objects should not be forced to depend on methods they don’t use.

D - Dependency Inversion
Depend on abstractions, not on concretions.

If you find the above definitions less than enlightening, don’t despair. As principles are referenced in this book, plain language explanations (like the one below) will follow.

#### Open-Closed Expanded

The "open" principle says that you should not conflate the process of moving code around, of refactoring, with the act of adding new features. You should instead separate these two operations. When faced with a new requirement, first rearrange the existing code such that it’s open to the new feature, and once that’s complete, then add the new code.

### Refactoring

#### Refactoring Code Smells

The trick to successfully improving code that contains many flaws is to isolate and correct them one at a time.

Refactoring, Martin Fowler
https://www.amazon.com/Refactoring-Improving-Design-Existing-Code/dp/0201485672

Refactoring Ruby Edition, Jay Fields
https://www.amazon.com/Refactoring-Ruby-Addison-Wesley-Professional/dp/0321984137

Code Smells, Source Making
https://sourcemaking.com/refactoring/smells

Christopher Coleman's YouTube Playlist (Sandi and Katrina talks)
https://www.youtube.com/playlist?list=PLqal2KPbpmUwQurG_ixyT9pAHcesUjvJ5

Tests are the wall at your back. Successful refactorings lean on green. Therefore, you should never change tests during a refactoring. If your tests are flawed such that they interfere with refactoring, improve them first, and then refactor.

##### Identifying code-smells

Senior programmers weren’t born with magical talents. Their powerful intuition isn’t innate—it’s the result of a lifetime of coding experiments. Their present-day actions are informed by a diverse body of knowledge gained piecemeal, over time. Their deep familiarity with many varieties of code entanglements allows them to unconsciously map appropriate solutions onto common problems, often without the necessity of first writing code. They know what’s right before they do it.

The best way to figure out what will happen if you follow competing recipes is to do so. If battling this problem alone, tentatively identify Switch Statement as the code smell, look up the curative refactorings, and then, speculatively, try them all. Evaluate the results. Choose one and proceed, or revert all and try again.

#### Flocking Rules

1. Select the things that are most alike.
2. Find the smallest difference between them.
3. Make the simplest change that will remove that difference.

Changes to code can be subdivided into four distinct steps:

1. parse the new code
2. parse and execute it
3. parse, execute and use its result
4. delete unused code

As you’re following the flocking rules:

For now, change only one line at a time.
Run the tests after every change.
If the tests fail, undo and make a better change.

Keep the code in a releasable state.

If several different programmers started from Shameless Green and refactored according to the Flocking Rules everyone’s code would be identical, excepting the names used for the concepts. This has enormous value.

The truth about refactoring is that it sometimes makes things worse, in which case your efforts serve gallantly to disprove an idea. The refactoring recipes don’t promise to result in code that better expresses the problem—they merely make it easy to create that new expression, and just as easy to revert it. Proper refactoring allows you to explore a problem domain safely.

### Embrace Polymorphism

This book wants you to fall in love with polymorphism.

When you disperse behavior into polymorphic objects, you can use factories to isolate both the names of the classes and the conditionals that choose them. Factories instantiate role-playing objects, which you can then inject as dependencies.

#### Notes on conditionals

As an OO practitioner, when you see a conditional, the hairs on your neck should stand up. Its very presence ought to offend your sensibilities. You should feel entitled to send messages to objects, and look for a way to write code that allows you to do so.

There’s a big difference between a conditional that selects the correct object and one that supplies behavior. The first is acceptable and generally unavoidable. The second suggests that you are missing objects in your domain.

The cold, hard truth is that you can’t avoid conditionals. However, you can use polymorphism to create pluggable behavior, and confine conditionals to factories whose job is to select the right object. Applications so constructed are supremely amenable to change.

This willful ignorance of type is fundamental to object-oriented programming. It insulates code that calls a factory from changes of implementation within that factory. By refusing to be aware of the classes of the objects with which you interact, you grant others the freedom to alter your code’s behavior without editing its source. In the distant future, someone could amend the factory to return newly introduced players of the bottle number role, and your existing code would happily collaborate with these unanticipated objects.

If you have to check the type of an object in order to know what message to send, you’re forced into a conditional that lists every concrete class with which you’re willing to collaborate.

##### Comparison Operators

Programmers tend to blithely interchange different comparison operators, confident that if the tests pass, the code is correct. However, having tests that pass doesn’t guarantee the best expression of code, and this is a case where your choice of operator affects future costs.

Testing for equality has several benefits over the alternatives. Most obviously, it narrows the range of things that meet the condition.

Knowing that the only way to get to the true branch is by supplying an exact value makes it easier for future readers to understand the code.

This reduces the difficulty of debugging errors caused by incorrect inputs. Testing for equality also makes the code more precise, and this precision enables future refactorings.


## Other bits

### Judging Code

1. How difficult was it to write?
2. How hard is it to understand?
3. How expensive will it be to change?

Code is easy to understand when it clearly reflects the problem it's solving.

### Naming

Naming things after domain concepts improves communication between you and the folks who pay the bills. Only good can come of this.

You should name methods not after what they do, but after what they mean

If you were to ask your customer what "beer" is in the context of 99 Bottles they would not answer "beer is the beer," they would say something "Beer is the thing you drink" or "Beer is the beverage"

Name methods at one level of abstraction higher.

### What does Good Code look like?

> I like my code to be elegant and efficient

> Clean code is ... full of crisp abstractions...

> Clean code was written by someone who cares.

What does it meant to be "elegant"? What makes an abstraction "crisp"?

This lack of precision means that well-meaning programmers can hold identically high standards and still have significant disagreements about relative goodness. Thus, we argue fruitlessly about code.

### DRY

Programmers can take the DRY principle to extremes, as if they're allergic to duplication. DRY is important but if applied too early, and with too much vigor, it can do more harm than good.

**Duplication is useful when it supplies independent, specific examples of a general concept that you don’t yet understand.**

Abstractions are beneficial. They consolidate code into a single place so that it can be changed with ease. They name this consolidated code, allowing the name to be used as a shortcut for an idea, independent of its current implementation.

Abstractions tell you where your code relies upon an idea. But to get this last benefit, you must refer to an abstraction in every place where it applies.

Questions to ask yourself before drying up code

* Does the change I’m contemplating make the code harder to understand? When abstractions are correct, code is easy to understand. Be suspicious of any change that muddies the waters; this suggests an insufficient understanding of the problem.
* What is the future cost of doing nothing now? Some changes cost the same regardless of whether you make them now or delay them until later. If it doesn’t increase your costs, delay making changes. The day may never come when you’re forced to make the change, or time may provide better information about what the change should be. Either way, waiting saves you money.
* When will the future arrive, or how soon will I get more information? If you’re in the middle of writing a test suite, better information is as close as the next test. Squeezing all duplication out at the end of every test is not necessary. It’s perfectly reasonable to tolerate a bit of duplication across several tests, hoping that coding up a number of slightly duplicative examples will reveal the correct abstraction. It’s better to tolerate duplication than to anticipate the wrong abstraction.

Note: DRY is a very good idea in code, but much less useful in tests. When testing, the best choice is very often just to write it down.

### Immutability

To mutate is to change. State is "the particular condition of something at a specific time." A variable is "that which varies," or, in maths, "a quantity which admits an infinite number of values in the same expression."

Ponder the benefits of working with objects that do not change. What virtue might immutability provide, and what trouble might it avoid?

One of the best things about immutable objects is that they are easy to understand and reason about. These objects never start out one way and then secretly morph into something else. You can be confident that what you see at creation time is always what you get later.

Because they are easy to reason about, immutable objects are also easy to test. Objects that change need tests for the affected behavior. The change might be caused by a collaborating object, or triggered by a distant event, so tests could need additional collaborators, or actions triggered by apparently unrelated parts of your app. Tests for immutable objects avoid this extra setup, which makes the tests cheaper to write and easier to understand.

Another key virtue of immutable objects is that they are thread safe. Some of the most pernicious bugs in multi-threaded systems involve the inadvertent changing of shared state by different threads. These bugs are often related to the timing of thread execution, and so are notoriously difficult to reproduce, as well as costly and frustrating to debug. This class of problem is entirely avoided by immutable objects. You can’t break shared state if shared state doesn’t change.

The benefits of immutability are so great that, if it were free, you’d choose it every time.

**But what about performance?**

Complicating code in order to solve performance problems, in advance of actual data about where those problems are, raises costs and very often pays nothing in return. These guesses are almost certain to be wrong, and merely serve to harm readability and impede change.

Given this, the best programming strategy is to write the simplest code possible and measure its performance once you’re done. If the whole is not acceptably fast, profile the performance, and speed up the slowest parts. Increasing speed may require caching, but many problems can be fixed by substituting more efficient code in specific, narrow places. Once you understand precisely what’s wrong, it may be possible to fix it without caching at all.

Your goal is to optimize for ease of understanding while maintaining performance that’s fast enough. Don’t sacrifice readability in advance of having solid performance data.

**The first solution to any problem should avoid caching, use immutable objects, and treat object creation as free.**

This results in speedy development of simple code, which leaves plenty of time to identify and correct the real performance problems.

### Liskov Substitution

Liskov, in plain terms, requires that objects be what they promise they are. When using inheritance, you must be able to freely substitute an instance of a subclass for an instance of its superclass. Subclasses, by definition, are all that their superclasses are, plus more, so this substitution should always work.

The Liskov Substitution Principle also applies to duck types. When relying on duck types, every object that asserts that it plays the duck’s role must completely implement the duck’s API. Duck types should be substitutable for one another.

Liskov prohibits you from doing anything that would force the sender of a message to test the returned result in order to know how to behave.

Liskov violations force message senders to have knowledge of the various return types, and to either treat them differently, or convert them into something consistent.

The sender’s entire burden is removed if the receiver honors the contract and provides a consistent return.