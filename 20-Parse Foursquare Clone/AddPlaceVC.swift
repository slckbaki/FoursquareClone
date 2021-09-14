//
//  AddPlaceVC.swift
//  20-Parse Foursquare Clone
//
//  Created by Selcuk Baki on 5/9/21.
//

import UIKit



class AddPlaceVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var placeNameText: UITextField!
    @IBOutlet weak var placeTypeText: UITextField!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeAtmosphereText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        placeImage.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(choosePhoto))
        placeImage.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func choosePhoto(){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImage.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    

 
    @IBAction func nextClicked(_ sender: Any) {
        
        if placeNameText.text != "" && placeTypeText.text != "" && placeAtmosphereText.text != "" {
            if let chosenImage = placeImage.image {
                PlaceModel.sharedInstance.placeAtmosphere = placeAtmosphereText.text!
                PlaceModel.sharedInstance.placeName = placeNameText.text!
                PlaceModel.sharedInstance.placeType = placeTypeText.text!
                PlaceModel.sharedInstance.placeImage = chosenImage
            }
            performSegue(withIdentifier: "toMapVC", sender: nil)

        } else {
            let alert = UIAlertController(title: "Error", message: "Place Name / Type", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
