//
//  SharedViewModelStatus.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation

enum BaseViewModelStatusEnum{
    case loading, loaded, error(error: NSError), none
}
