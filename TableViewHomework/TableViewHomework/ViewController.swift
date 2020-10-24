//
//  ViewController.swift
//  TableViewHomework
//
//  Created by Никита Ляпустин on 22.10.2020.
//  Copyright © 2020 Pasandep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    private struct SectionData {
        let header: String?
        let cells: [BasicCell]
    }
    
    private func loadData() {
        sectionsData = [
            SectionData(header: "A", cells: [
                BasicCell(contact: Contact(firstname: "Albert", lastname: "Akhmadiev", phoneNumber: "89967615144", profileImage: #imageLiteral(resourceName: "12")))
            ]),
            SectionData(header: "D", cells: [
                BasicCell(contact: Contact(firstname: "Daniil", lastname: "Antropov", phoneNumber: "89967614155", profileImage: #imageLiteral(resourceName: "1"))),
                BasicCell(contact: Contact(firstname: "Dasha", lastname: "Cherbaeva", phoneNumber: "89912312312", profileImage: #imageLiteral(resourceName: "4")))
            ]),
            SectionData(header: "I", cells: [
                BasicCell(contact: Contact(firstname: "Ilnur", lastname: "Osincev", phoneNumber: "89963213211", profileImage: #imageLiteral(resourceName: "8"))),
                BasicCell(contact: Contact(firstname: "Ilya", lastname: "Sadykov", phoneNumber: "89917295618", profileImage: #imageLiteral(resourceName: "7"))),
                BasicCell(contact: Contact(firstname: "Iskander", lastname: "Bariga", phoneNumber: "82828282828", profileImage: #imageLiteral(resourceName: "10")))
            ]),
            SectionData(header: "M", cells: [
                BasicCell(contact: Contact(firstname: "Max", lastname: "Maslakov", phoneNumber: "89898989898", profileImage: #imageLiteral(resourceName: "2"))),
                BasicCell(contact: Contact(firstname: "Milana", lastname: "Amirova", phoneNumber: "12345678901", profileImage: #imageLiteral(resourceName: "5"))),
                BasicCell(contact: Contact(firstname: "Misha", lastname: "Khovaev", phoneNumber: "10987654321", profileImage: #imageLiteral(resourceName: "6"))),
                BasicCell(contact: Contact(firstname: "Mom", lastname: "❤️", phoneNumber: "82123123321", profileImage: #imageLiteral(resourceName: "3")))
            ]),
            SectionData(header: "R", cells: [
                BasicCell(contact: Contact(firstname: "Ratmir", lastname: "Shishkov", phoneNumber: "11223344556", profileImage: #imageLiteral(resourceName: "9"))),
                BasicCell(contact: Contact(firstname: "Rishat", lastname: "Latypov", phoneNumber: "98989898989", profileImage: #imageLiteral(resourceName: "11")))
            ])
        ]
    }
    
    private var sectionsData: [SectionData]?
    
    private struct BasicCell {
        let contact: Contact
    }
    
    private func basicCell(for indexPath: IndexPath, from tableView: UITableView, title: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "Basic",
            for: indexPath
        )
        cell.textLabel?.text = title
        return cell
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionData = sectionsData?[section] else { return 0 }
        
        return sectionData.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellData = sectionsData?[indexPath.section]
        else { fatalError("Attempt to get data while it is not loaded") }

        return basicCell(for: indexPath, from: tableView, title: cellData.cells[indexPath.row].contact.firstname)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionsData?[section].header
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let contactDetailViewCOntroller: ContactDetailViewController = storyboard?.instantiateViewController(identifier: "ContactDetailViewController") else { return }
        
        let contact = sectionsData?[indexPath.section].cells[indexPath.row].contact
        contactDetailViewCOntroller.contact = contact
        show(contactDetailViewCOntroller, sender: nil)

    }
}

