-module(db).
-export([
	start/0,
	q/1,
	q/2,
	p/2
]).

-include("db.hrl").

-define(POOL, benchmark_pool).

start() ->
	application:start(crypto),
	application:start(emysql),
	emysql:add_pool(?POOL, 32, ?DB_USER, ?DB_PASS, ?DB_HOST, ?DB_PORT, ?DB_DB, utf8),
	p(world, <<"select * from World where id=?">>),
	p(fortunes, <<"select * from Fortune">>),
	ok.

p(Statement, SQL) when is_list(SQL) ->
	p(Statement, iolist_to_binary(SQL));
p(Statement, SQL) when is_binary(SQL) ->
	emysql:prepare(Statement, SQL).

q(Statement) ->
	q(Statement, []).

q(Statement, Args) when is_atom(Statement) and is_list(Args) ->
	extract_results(emysql:execute(?POOL, Statement, Args)).

extract_results({result_packet, _, _, Rows, _}) ->
	Rows.
