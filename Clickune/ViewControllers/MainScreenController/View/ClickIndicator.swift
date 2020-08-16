//
//  ClickIndicator.swift
//  Clickune
//
//  Created by Михаил Андреичев on 16.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

struct Round {
    var origin: CGPoint
    var radius: CGFloat
    var speed: CGFloat
}

final class ClickIndicator: UIView {
    
    var displayLink: CADisplayLink?
    var shapeLayer: CAShapeLayer?

    var speed: CGFloat = 0.1
    var color: UIColor = UIColor.white.withAlphaComponent(0.4)
    
    var data: [Round] = []
    
    init() {
        super.init(frame: .zero)
        startAnimating()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func clickHappend(_ origin: CGPoint) {
        data.append(Round(origin: origin, radius: 0, speed: speed))
    }
    
    private func addCirclesTo(path: CGMutablePath) {
        for index in data.indices {
            let radius = data[index].radius
            path.addEllipse(in: CGRect(
                x: data[index].origin.x - radius / 2,
                y: data[index].origin.y - radius / 2,
                width: radius, height: radius
            ))
            data[index].radius += data[index].speed
            data[index].speed += 0.1
        }
    }
    
    private func removeBigCircles() {
        data = data.filter { item in
            item.radius < frame.height
        }
    }
    
    private func startAnimating() {
        if shapeLayer != nil {
            return
        }

        let shapeLayer = CAShapeLayer(layer: layer)
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5

        layer.addSublayer(shapeLayer)

        let displayLink = CADisplayLink(
            target: self,
            selector: #selector(update)
        )
        displayLink.add(to: .main, forMode: .common)

        self.shapeLayer = shapeLayer
        self.displayLink = displayLink
    }
    
    @objc private func update() {
        let path: CGMutablePath = CGMutablePath()
        addCirclesTo(path: path)
        removeBigCircles()
        shapeLayer?.path = path
    }
}
