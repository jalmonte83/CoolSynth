//
//  KeyboardView.swift
//  CoolSynth
//
//  Created by Jeffrey Almonte on 2/24/19.
//  Copyright © 2019 Jeffrey Almonte. All rights reserved.
//

import UIKit
import AudioKitUI

@IBDesignable public class CoolKeyboardView: UIView {
    
    @IBInspectable open var octaveCount: Int = 1
    
    @IBInspectable open var firstOctave: Int = 1 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var coolKeyboard: AKKeyboardView = {
        let kbv = AKKeyboardView()
        kbv.octaveCount = 1
        kbv.firstOctave = 3
        kbv.keyOnColor = .orange
        kbv.polyphonicMode = true
        return kbv
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit() {
        setupKeyboardUI()
    }
}

extension CoolKeyboardView {
    public func setupKeyboardUI() {
        addSubview(coolKeyboard)
        
        coolKeyboard.translatesAutoresizingMaskIntoConstraints = false
        coolKeyboard.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        coolKeyboard.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        coolKeyboard.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.60, constant: 0).isActive = true
        coolKeyboard.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor).isActive = true
    }
}
