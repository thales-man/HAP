//  resource().swift
//  HAP
//
//  Created by colin on 31/05/2020.
//  Copyright © 2020 the striped lawn company. All rights reserved.
import Foundation
import Logging
import HTTP

fileprivate let logger = Logger(label: "hap.endpoints.pairings")

func resource(device: Device) -> Responder {
//    let controller = ResourceController(device: device)

    return { context, request in
        guard request.method == .POST else {
            return HTTPResponse(status: .methodNotAllowed)
        }
        guard
            let body = request.body.data //,
//            let data: PairTagTLV8 = try? decode(body)
//            data[.state]?[0] == PairStep.request.rawValue,
//            let method = data[.pairingMethod].flatMap({ PairingMethod(rawValue: $0[0]) })
            else {
                return .badRequest
        }

        // TODO: authorization
        logger.info("received body: \(String(decoding: body, as: UTF8.self))")
//        let pairing = device.controllerHandler?.getPairingForChannel(context.channel)
//        guard pairing?.role == .admin else {
//            logger.warning("Permission denied (non-admin) to update pairing data: \(data), method: \(method)")
//            let result: PairTagTLV8 = [
//                (.state, Data([PairStep.response.rawValue])),
//                (.error, Data([PairError.authenticationFailed.rawValue]))
//            ]
//            return HTTPResponse(tags: result)
//        }
//
//        logger.debug("Updating pairings data: \(data), method: \(method)")
//
//        switch method {
//        case .addPairing:
//            guard let username = data[.identifier],
//                let publicKey = data[.publicKey],
//                let permissions = data[.permissions]?.first,
//                let role = Pairing.Role(rawValue: permissions) else {
//                    return .badRequest
//            }
//            device.add(pairing: Pairing(identifier: username, publicKey: publicKey, role: role))
//            logger.info("Added \(role) pairing for \(String(data: username, encoding: .utf8)!)")
//        case .removePairing:
//            guard let username = data[.identifier] else {
//                return .badRequest
//            }
//            device.remove(pairingWithIdentifier: username)
//            logger.info("Removed pairing for \(String(data: username, encoding: .utf8)!)")
//        case .listPairings:
//            logger.debug("Listing parings")
//            let result = controller.listPairings()
//            return HTTPResponse(tags: result)
//        default:
//            logger.info("Unhandled PairingMethod request: \(method)")
//            return .badRequest
//        }
//
        let result: PairTagTLV8 = [
//            (.state, Data([PairStep.response.rawValue]))
        ]

        return HTTPResponse(tags: result)
    }
}
