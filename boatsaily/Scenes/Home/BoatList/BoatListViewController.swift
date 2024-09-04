//
//  BoatListViewController.swift
//  boatsaily
//
//  Created by yasin on 19.07.2024.
//

import UIKit

class BoatListViewController: UIViewController, Storyboarded {
    
    var coordinator: BoatListCoordinator?
    var viewModel: BoatListViewModel
    
    @IBOutlet weak var tableView: UITableView!
    
    public init(viewModel: BoatListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = BoatListViewModel()
       super.init(coder: aDecoder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Boat List"
        
        self.viewModel.callList()
    }
}

extension BoatListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}


