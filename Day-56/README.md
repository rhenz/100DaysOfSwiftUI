

## Day 56: Project 11 - Wrap Up

**Current Status:**  Done ✅

*https://www.hackingwithswift.com/100/swiftui/56*

>Congratulations on finishing another SwiftUI project! With technologies like Core Data at your side, you’re now capable of building some serious apps that interact with the user and – most importantly – remember what they entered. Although we only scratched the surface or Core Data, it’s capable of a lot more and I expect Apple to keep expanding the link between Core Data and SwiftUI in future updates. In the meantime, the very next project focuses deeply on Core Data – there’s lots to explore!
>
>As for the other things you learned, you’ve now almost met the full set of SwiftUI’s property wrappers, and I hope you’re getting a sense for which one to choose and when. @Binding is particularly useful when building custom UI components, because its ability to share data between views is just so useful.
>
>There’s one last thing I’d like to leave you with, and it’s something you might not even have noticed. When we built a star rating component, we created something that became a user-interactive control just like Button and Slider. However, we didn’t stop to consider how it works with accessibility and that’s a problem: Button, Slider, and others work great of the box, but as soon as we start creating our own components we need to step in and do that work ourselves.
>
>Building apps that are accessible for everyone is something everyone needs to take seriously, which is why I’ve dedicated a whole technique project to it in the future – we’re going to be looking back at the previous projects we’ve made and seeing how we can improve them.

## Challenge
- Right now it’s possible to select no genre for books, which causes a problem for the detail view. Please fix this, either by forcing a default, validating the form, or showing a default picture for unknown genres – you can choose.
- Modify ContentView so that books rated as 1 star have their name shown in red.
- Add a new “date” attribute to the Book entity, assigning Date() to it so it gets the current date and time, then format that nicely somewhere in DetailView.


##Screenshots:
<!-- ![App-Screenshot](documentation/1.png) -->
