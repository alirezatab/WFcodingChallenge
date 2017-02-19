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

    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Mark: - Private Global Constats
    private let dataSource = MyReservationsDataSource()

    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.dataSource = dataSource
        collectionView.collectionViewLayout = MyReservationCustomFlowLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
    }
    
    // MARK: - Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Unwind IBAction
    @IBAction func unwindToMyReservation(_ sender: UIStoryboardSegue) {
        
    }
}
