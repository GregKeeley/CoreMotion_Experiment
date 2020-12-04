//
//  ViewController.swift
//  CoreMotion_Experiment
//
//  Created by Gregory Keeley on 12/4/20.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var attitudeValueLabel: UILabel!
    @IBOutlet weak var gravityValueLabel: UILabel!
    @IBOutlet weak var headingValueLabel: UILabel!
    @IBOutlet weak var magneticFieldValueLabel: UILabel!
    @IBOutlet weak var rotationRateValueLabel: UILabel!
    @IBOutlet weak var sensorLocationValueLabel: UILabel!
    @IBOutlet weak var userAccelerationValueLabel: UILabel!
    
    var motionManager = CMHeadphoneMotionManager()
    
    var motionData: CMDeviceMotion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        startMotionServices()
    }
    
    func startMotionServices() {
        motionManager.delegate = self
        motionManager.startDeviceMotionUpdates()
    }
    func motionValueChanged() {
        if let accelerometerData = motionManager.deviceMotion {
            attitudeValueLabel.text = accelerometerData.attitude.description
            gravityValueLabel.text = "X: \(accelerometerData.gravity.x.description)\n Y: \(accelerometerData.gravity.y.description)\n Z: \(accelerometerData.gravity.z.description)"
            headingValueLabel.text = accelerometerData.heading.description
            magneticFieldValueLabel.text = "X: \(accelerometerData.magneticField.field.x)\n Y: \(accelerometerData.gravity.y.description)\n Z: \(accelerometerData.gravity.z.description)"
            sensorLocationValueLabel.text = accelerometerData.sensorLocation.rawValue.description
            userAccelerationValueLabel.text = "X: \(accelerometerData.userAcceleration.x.description)\n Y: \(accelerometerData.userAcceleration.x.description)\n Z: \(accelerometerData.userAcceleration.x.description)"
        } else {
            print("No accelerometerData")
        }
    }
}

extension ViewController: CMHeadphoneMotionManagerDelegate {
    func headphoneMotionManagerDidConnect(_ manager: CMHeadphoneMotionManager) {
        if motionManager.isDeviceMotionAvailable {

        } else {
            
        }
    }
    func headphoneMotionManagerDidDisconnect(_ manager: CMHeadphoneMotionManager) {
        print("Headphones disconnected")
    }
    
}
