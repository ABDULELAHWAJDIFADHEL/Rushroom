////
////  GSDocViewerController.swift
////  Vaccine Buddy
////
////  Created by Apple on 28/10/22.
////
//
//import Foundation
//import UIKit
//
//class DocPickerManager: NSObject, UIDocumentPickerDelegate{
//
//    var documentPicker = UIDocumentPickerViewController()
//    var alert = UIAlertController(title: "Choose Doc", message: nil, preferredStyle: .actionSheet)
//    var viewController: UIViewController?
//    var pickDocCallback : ((URL) -> ())?;
//
//
//
//    override init(){
//        super.init()
////        let DocAction = UIAlertAction(title: "Document", style: .default){
////            UIAlertAction in
////            self.openDoc()
////        }
////
////        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){
////            UIAlertAction in
////        }
////
////
////        documentPicker.delegate = self
////        alert.addAction(DocAction)
////        alert.addAction(cancelAction)
//    }
//
//
//    func pickDoc(_ viewController: UIViewController, _ callback: @escaping ((URL) -> ())) {
//        documentPicker = UIDocumentPickerViewController(documentTypes: ["public.text", "com.apple.iwork.pages.pages", "public.data"], in: .import)
//        documentPicker.delegate = self
//        pickDocCallback = callback
//        viewController.present(documentPicker, animated: true, completion: nil)
////
////        self.viewController = viewController
////        alert.popoverPresentationController?.sourceView = self.viewController!.view
////
////        viewController.present(alert, animated: true, completion: nil)
//    }
//
//    func openDoc(){
////        let documentPicker = UIDocumentPickerViewController(documentTypes: ["com.apple.iwork.pages.pages", "com.apple.iwork.numbers.numbers", "com.apple.iwork.keynote.key","public.image", "com.apple.application", "public.item","public.data", "public.content", "public.audiovisual-content", "public.movie", "public.audiovisual-content", "public.video", "public.audio", "public.text", "public.data", "public.zip-archive", "com.pkware.zip-archive", "public.composite-content", "public.text"], in: .import)
//        alert.dismiss(animated: true, completion: nil)
//        documentPicker = UIDocumentPickerViewController(documentTypes: ["public.text", "com.apple.iwork.pages.pages", "public.data"], in: .import)
//        self.viewController!.present(documentPicker, animated: true, completion: nil)
//    }
//
//
//    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
//        let cico = url as URL
//        print(cico)
//        print(url)
//
//        print(url.lastPathComponent)
//
//        print(url.pathExtension)
//
//        pickDocCallback?(url)
//
//    }
//}
