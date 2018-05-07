//
//  TableViewController.swift
//  task1and4
//
//  Created by Сергей Никулин on 06.05.2018.
//  Copyright © 2018 SNikulin. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "cellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.rowHeight = 150
        tableView.tableFooterView = UIView()
    }
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else {
            return UITableViewCell()
        }
        
        if let url = URL(string: "http://placehold.it/375x150?text=\(indexPath.row + 1)") {
            downloadImage(withURL: url, forCell: cell)
        }
        return cell
    }
    
    func downloadImage(withURL url: URL, forCell cell: UITableViewCell) {
        guard let cell = cell as? ImageTableViewCell else { return }
        
        if let image = imageCache.object(forKey: url.absoluteString as NSString) {
            cell.rowImageView?.image = image
        } else {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil, let image = UIImage(data: data) else {
                    return
                }
                imageCache.setObject(image, forKey: url.absoluteString as NSString)
                DispatchQueue.main.async {
                    cell.rowImageView?.image = image
                }
            }.resume()
        }
    }
}
