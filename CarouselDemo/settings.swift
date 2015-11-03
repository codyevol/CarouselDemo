//
//  settings.swift
//  CarouselDemo
//
//  Created by Cody Evol on 11/2/15.
//  Copyright © 2015 Cody Evol. All rights reserved.
//

import UIKit

class settings: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var closeSettings: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.image!.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func closeSettings(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
