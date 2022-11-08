//
//  Validation.swift
//  moshtary
//
//  Created by admin on 1/17/20.
//  Copyright © 2020 com.pomac.moshtary. All rights reserved.
//

import Foundation

class Validation<T> {
    
    internal enum ValidationCases {
        case name
        case email
        case isEgPhone
        case isNotEGPhone
        case number
        case password(_: Int) // number of chars
        case equalTo(_: Any)
        case code
        case arrayNotEmpty
        case minimum(Int)
        case maximum(Int)
        case isTime(format: String)
        case isDate(format: String)
    }
    
    var conditions: [String: [String: [ValidationCases]]] = [:]
    private var replacedString1: String = "" // @@
    private var replacedString2: String = "" // !!
    
    func validate(model: T) -> String?
    {
        let mirror = Mirror(reflecting: model)
        for (_, item) in mirror.children.enumerated() {
            if let text = item.label {
                if let label = conditions[text] {
                    guard let wordsToReplace = label.keys.first else {
                        return "error use name for every conditions "
                    }
                    self.replacedString1 = wordsToReplace
                    self.replacedString2 = ""
                    let value = item.value
                    for (_, state) in (label.values.first?.enumerated())!
                    {
                        // MARK:- CASES
                        
                        switch state {
                            
                        case .email:
                            let result = self.isEmail(email: value)
                            if (result != nil ) {
                                return result
                            }
                            break
                        case .name:
                            let result = self.isName(name: value)
                            if (result != nil ) {
                                return result
                            }
                            break
                        case .isEgPhone:
                            let result = self.isEGPhone(phone: value)
                            if (result != nil ) {
                                return result
                            }
                            break
                        case .isNotEGPhone:
                            let result = self.isNotEGPhone(phone: value)
                            if (result != nil ) {
                                return result
                            }
                            break
                        case .number:
                            let result = self.isNumber(number: value)
                            if (result != nil ) {
                                return result
                            }
                            break
                        case .code:
                            let result = self.isCode(code: value)
                            if (result != nil ) {
                                return result
                            }
                            break
                        case .password(let count):
                            let result = self.isPassword(password: value, count: count)
                            if (result != nil ) {
                                return result
                            }
                            break
                        case .equalTo(let str) :
                            let result = self.isMatched(pass1: value, pass2: str)
                            if (result != nil ) {
                                return result
                            }
                            break
                        case .arrayNotEmpty :
                            let result = self.isNotEmptyArray(arr: value)
                            if (result != nil ) {
                                return result
                            }
                            break
                        case .minimum(let min) :
                            let result = self.minCase(word: value, min: min)
                            if (result != nil ) {
                                return result
                            }
                            break
                        case .maximum(let max) :
                            let result = self.maxCase(word: value, max: max)
                            if (result != nil ) {
                                return result
                            }
                            break
                        case .isTime(format: let format):
                            let result = self.isItTime(time: value, format: format)
                            if (result != nil ) {
                                return result
                            }
                            break
                        case .isDate(format: let format):
                            let result = self.isItDate(date: value, format: format)
                            if (result != nil ) {
                                return result
                            }
                            break
                        } // END OF SWITCH
                        
                    } // END OF LABEL CASES
                }
            }
        }
        return nil
    }
    
