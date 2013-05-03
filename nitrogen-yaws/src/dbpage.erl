-module(dbpage).
-export([main/0]).

main() ->
	wf:content_type(<<"application/json">>),
	N = wf:coalesce([wf:q(queries),1]),
	Results = get_q(wf:to_integer(N)),
	jsonify_results(Results).

get_q(N) when N > 0 ->
	[db:q(world,[random:uniform(10000)]) || _ <- lists:seq(1,N)].

jsonify_results(Results) ->
	PreJson = [ {[{<<"id">>, ID}, {<<"randomNumber">>, Rand}]} || [[ID, Rand]] <- Results ],
	jiffy:encode(PreJson).

