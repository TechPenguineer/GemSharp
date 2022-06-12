grammar GemSharp;

program: line* EDF;
line: statement |  ifBlock | whileBlock;
statement: (assignment | functionCall) ';';
ifBlock: 'if' expression block ('else' elseIfBlock)?;
elseIfBlock: block | ifBlock;
whileBlock: WHILE expression block ('else' elseIfBlock);
WHILE: 'while' | 'until';
assignment: IDENTIFIER '=' expression;
functionCall: IDENTIFIER '(' expression (',' expression)*)? ')';
expression
	: const
	| IDENTIFIER
	| functionCall
	| '(' expression ')'
	| 
	;

constant: INTEGER | FLOAT | STRING | BOOL | NULL;
BOOL: 'true' | 'false';
block: '{' line* '}';
IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_];
WS: [ \t\r\n]+ -> skip;
