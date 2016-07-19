{application, hello_world, [
	{description, "Cowboy Hello World example"},
	{vsn, "1.0"},
	{modules, ['hello_world_app','hello_world_sup','toppage_handler']},
	{registered, [hello_world_sup]},
	{applications, [kernel,stdlib,cowboy]},
	{mod, {hello_world_app, []}},
	{env, [
    {answers, {<<"Yes">>, <<"No">>, <<"Doubtful">>,
               <<"I don't like your tone">>, <<"Of course">>,
               <<"Of course not">>, <<"*backs away slowly and runs away*">>}}
  ]}
]}.
