//
//  ImageTableViewCell.swift
//  task1and4
//
//  Created by Сергей Никулин on 06.05.2018.
//  Copyright © 2018 SNikulin. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var rowImageView: UIImageView?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        rowImageView?.image = nil
    }
}
