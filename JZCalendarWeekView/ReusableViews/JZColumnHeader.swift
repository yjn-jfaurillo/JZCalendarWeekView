//
//  JZColumnHeader.swift
//  JZCalendarWeekView
//
//  Created by Jeff Zhang on 28/3/18.
//  Copyright © 2018 Jeff Zhang. All rights reserved.
//

import UIKit

/// Header for each column (section, day) in collectionView (Supplementary View)
open class JZColumnHeader: UICollectionReusableView {
    
    public var lblDay = UILabel()
    public var lblWeekday = UILabel()
    public var calendarCurrent = Calendar.current
    public var dateFormatter = DateFormatter()
    public var columnDate = Date()
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        backgroundColor = .clear
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupUI() {
        // Hide all content when colum header height equals 0
        self.clipsToBounds = true
        let stackView = UIStackView(arrangedSubviews: [lblWeekday, lblDay])
        let view = CALayer()
        view.frame = CGRect(x: 0, y: 0, width: 50, height: 95)
        view.backgroundColor = UIColor.white.cgColor
        layer.insertSublayer(view, at: 0)
        stackView.axis = .vertical
        stackView.spacing = 10
        addSubview(stackView)
        stackView.setAnchorConstraintsEqualTo(centerXAnchor: centerXAnchor, centerYAnchor: centerYAnchor)
        lblDay.textAlignment = .center
        lblWeekday.textAlignment = .center
        lblDay.font = UIFont.systemFont(ofSize: 17)
        lblWeekday.font = UIFont.systemFont(ofSize: 12)
    }
    
    // FIXME: - Fork library 
    open func updateView(date: Date) {
        print("----- \(date)")
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        columnDate = dateFormatter.date(from: dateFormatter.string(from: date)) ?? Date()
        let weekday = calendarCurrent.component(.weekday, from: date) - 1
        
        lblDay.text = String(calendarCurrent.component(.day, from: date))
        lblWeekday.text = dateFormatter.veryShortWeekdaySymbols[weekday].uppercased()
        
        guard let stackView = subviews.first as? UIStackView else { return }
        let size = CGFloat(35)        
        if stackView.layer.sublayers?.contains(where: { $0.name == "circleLayer" }) == false, date.isToday {
            let circleLayer = CALayer()
            circleLayer.frame = CGRect(origin: CGPoint(x: -(size/4), y: lblDay.frame.origin.y  - (size/4) + 1), size: CGSize(width: 35, height: 35))
            circleLayer.contentsCenter = lblDay.frame
            circleLayer.backgroundColor = UIColor.yellow.cgColor
            
            circleLayer.cornerRadius = size/2
            circleLayer.name = "circleLayer"
            stackView.layer.insertSublayer(circleLayer, at: 0)
            
            
        } else {
            stackView.layer.sublayers?.first(where: { $0.name == "circleLayer" })?.removeFromSuperlayer()
        }
        
        
        
//        if date.isToday {
//
//            lblDay.textColor = JZWeekViewColors.today
//            lblWeekday.textColor = JZWeekViewColors.today
//        } else {
//            lblDay.textColor = JZWeekViewColors.columnHeaderDay
//            lblWeekday.textColor = JZWeekViewColors.columnHeaderDay
//        }
    }
    
    func reloadStackView() {
        
    }
    
}
