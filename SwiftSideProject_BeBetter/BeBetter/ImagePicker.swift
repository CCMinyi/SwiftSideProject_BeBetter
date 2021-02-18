//
//  ImagePicker.swift
//  BeBetter
//
//  Created by Minyi on 2021/1/30.
//

/*import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {
    
    @Binding var isVisible: Bool
    @Binding var image:Image?
    var sourceType:Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(isVisible: $isVisible,image: $image)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let vc = UIImagePickerController()
        //vc.allowsEditing = true
        vc.sourceType = sourceType == 0 ? .camera : .photoLibrary
        
        vc.delegate = context.coordinator
        
        return vc
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    class Coordinator : NSObject , UINavigationControllerDelegate , UIImagePickerControllerDelegate
    {
        
        @Binding var isVisible : Bool
        @Binding var image:Image?
        
        init(isVisible:Binding<Bool>,image:Binding<Image?>){
            _isVisible = isVisible
            _image = image
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiimage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            image = Image(uiImage: uiimage)
            isVisible = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isVisible = false
        }
    }
    
}

*/
