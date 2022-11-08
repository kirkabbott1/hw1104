

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.setUpUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setUpUI() {
        self.view.backgroundColor = .systemTeal
        self.title = "Latest Movies"
        
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemRed
        table.dataSource = self
        table.delegate = self
        // Register Cell
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "SampleCell")
        table.register(ProgrammaticTableViewCell.self, forCellReuseIdentifier: "ProgCell")
        
        // Add View To View Hierarchy
        self.view.addSubview(table)
        
        table.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        table.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        table.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        table.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
//        self.view.trailingAnchor.constraint(equalTo: table.trailingAnchor, constant: 8).isActive = true
//        self.view.bottomAnchor.constraint(equalTo: table.bottomAnchor, constant: 8).isActive = true
        
        
        // Alt Approach
//        let topConstraint = table.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8)
//        let leadingConstraint = table.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8)
//        let trailingConstraint = table.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8)
//        let bottomConstraint = table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -8)
//        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
        
        
        self.tableView = table
        
    }
    
    
    
    


}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProgCell", for: indexPath) as? ProgrammaticTableViewCell else {
            fatalError("Whoops, something went wrong")
        }
//        cell.textLabel?.text = "\(indexPath)"
        return cell
    }

    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let placeholderVC = DetailViewController()
        self.navigationController?.pushViewController(placeholderVC, animated: true)
    }
    
}
