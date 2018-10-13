//
//  ViewController.swift
//  Chore Turn
//
//  Created by Michael Hyun on 9/26/18.
//  Copyright © 2018 Michael Hyun. All rights reserved.
//

import UIKit
import SpinWheelControl

class ViewController: UIViewController, RotaryProtocol  {
    @IBOutlet weak var hcView: HCRotaryWheel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var spinWheel: SpinWheelControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = ""
        hcView.delegate = self
        hcView.timerDoesExist = false
        spinWheel.delegate = self
        spinWheel.dataSource = self
    }
    @IBAction func spinButtonPressed(_ sender: Any) {
        hcView.rotate()
    }
    
    func wheelDidChangeValue(_ currentSector: Int32) {
        label.text = getDescriptionText(newValue: currentSector)
    }
    
    func getDescriptionText(newValue :Int32) -> String
    {
        switch newValue {
        case 0:
            return "Bear"
        case 1:
            return "Monkey"
        case 2:
            return "Dog"
        case 3:
            return "Ghost"
        case 4:
            return "Peace"
        case 5:
            return "Alien"
        default:
            return "Bear"
        }
    }

}

extension ViewController: SpinWheelControlDelegate, SpinWheelControlDataSource {
    
    func numberOfWedgesInSpinWheel(spinWheel: SpinWheelControl) -> UInt {
        return 1
    }
    
    func wedgeForSliceAtIndex(index: UInt) -> SpinWheelWedge {
        let wedges : [SpinWheelWedge] =  self.spinWheel.subviews as! [SpinWheelWedge]
        print(wedges.count)
        print(wedges[Int(index)].label)
        return wedges[Int(index)]
    }
    
    func spinWheelDidRotateByRadians(radians: CGFloat) {
        print(radians)
    }
    
    func spinWheelDidEndDecelerating(spinWheel: SpinWheelControl) {
        print("Done Spinning")
    }
}