    private func isEmail(email: Any) -> String? /// done
    {
        guard let email = email as? String, email.isEmpty == false else {
            return errorMessage(error: "validation_empty_email")
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let state = emailPred.evaluate(with: email)
        return (state == true) ? nil : errorMessage(error: "validation_wrong_email")
    }
    
    private func isName(name: Any) -> String? //// done
    {
        guard let name = name as? String, name.isEmpty == false else {
            return errorMessage(error: "validation_empty_name")
        }
        let nameRegEx = "^[ء-يa-zA-Z0-9 ]{2,50}"
        let namePred = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        let state = namePred.evaluate(with: name)
        return (state == true) ? nil : errorMessage(error: "validation_wrong_name")
    }
    
    private func isCode(code: Any) -> String? //// done
    {
        guard let code = code as? String, code.isEmpty == false else {
            return errorMessage(error: "validation_empty_verification_code")
        }
        let codeRegEx = "[0-9]{4}"
        let codePred = NSPredicate(format:"SELF MATCHES %@", codeRegEx)
        let state = codePred.evaluate(with: code)
        return (state == true) ? nil : errorMessage(error: "validation_wrong_verification_code")
    }
    
    
    private func isEGPhone(phone: Any) -> String? //// done
    {
        guard let phone = phone as? String, phone.isEmpty == false else {
            return errorMessage(error: "validation_empty_phone")
        }
        let phoneRegEx = "(01)[0-9]{9}"
        let phonePred = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        let state = phonePred.evaluate(with: phone)
        return (state == true) ? nil : errorMessage(error: "validation_wrong_eg_phone")
    }
    
    private func isNotEmptyArray(arr: Any) -> String? ///// done
    {
        guard let arr = arr as? [Any], arr.count > 0 else {
            return errorMessage(error: "validation_empty_array")
        }
        return nil
    }
    
    private func isNotEGPhone(phone: Any) -> String? ///// done
    {
        guard let phone = phone as? String, phone.isEmpty == false else {
            return errorMessage(error: "validation_empty_phone")
        }
        let phoneRegEx = "[0-9]{9,16}"
        let phonePred = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        let state = phonePred.evaluate(with: phone)
        return (state == true) ? nil : errorMessage(error: "validation_wrong_forign_phone")
    }
    
    private func isNumber(number: Any) -> String? { //// done
        let numberRegEx = "^[0-9.]{1,}"
        let numberPred = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let state = numberPred.evaluate(with: "\(number)")
        return (state == true) ? nil : errorMessage(error: "validation_is_not_number")
    }
    
    
    private func isPassword(password: Any, count: Int) -> String? { ///// done
        guard let password = password as? String,
            password.isEmpty == false else {
                return errorMessage(error: "validation_empty_password")
        }
        self.replacedString2 = "\(count)"
        let passwordRegEx = "[a-zA-Z0-9*!@#$%+/|\\^&*_-]{\(count),16}"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        let state = passwordPred.evaluate(with: password)
        return (state == true) ? nil : errorMessage(error: "validation_wrong_password")
    }
    
    private func isMatched(pass1: Any, pass2: Any) -> String? { ///// DONE
        guard let pass = pass1 as? String, pass.isEmpty == false else {
            return errorMessage(error: "validation_empty_password")
        }
        if (pass1 as! String) == (pass2 as! String) {
            return nil
        } else {
            return errorMessage(error: "validation_password_not_match")
        }
    }
    
    private func minCase(word: Any, min: Int) -> String? { //// done
        self.replacedString2 = String(min)
        if let number = word as? NSNumber {
            if  Int(truncating: number) >= min {
                return nil
            }else {
                return errorMessage(error: "number_should_exceed_minimum_value")
            }
        } else if let word = word as? String {
            return (word.count >= min) ? nil : self.errorMessage(error: "word_should_exceed_minimum_value")
        }
        return errorMessage(error: "number_should_exceed_minimum_value")
    }
    
    private func maxCase(word: Any, max: Int) -> String? { //// done
        self.replacedString2 = String(max)
        if let number = word as? NSNumber {
            if  Int(truncating: number) <= max {
                return nil
            }else {
                return errorMessage(error: "number_should_not_exceed_maximum_value")
            }
        } else if let word = word as? String {
            let wordRegEx = "^[\\p{Arabic}\\s\\p{N}a-zA-Z0-9 !-_,]{0,\(max)}"
            let wordPred = NSPredicate(format:"SELF MATCHES %@", wordRegEx)
            let state = wordPred.evaluate(with: word)
            return (state == true) ? nil : errorMessage(error: "word_should_not_exceed_maximum_value")
        }
        
        return errorMessage(error: "number_should_not_exceed_maximum_value")
    }
    
    private func isItTime(time: Any, format: String) -> String?
    {
        self.replacedString2 = format
        if let time = time as? String, format.count == time.count {
            let formateer = returnFormatter(format: format)
            return (formateer.date(from: time) == nil) ? errorMessage(error: "validation_time_error") : nil
        }else {
            return errorMessage(error: "not_a_time")
        }
    }
    
    private func isItDate(date: Any, format: String) -> String?
    {
        self.replacedString2 = format
        if let date = date as? String, date.count == format.count {
            let formateer = returnFormatter(format: format)
            return (formateer.date(from: date) == nil) ? errorMessage(error: "validation_date_error") : nil
        }else {
            return errorMessage(error: "not_a_date")
        }
    }
    
    private func returnFormatter(format: String) -> DateFormatter
    {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter
    }
    
    
    private func errorMessage(error: String) -> String
    {
        let by1 = self.replacedString1.localized
        let by2 = self.replacedString2
        let message = error.localized
            .replacingOccurrences(of: "@@", with: by1)
            .replacingOccurrences(of: "!!", with: by2)
        return message
    }
    
}


/**
 ===================================
 HOW TO USE
 =================================
 -> let model = UserViewModel()
 -> let validation = Validation<UserViewModel>()
 -> validation.conditions = [
 "name": [.name], "email": [.email], "password1": [.password, .equalTo("ahmed_samir")]
 ]
 If let error = validation.validate(model: model) {
 -> router.displayToast(message: error)
 }else {
 ->
 }
 
 */
