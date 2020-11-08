//
//  YogaViewController.swift
//  YogaExplore
//
//  Created by Anurag Kashyap on 08/11/20.
//

import UIKit

class YogaViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var ratingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topImageView.roundedImageView(view: topImageView)
        ratingView.dropShadow(view: ratingView)
    }
}

extension YogaViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell") as! AddressTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "slotCell") as! SlotTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell") as! DescriptionTableViewCell
            return cell
        default:
            break
        }
        
        return UITableViewCell()
    }
}
