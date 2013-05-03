-module(fortune).
-export([
	main/0,
	body/0
]).
-include_lib("nitrogen_core/include/wf.hrl").

main() ->
	wf:content_type("text/html; charset=UTF-8"),
	#template{file="priv/templates/fortune.html"}.

body() ->
	Fortunes = db:q(fortunes),
	Fortunes2 = [[0, <<"Some randomly added new fortune">>] | Fortunes],
	SortedFortunes = lists:sort(fun sort_fortunes/2, Fortunes2),
	Map = [id@text,message@text],
	#table{rows=[
		#tablerow{cells=[
			#tableheader{text="id"},
			#tableheader{text="message"}
		]},
		#bind{map=Map,data=SortedFortunes,body=[
			#tablerow{cells=[
				#tablecell{id=id},
				#tablecell{id=message}
			]}
		]}
	]}.

sort_fortunes([_, Msg1], [_, Msg2]) ->
	Msg1 =< Msg2.

