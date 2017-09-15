//
//  OCRViewController.swift
//  skinny
//
//  Created by Mac on 2017/9/1.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import TesseractOCR

class OCRViewController: UIViewController, G8TesseractDelegate {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var tesseract:G8Tesseract = G8Tesseract(language:"eng");
        //tesseract.language = "eng+ita";
        tesseract.delegate = self;
        tesseract.charWhitelist = "01234567890";
        tesseract.image = UIImage(named: "6");
        tesseract.recognize();
        
        textView.text = tesseract.recognizedText
        
        NSLog("%@", tesseract.recognizedText);
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func shouldCancelImageRecognitionForTesseract(tesseract: G8Tesseract!) -> Bool {
        return false; // return true if you need to interrupt tesseract before it finishes
    }
    
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Recognition Progress is \(tesseract.progress)")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
