module Ast

type operator = Add | Sub | Mul | Div
type expr =
    | Binop of expr * operator * expr
    | Lit of int