-module(json).
-export([main/0]).

main() ->
	wf:content_type(<<"application/json">>),
	Obj = {[{<<"message">>, <<"Hello, World!">>}]},
	jiffy:encode(Obj).
