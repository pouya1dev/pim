# fuc.nim
# Copyright (C) 2026 - Pouya1Dev 
# Part of PIM
import struct, re
import tables
import strutils
proc func_define*(tokeno: token) =
    #echo "func run"
    if tokeno.value.startsWith("write"):
        #echo "i1s"
        let pattern = re(r"write\(([^)]*)\);")
        var matchs: array[1, string]
        let pos = tokeno.value.find(pattern, matchs)
        if pos >= 0:
            #echo matchs[0]
            if matchs[0].startsWith("\"") and matchs[0].endsWith("\""):
                echo matchs[0].replace("\"", "")
            elif matchs[0] in string_map:
                echo string_map[matchs[0]].replace("\"", "")
