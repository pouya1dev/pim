import os
import tables
import strutils
import fuc, struct


when isMainModule:
  var tokenlist: seq[token] = @[]
  let args = commandLineParams()
  if args.len > 0:
    if args[0] == "--import":
      if fileExists(args[1]):
        for line in lines(args[1]):
          let lin = line.strip()
          if lin.len > 0:
            let t1 = lin.split(' ')
            for part in t1:
              if part == "generate" or part == "int" or part == "string" or part == "gen":
                tokenlist.add(token(value: part, typea: Tokentypes.keyword))
              elif part == "=":
                tokenlist.add(token(value: part, typea: Tokentypes.op))
              elif part.startsWith("\"") and part.endsWith("\""):
                tokenlist.add(token(value: part, typea: Tokentypes.stringa))
              elif part.startsWith("write(") and part.endsWith(");"):
                tokenlist.add(token(value: part, typea: Tokentypes.functions))
              else:
                tokenlist.add(token(value: part, typea: Tokentypes.normal_value))
          if tokenlist[0].value == "generate" or tokenlist[0].value == "gen":
            if tokenlist[1].value == "string" and tokenlist[2].typea == Tokentypes.normal_value:
              if tokenlist[3].value == "=":
                if tokenlist[4].typea == Tokentypes.stringa:
                  string_map[tokenlist[2].value] = tokenlist[4].value
            elif tokenlist[1].typea == Tokentypes.functions:
              func_define(tokenlist[1])
          #for oap in tokenlist:
          #  echo oap.value, ": (", oap.typea, ")"
          tokenlist.setLen(0)
      else:
        echo "file not exists."
    else:
      echo "Unknown options."
      echo "Use ./pim to see list of options."
  else:
    echo "PIM v0.0.1 (https://github.com/pouya1dev/pim)"
    echo "Usage: ./pim --[option] [filename]"
    echo "Options:"
    echo "\timport: start interperter for a new file."
    echo "\nhttps://pouya1dev.github.io/pim"


