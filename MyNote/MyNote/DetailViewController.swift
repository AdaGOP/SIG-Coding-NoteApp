//
//  DetailViewController.swift
//  MyNote
//
//  Created by Allicia Viona Sagi on 20/04/22.
//

import UIKit

class DetailViewController: UIViewController {
    /// Data
    var titleDetailPage: String?
    var descDetailPage: String?
    
    @IBOutlet weak var titleLblDetailPage: UILabel!
    @IBOutlet weak var descLblDetailPage: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLblDetailPage.text = titleDetailPage
        descLblDetailPage.text = descDetailPage
    }

}
