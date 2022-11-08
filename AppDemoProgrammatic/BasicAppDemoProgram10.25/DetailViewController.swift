
import UIKit

class DetailViewController: UIViewController {

    override func loadView() {
        super.loadView()
        
        print("VC: View is loading in mem")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemGray6
        
        print("VC: View did load in mem")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("VC: View Will be entering")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("VC: View DID enter")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("VC: View will leave")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("VC: View did leave")
    }
    
}
