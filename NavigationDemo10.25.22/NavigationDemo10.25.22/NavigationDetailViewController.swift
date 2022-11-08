//
//  NavigationDetailViewController.swift
//  NavigationDemo10.25.22
//
//  Created by iAskedYou2nd on 10/31/22.
//

import UIKit

class NavigationDetailViewController: UIViewController {

    
    @IBOutlet weak var shoeLabel: UILabel!
    
    var shoeString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(self.shoeString)
        self.shoeLabel.text = self.shoeString
    }
    

}
