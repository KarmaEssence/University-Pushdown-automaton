
MENHIR=menhir
OCAMLC=ocamlc
OCAMLLEX=ocamllex

SOURCES = ast.ml prog.ml gas6_utils.ml check_ast.ml print_ast.ml print_prog.ml eval_ast.ml\
convert_prog_to_ast.ml parser_ast.ml parser_prog.ml lexer_ast.ml lexer_prog.ml main.ml

OBJECTS = $(SOURCES:.ml=.cmo)

.PHONY: clean all 

all: main

main: ast.cmo prog.cmo gas6_utils.cmo check_ast.cmi check_ast.cmo\
print_ast.cmi print_ast.cmo print_prog.cmi print_prog.cmo eval_ast.cmi eval_ast.cmo\
convert_prog_to_ast.cmi convert_prog_to_ast.cmo parser_ast.cmi parser_ast.cmo\
parser_prog.cmi parser_prog.cmo lexer_ast.cmo lexer_prog.cmo main.cmo 
	$(OCAMLC) -o $@ $(OBJECTS)

%.cmo: %.ml
	$(OCAMLC) -c $< -o $@

%.cmi: %.mli
	$(OCAMLC) -c $< -o $@

%.ml %.mli: %.mly
	rm -f $(<:.mly=.conflicts)
	$(MENHIR) -v --infer $<

%.ml: %.mll
	$(OCAMLLEX) $<

parser_ast.mly: ast.ml

parser_prog.mly: prog.ml

lexer_ast.mll: parser_ast.ml 

lexer_prog.mll: parser_prog.ml

clean:
	rm -fr parser_ast.mli parser_ast.ml parser_prog.mli \
	parser_prog.ml lexer_ast.ml *.cmo main *.cmi *~ *.automaton *.conflicts


parser_ast.cmo: ast.cmo parser_ast.cmi
parser_prog.cmo: prog.cmo parser_prog.cmi
lexer_ast.cmo: parser_ast.cmo
lexer_prog.cmo: parser_prog.cmo 
main.cmo: parser_ast.cmo parser_prog.cmo lexer_ast.cmo lexer_prog.cmo
