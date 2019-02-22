//
//  ViewController.swift
//  CoolSynth
//
//  Created by Jeffrey Almonte on 2/11/19.
//  Copyright © 2019 Jeffrey Almonte. All rights reserved.
//

import UIKit
import AudioKit
import AudioKitUI

class ViewController: UIViewController {
    
    let oscillator = AKOscillator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AudioKit.output = oscillator
        // maybe "try" not needed
        do {
            try AudioKit.start()
        } catch {
            AKLog("AudioKit did not start!")
        }
        
        setupUI()
    }
    
    func setupUI() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let adsrView = AKADSRView()
        stackView.addArrangedSubview(adsrView)
        
        let keyboardView = AKKeyboardView()
        keyboardView.delegate = self
        
        stackView.addArrangedSubview(keyboardView)
        
        view.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
}

extension ViewController: AKKeyboardDelegate {
    func noteOn(note: MIDINoteNumber) {
        oscillator.play()
    }
    
    func noteOff(note: MIDINoteNumber) {
        oscillator.stop()
    }
}
