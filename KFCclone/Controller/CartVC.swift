//
//  CartVC.swift
//  KFCclone
//
//  Created by 강민혜 on 5/27/22.
//

import UIKit

class CartVC: UIViewController {

    
    @IBOutlet weak var selectedPackNameLabel: UILabel!
    @IBOutlet weak var selectedPackImage: UIImageView!
    @IBOutlet weak var selectedPackPriceWon: UILabel!
    
    @IBOutlet weak var minusButtonTapped: UIButton!
    @IBOutlet weak var plusButtonTapped: UIButton!
    
    @IBOutlet weak var selectedPackPrice: UILabel!
    @IBOutlet weak var totalPriceWon: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectOrderShow()
    }
    
    func selectOrderShow() {
        
        
        
        
    }
   
}
