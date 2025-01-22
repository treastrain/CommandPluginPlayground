//
//  CommandPluginPlayground.swift
//  CommandPluginPlayground
//
//  Created by treastrain on 2025/01/23.
//

import Foundation
import PackagePlugin

@main
struct CommandPluginPlayground: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        let tool = try context.tool(named: "playground")
        let process = try Process.run(tool.url, arguments: arguments)
        process.waitUntilExit()
    }
}
