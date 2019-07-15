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
// ReplayKit will be use when recording is acheiveable
import ReplayKit

class CoolSynthViewController: UIViewController {
    
    private var octave = 4
    private var controlsButtonView = ControlsButtonView()
    
    private var coolKeyboardView = CoolKeyboardView()
    var stackView = UIStackView() {
        didSet{
            stackView.reloadInputViews()
        }
    }
    
    private var midiSample = AKMIDISampler()
    //TODO: Get metronome to work
     private var metronome = AKMetronome()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coolKeyboardView.coolKeyboard.delegate = self
        
        AudioKit.output = midiSample
        do {
            try AudioKit.start()
        } catch {
            AKLog("AudioKit did not start!")
        }
        setupUI()
        loadSound()
        controlsButtonView.octaveUp.callback(controlsButtonView.octaveUp)
        controlsButtonView.switchOctaveOutlet.addTarget(self, action: #selector(octaveSwitchPressed), for:.valueChanged)
    }
    
    func setupUI() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(controlsButtonView)
        stackView.addArrangedSubview(coolKeyboardView.coolKeyboard)
        view.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    @objc func upOctavePressed() {
        if coolKeyboardView.octaveCount == 2 && coolKeyboardView.firstOctave == 5 {
            print("It's over 9,000!")
        } else if coolKeyboardView.firstOctave == 6 {
            print("It's under 9,000!")
        } else {
            coolKeyboardView.coolKeyboard.firstOctave += 1
        }
    }
    
    @objc func downOctavePressed() {
        if coolKeyboardView.firstOctave == 0 {
            print("the Tao is like water...")
        } else {
            coolKeyboardView.coolKeyboard.firstOctave += -1
        }
    }
    
    @objc func octaveSwitchPressed(){
        print(controlsButtonView.switchOctaveOutlet.isOn)
        if  controlsButtonView.switchOctaveOutlet.isOn {
            self.coolKeyboardView.coolKeyboard.octaveCount = 2
            self.coolKeyboardView.coolKeyboard.programmaticNoteOn(100)
        } else {
            self.coolKeyboardView.coolKeyboard.octaveCount = 1
            self.coolKeyboardView.coolKeyboard.programmaticNoteOn(100)
        }
    }
    
    @objc func metronomeButtonPressed(){
        print(controlsButtonView.metronomeButton.highlightedColor, " yup" )
    print("ypi")
        
    }
    
    func loadSound() {
        AKSettings.playbackWhileMuted = true
        try! AudioKit.start()
        do {
            try midiSample.loadMelodicSoundFont("gpiano", preset: 0)
        } catch {
            print("couldnt load soundFont")
        }
    }
}

extension CoolSynthViewController: AKKeyboardDelegate {
    public func noteOn(note: MIDINoteNumber) {
        do {
            try midiSample.play(noteNumber: note, velocity: 80, channel: 0)
        } catch {
            print("error sampling")
        }
    }
    
    public func noteOff(note: MIDINoteNumber) {
        do {
            try midiSample.stop(noteNumber: note, channel: 0)
        } catch {
            print("error stopping sample")
        }
    }
}


