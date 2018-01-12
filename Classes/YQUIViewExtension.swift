//
//  UIViewExtension.swift
//  UIViewExtension
//
//  Created by Wang on 2018/1/11.
//  Copyright © 2018年 Wang. All rights reserved.
//

import UIKit

@IBDesignable

class YQEdgeView: UIView {
    
    private let lineWidth = 1 / UIScreen.main.scale
    private let lineOffset = (1 / UIScreen.main.scale) / 2
    
    @IBInspectable var lineColor: UIColor = UIColor.lightGray {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var left: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var top: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var right: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var bottom: Bool = true {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        lineColor.setStroke()
        context.setLineWidth(lineWidth)
        if left {
            context.move(to: CGPoint(x: lineOffset, y: 0))
            context.addLine(to: CGPoint(x: lineOffset, y: bounds.height))
        }
        
        if top {
            context.move(to: CGPoint(x: 0, y: lineOffset))
            context.addLine(to: CGPoint(x: bounds.width, y: lineOffset))
        }
        
        if right {
            context.move(to: CGPoint(x: bounds.width - lineOffset, y: 0))
            context.addLine(to: CGPoint(x: bounds.width - lineOffset, y: bounds.height))
        }
        
        if bottom {
            context.move(to: CGPoint(x: 0, y: bounds.height - lineOffset))
            context.addLine(to: CGPoint(x: bounds.width, y: bounds.height - lineOffset))
        }
        context.strokePath()
    }
    
}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
