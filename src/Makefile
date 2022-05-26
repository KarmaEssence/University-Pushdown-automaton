
MENHIR=menhir
OCAMLC=ocamlc
OCAMLLEX=ocamllex

SOURCES = type.ml gas6_utils.ml print_auto.ml check_auto.ml eval_auto.ml\
convert_prog_to_auto.ml lexer.ml parser.ml main.ml

OBJECTS = $(SOURCES:.ml=.cmo)

.PHONY: clean all 

all: main

main: type.cmo gas6_utils.cmo print_auto.cmi print_auto.cmo\
check_auto.cmi check_auto.cmo eval_auto.cmi eval_auto.cmo\
convert_prog_to_auto.cmi convert_prog_to_auto.cmo lexer.cmo parser.cmi parser.cmo\
main.cmo 
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

lexer.mll: parser.ml

clean:
	rm -fr parser.mli parser.ml \
	lexer_ast.ml *.cmo main *.cmi *~ *.automaton *.conflicts


parser.cmo: type.cmo parser.cmi
lexer.cmo: parser.cmo
main.cmo: parser.cmo lexer.cmo
