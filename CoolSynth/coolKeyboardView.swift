//
//  KeyboardView.swift
//  CoolSynth
//
//  Created by Jeffrey Almonte on 2/24/19.
//  Copyright © 2019 Jeffrey Almonte. All rights reserved.
//

import UIKit
import AudioKitUI

@IBDesignable public class coolKeyboardView: UIView {
    
   /// Number of octaves displayed at once
//    @IBInspectable open var octaveCount: Int = 1
//
   /// Lowest octave dispayed
//    @IBInspectable open var firstOctave: Int = 1 {
//        didSet {
//            self.setNeedsDisplay()
//        }
//    }
    
    let coolSynthKeyboard: AKKeyboardView = {
        let kbv = AKKeyboardView()
        kbv.octaveCount = 1
        kbv.keyOnColor = .blue
        kbv.polyphonicMode = true
      //  kbv.programmaticNoteOn(<#T##note: MIDINoteNumber##MIDINoteNumber#>)
        
        return kbv
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(coolSynthKeyboard)
        setupKeyboardUI()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension coolKeyboardView {
    
    
    public func setupKeyboardUI() {
        coolSynthKeyboard.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(coolSynthKeyboard)
        coolSynthKeyboard.centerYAnchor.constraint(equalToSystemSpacingBelow: self.centerYAnchor, multiplier: 1.20).isActive = true
        
        coolSynthKeyboard.bottomAnchor.constraint(equalToSystemSpacingBelow: self.safeAreaLayoutGuide.bottomAnchor, multiplier: 0.50).isActive = true
        coolSynthKeyboard.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.50, constant: 0).isActive = true
        coolSynthKeyboard.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.01, constant: 0).isActive = true
        
//                 keyboardYconstraint = NSLayoutConstraint(item: keyboardView, attribute: .centerY, relatedBy: .equal, toItem: keyboardView, attribute: .centerY, multiplier: 1.20, constant: 0).isActive = true
//                 keyboardHeightConstraint = NSLayoutConstraint(item: keyboardView, attribute: .height, relatedBy: .equal, toItem: keyboardView, attribute: .height, multiplier: 0.80, constant: 0).isActive = true
//                 keyboardWidthConstraint = NSLayoutConstraint(item: keyboardView, attribute: .width, relatedBy: .equal, toItem: keyboardView, attribute: .width, multiplier: 1.01, constant: 0).isActive = true

        
               // keyboardView.delegate = self
//                keyboardView.polyphonicMode = true
//                NSLayoutConstraint.activate([keyboardYconstraint, keyboardHeightConstraint, keyboardWidthConstraint])
    }
}
