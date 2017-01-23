//
//  ViewControllersFactory.swift
//
//  Created by Or Elmaliah on 07/01/2017.
//  Copyright © 2017 Or Elmaliah. All rights reserved.
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

enum ViewControllersFactoryStoryboardType: String {
    case main = "Main"
    case reportFlow = "ReportFlow"
}

final class ViewControllersFactory: NSObject {
    
    static func instantiateViewController<T: UIViewController>(inStoryboard type: ViewControllersFactoryStoryboardType) -> T where T: StoryboardIdentifiable {
        
        let storyboard = UIStoryboard(name: type.rawValue, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
}

