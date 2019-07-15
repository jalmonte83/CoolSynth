//
//  AdsrView.swift
//  CoolSynth
//
//  Created by Jeffrey Almonte on 2/25/19.
//  Copyright © 2019 Jeffrey Almonte. All rights reserved.
//

import UIKit
import AudioKitUI

@IBDesignable public class ControlsButtonView: UIView {
    
    private var keyboardView = CoolKeyboardView()
    
    lazy var metronomeButton: AKButton = {
        let metronome = AKButton()
        metronome.title = "Metronome"
        metronome.borderColor = .black
        metronome.borderWidth = 15.0
        
        return metronome
    }()
    
    lazy var octaveDown: AKButton = {
        let pb = AKButton.init(title: "Down Octave", callback: { (sender) in
            print("lo")
            if self.keyboardView.octaveCount == 2 && self.keyboardView.firstOctave == 5 {
                print("It's over 9,000!")
            } else if self.keyboardView.firstOctave == 6 {
                print("It's under 9,000!")
            } else {
                self.keyboardView.firstOctave += 1
            }
            
            //            if self.keyboardView.octaveCount == 1 {
            //
            //            }
            //TODO:
            /*When it loads is at a fixed note
             noteValueDown = xx
             noteValueUp = yy
             When the button is clicked we change note value
             noteValue = yy
             we need a measure to deduct or add
             
             */
        })
        pb.borderColor = .black
        pb.borderWidth = 15.0
        return pb
    }()
    
    let octaveUp: AKButton = {
        let pb = AKButton.init(title: "Up Octave", callback: { (sender) in
            print("hi")
        })
        pb.borderColor = .black
        pb.borderWidth = 15.0
        return pb
    }()
    
    let switchOctaveOutlet: UISwitch = {
        let oSwitch = UISwitch()
        oSwitch.isOn = false
        return oSwitch
    }()
    
    let switchSoundOutlet: UISwitch = {
        let sSwitch = UISwitch()
        sSwitch.onTintColor = .blue
        sSwitch.isOn = false
        
        return sSwitch
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit() {
        setupControlsButtonView()
    }
}

extension ControlsButtonView {
    
    private func setupControlsButtonView() {
        playButtonConstraints()
    }
    
    func playButtonConstraints() {
        let buttonContainerView = UIView()
        buttonContainerView.translatesAutoresizingMaskIntoConstraints = false
        buttonContainerView.backgroundColor = .gray
        
        self.addSubview(buttonContainerView)
        
        buttonContainerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        buttonContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        buttonContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        buttonContainerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.80).isActive = true
        buttonContainerView.addSubview(octaveDown)
        buttonContainerView.addSubview(octaveUp)
        buttonContainerView.addSubview(switchOctaveOutlet)
        buttonContainerView.addSubview(metronomeButton)
       buttonContainerView.addSubview(switchSoundOutlet)
        
        switchOctaveOutlet.translatesAutoresizingMaskIntoConstraints = false
        switchOctaveOutlet.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
        switchOctaveOutlet.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: buttonContainerView.leadingAnchor, multiplier: 4).isActive = true
        switchOctaveOutlet.layer.cornerRadius = 15
        switchOctaveOutlet.layer.borderWidth = 1
        switchOctaveOutlet.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        switchSoundOutlet.translatesAutoresizingMaskIntoConstraints = false
        switchSoundOutlet.centerXAnchor.constraint(equalTo: switchOctaveOutlet.centerXAnchor).isActive = true
        switchSoundOutlet.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: buttonContainerView.leadingAnchor, multiplier: 4).isActive = true
        switchSoundOutlet.topAnchor.constraint(equalTo: switchOctaveOutlet.bottomAnchor, constant: 11).isActive = true
        switchSoundOutlet.heightAnchor.constraint(equalTo: switchOctaveOutlet.heightAnchor, multiplier: 0.75)
        switchSoundOutlet.layer.cornerRadius = 15
        switchSoundOutlet.layer.borderWidth = 1
        switchSoundOutlet.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        octaveDown.translatesAutoresizingMaskIntoConstraints = false
        octaveDown.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
        octaveDown.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: switchOctaveOutlet.trailingAnchor, multiplier: 2.5).isActive = true
        octaveDown.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor, multiplier: 0.175).isActive = true
        octaveDown.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 0.75).isActive = true
        octaveDown.layer.cornerRadius = 15
        octaveDown.layer.borderWidth = 2
        octaveDown.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        octaveUp.translatesAutoresizingMaskIntoConstraints = false
        octaveUp.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
        octaveUp.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: octaveDown.trailingAnchor, multiplier: 2.5).isActive = true
        octaveUp.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor, multiplier: 0.175).isActive = true
        octaveUp.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 0.75).isActive = true
        octaveUp.layer.cornerRadius = 15
        octaveUp.layer.borderWidth = 2
        octaveUp.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        metronomeButton.translatesAutoresizingMaskIntoConstraints = false
        metronomeButton.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
        metronomeButton.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: octaveUp.trailingAnchor, multiplier: 2.5).isActive = true
        metronomeButton.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor, multiplier: 0.175).isActive = true
        metronomeButton.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 0.75).isActive = true
        metronomeButton.layer.masksToBounds = true
        metronomeButton.layer.cornerRadius = 15
        metronomeButton.layer.borderWidth = 2
        metronomeButton.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
    }
}
