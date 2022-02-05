//
//  ViewController.swift
//  CustomTableViewCell
//
//  Created by user204691 on 2/4/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let image = ["food1", "food2","food3", "food4", "food5","food6", "food7","food8", "food9", "food10"]
    let imageName = ["image 1","image 2","image 3","image 4","image 5","image 6","image 7","image 8","image 9","image 10"]
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return image.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!TableViewCell
        cell.imgView.image = UIImage(named: image[indexPath.row])
        cell.lblCell.text = imageName[indexPath.row]
        return cell
    }
}

