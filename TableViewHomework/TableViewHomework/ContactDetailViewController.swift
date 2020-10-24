//
//  ContactDetailViewController.swift
//  TableViewHomework
//
//  Created by Никита Ляпустин on 24.10.2020.
//  Copyright © 2020 Pasandep. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var phoneNumberLabel: UILabel!
    
    var contact: Contact? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2

        if let contact = contact {
            nameLabel.text = "\(contact.firstname) \(contact.lastname)"
            phoneNumberLabel.text = contact.phoneNumber
            profileImage.image = contact.profileImage
        }
    }
}
