// Implementation file for parser generated by fsyacc
module Parser

#nowarn "64";; // turn off warnings that type variables used in production annotations are instantiated to concrete type
open FSharp.Text.Lexing
open FSharp.Text.Parsing.ParseHelpers
# 1 "Parser.fsy"
 
open Ast

# 10 "Parser.fs"
// This type is the type of tokens accepted by the parser
type token = 
  | LITERAL of (int)
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | EOF
// This type is used to give symbolic names to token indexes, useful for error messages
type tokenId = 
    | TOKEN_LITERAL
    | TOKEN_PLUS
    | TOKEN_MINUS
    | TOKEN_TIMES
    | TOKEN_DIVIDE
    | TOKEN_EOF
    | TOKEN_end_of_input
    | TOKEN_error
// This type is used to give symbolic names to token indexes, useful for error messages
type nonTerminalId = 
    | NONTERM__startexpr
    | NONTERM_expr

// This function maps tokens to integer indexes
let tagOfToken (t:token) = 
  match t with
  | LITERAL _ -> 0 
  | PLUS  -> 1 
  | MINUS  -> 2 
  | TIMES  -> 3 
  | DIVIDE  -> 4 
  | EOF  -> 5 

// This function maps integer indexes to symbolic token ids
let tokenTagToTokenId (tokenIdx:int) = 
  match tokenIdx with
  | 0 -> TOKEN_LITERAL 
  | 1 -> TOKEN_PLUS 
  | 2 -> TOKEN_MINUS 
  | 3 -> TOKEN_TIMES 
  | 4 -> TOKEN_DIVIDE 
  | 5 -> TOKEN_EOF 
  | 8 -> TOKEN_end_of_input
  | 6 -> TOKEN_error
  | _ -> failwith "tokenTagToTokenId: bad token"

/// This function maps production indexes returned in syntax errors to strings representing the non terminal that would be produced by that production
let prodIdxToNonTerminal (prodIdx:int) = 
  match prodIdx with
    | 0 -> NONTERM__startexpr 
    | 1 -> NONTERM_expr 
    | 2 -> NONTERM_expr 
    | 3 -> NONTERM_expr 
    | 4 -> NONTERM_expr 
    | 5 -> NONTERM_expr 
    | _ -> failwith "prodIdxToNonTerminal: bad production index"

let _fsyacc_endOfInputTag = 8 
let _fsyacc_tagOfErrorTerminal = 6

// This function gets the name of a token as a string
let token_to_string (t:token) = 
  match t with 
  | LITERAL _ -> "LITERAL" 
  | PLUS  -> "PLUS" 
  | MINUS  -> "MINUS" 
  | TIMES  -> "TIMES" 
  | DIVIDE  -> "DIVIDE" 
  | EOF  -> "EOF" 

// This function gets the data carried by a token as an object
let _fsyacc_dataOfToken (t:token) = 
  match t with 
  | LITERAL _fsyacc_x -> Microsoft.FSharp.Core.Operators.box _fsyacc_x 
  | PLUS  -> (null : System.Object) 
  | MINUS  -> (null : System.Object) 
  | TIMES  -> (null : System.Object) 
  | DIVIDE  -> (null : System.Object) 
  | EOF  -> (null : System.Object) 
