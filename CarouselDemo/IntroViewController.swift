//
//  IntroViewController.swift
//  CarouselDemo
//
//  Created by Cody Evol on 10/29/15.
//  Copyright © 2015 Cody Evol. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    @IBOutlet weak var tile6: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.image!.size
        scrollView.delegate = self
        
        setUpInitialPhotoStates()
    }
    
    func setUpInitialPhotoStates() {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let photos: [UIImageView] = [tile1, tile2, tile3, tile4, tile5, tile6]
        
        let yOffsets : [Float] = [-295, -410, -510, -290, -430, -515]
        let xOffsets : [Float] = [-65, 95, -105, 40, 0, -120]
        let scales   : [Float] = [1, 1.65, 1.9, 1.6, 2, 1.65]
        let rotations: [Float] = [-10, 10, 10, -10, 10, -10]
        
        let scrollOffset = Float(scrollView.contentOffset.y)
        let scrollOffsetMax = Float(573.0)
        let scrollOffsetMin = Float(-25.0)
        
        // Cap scroll offset
        var cappedOffset = scrollOffset
        
        if scrollOffset < scrollOffsetMin {
            cappedOffset = scrollOffsetMin
        } else if scrollOffset > scrollOffsetMax {
            cappedOffset = scrollOffsetMax
        } else {
            cappedOffset = scrollOffset
        }
        
        let scrollMin = CGFloat(-20)
        let scrollMax = CGFloat(568)
        
        // Transform photos
        for (i, photo) in photos.enumerate() {
            photo.transform = CGAffineTransformMakeTranslation(
                convertValue(CGFloat(cappedOffset),
                    r1Min: scrollMin,
                    r1Max: scrollMax,
                    r2Min: CGFloat(xOffsets[i]),
                    r2Max: 0),
                convertValue(CGFloat(cappedOffset),
                    r1Min: scrollMin,
                    r1Max: scrollMax,
                    r2Min: CGFloat(yOffsets[i]),
                    r2Max: 0))
            
            photo.transform = CGAffineTransformScale(photo.transform,
                convertValue(CGFloat(cappedOffset),
                    r1Min: scrollMin,
                    r1Max: scrollMax,
                    r2Min: CGFloat(scales[i]),
                    r2Max: 1),
                convertValue(CGFloat(cappedOffset),
                    r1Min: scrollMin,
                    r1Max: scrollMax,
                    r2Min: CGFloat(scales[i]),
                    r2Max: 1))
            
            photo.transform = CGAffineTransformRotate(photo.transform,
                convertValue(CGFloat(cappedOffset),
                    r1Min: scrollMin,
                    r1Max: scrollMax,
                    r2Min: CGFloat(rotations[i]),
                    r2Max: 0) * CGFloat(M_PI / 180))
        }

        

    }
    
}


