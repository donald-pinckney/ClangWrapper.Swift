//
//  RefQualifierKind.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/22.
//  Copyright (c) 2015 Eonil. All rights reserved.
//



public enum RefQualifierKind: UInt32 {
	///	No ref-qualifier was provided.
	case None	=	0
	
	///	An lvalue ref-qualifier was provided (&).
	case LValue
	
	///	An rvalue ref-qualifier was provided (&&).
	case RValue
}

extension RefQualifierKind {
	static func fromRaw(raw r:CXRefQualifierKind) -> RefQualifierKind {
		return	self.init(raw: r)
	}
	///	Doesn't work well in Swift 1.2.
	///	Use `fromRaw` instead of.
	init(raw: CXRefQualifierKind) {
		switch raw.rawValue {
		case CXRefQualifier_None.rawValue:		self	=	None
		case CXRefQualifier_LValue.rawValue:	self	=	LValue
		case CXRefQualifier_RValue.rawValue:	self	=	RValue
		default:
			fatalError("Unknown `CXRefQualifierKind` value: \(raw)")
		}
	}
	var raw:CXRefQualifierKind {
		get {
			switch self {
			case .None:		return	CXRefQualifier_None
			case .LValue:	return	CXRefQualifier_LValue
			case .RValue:	return	CXRefQualifier_RValue
			}
		}
	}
}