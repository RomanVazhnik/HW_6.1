//
//  ListTableViewController.swift
//  HW_6
//
//  Created by Роман Важник on 09/08/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    var namesArray = ["Roman", "Dima", "Alex", "Bob", "Steve"]
    var surnamesArray = ["Abramson", "Backer", "Davidson", "Gilson", "Carter"]
    var phoneNumbersArray = ["1405122", "5670133", "1256200", "9563833", "4510432"]
    var emailsArray = ["aaa@gmail.ru", "bbb@gmail.ru", "ссс@gmail.ru", "ddd@gmail.ru", "fff@gmail.ru"]
    
    var persons: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createRandomStructure(countOfIterations: namesArray.count)
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.2614391803, green: 0.5355914019, blue: 0.6461373731, alpha: 1)
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTableViewCell", for: indexPath)
        
        let currentPerson =  persons[indexPath.row]
        cell.textLabel?.text = "\(currentPerson.name) \(currentPerson.surname)"
        return cell
    }
    
    //Cell setup
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.font = UIFont(name: "Kailasa", size: 18)
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.imageView?.image = UIImage(named: "man1")
        cell.imageView?.backgroundColor = .white
        cell.imageView?.layer.cornerRadius = 14
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let vc = segue.destination as! DetailViewController
            vc.sourceStructure = persons[indexPath.row]
        }
    }
    
    private func createRandomStructure(countOfIterations: Int) {
        namesArray.shuffle()
        surnamesArray.shuffle()
        phoneNumbersArray.shuffle()
        emailsArray.shuffle()
        for element in 0..<namesArray.count {
            
            let name = namesArray[element]
            let surname = surnamesArray[element]
            let phoneNumber = phoneNumbersArray[element]
            let email = emailsArray[element]
            let newPerson = Person(name: name, surname: surname, phoneNumber: phoneNumber, email: email)
            persons.append(newPerson)
            
        }
    }
    
}
