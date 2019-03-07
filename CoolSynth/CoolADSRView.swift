//
//  AdsrView.swift
//  CoolSynth
//
//  Created by Jeffrey Almonte on 2/25/19.
//  Copyright © 2019 Jeffrey Almonte. All rights reserved.
//

import UIKit
import AudioKitUI

@IBDesignable public class CoolADSRView: UIView {
    
    
    let metronomeButton: AKButton = {
        let pb = AKButton()
        pb.title = "Metronome"
        pb.borderColor = .black
        pb.borderWidth = 20.0
        // pb.h
        return pb
    }()
    let octaveDown: AKButton = {
        let pb = AKButton()
        pb.title = "Up Down"
        pb.borderColor = .black
        pb.borderWidth = 20.0
        // pb.h
        return pb
    }()
    
    let octaveUp: AKButton = {
        let pb = AKButton()
        pb.title = "Up Octive"
        pb.borderColor = .black
        pb.borderWidth = 20.0
        
        return pb
    }()
    
    let switchOctaveOutlet: UISwitch = {
        let oSwitch = UISwitch()
        oSwitch.isOn = false
        
        //oSwitch.addSubview()
        
        return oSwitch
    }()
    
    let metronome: AKSamplerMetronome = {
        let met = AKSamplerMetronome()
        
        met.tempo = 120

        return met
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit() {
        setupCoolADSRView()
    }
}

extension CoolADSRView {
    
    private func setupCoolADSRView() {
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
        
        switchOctaveOutlet.translatesAutoresizingMaskIntoConstraints = false
            switchOctaveOutlet.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
            switchOctaveOutlet.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: buttonContainerView.leadingAnchor, multiplier: 4).isActive = true
            switchOctaveOutlet.layer.cornerRadius = 15
            switchOctaveOutlet.layer.borderWidth = 1
            switchOctaveOutlet.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        octaveDown.translatesAutoresizingMaskIntoConstraints = false
        octaveDown.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
        octaveDown.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: switchOctaveOutlet.trailingAnchor, multiplier: 2.5).isActive = true
        octaveDown.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor, multiplier: 0.065).isActive = true
        octaveDown.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 0.65).isActive = true
        octaveDown.layer.cornerRadius = 15
        octaveDown.layer.borderWidth = 2
        octaveDown.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        
        octaveUp.translatesAutoresizingMaskIntoConstraints = false
        octaveUp.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
        octaveUp.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: octaveDown.trailingAnchor, multiplier: 2.5).isActive = true
        octaveUp.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor, multiplier: 0.065).isActive = true
        octaveUp.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 0.65).isActive = true
        octaveUp.layer.cornerRadius = 15
        octaveUp.layer.borderWidth = 2
        octaveUp.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        
            metronomeButton.translatesAutoresizingMaskIntoConstraints = false
            metronomeButton.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
            metronomeButton.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: octaveUp.trailingAnchor, multiplier: 2.5).isActive = true
            metronomeButton.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor, multiplier: 0.175).isActive = true
            metronomeButton.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 0.75).isActive = true
            metronomeButton.layer.masksToBounds = true
            metronomeButton.layer.cornerRadius = 10
            metronomeButton.layer.borderWidth = 4
            metronomeButton.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
    }
}

