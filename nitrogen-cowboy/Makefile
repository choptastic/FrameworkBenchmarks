all: get-deps compile prepare-static run

get-deps:
	./rebar get-deps

compile:
	./rebar compile

prepare-static:
	cp -Rf deps/nitrogen_core/www priv/static/nitrogen

run:
	erl -config etc/app.config -config etc/cowboy.config -pa ebin deps/*/ebin -nitrogen db_host \"127.0.0.1\"  -args_file etc/vm.args
