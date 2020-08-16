

## Day 36: Project 7 - Part 1

**Current Status:**  Done ✅

*https://www.hackingwithswift.com/100/swiftui/36*


## What I've learned on this day:
- The reason why `@State` *property wrapper* only works with structs. Although the values inside the class are changing under the hood, `@State` doesn't monitor those. When we modify a `Struct`, Swift was actually creating a new instance of the struct. `@State` was able to spot that change, and automatically reloaded our view. Now that we have a `Class`, that behavior no longer happens. Swift can just modify the value directly
- To monitor the changes of a class, you make a class conform to `ObservableObject` protocol. Add a `@Published` property wrapper to some properties of that class so that any views using the class get updated when they change. Create an instance of our class using the `@ObservedObject` property wrapper.
- Presenting a `sheet` which is kinda similar as when you present modally using `.sheet` modifier.
- Using `@Environment(\.presentationMode)`
- Deleting items from a list using `onDelete()` modifier. Removing items using `offsets`
- Introduction in using `UserDefaults` with SwiftUI


## Screenshots
