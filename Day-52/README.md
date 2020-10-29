

## Day 52: Project 10 - Part 4

**Current Status:**  Done ✅

*https://www.hackingwithswift.com/100/swiftui/52*

>Every new project we work on here introduces new concepts to you in isolation and then again in the context of a real app, with the goal being that showing you the same thing twice in different circumstances helps it sink deeper into your long-term memory.
>
>But today, with our app finished, it’s time for another important part of the long-term process: a test of what you remember, and some challenges to help push you further. Like it or not, this step matters – as the astronaut John Young once said, “the greatest enemy of progress is the illusion of knowledge.”
>
>Trust me on this: knowing you understand something is way better than thinking you understand it. This is why I keep drilling the essentials into you: I want you to get so bored with Form that you could almost write this course yourself. I want you to see Codable and know exactly what it means and how it works behind the scenes, and never to think to yourself that it’s somehow magic.
>
>All these foundations we’re building here are going to last you for years, and it means everything you build on top – everything you learn or create in the future – isn’t built on top of half understanding something you read once, but is instead something you can have real, lasting confidence about.

Challenge:
- Our address fields are currently considered valid if they contain anything, even if it’s just only whitespace. Improve the validation to make sure a string of pure whitespace is invalid.
- If our call to placeOrder() fails – for example if there is no internet connection – show an informative alert for the user. To test this, just disable WiFi on your Mac so the simulator has no connection either.
- For a more challenging task, see if you can convert our data model from a class to a struct, then create an ObservableObject class wrapper around it that gets passed around. This will result in your class having one @Published property, which is the data struct inside it, and should make supporting Codable on the struct much easier.


##Screenshots:
<!-- ![App-Screenshot](documentation/1.png)
![App-Screenshot](documentation/2.png)
![App-Screenshot](documentation/3.png) -->
