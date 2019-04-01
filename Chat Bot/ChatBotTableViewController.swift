//
//  ChatBotTableViewController.swift
//  Chat Bot
//
//  Created by Denis Bystruev on 25/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ChatBotTableViewController: UITableViewController {
    
    struct Answer {
        var text: String
        var date: Date
    }
    
    var answers = [Answer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        let alert = UIAlertController(title: "Введите вопрос", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            guard let textField = alert.textFields?.first else { return }
            guard let text = textField.text else { return }
            guard !text.isEmpty else { return }
            
            let answer = Answer(text: text, date: Date())
            self.answers.append(answer)
            self.tableView.reloadData()
            self.updateUI()
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
        let answer = answers[index]
        cell.textLabel?.text = answer.text
        cell.detailTextLabel?.text = "\(answer.date)"
        
        return cell
    }
}
