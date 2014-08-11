%% @author Eric.yutao
%% @doc @todo The file was written to show the receive problem.


-module(receive_test).

%% ====================================================================
%% API functions
%% ====================================================================
-export([receive_test/0, receive_test1/0]).

-spec receive_test() -> no_return().
receive_test() ->
	receive
		{ok, Content} ->
			guard_one;
		{error, Error} ->
			guard_two
	end.

-spec receive_test1() -> no_return().
receive_test1() ->
	receive
		Msg -> Msg
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================


