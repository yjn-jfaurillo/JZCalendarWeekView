//
//  AllDayViewModel.swift
//  JZCalendarWeekViewExample
//
//  Created by Jeff Zhang on 30/5/18.
//  Copyright © 2018 Jeff Zhang. All rights reserved.
//

import Foundation
import JZCalendarWeekView

class AllDayViewModel: NSObject {
    
    private lazy var thirdDate = self.dateFormatter.date(from: "2019-05-05 01:15:00")!
    private lazy var firstDate = self.dateFormatter.date(from: "2019-05-05 01:30:00")!
    private lazy var secondDate = self.dateFormatter.date(from: "2019-05-05 02:45:00")!
    private lazy var fourthDate = self.dateFormatter.date(from: "2019-05-05 04:00:00")!
    private lazy var fifthDate = self.dateFormatter.date(from: "2019-05-05 07:30:00")!
    
    lazy var events = [AllDayEvent(id: "0", title: "One", startDate: firstDate, endDate: firstDate.add(component: .hour, value: 2), location: "Melbourne", isAllDay: false),
                       AllDayEvent(id: "1", title: "Two", startDate: secondDate, endDate: secondDate.add(component: .hour, value: 2), location: "Melbourne", isAllDay: false),
                       AllDayEvent(id: "2", title: "Three", startDate: thirdDate, endDate: thirdDate.add(component: .hour, value: 2), location: "Melbourne", isAllDay: false),
                       AllDayEvent(id: "3", title: "Four", startDate: fourthDate, endDate: fourthDate.add(component: .hour, value: 2), location: "Melbourne", isAllDay: false),
                       AllDayEvent(id: "4", title: "Five", startDate: fifthDate, endDate: fifthDate.add(component: .hour, value: 2), location: "Melbourne", isAllDay: false)]
    
//    private lazy var firstDate = self.dateFormatter.date(from: "2019-05-05 21:45:00")!
//    private lazy var secondDate = self.dateFormatter.date(from: "2019-05-05 22:00:00")!
//    private lazy var thirdDate = self.dateFormatter.date(from: "2019-05-05 22:45:00")!
//    private lazy var fourthDate = self.dateFormatter.date(from: "2019-05-05 23:00:00")!
//    private lazy var fifthDate = self.dateFormatter.date(from: "2019-05-05 23:30:00")!
//
//    lazy var events = [AllDayEvent(id: "0", title: "One", startDate: firstDate, endDate: firstDate.add(component: .minute, value: 134), location: "Melbourne", isAllDay: false),
//                       AllDayEvent(id: "1", title: "Two", startDate: secondDate, endDate: secondDate.add(component: .minute, value: 15), location: "Melbourne", isAllDay: false),
//                       AllDayEvent(id: "2", title: "Three", startDate: secondDate, endDate: secondDate.add(component: .minute, value: 119), location: "Melbourne", isAllDay: false),
//                       AllDayEvent(id: "3", title: "Four", startDate: thirdDate, endDate: thirdDate.add(component: .minute, value: 74), location: "Melbourne", isAllDay: false),
//                       AllDayEvent(id: "4", title: "Five", startDate: fourthDate, endDate: fourthDate.add(component: .minute, value: 59), location: "Melbourne", isAllDay: false),
//                       AllDayEvent(id: "5", title: "Six", startDate: fourthDate, endDate: fourthDate.add(component: .minute, value: 59), location: "Melbourne", isAllDay: false),
//                       AllDayEvent(id: "6", title: "Seven", startDate: fourthDate, endDate: fourthDate.add(component: .minute, value: 30), location: "Melbourne", isAllDay: false),
//                       AllDayEvent(id: "7", title: "Eight", startDate: fifthDate, endDate: fifthDate.add(component: .minute, value: 29), location: "Melbourne", isAllDay: false)]
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = Calendar.current.timeZone
        return dateFormatter
    }()
    
    lazy var eventsByDate = JZWeekViewHelper.getIntraEventsByDate(originalEvents: events)
    
    var currentSelectedData: OptionsSelectedData!
}
