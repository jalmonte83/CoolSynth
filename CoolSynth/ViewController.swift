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
import ReplayKit

class ViewController: UIViewController {
    
    private var controlsButtonView = CoolADSRView()
    
    private var newKeyboardView = coolKeyboardView()
    //private var newKeyboardViewTwo = CoolKeyboardTwoOctView()
    var stackView = UIStackView() {
        didSet{
            stackView.reloadInputViews()
        }
    }


    private var midiSample = AKMIDISampler()
    // private var metronome = AKMetronome()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       controlsButtonView.delegate = self
        newKeyboardView.coolSynthKeyboard.delegate = self
     //   newKeyboardViewTwo.coolSynthKeyboard.delegate = self
        
        AudioKit.output = midiSample
        do {
            try AudioKit.start()
        } catch {
            AKLog("AudioKit did not start!")
        }
        
        //TODO: get switch to work
        
        //        controlsButtonView.switchOctaveOutlet.addTarget(self, action: #selector(octaveSwitchPressed), for: .touchUpInside)
        
        //    controlsButtonView.octaveUp.addTarget(self, action: #selector(upOctavePressed), for: .touchUpInside)
        
        setupUI()
        loadSound()
        controlsButtonView.switchOctaveOutlet.addTarget(self, action: #selector(octaveSwitchPressed), for:.valueChanged)
        
    }
    
    func setupUI() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(controlsButtonView)
        stackView.addArrangedSubview(newKeyboardView.coolSynthKeyboard)
//        stackView.addSubview(controlsButtonView)
//       stackView.addSubview(newKeyboardView.coolSynthKeyboard)
//        stackView.addSubview(newKeyboardView)
        
        view.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
//    @objc func upOctavePressed() {
//        if newKeyboardView.octaveCount == 2 && newKeyboardView.firstOctave == 5 {
//            print("It's over 9,000!")
//        } else if newKeyboardView.firstOctave == 6 {
//            print("It's under 9,000!")
//        } else {
//            newKeyboardView.firstOctave += 1
//        }
//    }
//
//    @objc func downOctavePressed() {
//        if newKeyboardView.firstOctave == 0 {
//            print("the Tao is like water...")
//        } else {
//            newKeyboardView.firstOctave += -1
//        }
//    }
    

    @objc func octaveSwitchPressed(){
        print(controlsButtonView.switchOctaveOutlet.isOn)
        if  controlsButtonView.switchOctaveOutlet.isOn {
            
                        self.newKeyboardView.coolSynthKeyboard.octaveCount = 2
           self.newKeyboardView.coolSynthKeyboard.programmaticNoteOn(100)
//           self.stackView.removeArrangedSubview(newKeyboardView)
//
//            self.newKeyboardView.removeFromSuperview()
//            self.stackView.addSubview(controlsButtonView)
//           self.stackView.addArrangedSubview(newKeyboardViewTwo)

//view.addSubview(stackView)
//loadSound()
        } else {
            self.newKeyboardView.coolSynthKeyboard.octaveCount = 1
            
//            self.stackView.addArrangedSubview(controlsButtonView)
//            self.stackView.removeArrangedSubview(newKeyboardViewTwo)
//
//            self.newKeyboardViewTwo.removeFromSuperview()
//
//
//           self.stackView.addArrangedSubview(newKeyboardView)
//view.addSubview(stackView)
        }
        view.addSubview(stackView)


//        stackView.reloadInputViews()
//        loadSound()
        
        
//        if newKeyboardView.octaveCount == 1 {
//            newKeyboardView.octaveCount += 1
//        } else if newKeyboardView.octaveCount == 2 {
//            newKeyboardView.octaveCount += -1
//        }
//        viewDidLoad()
        
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

extension ViewController: AKKeyboardDelegate {
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


extension ViewController: OctaveButtonDelegate {
    func setupOctaveLogic() {
      
        
    }
    
   

    @objc func upOctavePressed() {
        if newKeyboardView.octaveCount == 2 && newKeyboardView.firstOctave == 5 {
            print("It's over 9,000!")
        } else if newKeyboardView.firstOctave == 6 {
            print("It's under 9,000!")
        } else {
            newKeyboardView.firstOctave += 1
        }
    }
    
    @objc func downOctavePressed() {
        if newKeyboardView.firstOctave == 0 {
            print("the Tao is like water...")
        } else {
            newKeyboardView.firstOctave += -1
        }
    }

}



