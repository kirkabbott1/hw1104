//
//  ViewController.swift
//  NavigationDemo10.25.22
//
//  Created by iAskedYou2nd on 10/31/22.
//

import UIKit

class ViewController: UIViewController {

    var stringArr = ["Crocs", "Sandals", "Sneakers", "Stilletos", "Dress Shoes"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemPink
        self.title = "Home Screen"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier {
        case "PushNavigationSegue":
            let detail = segue.destination as? NavigationDetailViewController
            self.performRandomSelection(detail: detail)
        case "NavigationModalPresentation":
            let detail = segue.destination as? ModalPresentationViewController
            detail?.shoeString = self.stringArr[2]
            detail?.delegate = self
            detail?.modalPresentationStyle = .fullScreen
        default:
            print("No Match")
        }
    }
    
    func performRandomSelection(detail: NavigationDetailViewController?) {
        detail?.shoeString = self.stringArr.last
    }
    

    @IBAction func navigateWithNavigationStack(_ sender: Any) {
        print("Navigation Button Pressed")
        
        self.performSegue(withIdentifier: "PushNavigationSegue", sender: self)
        
    }
    
    
    @IBAction func navigateWithModalPresentation(_ sender: Any) {
        print("Modal Presentation Button Pressed")
        
        self.performSegue(withIdentifier: "NavigationModalPresentation", sender: self)
    }
    
    
    @IBAction func navStackSansSegueButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "NavigationDetailViewController") as? NavigationDetailViewController else { return }
        
        detailVC.shoeString = self.stringArr[0]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    @IBAction func navModalPresentationSansSegueButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "ModalPresentationViewController") as? ModalPresentationViewController else { return }
        
        detailVC.shoeString = self.stringArr[3]
        detailVC.delegate = self
        detailVC.modalPresentationStyle = .currentContext
        detailVC.modalTransitionStyle = .crossDissolve
        self.present(detailVC, animated: true, completion: nil)
    }
    
    
}

extension ViewController: DismissDelegate {
    
    func dismissViewController(text: String?) {
        
        print(text)
        self.stringArr.append(text ?? "Missing Data")
        self.dismiss(animated: true, completion: nil)
    }
    
}

