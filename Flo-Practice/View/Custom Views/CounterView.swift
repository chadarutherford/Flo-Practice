//
// CounterView.swift
// Flo-Practice
//
// Created by Chad Rutherford on 7/24/20.
// Copyright © 2020 chadarutherford. All rights reserved.
//

import UIKit

@IBDesignable
class CounterView: UIView {
	
	private struct Constants {
		static let numberOfGlasses = 8
		static let lineWidth: CGFloat = 5.0
		static let arcWidth: CGFloat = 76
		
		static var halfOfLineWidth: CGFloat {
			return lineWidth / 2
		}
	}
	
	@IBInspectable var counter: Int = 5 {
		didSet {
			if counter <= Constants.numberOfGlasses {
				setNeedsDisplay()
			}
		}
	}
	@IBInspectable var outlineColor: UIColor = .blue
	@IBInspectable var counterColor: UIColor = .orange
	
	override func draw(_ rect: CGRect) {
		let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
		let radius = max(bounds.width, bounds.height)
		let startAngle: CGFloat = 3 * .pi / 4
		let endAngle: CGFloat = .pi / 4
		
		let path = UIBezierPath(arcCenter: center,
								radius: radius / 2 - Constants.arcWidth / 2,
								startAngle: startAngle,
								endAngle: endAngle,
								clockwise: true)
		path.lineWidth = Constants.arcWidth
		counterColor.setStroke()
		path.stroke()
		
		let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
		let arcLengthPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses)
		let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
		
		let outerArcRadius = bounds.width / 2 - Constants.halfOfLineWidth
		let outlinePath = UIBezierPath(arcCenter: center,
									   radius: outerArcRadius,
									   startAngle: startAngle,
									   endAngle: outlineEndAngle,
									   clockwise: true)
		
		let innerArcRadius = bounds.width / 2 - Constants.arcWidth + Constants.halfOfLineWidth
		
		outlinePath.addArc(withCenter: center,
						   radius: innerArcRadius,
						   startAngle: outlineEndAngle,
						   endAngle: startAngle,
						   clockwise: false)
		
		outlinePath.close()
		
		outlineColor.setStroke()
		outlinePath.lineWidth = Constants.lineWidth
		outlinePath.stroke()
	}
}
