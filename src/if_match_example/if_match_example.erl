%% @author cb1224
%% @doc @todo Add description to if_match_example.


-module(if_match_example).

%% ====================================================================
%% API functions
%% ====================================================================
-export([if_test/1, guard_match/1]).


-spec if_test(term()) -> no_return().
if_test(Term) ->
	if
		guard_one =:= Term ->
			guard_one;
		guard_two =:= Term ->
			guard_two;
		"abc" =:= Term ->
			guard_three;
		[1,2,3] =:= Term ->
			guard_four;
		true ->
			default
	end.


-spec guard_match(term()) -> no_return().
guard_match(guard_one) ->
	guard_one;
guard_match(guard_two) ->
	guard_two;
guard_match("abc") ->
	guard_three;
guard_match([1,2,3]) ->
	guard_four;
guard_match(_Other) ->
	default.




%% ====================================================================
%% Internal functions
%% ====================================================================


