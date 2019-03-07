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

    let adsrView:AKADSRView = {
        let av = AKADSRView()
        //av.bgColor = .orange
        return av
    }()

}
