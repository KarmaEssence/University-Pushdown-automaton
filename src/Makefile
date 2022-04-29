
MENHIR=menhir
OCAMLC=ocamlc
OCAMLLEX=ocamllex

SOURCES = type.ml gas6_utils.ml check_ast.ml print_ast.ml eval_ast.ml\
convert_prog_to_ast.ml parser.ml lexer.ml main.ml

OBJECTS = $(SOURCES:.ml=.cmo)

.PHONY: clean all 

all: main

main: type.cmo gas6_utils.cmo check_ast.cmi check_ast.cmo\
print_ast.cmi print_ast.cmo eval_ast.cmi eval_ast.cmo\
convert_prog_to_ast.cmi convert_prog_to_ast.cmo parser.cmi parser.cmo\
lexer.cmo main.cmo 
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

parser.mly: type.ml

lexer.mll: parser.mly

clean:
	rm -fr parser.mli parser.ml \
	lexer_ast.ml *.cmo main *.cmi *~ *.automaton *.conflicts


parser.cmo: type.cmo parser.cmi
lexer.cmo: parser.cmo
main.cmo: parser.cmo lexer.cmo
