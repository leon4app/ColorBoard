//
//  ColorViewController.swift
//  Colorboard
//
//  Created by LeonTse on 2017/4/5.
//  Copyright © 2017年 LeonTse. All rights reserved.
//

import UIKit

open class ColorViewController : UIViewController
{

    open var existingColor: Bool = false
    
    open var colorDescription: ColorDescription?
    
    @IBOutlet private var textField: UITextField?
    
    @IBOutlet private var redSlider: UISlider?
    
    @IBOutlet private var greenSlider: UISlider?
    
    @IBOutlet private var blueSlider: UISlider?

    override open func viewDidLoad()
    {
        if colorDescription != nil
        {
            let color = colorDescription!.color!
            print("Color is ready")
            var red:CGFloat = 0, green:CGFloat = 0, blue:CGFloat = 0
            color.getRed(&red, green: &green, blue: &blue, alpha: nil)
            print("red: \(red), green: \(green), blue :\(blue)")
            redSlider?.value = Float(red)
            greenSlider?.value = Float(green)
            blueSlider?.value = Float(blue)
            view.backgroundColor = color
            textField?.text = colorDescription?.name
        }
        else
        {
            print("Color is not ready")
        }
    }
    
    override open func viewWillAppear(_ animated: Bool)
    {

        if existingColor
        {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    override open func viewWillDisappear(_ animated: Bool)
    {
        colorDescription?.name  = textField?.text
        colorDescription?.color = view.backgroundColor
    }
    
    @IBAction func dismiss(sender: AnyObject)
    {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeColor(sender: AnyObject)
    {
        let red = redSlider?.value
        let green = greenSlider?.value
        let blue = blueSlider?.value
        
        let newColor = UIColor.init(colorLiteralRed: red!, green: green!, blue: blue!, alpha: 1.0)
        view.backgroundColor = newColor
    }
    
}
