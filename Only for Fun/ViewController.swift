//  Random Cat

// https://cataas.com/cat
// https://cataas.com/cat/says/meow

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("RANDOMIZE", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 350, height: 350)
        imageView.center = view.center
        // button
        view.addSubview(button)
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height-100-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60,
                               height: 55)
        // randomize function
        randomizeCat()
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func    buttonPressed() {
        randomizeCat()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
      button.frame = CGRect(x: 30,
      y: view.frame.size.height-100-view.safeAreaInsets.bottom,
      width: view.frame.size.width-60,
       height: 55)
    }
    
    func    randomizeCat() {
        let urlCat = "https://cataas.com/cat"
        let url = URL(string: urlCat)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
}

