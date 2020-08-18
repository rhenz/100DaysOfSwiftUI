

## Day 37: Project 7 - Part 2

**Current Status:**  Done ✅

*https://www.hackingwithswift.com/100/swiftui/37*


## What I've learned on this day:
- Building a `List` where you can delete an item
- Working with `Identifiable` items. Therefore in using `ForEach`, I no longer need to tell which property to use for the identifier. Therefore you can omit the `id` parameter

```
ForEach(expenses.items, id: \.id) { item in
    Text(item.name)
}
```

ForEach(expenses.items) { item in
    Text(item.name)
}

- Sharing an `Observed Object` to a new view
- Using UserDefaults to save objects as Data with the help of `Codable` protocol


## Screenshots
