//
//  ModalPresentationViewController.swift
//  NavigationDemo10.25.22
//
//  Created by iAskedYou2nd on 10/31/22.
//

import UIKit

protocol DismissDelegate: AnyObject {
    func dismissViewController(text: String?)
}

class ModalPresentationViewController: UIViewController {

    @IBOutlet weak var shoeLabel: UILabel!

    @IBOutlet weak var userInputField: UITextView!
    
    
    var shoeString: String?
    var delegate: DismissDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.shoeLabel.text = self.shoeString
        self.userInputField.delegate = self
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.delegate?.dismissViewController(text: "Example Text")
        
    }
    

}

extension ModalPresentationViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text)
    }
    
}
