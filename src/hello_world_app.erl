%% Feel free to use, reuse and abuse the code in this file.

%% @private
-module(hello_world_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).

%% API.

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
		{'_', [
			{"/", toppage_handler, []}
		]}
	]),
    NbAcceptors = 100,
    Port = 8080,
        init(www, NbAcceptors, Port, Dispatch),
	hello_world_sup:start_link().

stop(_State) ->
	ok.

init(PoolName, NbAcceptors, Port, Dispatch) ->
    [_] = pool:start(PoolName),
    TransOpts = [{port, Port}],
    ProtoOpts = #{
      pool => PoolName,
      env => #{dispatch => Dispatch }
     },
    ranch:start_listener(http, NbAcceptors, ranch_tcp, TransOpts, ranch_dist, ProtoOpts).
