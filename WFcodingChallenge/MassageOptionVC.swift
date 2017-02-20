//
//  MassageOptionVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/17/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

// set custom delegate for pickerView
protocol PickerViewCustomDelegate {
    func showPickerView()
}

class MassageOptionVC: UITableViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var partySizeButton: UIButton!
    
    // MARK: - Golbal public delegate variable
    var pickerViewCustomDelegate : PickerViewCustomDelegate? = nil
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        configurePartySizeButton()
        
        // listener is looking to see a Party Size picker view is selected
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.setPartySizeLabel(_:)),
                                               name: NSNotification.Name(rawValue: "SetPartySizeLabel"),
                                               object: nil)
    }
    
    //MARK: - Custom Methods
    // configure Button
    func configurePartySizeButton() {
        
        partySizeButton.layer.borderColor = UIColor.lightGray.cgColor
        partySizeButton.layer.borderWidth = 1
        partySizeButton.layer.cornerRadius = 5
        partySizeButton.layer.masksToBounds = true
    }

    func setPartySizeLabel(_ notification: NSNotification){
        if let partySize = notification.userInfo?["partySize"] as? String {
            partySizeButton.titleLabel?.text = partySize
        }
    }
    
    //MARK: - IBActions
    @IBAction func onPartySizeButtonPressed(_ sender: UIButton) {
        if pickerViewCustomDelegate != nil {
            pickerViewCustomDelegate?.showPickerView()
        }
    }
    
    // MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
