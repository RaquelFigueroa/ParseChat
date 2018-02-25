//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Raquel Figueroa-Opperman on 2/25/18.
//  Copyright © 2018 Raquel Figueroa-Opperman. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDataSource {

    var refreshControl: UIRefreshControl!
    
    @IBOutlet weak var chatMessageField: UITextField!
    
    @IBOutlet weak var chatTableView: UITableView!
    var messages: [PFObject] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatTableView.rowHeight = UITableViewAutomaticDimension
        chatTableView.estimatedRowHeight = 50

        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ChatViewController.didPullToRefresh(_:)), for: .valueChanged)
        chatTableView.insertSubview(refreshControl, at: 0)
        
        chatTableView.dataSource = self
//        chatTableView.delegate = self as! UITableViewDelegate
        
        fetchMessages()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.fetchMessages), userInfo: nil, repeats: true)
    }
    
    @objc func fetchMessages() {
        print ("Get Messages!")
        let query = PFQuery(className:"Message")
        query.order(byDescending: "createdAt")
        query.includeKey("user")

//         fetch data asynchronously
        query.findObjectsInBackground { (messages: [PFObject]?, error: Error?) -> Void in
            if let messages = messages {
                self.messages = messages
                self.chatTableView.reloadData()
                self.refreshControl.endRefreshing()
            } else {
                print(error!.localizedDescription)
                if (error!.localizedDescription == "The Internet connection appears to be offline."){
                    //alert functionality:
                    let alertController = UIAlertController(title: "Network Connection Failure", message: "The Internet connection appears to be offline. Would you like to reload?", preferredStyle: .alert)

                    let cancelAction = UIAlertAction(title: "Cancel: Exit App", style: .cancel) { (action) in
                        exit(0)
                    }

                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        self.fetchMessages()
                    }

                    alertController.addAction(cancelAction)
                    alertController.addAction(okAction)

                    self.present(alertController, animated: true){
                    }
                }
            }
        }
        
    }

    
    @IBAction func sendButton(_ sender: Any) {
        print ("send button pressed")
        let chatMessage = PFObject(className: "Message")
        chatMessage["text"] = chatMessageField.text ?? ""
        chatMessage["user"] = PFUser.current()
        chatMessageField.text = "message here"
        
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("The message was saved!")
                self.chatMessageField.text = ""
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        let message = messages[indexPath.row]
        cell.chatLabel.text = "Chat text here!"
        cell.chatLabel.text = (message["text"] as! String)
        if let user = message["user"] as? PFUser {
            cell.usernameLabel.text = user.username
        } else {
            // No user found, set default username
            cell.usernameLabel.text = "🤖"
        }
//cell.usernameLabel.text = "🤖"
//        cell.chatLabel.text = "chat chat"

        return cell
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        fetchMessages()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
