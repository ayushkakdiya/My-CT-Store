//
//  VendorCollectionViewCell.swift
//  My CT Store
//
//  Created by Ayush Kakdiya on 29/03/23.
//

import UIKit
import Cosmos

class VendorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var minOrderLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var vendorNameLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    @IBOutlet weak var vendorImageview: UIImageView!
    @IBOutlet weak var openLable: UILabel!
    @IBOutlet weak var viewMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       setUp()
    }
    func setUp() {
        openLable.layer.cornerRadius = 100
    }
}
