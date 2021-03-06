//
//  SubscriptionStatus.swift
//  HealthSoftware
//
//  Generated from FHIR 4.4.0-29ad3ab0 (http://hl7.org/fhir/StructureDefinition/SubscriptionStatus)
//  Copyright 2020 Apple Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import FMCore

/**
 Status information about a Subscription provided during event notification.
 
 The SubscriptionStatus resource describes the state of a Subscription during notifications.
 */
open class SubscriptionStatus: DomainResource {
	
	override open class var resourceType: ResourceType { return .subscriptionStatus }
	
	/// The type of event being conveyed with this notificaiton.
	public var notificationType: FHIRPrimitive<SubscriptionNotificationType>
	
	/// Events since the Subscription was created
	public var eventsSinceSubscriptionStart: FHIRPrimitive<FHIRInteger64>?
	
	/// Events in this notification
	public var eventsInNotification: FHIRPrimitive<FHIRInteger>?
	
	/// Reference to the Subscription responsible for this notification
	public var subscription: Reference
	
	/// The status of the subscription, which marks the server state for managing the subscription.
	public var status: FHIRPrimitive<SubscriptionState>?
	
	/// Reference to the SubscriptionTopic this notification relates to
	public var topic: Reference
	
	/// Designated initializer taking all required properties
	public init(notificationType: FHIRPrimitive<SubscriptionNotificationType>, subscription: Reference, topic: Reference) {
		self.notificationType = notificationType
		self.subscription = subscription
		self.topic = topic
		super.init()
	}
	
	/// Convenience initializer
	public convenience init(
							contained: [ResourceProxy]? = nil,
							eventsInNotification: FHIRPrimitive<FHIRInteger>? = nil,
							eventsSinceSubscriptionStart: FHIRPrimitive<FHIRInteger64>? = nil,
							`extension`: [Extension]? = nil,
							id: FHIRPrimitive<FHIRString>? = nil,
							implicitRules: FHIRPrimitive<FHIRURI>? = nil,
							language: FHIRPrimitive<FHIRString>? = nil,
							meta: Meta? = nil,
							modifierExtension: [Extension]? = nil,
							notificationType: FHIRPrimitive<SubscriptionNotificationType>,
							status: FHIRPrimitive<SubscriptionState>? = nil,
							subscription: Reference,
							text: Narrative? = nil,
							topic: Reference)
	{
		self.init(notificationType: notificationType, subscription: subscription, topic: topic)
		self.contained = contained
		self.eventsInNotification = eventsInNotification
		self.eventsSinceSubscriptionStart = eventsSinceSubscriptionStart
		self.`extension` = `extension`
		self.id = id
		self.implicitRules = implicitRules
		self.language = language
		self.meta = meta
		self.modifierExtension = modifierExtension
		self.status = status
		self.text = text
	}
	
	// MARK: - Codable
	
	private enum CodingKeys: String, CodingKey {
		case eventsInNotification; case _eventsInNotification
		case eventsSinceSubscriptionStart; case _eventsSinceSubscriptionStart
		case notificationType; case _notificationType
		case status; case _status
		case subscription
		case topic
	}
	
	/// Initializer for Decodable
	public required init(from decoder: Decoder) throws {
		let _container = try decoder.container(keyedBy: CodingKeys.self)
		
		// Decode all our properties
		self.eventsInNotification = try FHIRPrimitive<FHIRInteger>(from: _container, forKeyIfPresent: .eventsInNotification, auxiliaryKey: ._eventsInNotification)
		self.eventsSinceSubscriptionStart = try FHIRPrimitive<FHIRInteger64>(from: _container, forKeyIfPresent: .eventsSinceSubscriptionStart, auxiliaryKey: ._eventsSinceSubscriptionStart)
		self.notificationType = try FHIRPrimitive<SubscriptionNotificationType>(from: _container, forKey: .notificationType, auxiliaryKey: ._notificationType)
		self.status = try FHIRPrimitive<SubscriptionState>(from: _container, forKeyIfPresent: .status, auxiliaryKey: ._status)
		self.subscription = try Reference(from: _container, forKey: .subscription)
		self.topic = try Reference(from: _container, forKey: .topic)
		try super.init(from: decoder)
	}
	
	/// Encodable
	public override func encode(to encoder: Encoder) throws {
		var _container = encoder.container(keyedBy: CodingKeys.self)
		
		// Encode all our properties
		try eventsInNotification?.encode(on: &_container, forKey: .eventsInNotification, auxiliaryKey: ._eventsInNotification)
		try eventsSinceSubscriptionStart?.encode(on: &_container, forKey: .eventsSinceSubscriptionStart, auxiliaryKey: ._eventsSinceSubscriptionStart)
		try notificationType.encode(on: &_container, forKey: .notificationType, auxiliaryKey: ._notificationType)
		try status?.encode(on: &_container, forKey: .status, auxiliaryKey: ._status)
		try subscription.encode(on: &_container, forKey: .subscription)
		try topic.encode(on: &_container, forKey: .topic)
		try super.encode(to: encoder)
	}
	
	// MARK: - Equatable & Hashable
	
	public override func isEqual(to _other: Any?) -> Bool {
		guard let _other = _other as? SubscriptionStatus else {
			return false
		}
		guard super.isEqual(to: _other) else {
			return false
		}
		return eventsInNotification == _other.eventsInNotification
		    && eventsSinceSubscriptionStart == _other.eventsSinceSubscriptionStart
		    && notificationType == _other.notificationType
		    && status == _other.status
		    && subscription == _other.subscription
		    && topic == _other.topic
	}
	
	public override func hash(into hasher: inout Hasher) {
		super.hash(into: &hasher)
		hasher.combine(eventsInNotification)
		hasher.combine(eventsSinceSubscriptionStart)
		hasher.combine(notificationType)
		hasher.combine(status)
		hasher.combine(subscription)
		hasher.combine(topic)
	}
}
