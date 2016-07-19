%% Feel free to use, reuse and abuse the code in this file.

%% @doc Hello world handler.
-module(toppage_handler).

-export([init/2]).

init(Req, Opts) ->
	Node = atom_to_list(node()),
	cowboy_req:reply(200, #{
		<<"content-type">> => <<"text/plain">>
	}, Node, Req),
	{ok, Req, Opts}.
