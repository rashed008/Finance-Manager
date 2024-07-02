//
//  PieChartView.swift
//  Personal Finance Manager
//
//  Created by RASHED on 7/1/24.
//

import UIKit

struct PieChartData {
    var name: String
    var value: CGFloat
    var color: UIColor
}

class PieChartView: UIView {
    
    var data: [PieChartData] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        guard data.count > 0 else { return }
        
        let context = UIGraphicsGetCurrentContext()
        let radius = min(bounds.width, bounds.height) / 2
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        var startAngle = -CGFloat.pi / 2
        
        for segment in data {
            context?.setFillColor(segment.color.cgColor)
            let endAngle = startAngle + 2 * .pi * (segment.value / totalValue())
            context?.move(to: center)
            context?.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            context?.closePath()
            context?.fillPath()
            startAngle = endAngle
        }
        
        drawInnerCircle(center: center, radius: radius, context: context)
        drawLabels(center: center, radius: radius, context: context)
    }
    
    private func totalValue() -> CGFloat {
        return data.map { $0.value }.reduce(0, +)
    }
    
    private func drawInnerCircle(center: CGPoint, radius: CGFloat, context: CGContext?) {
        let innerRadius = radius * 0.4
        context?.setFillColor(UIColor.white.cgColor)
        context?.move(to: center)
        context?.addArc(center: center, radius: innerRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: false)
        context?.closePath()
        context?.fillPath()
    }
    
    private func drawLabels(center: CGPoint, radius: CGFloat, context: CGContext?) {
        var startAngle = -CGFloat.pi / 2
        
        for segment in data {
            let endAngle = startAngle + 2 * .pi * (segment.value / totalValue())
            let midAngle = (startAngle + endAngle) / 2
            let labelRadius = radius * 0.75
            let labelCenter = CGPoint(x: center.x + labelRadius * cos(midAngle), y: center.y + labelRadius * sin(midAngle))
            drawText(segment.name, at: labelCenter, context: context)
            startAngle = endAngle
        }
    }
    
    private func drawText(_ text: String, at point: CGPoint, context: CGContext?) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.white
        ]
        
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        let textSize = attributedString.size()
        let textRect = CGRect(x: point.x - textSize.width / 2, y: point.y - textSize.height / 2, width: textSize.width, height: textSize.height)
        attributedString.draw(in: textRect)
    }
}
