//
//  RangeSliderTrackLayer.swift
//  RangeSlider
//
//  Created by Sujal on 3/16/19.
//  Copyright © 2019 Sujal. All rights reserved.
//

import UIKit
import QuartzCore

class RangeSliderTrackLayer: CALayer {
    
    weak var rangeSlider: RangeSlider?
    
    override func draw(in ctx: CGContext) {
        
        if let slider = rangeSlider {
            
            // Define the bounds
            
            let cornerRadius = bounds.height * slider.curvaceousness / 2.0
            
            let customBounds =  CGRect(x: bounds.minX, y: bounds.minY+5, width: bounds.width, height: 2)
            
            let path = UIBezierPath(roundedRect: customBounds, cornerRadius: cornerRadius)
            
            ctx.addPath(path.cgPath)
            
            // Fill the overall track
            
            ctx.setFillColor(slider.trackTintColor.cgColor)
            
            ctx.addPath(path.cgPath)
            
            ctx.fillPath()
            
            // Fill the selected range with desired highlight color
            
            ctx.setFillColor(slider.trackHighlightTintColor.cgColor)
            
            let lowerValuePosition = CGFloat(slider.positionForValue(value: slider.lowerValue))
            
            let upperValuePosition = CGFloat(slider.positionForValue(value: slider.upperValue))
            
            let rect = CGRect(x: lowerValuePosition, y: 0.0 + 5.0, width: upperValuePosition - lowerValuePosition, height: customBounds.height)
            
            ctx.fill(rect)
        }
    }
}

