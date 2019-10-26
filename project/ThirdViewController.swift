//
//  ThirdViewController.swift
//  project
//
//  Created by Michael Wang on 10/26/19.
//  Copyright © 2019 Michael Wang. All rights reserved.
//

import UIKit
import Firebase
class ThirdViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var test: UILabel!
    let imagePicker = UIImagePickerController()
    
    @IBAction func loadImageButtonTapped(_ sender: UIButton) {
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        //let image = UIImage(named: "")
        
        //imageAdded(image: image)
        // Do any additional setup after loading the view.
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            let image = pickedImage
            imageAdded(image: image)
            print("Call Image Added")
        }
     
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func imageAdded(image: UIImage) { //in Josh's code
        let vision = Vision.vision()
        let visionImage = VisionImage(image: image)
        let textRecognizer = vision.onDeviceTextRecognizer()
        textRecognizer.process(visionImage) { result, error in
          guard error == nil, let result = result else {
            return
          }
            
          // Recognized text
            let resultText = result.text
            for block in result.blocks {
                
                self.test.text = block.text
                let blockText = block.text
                let blockConfidence = block.confidence
                let blockLanguages = block.recognizedLanguages
                let blockCornerPoints = block.cornerPoints
                let blockFrame = block.frame
                for line in block.lines {
                    let lineText = line.text
                    let lineConfidence = line.confidence
                    let lineLanguages = line.recognizedLanguages
                    let lineCornerPoints = line.cornerPoints
                    let lineFrame = line.frame
                    for element in line.elements {
                        let elementText = element.text
                        let elementConfidence = element.confidence
                        let elementLanguages = element.recognizedLanguages
                        let elementCornerPoints = element.cornerPoints
                        let elementFrame = element.frame
                    }
                }
            }
            
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