let _fsyacc_gotos = [| 0us; 65535us; 5us; 65535us; 0us; 1us; 6us; 2us; 7us; 3us; 8us; 4us; 9us; 5us; |]
let _fsyacc_sparseGotoTableRowOffsets = [|0us; 1us; |]
let _fsyacc_stateToProdIdxsTableElements = [| 1us; 0us; 5us; 0us; 1us; 2us; 3us; 4us; 5us; 1us; 1us; 2us; 3us; 4us; 5us; 1us; 2us; 2us; 3us; 4us; 5us; 1us; 2us; 3us; 3us; 4us; 5us; 1us; 2us; 3us; 4us; 4us; 1us; 1us; 1us; 2us; 1us; 3us; 1us; 4us; 1us; 5us; |]
let _fsyacc_stateToProdIdxsTableRowOffsets = [|0us; 2us; 8us; 14us; 20us; 26us; 32us; 34us; 36us; 38us; 40us; |]
let _fsyacc_action_rows = 11
let _fsyacc_actionTableElements = [|1us; 32768us; 0us; 10us; 4us; 49152us; 1us; 6us; 2us; 7us; 3us; 8us; 4us; 9us; 2us; 16385us; 3us; 8us; 4us; 9us; 2us; 16386us; 3us; 8us; 4us; 9us; 0us; 16387us; 0us; 16388us; 1us; 32768us; 0us; 10us; 1us; 32768us; 0us; 10us; 1us; 32768us; 0us; 10us; 1us; 32768us; 0us; 10us; 0us; 16389us; |]
let _fsyacc_actionTableRowOffsets = [|0us; 2us; 7us; 10us; 13us; 14us; 15us; 17us; 19us; 21us; 23us; |]
let _fsyacc_reductionSymbolCounts = [|1us; 3us; 3us; 3us; 3us; 1us; |]
let _fsyacc_productionToNonTerminalTable = [|0us; 1us; 1us; 1us; 1us; 1us; |]
let _fsyacc_immediateActions = [|65535us; 65535us; 65535us; 65535us; 65535us; 65535us; 65535us; 65535us; 65535us; 65535us; 16389us; |]
let _fsyacc_reductions ()  =    [| 
# 101 "Parser.fs"
        (fun (parseState : FSharp.Text.Parsing.IParseState) ->
            let _1 = parseState.GetInput(1) :?> Ast.expr in
            Microsoft.FSharp.Core.Operators.box
                (
                   (
                      raise (FSharp.Text.Parsing.Accept(Microsoft.FSharp.Core.Operators.box _1))
                   )
                 : 'gentype__startexpr));
# 110 "Parser.fs"
        (fun (parseState : FSharp.Text.Parsing.IParseState) ->
            let _1 = parseState.GetInput(1) :?> Ast.expr in
            let _3 = parseState.GetInput(3) :?> Ast.expr in
            Microsoft.FSharp.Core.Operators.box
                (
                   (
# 15 "Parser.fsy"
                                          Binop(_1, Add, _3) 
                   )
# 15 "Parser.fsy"
                 : Ast.expr));
# 122 "Parser.fs"
        (fun (parseState : FSharp.Text.Parsing.IParseState) ->
            let _1 = parseState.GetInput(1) :?> Ast.expr in
            let _3 = parseState.GetInput(3) :?> Ast.expr in
            Microsoft.FSharp.Core.Operators.box
                (
                   (
# 16 "Parser.fsy"
                                             Binop(_1, Sub, _3) 
                   )
# 16 "Parser.fsy"
                 : Ast.expr));
# 134 "Parser.fs"
        (fun (parseState : FSharp.Text.Parsing.IParseState) ->
            let _1 = parseState.GetInput(1) :?> Ast.expr in
            let _3 = parseState.GetInput(3) :?> Ast.expr in
            Microsoft.FSharp.Core.Operators.box
                (
                   (
# 17 "Parser.fsy"
                                             Binop(_1, Mul, _3) 
                   )
# 17 "Parser.fsy"
                 : Ast.expr));
# 146 "Parser.fs"
        (fun (parseState : FSharp.Text.Parsing.IParseState) ->
            let _1 = parseState.GetInput(1) :?> Ast.expr in
            let _3 = parseState.GetInput(3) :?> Ast.expr in
            Microsoft.FSharp.Core.Operators.box
                (
                   (
# 18 "Parser.fsy"
                                              Binop(_1, Div, _3) 
                   )
# 18 "Parser.fsy"
                 : Ast.expr));
# 158 "Parser.fs"
        (fun (parseState : FSharp.Text.Parsing.IParseState) ->
            let _1 = parseState.GetInput(1) :?> int in
            Microsoft.FSharp.Core.Operators.box
                (
                   (
# 19 "Parser.fsy"
                                     Lit(_1) 
                   )
# 19 "Parser.fsy"
                 : Ast.expr));
|]
# 170 "Parser.fs"
let tables : FSharp.Text.Parsing.Tables<_> = 
  { reductions= _fsyacc_reductions ();
    endOfInputTag = _fsyacc_endOfInputTag;
    tagOfToken = tagOfToken;
    dataOfToken = _fsyacc_dataOfToken; 
    actionTableElements = _fsyacc_actionTableElements;
    actionTableRowOffsets = _fsyacc_actionTableRowOffsets;
    stateToProdIdxsTableElements = _fsyacc_stateToProdIdxsTableElements;
    stateToProdIdxsTableRowOffsets = _fsyacc_stateToProdIdxsTableRowOffsets;
    reductionSymbolCounts = _fsyacc_reductionSymbolCounts;
    immediateActions = _fsyacc_immediateActions;
    gotos = _fsyacc_gotos;
    sparseGotoTableRowOffsets = _fsyacc_sparseGotoTableRowOffsets;
    tagOfErrorTerminal = _fsyacc_tagOfErrorTerminal;
    parseError = (fun (ctxt:FSharp.Text.Parsing.ParseErrorContext<_>) -> 
                              match parse_error_rich with 
                              | Some f -> f ctxt
                              | None -> parse_error ctxt.Message);
    numTerminals = 9;
    productionToNonTerminalTable = _fsyacc_productionToNonTerminalTable  }
let engine lexer lexbuf startState = tables.Interpret(lexer, lexbuf, startState)
let expr lexer lexbuf : Ast.expr =
    engine lexer lexbuf 0 :?> _
