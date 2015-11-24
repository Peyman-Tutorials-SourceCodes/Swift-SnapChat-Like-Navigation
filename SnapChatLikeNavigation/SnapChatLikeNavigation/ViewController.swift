//
//  ViewController.swift
//  SnapChatLikeNavigation
//
//  Created by Peyman Mortazavi on 11/24/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController, UIPageViewControllerDataSource {

    private var pages : [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        pages.append(storyboard.instantiateViewControllerWithIdentifier("VC1"))
        pages.append(storyboard.instantiateViewControllerWithIdentifier("VC2"))
        
        self.dataSource = self
        
        self.setViewControllers([pages[0]], direction: .Forward, animated: false, completion: nil)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        if let index = pages.indexOf(viewController)?.advancedBy(1) where index < pages.count {
            return pages[index]
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {

        if let index = pages.indexOf(viewController)?.advancedBy(-1) where index > -1 {
            return pages[index]
        }
        return nil
    }
    
    
}

