//
//  CameraViewController.swift
//  Examen
//
//  Created by Pedro Antonio Vazquez Rodriguez on 24/09/20.
//  Copyright © 2020 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    
    lazy var imagePicker = UIImagePickerController()
    
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker.delegate = self
        self.imagePicker.allowsEditing = true

        enableCameraAccess()

    }



    
    @IBAction func onTapCreate(_ sender: Any) {

        let settings: AVCapturePhotoSettings
        print(self.photoOutput.availablePhotoCodecTypes)
        if self.photoOutput.availablePhotoCodecTypes.contains(.hevc) {
            settings = AVCapturePhotoSettings(format:
                [AVVideoCodecKey: AVVideoCodecType.hevc])
        } else {
            settings = AVCapturePhotoSettings()
        }
        settings.flashMode = .auto
        photoOutput.capturePhoto(with: settings, delegate: self)
    }


    func enableCameraAccess() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                self.setupCaptureSession()
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        self.setupCaptureSession()
                    }
                }
            case .denied:

                return
            case .restricted:
                return
        @unknown default:
            fatalError()
        }
    }

    let session = AVCaptureSession()
    let photoOutput = AVCapturePhotoOutput()

    func setupCaptureSession() {
        session.beginConfiguration()
        let device = AVCaptureDevice.default(.builtInDualCamera,for: .video, position: .back)!
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: device),
            session.canAddInput(videoDeviceInput) else { return }
        session.addInput(videoDeviceInput)

        guard session.canAddOutput(photoOutput) else { return }
        session.sessionPreset = .photo
        session.addOutput(photoOutput)
        session.commitConfiguration()
        session.startRunning()
    }

    @IBAction func chooseFromLibrary(_ sender: Any) {
        
         if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                
            self.imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func setImage(image:UIImage){
        self.imageView.image = image
    }
}

extension CameraViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation(), let img = UIImage(data: data) else { return }
        setImage(image: img)

    }
}

extension CameraViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
 func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.editedImage] as? UIImage {
            dismiss(animated: true, completion: nil)
            setImage(image: pickedImage)
        }
    }

}
