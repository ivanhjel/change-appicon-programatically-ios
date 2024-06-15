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

    let icons = [
        AppIcon(name: "Taco", imageName: "Icon1"),
        AppIcon(name: "Pizza", imageName: "Icon2"),
        AppIcon(name: "HotDog", imageName: "Icon3"),
        AppIcon(name: "Hamburger", imageName: "Icon4"),
        AppIcon(name: "Donut", imageName: "Icon5")
    ]

    func setIcon(name: String) {
        let app = UIApplication.shared
        if #available(iOS 10.3, *) {
            if app.supportsAlternateIcons {
                app.setAlternateIconName(name, completionHandler: { (error) in
                    if error != nil {
                        print("error => \(String(describing: error?.localizedDescription))")
                    } else {
                        print("Changed Icon Sucessfully.")
                    }
                })
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "icons", for: indexPath)
        let icon = icons[indexPath.row]
        cell.textLabel?.text = icon.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let icon = icons[indexPath.row]
        setIcon(name: icon.imageName)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Press any cell to change AppIcon"
    }
}
