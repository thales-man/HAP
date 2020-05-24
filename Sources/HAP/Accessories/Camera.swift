//  Camera.swift
//  HAP
//
//  Created by colin on 20/05/2020.
extension Accessory {
    open class Camera: Accessory {
        public let camera = Service.Camera()

        public init(info: Service.Info, additionalServices: [Service] = []) {
            super.init(info: info, type: .ipCamera, services: [camera] + additionalServices)
        }
    }
}

extension Service {
    open class Camera: CameraStreamManagementBase {
    }
}
