//
//  ScratchView.swift
//  SEB
//
//  Created by Jia Chen Yee on 15/6/22.
//

import Foundation
import UIKit

class ScratchView: UIView {
    
    let path = UIBezierPath()
    let shapeLayer = CAShapeLayer()
    
    var delegate: ScratchDelegate? 
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let trackedTouch = touches.first else { return }
        
        let point = trackedTouch.location(in: self)
        
        path.move(to: point)
        shapeLayer.path = path.cgPath
        
        delegate?.onScratch()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let trackedTouch = touches.first else { return }
        
        let point = trackedTouch.location(in: self)
        
        path.addLine(to: point)
        shapeLayer.path = path.cgPath
    }
    
    init() {
        super.init(frame: .zero)
        setUp()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        backgroundColor = .black
        
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 30
        
        self.layer.addSublayer(shapeLayer)
        
        self.isUserInteractionEnabled = true
        
    }
}
