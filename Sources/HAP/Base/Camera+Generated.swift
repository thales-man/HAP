import Foundation

public extension ServiceType {
    static let cameraOperatingMode = ServiceType(0x021A)
    static let cameraStreamManagement = ServiceType(0x0110)
}

// swiftlint:disable no_grouping_extension
public extension CharacteristicType {
    static let cameraOperatingModeIndicator = CharacteristicType(0x021D)
    static let eventSnapshotsActive = CharacteristicType(0x0223)
    static let homekitCameraActive = CharacteristicType(0x021B)
    static let nightVision = CharacteristicType(0x011B)
    static let manuallyDisabled = CharacteristicType(0x0227)
    static let periodicSnapshotsActive = CharacteristicType(0x0225)
    static let selectedCameraRecordingConfiguration = CharacteristicType(0x0209)
    static let selectedStreamConfiguration = CharacteristicType(0x0117)
    static let setupEndpoint = CharacteristicType(0x0118)
    static let streamingStatus = CharacteristicType(0x0120)
    static let supportedAudioStreamConfiguration = CharacteristicType(0x0115)
    static let supportedRtpConfiguration = CharacteristicType(0x0116)
    static let supportedVideoStreamConfiguration = CharacteristicType(0x0114)
    static let thirdPartyCameraActive = CharacteristicType(0x021C)
}

extension Service {
    open class CameraOperatingModeBase: Service {
        // Required Characteristics
        public let eventSnapshotsActive: GenericCharacteristic<Bool>
        public let homekitCameraActive: GenericCharacteristic<Bool>
        
        // Optional Characteristics
        public let manuallyDisabled: GenericCharacteristic<Bool>?
        public let nightVision: GenericCharacteristic<Bool>?
        public let thirdPartyCameraActive: GenericCharacteristic<Bool>?
        public let cameraOperatingModeIndicator: GenericCharacteristic<Bool>?
        public let periodicSnapshotsActive: GenericCharacteristic<Bool>?
        
        public init(characteristics: [AnyCharacteristic] = []) {
            var unwrapped = characteristics.map { $0.wrapped }
            eventSnapshotsActive = getOrCreateAppend(
                type: .eventSnapshotsActive,
                characteristics: &unwrapped,
                generator: { PredefinedCharacteristic.eventSnapshotsActive() })
            homekitCameraActive = getOrCreateAppend(
                type: .homekitCameraActive,
                characteristics: &unwrapped,
                generator: { PredefinedCharacteristic.homekitCameraActive() })
            manuallyDisabled = get(type: .manuallyDisabled, characteristics: unwrapped)
            nightVision = get(type: .nightVision, characteristics: unwrapped)
            thirdPartyCameraActive = get(type: .thirdPartyCameraActive, characteristics: unwrapped)
            cameraOperatingModeIndicator = get(type: .cameraOperatingModeIndicator, characteristics: unwrapped)
            periodicSnapshotsActive = get(type: .periodicSnapshotsActive, characteristics: unwrapped)
            super.init(type: .cameraOperatingMode, characteristics: unwrapped)
        }
    }
    
    open class CameraStreamManagementBase: Service {
        // Required Characteristics
        public let selectedStreamConfiguration: GenericCharacteristic<Data>
        public let setupEndpoint: GenericCharacteristic<Data>
        public let streamingStatus: GenericCharacteristic<Data>
        public let supportedAudioStreamConfiguration: GenericCharacteristic<Data>
        public let supportedRtpConfiguration: GenericCharacteristic<Data>
        public let supportedVideoStreamConfiguration: GenericCharacteristic<Data>
        
        // Optional Characteristics
        public let active: GenericCharacteristic<Enums.Active>?
        
