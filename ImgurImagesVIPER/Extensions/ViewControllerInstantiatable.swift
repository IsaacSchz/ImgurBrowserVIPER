import UIKit

/// Protocol to be extended with implementations
protocol ViewControllerInstantiatable {}

/// Extend UIViewController to declare that it includes storyboard loading functionality
extension UIViewController : ViewControllerInstantiatable {}

/// Protocol implementation
extension ViewControllerInstantiatable where Self : UIViewController {

    /**
     Creates a new instance of the class on which this method is invoked,
     instantiated from a storyboard of the given name. If no storyboard
     name is given then a storyboard with the name of the class is used.

     - parameter storyboardNameOrNil: The name of the storyboard to load
     from, or nil to indicate the storyboard with the name of the class
     should be used.

     - returns: A new instance of the class, loaded from a storyboard.
     */
    static func loadFromStoryboard(storyboardName: String? = nil) -> Self {
        let nibName = storyboardName ?? self.className
        let storyboard = UIStoryboard(name: nibName, bundle: nil)
        return storyboard.instantiateViewController(identifier: self.className) as Self
    }

    static private var className: String {
        let className = "\(self)"
        let components = className.split{$0 == "."}.map ( String.init )
        return components.last!
    }

}
