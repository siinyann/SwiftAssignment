//
//  ArtPhotoViewController.swift
//  DevelopmentIsFun
//
//  Created by Swift on 11/4/22.
//

import UIKit
import Firebase
import FirebaseStorage

class ArtPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // All IB outlets for this view controller
    @IBOutlet weak var imageView: UIImageView!
    
    private let storage = Storage.storage().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.contentMode = .scaleAspectFit
        
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
         let url = URL(string: urlString) else {
             return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.imageView.image = image
            }
        })
        
        task.resume()
    }
    
    // Allow the photo library to appear for user to choose an image
    @IBAction func uploadPhotoButton_Tapped(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated:true)
    }
    
    // Allow user to pick an image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true , completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        guard let imageData = image.pngData() else {
            return
        }
        
        /* /Desktop/file.png */
        storage.child("images/file.png").putData(imageData, metadata: nil, completion: { _, error in
            guard error == nil else {
                print("Failed to upload")
                return
            }
            
            self.storage.child("images/file.png").downloadURL(completion: { url, error in
                guard let url = url, error == nil else {
                    return
                }
                
                let urlString = url.absoluteString
                
                DispatchQueue.main.async {
                    self.imageView.image =  image
                }
                print("Download URL: \(urlString)")
                UserDefaults.standard.set(urlString, forKey: "url")
            })
        })
    }
    
    // To dismiss the imagePickerController
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
