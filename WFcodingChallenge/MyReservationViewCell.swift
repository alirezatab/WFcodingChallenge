//
//  MyReservationViewCell.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/18/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class MyReservationViewCell: UICollectionViewCell {
    
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var massageTypeLabel: UILabel!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var massageDescriptionLabel: UILabel!
    @IBOutlet weak var rescheduleButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        self.layer.borderWidth = 0.75
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
