import tables

type
  Tokentypes* = enum 
    keyword, normal_value, op, stringa, functions

type
  token* = object
    value*: string
    typea*: Tokentypes

var string_map* = Table[string, string]()
