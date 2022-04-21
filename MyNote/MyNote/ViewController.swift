//
//  ViewController.swift
//  MyNote
//
//  Created by Allicia Viona Sagi on 20/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toolbar: UIToolbar!
    
    /// Data
    var arrOfNotes: [Notes]?
    
    /// Data Feeder (filler)
    var feeder = NotesFeeder()
    
    /// Control
    var rowSelected: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrOfNotes = feeder.getNotes()
        
        tableView.register(UINib(nibName: "NotesTableViewCell", bundle: nil), forCellReuseIdentifier: "notesCell")
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    @IBAction func btnNewNotes(_ sender: Any) {
        performSegue(withIdentifier: "tableToAdd", sender: self)
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource  {
    
    /// Protocol of UITableViewDataSource
    /// To define each cell on the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell") as? NotesTableViewCell
        cell?.titleLbl.text =  arrOfNotes?[indexPath.row].title
        cell?.descLbl.text = arrOfNotes?[indexPath.row].content
        return cell ?? UITableViewCell()
    }
    
    /// To define number of row within a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfNotes?.count ?? 0
    }
    
    /// A function to tell the cell when they're selected / clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = indexPath.row
        performSegue(withIdentifier: "tableToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tableToAdd" {
            guard let vc = segue.destination as? AddNotesViewController else {
                fatalError("Destination is missing")
            }
            vc.delegate = self
        } else if segue.identifier == "tableToDetail" {
            if let selectedRow  = rowSelected {
                if let destination = segue.destination as? DetailViewController {
                    destination.titleDetailPage = arrOfNotes?[selectedRow].title
                    destination.descDetailPage = arrOfNotes?[selectedRow].content
                }
            }
        }
        
    }
    
}

extension ViewController: AddNotesDelegate {
    
    func getNewNote(_ title: String, _ content: String) {
        var newNotes = Notes(title: title, content: content)
        arrOfNotes?.append(newNotes)
        self.tableView.reloadData()
    }
        
}
