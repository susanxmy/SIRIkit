//
//  IntentHandler.swift
//  SiriPayment
//
//  Created by Susan Xue on 24/11/2017.
//  Copyright © 2017 RWTH Aachen University (Media Computing Group). All rights reserved.
//

import Intents

// As an example, this class is set up to handle Message intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Send a message using <myApp>"
// "<myApp> John saying hello"
// "Search for messages in <myApp>"

class IntentHandler: INExtension {}

/** Questions to ask:
     1) "Add the Siri feature to your app ID" fail
     2) My personal iphone is not authorized? Can't use it to test the app
     3) Why doesn't the payment added in IntentHandler by Siri show up in the UI?
 
 Notes:
 1) Prezi: projector 16:9
 **/

extension IntentHandler : INSendPaymentIntentHandling {
    func handle(intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
        
        guard let amount = intent.currencyAmount?.amount?.doubleValue
            else {
                completion(INSendPaymentIntentResponse(code: .failure, userActivity: nil))
                return
            }
        PaymentHistoryModel.addPayment(payee: "dummyname", amount: amount)
        completion(INSendPaymentIntentResponse(code: .success, userActivity: nil))
        
    }

}



