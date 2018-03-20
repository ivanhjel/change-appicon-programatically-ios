//
//  ViewController.swift
//  IconChangeTest
//
//  Created by Ivan Hjelmeland on 20/03/2018.
//  Copyright © 2018 Aboveapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let icons = ["Icon1", "Icon2", "Icon3", "Icon4", "Icon5"]
    let names  = ["Taco", "Pizza", "HotDog", "Hamburger", "Donut"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func setIcon(name: String) {
        let app = UIApplication.shared
        if #available(iOS 10.3, *) {
            if app.supportsAlternateIcons {
                app.setAlternateIconName(name, completionHandler: { (error) in
                    if error != nil {
                        print("error => \(String(describing: error?.localizedDescription))")
                    }else {
                        print("Changed Icon Sucessfully.")
                    }
                })
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "icons", for: indexPath)
        let name = names[indexPath.row]
        cell.textLabel?.text = name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let icon = icons[indexPath.row]
        setIcon(name: icon)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Press any cell to change AppIcon"
    }

}

