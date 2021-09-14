//
//  DetailsVC.swift
//  20-Parse Foursquare Clone
//
//  Created by Selcuk Baki on 7/9/21.
//

import UIKit
import MapKit

class DetailsVC: UIViewController {

    @IBOutlet weak var detailsMap: MKMapView!
    @IBOutlet weak var detailsAtmosphere: UILabel!
    @IBOutlet weak var detailsType: UILabel!
    @IBOutlet weak var detailsName: UILabel!
    @IBOutlet weak var detailsImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
