//
//  ChatBotTableViewController.swift
//  Chat Bot
//
//  Created by Denis Bystruev on 25/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ChatBotTableViewController: UITableViewController {
    
    var answers: [String] = [
        "9:00 Консультация по ОГЭ по русскому языку",
        "10:00 Информатика",
        "10:50 Английский язык",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alert = UIAlertController(title: "Введите вопрос", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            guard let textField = alert.textFields?.first else { return }
            print(#function, textField.text ?? "nil")
        }))
        alert.addTextField { textField in
            textField.addTarget(self, action: #selector(self.textFieldHandler(sender:)), for: .primaryActionTriggered)
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc func textFieldHandler(sender: UITextField) {
        print(#function, sender.text ?? "nil")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        let index = indexPath.row
        cell.textLabel?.text = answers[index]
        
        return cell
    }
}
