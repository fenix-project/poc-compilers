%{
#include <iostream>
#include <math.h>
#include <string>
#include <bits/stdc++.h>
#include "bilex.h"

extern "C" int yylex();

void yyerror(const std::string s);

%}

%union {
    int integer_;
    float float_;
    Boolean boolean_;
    char* string_;
}

/* declare tokens */

/* datatypes */

%token NUMBER
%token STRING
%token WHITESPACE
%token ANY
%token ERROR

/* Declare types for the grammar's non-terminals. */
%type <string> expr

%%

expr: NUMBER expr {}
    | NUMBER {}
    | WHITESPACE {}
;

%%

/* This function is called automatically when Bison detects a parse error. */
void yyerror(const std::string s)
{
    std::cerr << "\"" << s << " at or near " << std::endl;
}
