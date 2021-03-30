Introductory examples for F# and very simple abstract syntax (Intro/README.TXT)
-------------------------------------------------------------------------------

Archive intro.zip contains the files used below.

A. File Appendix.fs contains all examples from PLCSD Appendix A: F#
   Crash Course.  There is no point in loading all of it into F#
   Interactive (fsi) in one go.  Instead, start fsi in a Command
   Prompt and copy example code from Appendix.fs to fsi.

   fsi
   <copy example code>
   <copy example code>
   ...
   #q;;


B. File Intro1.fs contains abstract syntax (type expr) for very simple
   expressions without variables, and a corresponding eval function.

   fsi Intro1.fs
   open Intro1;;
   <experiments>
   <experiments>
   ...
   #q;;


C. File Intro2.fs contains abstract syntax (type expr) for very simple
   expressions with variables, and a corresponding eval function.

   fsi Intro2.fs
   open Intro2;;
   <experiments>
   <experiments>
   ...
   #q;;

D. File SimpleExpr.java contains a Java version of abstract syntax
   (abstract class Expr with subclasses CstI, Var and Prim) for very
   simple expressions with variables, with an eval method.  This
   closely corresponds to the expr type and eval function in F# file
   Intro2.fs.  To compile and execute it, do:

   javac SimpleExpr.java 
   java SimpleExpr 
