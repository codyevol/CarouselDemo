//
//  tutorial.swift
//  CarouselDemo
//
//  Created by Cody Evol on 11/2/15.
//  Copyright © 2015 Cody Evol. All rights reserved.
//

import UIKit

class tutorial: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var getStarted: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(1280, 568)
        scrollView.frame = CGRectMake(0, 0, 320, 568)
        scrollView.showsHorizontalScrollIndicator = false
        
        getStarted.alpha = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let currentPage = Int(round(scrollView.contentOffset.x / 320))
        pageControl.currentPage = currentPage
        
        let duration = 0.5
        if currentPage == 3 {
            UIView.animateWithDuration(duration, animations: {
                self.pageControl.alpha = 0
                self.getStarted.alpha = 1
            })
        } else {
            UIView.animateWithDuration(duration / 2, animations: {
                self.pageControl.alpha = 1
                self.getStarted.alpha = 0
            })
        }
    }
    
}
