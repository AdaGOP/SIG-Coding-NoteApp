//
//  AddNotesViewController.swift
//  MyNote
//
//  Created by Allicia Viona Sagi on 21/04/22.
//

import UIKit

protocol AddNotesDelegate {
    func getNewNote(_ title: String,_ content: String)
}

class AddNotesViewController: UIViewController {
    
    var delegate: AddNotesDelegate?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnDone(_ sender: Any) {
        guard let noteTitle = titleTextField.text else {
            fatalError("Note Title is Nil")
        }
        
        guard let noteContent = contentTextView.text else {
            fatalError("Note Content is Nil")
        }
        
        delegate?.getNewNote(noteTitle, noteContent)
    }
    
   
}
