//
//  MassageOptionVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/17/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

// set custom delegate
protocol PickerViewCustomDelegate {
    func showPickerView()
}

class MassageOptionVC: UITableViewController {

    @IBOutlet weak var partySizeButton: UIButton!
    
    var pickerViewCustomDelegate : PickerViewCustomDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurePartySizeButton()
        
        // listener is looking to see a Party Size picker view is selected
        NotificationCenter.default.addObserver(self, selector: #selector(self.setPartySizeLabel(_:)), name: NSNotification.Name(rawValue: "SetPartSizeLabel"), object: nil)
    }
    
    //Mark: - Custom Methods
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
    
    
    //Mark: - IBActions
    @IBAction func onPartySizeButtonPressed(_ sender: UIButton) {
        if pickerViewCustomDelegate != nil {
            pickerViewCustomDelegate?.showPickerView()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
