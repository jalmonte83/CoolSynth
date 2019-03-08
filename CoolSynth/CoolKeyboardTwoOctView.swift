//
//  CoolKeyboardTwoOctView.swift
//  CoolSynth
//
//  Created by Jeffrey Almonte on 3/8/19.
//  Copyright © 2019 Jeffrey Almonte. All rights reserved.
//

import UIKit
import AudioKitUI

@IBDesignable public class CoolKeyboardTwoOctView: UIView {
    
    // Number of octaves displayed at once
    @IBInspectable open var octaveCount: Int = 1
    
    // Lowest octave dispayed
    @IBInspectable open var firstOctave: Int = 1 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    let coolSynthKeyboard: AKKeyboardView = {
        let kbv = AKKeyboardView()
        kbv.octaveCount = 2
        kbv.firstOctave = 3
        kbv.keyOnColor = .blue
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

extension CoolKeyboardTwoOctView {
    
    
    public func setupKeyboardUI() {
        addSubview(coolSynthKeyboard)
        
        coolSynthKeyboard.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(coolSynthKeyboard)
        coolSynthKeyboard.centerYAnchor.constraint(equalToSystemSpacingBelow: self.centerYAnchor, multiplier: 1.20).isActive = true
        coolSynthKeyboard.bottomAnchor.constraint(equalToSystemSpacingBelow: self.safeAreaLayoutGuide.bottomAnchor, multiplier: 0.50).isActive = true
        coolSynthKeyboard.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.50, constant: 0).isActive = true
        coolSynthKeyboard.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.01, constant: 0).isActive = true
        
    }
}