//public func setupButtonsUI() {
//    let buttonContainerView = UIView()
//    buttonContainerView.translatesAutoresizingMaskIntoConstraints = false
//    buttonContainerView.backgroundColor = UIColor(patternImage: UIImage(named: "lightWood.png")!)
//    view.addSubview(buttonContainerView)
//    buttonContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//    buttonContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//    buttonContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//    buttonContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20).isActive = true
//    buttonContainerView.addSubview(switchOctaveOutlet)
//    buttonContainerView.addSubview(octaveDown)
//    buttonContainerView.addSubview(octaveUp)
//    buttonContainerView.addSubview(infoLabel)
//    buttonContainerView.addSubview(resetButton)
//    buttonContainerView.addSubview(recButton)
//    buttonContainerView.addSubview(playButton)
//    buttonContainerView.addSubview(saveButton)
//
//    switchOctaveOutlet.translatesAutoresizingMaskIntoConstraints = false
//    switchOctaveOutlet.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
//    switchOctaveOutlet.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: buttonContainerView.leadingAnchor, multiplier: 4).isActive = true
//    switchOctaveOutlet.layer.cornerRadius = 15
//    switchOctaveOutlet.layer.borderWidth = 1
//    switchOctaveOutlet.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
//
//    octaveDown.translatesAutoresizingMaskIntoConstraints = false
//    octaveDown.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
//    octaveDown.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: switchOctaveOutlet.trailingAnchor, multiplier: 2.5).isActive = true
//    octaveDown.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor, multiplier: 0.065).isActive = true
//    octaveDown.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 0.65).isActive = true
//    octaveDown.layer.cornerRadius = 15
//    octaveDown.layer.borderWidth = 2
//    octaveDown.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
//
//
//    octaveUp.translatesAutoresizingMaskIntoConstraints = false
//    octaveUp.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
//    octaveUp.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: octaveDown.trailingAnchor, multiplier: 2.5).isActive = true
//    octaveUp.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor, multiplier: 0.065).isActive = true
//    octaveUp.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 0.65).isActive = true
//    octaveUp.layer.cornerRadius = 15
//    octaveUp.layer.borderWidth = 2
//    octaveUp.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
//
//
//    infoLabel.translatesAutoresizingMaskIntoConstraints = false
//    infoLabel.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
//    infoLabel.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: octaveUp.trailingAnchor, multiplier: 2.5).isActive = true
//    infoLabel.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor, multiplier: 0.175).isActive = true
//    infoLabel.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 0.75).isActive = true
//    infoLabel.layer.masksToBounds = true
//    infoLabel.layer.cornerRadius = 10
//    infoLabel.layer.borderWidth = 4
//    infoLabel.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
//    infoLabel.adjustsFontSizeToFitWidth = true
//
//
//    resetButton.translatesAutoresizingMaskIntoConstraints = false
//    resetButton.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
//    resetButton.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: infoLabel.trailingAnchor, multiplier: 2.5).isActive = true
//    resetButton.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor, multiplier: 0.075).isActive = true
//    resetButton.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 0.75).isActive = true
//    resetButton.layer.masksToBounds = true
//    resetButton.layer.cornerRadius = 15
//    resetButton.layer.borderWidth = 2
//    resetButton.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
//
//
//    recButton.translatesAutoresizingMaskIntoConstraints = false
//    recButton.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
//    recButton.leadingAnchor.constraint(equalToSystemSpacingAfter: resetButton.trailingAnchor, multiplier: 2.5).isActive = true
//    recButton.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor, multiplier: 0.075).isActive = true
//    recButton.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 0.75).isActive = true
//    recButton.layer.cornerRadius = 15
//    recButton.layer.borderWidth = 2
//    recButton.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
//
//
//    playButton.translatesAutoresizingMaskIntoConstraints = false
//    playButton.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
//    playButton.leadingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: recButton.trailingAnchor, multiplier: 2.5).isActive = true
//    playButton.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor, multiplier: 0.075).isActive = true
//    playButton.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 0.75).isActive = true
//    playButton.layer.cornerRadius = 15
//    playButton.layer.borderWidth = 2
//    playButton.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
//    if player.audioFile?.duration == 0 && recorder.isRecording {
//        playButton.isUserInteractionEnabled = false
//    } else if player.audioFile?.duration == 0 {
//        playButton.isUserInteractionEnabled = false
//    } else {
//        playButton.isUserInteractionEnabled = true
//
//    }
//
//    saveButton.translatesAutoresizingMaskIntoConstraints = false
//    saveButton.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
//    saveButton.leadingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: playButton.trailingAnchor, multiplier: 2.5).isActive = true
//    saveButton.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor, multiplier: 0.075).isActive = true
//    saveButton.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 0.75).isActive = true
//    saveButton.layer.cornerRadius = 15
//    saveButton.layer.borderWidth = 2
//    saveButton.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
//
//
//}
