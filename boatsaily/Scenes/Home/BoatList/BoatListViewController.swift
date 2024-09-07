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
        self.tableView.register(BoatListTableViewCell.nib(), forCellReuseIdentifier: BoatListTableViewCell.identifier)
    }
}

extension BoatListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.filteredBoatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BoatListTableViewCell.identifier, for: indexPath) as! BoatListTableViewCell
        cell.configure(model: self.viewModel.filteredBoatList[indexPath.row])
        return cell
    }
}