        public init(characteristics: [AnyCharacteristic] = []) {
            var unwrapped = characteristics.map { $0.wrapped }
            selectedStreamConfiguration = getOrCreateAppend(
                type: .selectedStreamConfiguration,
                characteristics: &unwrapped,
                generator: { PredefinedCharacteristic.selectedStreamConfiguration() })
            setupEndpoint = getOrCreateAppend(
                type: .setupEndpoint,
                characteristics: &unwrapped,
                generator: { PredefinedCharacteristic.setupEndpoint() })
            streamingStatus = getOrCreateAppend(
                type: .streamingStatus,
                characteristics: &unwrapped,
                generator: { PredefinedCharacteristic.streamingStatus() })
            supportedAudioStreamConfiguration = getOrCreateAppend(
                type: .supportedAudioStreamConfiguration,
                characteristics: &unwrapped,
                generator: { PredefinedCharacteristic.supportedAudioStreamConfiguration() })
            supportedRtpConfiguration = getOrCreateAppend(
                type: .supportedRtpConfiguration,
                characteristics: &unwrapped,
                generator: { PredefinedCharacteristic.supportedRtpConfiguration() })
            supportedVideoStreamConfiguration = getOrCreateAppend(
                type: .supportedVideoStreamConfiguration,
                characteristics: &unwrapped,
                generator: { PredefinedCharacteristic.supportedVideoStreamConfiguration() })
            active = get(type: .active, characteristics: unwrapped)
            super.init(type: .cameraStreamManagement, characteristics: unwrapped)
        }
    }
}

public extension AnyCharacteristic {
    
