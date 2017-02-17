//
//  MassageOptionVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/17/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class MassageOptionVC: UITableViewController {

    @IBOutlet weak var partySizeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurePartySizeButton()
    }
    
    // configure Button
    func configurePartySizeButton() {
        
        partySizeButton.layer.borderColor = UIColor.lightGray.cgColor
        partySizeButton.layer.borderWidth = 1
        partySizeButton.layer.cornerRadius = 5
        partySizeButton.layer.masksToBounds = true
    }

    @IBAction func onPartySizeButtonPressed(_ sender: UIButton) {
        
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
