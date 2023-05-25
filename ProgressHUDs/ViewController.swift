//
//  ViewController.swift
//  ProgressHUDs
//
//  Created by Nazar Kopeika on 25.05.2023.
//

import JGProgressHUD /* 1 */
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: { /* 3 */
            self.showExample() /* 4 */
        })
    }

    func showExample() { /* 2 */
        let hud = JGProgressHUD() /* 5 */
        hud.indicatorView = JGProgressHUDPieIndicatorView() /* 9 */
//        hud.indicatorView = JGProgressHUDImageIndicatorView(image: UIImage(systemName: "bell")!) /* 23 */
        hud.textLabel.text = "Downloading" /* 7 */
//        hud.textLabel.text = "Notifications Enabled" /* 24 */
//        hud.textLabel.textColor = .red
//        hud.hudView.backgroundColor = .systemPink
//        hud.cornerRadius = 50
        hud.detailTextLabel.text = "0%" /* 8 */
        hud.show(in: view) /* 6 */
//        hud.dismiss(afterDelay: 3) /* 10 */
        
        var progress: Float = 0.0 /* 11 */
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in /* 12 */
            progress += 0.1 /* 13 */
            hud.setProgress(progress, animated: true) /* 14 */

            let value: Float = progress / 1.0 /* 15 */
            hud.detailTextLabel.text = "\(Int(value * 100.0))%" /* 16 */
            if progress > 1.0 { /* 17 */
                timer.invalidate() /* 18 */

                hud.indicatorView = JGProgressHUDSuccessIndicatorView() /* 19 */
                hud.detailTextLabel.text = nil /* 20 */
                hud.textLabel.text = "Done!" /* 21 */
                hud.dismiss(afterDelay: 3) /* 22 */
            }
        }
    }

}

