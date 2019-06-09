//
//  IssueModel.swift
//  JusticeAppp
//
//  Created by iosdev on 6/8/19.
//  Copyright © 2019 Ivan Karpets. All rights reserved.
//

import Foundation

enum IssueStatus{
    case submitted, transmitted, considered, done, canceled
}

enum PersonCategory{
    case invalid, elderly, homeless, others
    
}

class Issue{
    
    var shortName: String
    var status: IssueStatus
    var number: String
    var date: String
    lazy var statusText: String = self.defineStatusText(status: self.status)
    var personCategory: PersonCategory
    var sinPerson: String
    var comment: String
    
    init(name: String, status: IssueStatus, number: String, date: String, personCategory: PersonCategory, sinPerson:String, comment: String ) {
        self.shortName = name
        self.status = status
        self.number = number
        self.date = date
        self.personCategory = personCategory
        self.sinPerson = sinPerson
        self.comment = comment
    }
    
    func defineStatusText(status: IssueStatus)-> String{
        switch status {
        case .submitted:
            return "Ваш запит оброблюється"
        case .transmitted:
            return "Передано до відповідної установи"
        case .considered:
            return "Розглядається"
        case .done:
            return "Вирішено"
        case .canceled:
            return "Відхилено"
        default:
            return ""
        }
    }
}
