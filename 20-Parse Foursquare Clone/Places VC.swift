//
//  Places VC.swift
//  20-Parse Foursquare Clone
//
//  Created by Selcuk Baki on 5/9/21.
//

import UIKit
import Parse

class Places_VC: UIViewController, UITableViewDelegate, UITableViewDataSource {


    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClick))
        let barButtonItem = UIBarButtonItem(title: "Log Out", style: UIBarButtonItem.Style.done, target: self, action: #selector(logOutClick))
        let barButtonItem2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(addButtonClick))
        navigationController?.navigationBar.topItem?.leftBarButtonItems = [barButtonItem2, barButtonItem]
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func logOutClick(){
        PFUser.logOutInBackground { error in
            if error != nil {
                self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
            } else {
                self.performSegue(withIdentifier: "toSignUpVC", sender: nil)
            }
        }
        
    }
    
    @objc func addButtonClick(){
        
        //Segue
        performSegue(withIdentifier: "toAddPlaceVC", sender: nil)
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "selcuk"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    
    
    func makeAlert(titleInput : String, messageInput : String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Error", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
