//
//  ViewController.swift
//  RangeSlider
//
//  Created by Sujal on 3/16/19.
//  Copyright © 2019 Sujal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let rangeSlider = RangeSlider(frame: CGRect.zero)
    
    @IBOutlet weak var viewForRangeSlider: UIView!
    
    @IBOutlet weak var labelAgeRange: UILabel!
    
    override func viewDidLayoutSubviews() {
        rangeSlider.frame = CGRect(x: 0, y: 5, width: viewForRangeSlider.frame.width, height: viewForRangeSlider.frame.height)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        labelAgeRange.text = "18 - 60 years"
        
        rangeSlider.trackHighlightTintColor = UIColor.red
        rangeSlider.curvaceousness = 5.0
        
        rangeSlider.lowerValue = 18
        rangeSlider.upperValue = 60
        
        rangeSlider.minimumValue = 18
        rangeSlider.maximumValue = 60
        
        viewForRangeSlider.addSubview(rangeSlider)
        
        rangeSlider.addTarget(self, action: #selector(ageRangeChanged), for: .allTouchEvents)
    }

    @objc func ageRangeChanged() {
        labelAgeRange.text = "\(String(Int(rangeSlider.lowerValue))) - \(String(Int(rangeSlider.upperValue))) years"
    }

}

