//
//  MyReservationVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/18/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit
import CoreData

class MyReservationVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let dataSource = MyReservationsDataSource()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.dataSource = dataSource
        collectionView.collectionViewLayout = MyReservationCustomFlowLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
