//
//  MyReservationVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/18/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class MyReservationVC: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.dataSource = self
        collectionView.collectionViewLayout = MyReservationCustomFlowLayout()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyReservationVC", for: indexPath) as! MyReservationViewCell
        
        cell.massageDescriptionLabel.text = "Massage focused on the deepest layer of muscles to target knots and release chronic muscle tension."
        
        cell.rescheduleButton.layer.cornerRadius = 5
        cell.rescheduleButton.layer.masksToBounds = true
        cell.rescheduleButton.frame = CGRect(x: 20,
                                             y: cell.frame.height - 20 - 40,
                                             width: (cell.frame.width/2) - 20 - 10,
                                             height: 40)
        
        
        cell.cancelButton.layer.cornerRadius = 5
        cell.cancelButton.layer.masksToBounds = true
        cell.cancelButton.frame = CGRect(x: 20 + (cell.frame.width/2) - 10,
                                         y: cell.frame.height - 20 - 40,
                                         width: (cell.frame.width/2) - 20 - 10,
                                         height: 40)
    
        return cell
    }
    
    @IBAction func unwindToMyReservation(_ sender: UIStoryboardSegue) {
        
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
