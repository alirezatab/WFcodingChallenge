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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToMyReservation(_ sender: UIStoryboardSegue) {
        
    }
}