    static func cameraOperatingModeIndicator(
        _ value: Bool = false,
        permissions: [CharacteristicPermission] = [.read, .write, .events],
        description: String? = "Camera Operating Mode Indicator",
        format: CharacteristicFormat? = .bool,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> AnyCharacteristic {
        return AnyCharacteristic(
            PredefinedCharacteristic.cameraOperatingModeIndicator(
                value,
                permissions: permissions,
                description: description,
                format: format,
                unit: unit,
                maxLength: maxLength,
                maxValue: maxValue,
                minValue: minValue,
                minStep: minStep) as Characteristic)
    }
    
    static func eventSnapshotsActive(
        _ value: Bool = false,
        permissions: [CharacteristicPermission] = [.read, .write, .events],
        description: String? = "Event Snapshots Active",
        format: CharacteristicFormat? = .bool,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> AnyCharacteristic {
        return AnyCharacteristic(
            PredefinedCharacteristic.eventSnapshotsActive(
                value,
                permissions: permissions,
                description: description,
                format: format,
                unit: unit,
                maxLength: maxLength,
                maxValue: maxValue,
                minValue: minValue,
                minStep: minStep) as Characteristic)
    }
    
    static func homekitCameraActive(
        _ value: Bool = false,
        permissions: [CharacteristicPermission] = [.read, .write, .events],
        description: String? = "HomeKit Camera Active",
        format: CharacteristicFormat? = .bool,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> AnyCharacteristic {
        return AnyCharacteristic(
            PredefinedCharacteristic.homekitCameraActive(
                value,
                permissions: permissions,
                description: description,
                format: format,
                unit: unit,
                maxLength: maxLength,
                maxValue: maxValue,
                minValue: minValue,
                minStep: minStep) as Characteristic)
    }
    
    static func nightVision(
        _ value: Bool = false,
        permissions: [CharacteristicPermission] = [.read, .write, .events],
        description: String? = "Night Vision",
        format: CharacteristicFormat? = .bool,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> AnyCharacteristic {
        return AnyCharacteristic(
            PredefinedCharacteristic.nightVision(
                value,
                permissions: permissions,
                description: description,
                format: format,
                unit: unit,
                maxLength: maxLength,
                maxValue: maxValue,
                minValue: minValue,
                minStep: minStep) as Characteristic)
    }
    
    static func periodicSnapshotsActive(
        _ value: Bool = false,
        permissions: [CharacteristicPermission] = [.read, .write, .events],
        description: String? = "Periodic Snapshots Active",
        format: CharacteristicFormat? = .bool,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> AnyCharacteristic {
        return AnyCharacteristic(
            PredefinedCharacteristic.periodicSnapshotsActive(
                value,
                permissions: permissions,
                description: description,
                format: format,
                unit: unit,
                maxLength: maxLength,
                maxValue: maxValue,
                minValue: minValue,
                minStep: minStep) as Characteristic)
    }
    
    static func selectedCameraRecordingConfiguration(
        _ value: Data = Data(),
        permissions: [CharacteristicPermission] = [.read, .write, .events],
        description: String? = "Selected Camera Recording Configuration",
        format: CharacteristicFormat? = .tlv8,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> AnyCharacteristic {
        return AnyCharacteristic(
            PredefinedCharacteristic.selectedCameraRecordingConfiguration(
                value,
                permissions: permissions,
                description: description,
                format: format,
                unit: unit,
                maxLength: maxLength,
                maxValue: maxValue,
                minValue: minValue,
                minStep: minStep) as Characteristic)
    }
    
    static func selectedStreamConfiguration(
        _ value: Data = Data(),
        permissions: [CharacteristicPermission] = [.read, .write],
        description: String? = "Selected Stream Configuration",
        format: CharacteristicFormat? = .tlv8,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> AnyCharacteristic {
        return AnyCharacteristic(
            PredefinedCharacteristic.selectedStreamConfiguration(
                value,
                permissions: permissions,
                description: description,
                format: format,
                unit: unit,
                maxLength: maxLength,
                maxValue: maxValue,
                minValue: minValue,
                minStep: minStep) as Characteristic)
    }
    
    static func setupEndpoint(
        _ value: Data = Data(),
        permissions: [CharacteristicPermission] = [.read, .write],
        description: String? = "Setup Endpoint",
        format: CharacteristicFormat? = .tlv8,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> AnyCharacteristic {
        return AnyCharacteristic(
            PredefinedCharacteristic.setupEndpoint(
                value,
                permissions: permissions,
                description: description,
                format: format,
                unit: unit,
                maxLength: maxLength,
                maxValue: maxValue,
                minValue: minValue,
                minStep: minStep) as Characteristic)
    }
    
    static func streamingStatus(
        _ value: Data = Data(),
        permissions: [CharacteristicPermission] = [.read, .events],
        description: String? = "Streaming Status",
        format: CharacteristicFormat? = .tlv8,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> AnyCharacteristic {
        return AnyCharacteristic(
            PredefinedCharacteristic.streamingStatus(
                value,
                permissions: permissions,
                description: description,
                format: format,
                unit: unit,
                maxLength: maxLength,
                maxValue: maxValue,
                minValue: minValue,
                minStep: minStep) as Characteristic)
    }
    
    
    static func supportedRtpConfiguration(
        _ value: Data = Data(),
        permissions: [CharacteristicPermission] = [.read],
        description: String? = "Supported RTP Configuration",
        format: CharacteristicFormat? = .tlv8,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> AnyCharacteristic {
        return AnyCharacteristic(
            PredefinedCharacteristic.supportedRtpConfiguration(
                value,
                permissions: permissions,
                description: description,
                format: format,
                unit: unit,
                maxLength: maxLength,
                maxValue: maxValue,
                minValue: minValue,
                minStep: minStep) as Characteristic)
    }
    
    static func supportedVideoStreamConfiguration(
        _ value: Data = Data(),
        permissions: [CharacteristicPermission] = [.read],
        description: String? = "Supported Video Stream Configuration",
        format: CharacteristicFormat? = .tlv8,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> AnyCharacteristic {
        return AnyCharacteristic(
            PredefinedCharacteristic.supportedVideoStreamConfiguration(
                value,
                permissions: permissions,
                description: description,
                format: format,
                unit: unit,
                maxLength: maxLength,
                maxValue: maxValue,
                minValue: minValue,
                minStep: minStep) as Characteristic)
    }
    
    static func thirdPartyCameraActive(
        _ value: Bool = false,
        permissions: [CharacteristicPermission] = [.read, .events],
        description: String? = "Third Party Camera Active",
        format: CharacteristicFormat? = .bool,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> AnyCharacteristic {
        return AnyCharacteristic(
            PredefinedCharacteristic.thirdPartyCameraActive(
                value,
                permissions: permissions,
                description: description,
                format: format,
                unit: unit,
                maxLength: maxLength,
                maxValue: maxValue,
                minValue: minValue,
                minStep: minStep) as Characteristic)
    }
}

extension PredefinedCharacteristic {
    
    static func cameraOperatingModeIndicator(
        _ value: Bool = false,
        permissions: [CharacteristicPermission] = [.read, .write, .events],
        description: String? = "Camera Operating Mode Indicator",
        format: CharacteristicFormat? = .bool,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> GenericCharacteristic<Bool> {
        return GenericCharacteristic<Bool>(
            type: .cameraOperatingModeIndicator,
            value: value,
            permissions: permissions,
            description: description,
            format: format,
            unit: unit,
            maxLength: maxLength,
            maxValue: maxValue,
            minValue: minValue,
            minStep: minStep)
    }
    
    static func eventSnapshotsActive(
        _ value: Bool = false,
        permissions: [CharacteristicPermission] = [.read, .write, .events],
        description: String? = "Event Snapshots Active",
        format: CharacteristicFormat? = .bool,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> GenericCharacteristic<Bool> {
        return GenericCharacteristic<Bool>(
            type: .eventSnapshotsActive,
            value: value,
            permissions: permissions,
            description: description,
            format: format,
            unit: unit,
            maxLength: maxLength,
            maxValue: maxValue,
            minValue: minValue,
            minStep: minStep)
    }
    
    static func homekitCameraActive(
        _ value: Bool = false,
        permissions: [CharacteristicPermission] = [.read, .write, .events],
        description: String? = "HomeKit Camera Active",
        format: CharacteristicFormat? = .bool,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> GenericCharacteristic<Bool> {
        return GenericCharacteristic<Bool>(
            type: .homekitCameraActive,
            value: value,
            permissions: permissions,
            description: description,
            format: format,
            unit: unit,
            maxLength: maxLength,
            maxValue: maxValue,
            minValue: minValue,
            minStep: minStep)
    }
    
    static func nightVision(
        _ value: Bool = false,
        permissions: [CharacteristicPermission] = [.read, .write, .events],
        description: String? = "Night Vision",
        format: CharacteristicFormat? = .bool,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> GenericCharacteristic<Bool> {
        return GenericCharacteristic<Bool>(
            type: .nightVision,
            value: value,
            permissions: permissions,
            description: description,
            format: format,
            unit: unit,
            maxLength: maxLength,
            maxValue: maxValue,
            minValue: minValue,
            minStep: minStep)
    }
    
    static func periodicSnapshotsActive(
        _ value: Bool = false,
        permissions: [CharacteristicPermission] = [.read, .write, .events],
        description: String? = "Periodic Snapshots Active",
        format: CharacteristicFormat? = .bool,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> GenericCharacteristic<Bool> {
        return GenericCharacteristic<Bool>(
            type: .periodicSnapshotsActive,
            value: value,
            permissions: permissions,
            description: description,
            format: format,
            unit: unit,
            maxLength: maxLength,
            maxValue: maxValue,
            minValue: minValue,
            minStep: minStep)
    }
    
    static func selectedCameraRecordingConfiguration(
        _ value: Data = Data(),
        permissions: [CharacteristicPermission] = [.read, .write, .events],
        description: String? = "Selected Camera Recording Configuration",
        format: CharacteristicFormat? = .tlv8,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> GenericCharacteristic<Data> {
        return GenericCharacteristic<Data>(
            type: .selectedCameraRecordingConfiguration,
            value: value,
            permissions: permissions,
            description: description,
            format: format,
            unit: unit,
            maxLength: maxLength,
            maxValue: maxValue,
            minValue: minValue,
            minStep: minStep)
    }
    
    static func selectedStreamConfiguration(
        _ value: Data = Data(),
        permissions: [CharacteristicPermission] = [.read, .write],
        description: String? = "Selected Stream Configuration",
        format: CharacteristicFormat? = .tlv8,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> GenericCharacteristic<Data> {
        return GenericCharacteristic<Data>(
            type: .selectedStreamConfiguration,
            value: value,
            permissions: permissions,
            description: description,
            format: format,
            unit: unit,
            maxLength: maxLength,
            maxValue: maxValue,
            minValue: minValue,
            minStep: minStep)
    }
    
    static func setupEndpoint(
        _ value: Data = Data(),
        permissions: [CharacteristicPermission] = [.read, .write],
        description: String? = "Setup Endpoint",
        format: CharacteristicFormat? = .tlv8,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> GenericCharacteristic<Data> {
        return GenericCharacteristic<Data>(
            type: .setupEndpoint,
            value: value,
            permissions: permissions,
            description: description,
            format: format,
            unit: unit,
            maxLength: maxLength,
            maxValue: maxValue,
            minValue: minValue,
            minStep: minStep)
    }
    
    static func streamingStatus(
        _ value: Data = Data(),
        permissions: [CharacteristicPermission] = [.read, .events],
        description: String? = "Streaming Status",
        format: CharacteristicFormat? = .tlv8,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> GenericCharacteristic<Data> {
        return GenericCharacteristic<Data>(
            type: .streamingStatus,
            value: value,
            permissions: permissions,
            description: description,
            format: format,
            unit: unit,
            maxLength: maxLength,
            maxValue: maxValue,
            minValue: minValue,
            minStep: minStep)
    }
    
    static func supportedAudioStreamConfiguration(
        _ value: Data = Data(),
        permissions: [CharacteristicPermission] = [.read],
        description: String? = "Supported Audio Stream Configuration",
        format: CharacteristicFormat? = .tlv8,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> GenericCharacteristic<Data> {
        return GenericCharacteristic<Data>(
            type: .supportedAudioStreamConfiguration,
            value: value,
            permissions: permissions,
            description: description,
            format: format,
            unit: unit,
            maxLength: maxLength,
            maxValue: maxValue,
            minValue: minValue,
            minStep: minStep)
    }
    
    static func supportedRtpConfiguration(
        _ value: Data = Data(),
        permissions: [CharacteristicPermission] = [.read],
        description: String? = "Supported RTP Configuration",
        format: CharacteristicFormat? = .tlv8,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> GenericCharacteristic<Data> {
        return GenericCharacteristic<Data>(
            type: .supportedRtpConfiguration,
            value: value,
            permissions: permissions,
            description: description,
            format: format,
            unit: unit,
            maxLength: maxLength,
            maxValue: maxValue,
            minValue: minValue,
            minStep: minStep)
    }
    
    static func supportedVideoStreamConfiguration(
        _ value: Data = Data(),
        permissions: [CharacteristicPermission] = [.read],
        description: String? = "Supported Video Stream Configuration",
        format: CharacteristicFormat? = .tlv8,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> GenericCharacteristic<Data> {
        return GenericCharacteristic<Data>(
            type: .supportedVideoStreamConfiguration,
            value: value,
            permissions: permissions,
            description: description,
            format: format,
            unit: unit,
            maxLength: maxLength,
            maxValue: maxValue,
            minValue: minValue,
            minStep: minStep)
    }
    
    static func thirdPartyCameraActive(
        _ value: Bool = false,
        permissions: [CharacteristicPermission] = [.read, .events],
        description: String? = "Third Party Camera Active",
        format: CharacteristicFormat? = .bool,
        unit: CharacteristicUnit? = nil,
        maxLength: Int? = nil,
        maxValue: Double? = nil,
        minValue: Double? = nil,
        minStep: Double? = nil
    ) -> GenericCharacteristic<Bool> {
        return GenericCharacteristic<Bool>(
            type: .thirdPartyCameraActive,
            value: value,
            permissions: permissions,
            description: description,
            format: format,
            unit: unit,
            maxLength: maxLength,
            maxValue: maxValue,
            minValue: minValue,
            minStep: minStep)
    }
}
