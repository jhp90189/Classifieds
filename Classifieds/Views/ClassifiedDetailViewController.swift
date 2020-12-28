//
//  ClassifiedDetailViewController.swift
//  Classifieds
//
//  Created by Apple on 28/12/20.
//  Copyright © 2020 Jainesh Patel. All rights reserved.
//

import UIKit

class ClassifiedDetailViewController: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelCreatedDate: UILabel!

    var classified: Classified? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    private func setupView() {
        self.title = classified?.name
        labelPrice.text = classified?.price
        labelCreatedDate.text = classified?.created_at.convertToDate()
        detailImageView.loadImage(urlString: classified?.image_urls.first ?? "")
    }
}
