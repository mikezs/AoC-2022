import Algorithms
import Foundation

public final class Day7: Day {
    class File {
        let name: String
        let size: Int

        init(name: String, size: Int) {
            self.name = name
            self.size = size
        }
    }

    class Folder {
        let name: String
        var subfolders: [Folder]
        var files: [File]
        let parent: Folder?

        init(name: String, subfolders: [Folder], files: [File], parent: Folder? = nil) {
            self.name = name
            self.subfolders = subfolders
            self.files = files
            self.parent = parent
        }

        func subfolder(named: String) -> Folder? {
            subfolders.first { $0.name == named }
        }

        var totalSize: Int {
            subfolders.reduce(0) {
                $0 + $1.totalSize
            } + files.reduce(0) { $0 + $1.size }
        }
    }

    let input: Folder

    public init(input: String) {
        var folder: Folder?
        var listing = false
        var currentFolder: Folder?

        input.trimmedLines.forEach { line in
            if line.starts(with: "$") {
                listing = false

                let command = String(line.suffix(from: line.index(line.startIndex, offsetBy: 2)))

                if command.starts(with: "cd") {
                    let name = String(command.suffix(from: command.index(command.startIndex, offsetBy: 3)))

                    if name == ".." {
                        currentFolder = currentFolder?.parent
                    } else {
                        if folder == nil {
                            folder = Folder(name: name, subfolders: [], files: [])
                            currentFolder = folder
                        } else {
                            guard let subfolder = currentFolder?.subfolder(named: name) else {
                                fatalError("I don't have a sub-folder named \(name)")
                            }

                            currentFolder = subfolder
                        }
                    }
                } else if command.starts(with: "ls") {
                    listing = true
                }
            } else if listing {
                if line.starts(with: "dir ") {
                    let name = String(line.suffix(from: line.index(line.startIndex, offsetBy: 4)))

                    currentFolder?.subfolders.append(Folder(name: name, subfolders: [], files: [], parent: currentFolder))
                } else {
                    let parts = line.split(separator: " ")

                    currentFolder?.files.append(File(name: String(parts[1]), size: Int(parts[0])!))
                }
            }
        }

        self.input = folder!
    }

    func values(inside folder: Folder) -> [(folder: Folder, total: Int)] {
        let subfolders = folder.subfolders.flatMap { values(inside: $0) }
        let filesTotal = folder.files.reduce(0) { $0 + $1.size }
        let subfoldersTotal = subfolders.reduce(0) { $0 + $1.total }

        return subfolders + [(folder, subfoldersTotal + filesTotal)]
    }

    public func part1() -> Int {
        values(inside: input)
            .filter { $0.total < 100000 }
            .reduce(0) { $0 + $1.total}
    }

    public func part2() -> Int {
        let values = values(inside: input)
        let total = values.first { $0.folder.name == "/" }.map { $0.total }!

        if total > 70000000 {
            fatalError("The filesystem is larger than the available space")
        }

        let required = -(40000000 - total)

        let filtered = values
            .filter { $0.total > required }

        return filtered.min {
            $0.total < $1.total
        }!
        .total
    }
}
