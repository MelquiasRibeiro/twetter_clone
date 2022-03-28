//
//  Utilities.swift
//  twitterClone
//
//  Created by Idwall Go Dev 012 on 28/03/22.
//

import UIKit

class Utilities {

    func inputContainerView(withImage image:UIImage, textField:UITextField)->UIView{
        
        let view = UIView()
        let icon = UIImageView()

        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        icon.image =  image
        view.addSubview(icon)
        icon.anchor(left: view.leftAnchor,bottom: view.bottomAnchor,
                          paddingLeft: 8, paddingBottom: 8)
        icon.setDimensions(width: 24, height: 24)
        
        view.addSubview(textField)
        
        textField.anchor(left:icon.rightAnchor,bottom: view.bottomAnchor,
                         right: view.rightAnchor,paddingLeft: 8,paddingBottom: 8)
        
        let borderBottom = UIView()
        borderBottom.backgroundColor = .white
        view.addSubview(borderBottom)
        borderBottom.anchor(left:view.leftAnchor,bottom: view.bottomAnchor,
                            right: view.rightAnchor,paddingLeft: 8,height: 0.75)
        
        
        
        return view
        
    }
    
    func textField(withPlaceHolder placeHolder:String)->UITextField{
        
        let textField = UITextField()
        textField.placeholder = placeHolder
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize:16)
        textField.attributedPlaceholder = NSAttributedString(string: placeHolder,attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
         return textField
    }

    func attributedButton(_ textPart:String, _ actionPart:String)->UIButton{
        let button = UIButton()
        
        let attributedTitle = NSMutableAttributedString(string: textPart,attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize:16),NSAttributedString.Key.foregroundColor:UIColor.white])
        
        attributedTitle.append(NSAttributedString(string: actionPart,attributes: [NSAttributedString.Key.font :UIFont.boldSystemFont(ofSize: 16),NSAttributedString.Key.foregroundColor: UIColor.white ]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }

}
