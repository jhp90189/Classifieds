//
//  ViewController.swift
//  Classifieds
//
//  Created by Apple on 28/12/20.
//  Copyright © 2020 Jainesh Patel. All rights reserved.
//

import UIKit

class ClassifiedsListViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    private var classifiedsList: [Classified] = []
    private var selectedClassified: Classified? = nil
    private let detailSegueIdentifier = "toclassifieddetail"
    var viewModel = ClassifiedsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        observeModel()
    }
    
    private func setupView() {
        self.title = "Classifieds"
    }
    
    private func observeModel() {
        activityIndicator.startAnimating()
        viewModel.bindClassifiedList = { [weak self] list in
            self?.activityIndicator.stopAnimating()
            self?.classifiedsList = list
            self?.tableView.reloadData()
        }
        viewModel.callApiToFetchCurrencyList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailSegueIdentifier {
            let listViewController = segue.destination as? ClassifiedDetailViewController
            listViewController?.classified = selectedClassified
        }
    }
}

extension ClassifiedsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classifiedsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classifiedcell", for: indexPath) as! ClassifiedCell
        cell.selectionStyle = .none
        let classified = classifiedsList[indexPath.row]
        cell.labelName.text = classified.name
        cell.labelPrice.text = classified.price
        cell.classifiedImage.loadImage(urlString: classified.image_urls_thumbnails.first ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedClassified = classifiedsList[indexPath.row]
        performSegue(withIdentifier: detailSegueIdentifier, sender: nil)
    }
}
