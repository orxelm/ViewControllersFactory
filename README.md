# ViewControllersFactory

## Usage
### Add you storyboards
```swift
enum ViewControllersFactoryStoryboardType: String {
    case main = "Main"
    // Add your storyboard names here
}
```

### Instantiate your ViewControllers
```swift
let someViewController: SomeViewController = ViewControllersFactory.instantiateViewController(inStoryboard: .main)
```
