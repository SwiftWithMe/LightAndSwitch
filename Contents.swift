//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport


// Model
struct Light {
    var isOn: Bool = false

    func stateDescription() -> String {

        if isOn {
            return "The light is on"
        } else {
            return "The light is off"
        }
    }
}

// View
extension UIImageView {
    func display(light: Light) {
        if light.isOn {
            self.isHighlighted = true
        } else {
            self.isHighlighted = false
        }
    }
}

// Controller
class LightViewController : UIViewController {

    //Model
    var light = Light()

    // View
    lazy var lightImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Light_Off.png"), highlightedImage: #imageLiteral(resourceName: "Light_On.png"))
        self.view.addSubview(imageView)
        return imageView
    }()

    lazy var switchButton: UISwitch = {

        let switchButton = UISwitch()
        switchButton.addTarget(self, action: #selector(switchLight(_:)), for: .valueChanged)

        self.view.addSubview(switchButton)

        return switchButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        lightImageView.frame = CGRect(x: 100, y: 50, width: 160, height: 240)

        switchButton.frame = CGRect(x: 155, y: 310, width: 160, height: 50)
    }

    func switchLight(_ sender:UISwitch) {
        print("change to \(sender.isOn)")
        light.isOn = sender.isOn
        lightImageView.display(light: light)
    }


}




// Run the code

let viewController = LightViewController()

PlaygroundPage.current.liveView = viewController






