//
//  DetailViewController.swift
//  TestDigio
//
//  Created by Pedro Brandão on 13/10/24.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    var model: DetailModel? { get set }
}

class DetailViewController: UIViewController, DetailViewProtocol {
    var model: DetailModel?
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = model?.title
        imageView.sd_setImage(with: URL(string: model?.url ?? ""))
        descriptionLabel.text = model?.decription
    }
}
