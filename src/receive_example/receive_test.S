%% the abstruct code for receive_test.erl 

%% So,do not use receive to match a message in a public server processor.
%% That is a bad idea,if the QPS is high that make the request be blocked.
%% Let the request processor to receive a message and process it.

{module, receive_test}.  %% version = 0

{exports, [{module_info,0},{module_info,1},{receive_test,0},{receive_test1,0}]}.

{attributes, []}.

{labels, 16}.


{function, receive_test, 0, 2}.
  {label,1}.
    {line,[{location,"receive_test.erl",13}]}.
    {func_info,{atom,receive_test},{atom,receive_test},0}.
  {label,2}.
    {line,[{location,"receive_test.erl",14}]}.
  {label,3}.
    {loop_rec,{f,7},{x,0}}.			%% if no message,goto label 7 wait a message come.
    {test,is_tuple,{f,6},[{x,0}]}.	%% notice:if the message not match tuple,goto label 6.Bad thing happened,'loop_rec_end'
    								%% loop the message queue until match a guard.
    								%% So,receive will traverse the message queue until find a guard match.
    {test,test_arity,{f,6},[{x,0},2]}.
    {get_tuple_element,{x,0},0,{x,1}}.
    {test,is_atom,{f,6},[{x,1}]}.
    {select_val,{x,1},{f,6},{list,[{atom,error},{f,4},{atom,ok},{f,5}]}}.
  {label,4}.
    remove_message.					%% match a guard,remove the message
    {move,{atom,guard_two},{x,0}}.
    return.
  {label,5}.
    remove_message.
    {move,{atom,guard_one},{x,0}}.
    return.
  {label,6}.
    {loop_rec_end,{f,3}}.
  {label,7}.
    {wait,{f,3}}.


{function, receive_test1, 0, 9}.
  {label,8}.
    {line,[{location,"receive_test.erl",22}]}.
    {func_info,{atom,receive_test},{atom,receive_test1},0}.
  {label,9}.
    {line,[{location,"receive_test.erl",23}]}.
  {label,10}.
    {loop_rec,{f,11},{x,0}}.		%% All things be matched,so the message queue will be traversed  and make it empty
    remove_message.
    return.
  {label,11}.
    {wait,{f,10}}.


{function, module_info, 0, 13}.
  {label,12}.
    {line,[]}.
    {func_info,{atom,receive_test},{atom,module_info},0}.
  {label,13}.
    {move,{atom,receive_test},{x,0}}.
    {line,[]}.
    {call_ext_only,1,{extfunc,erlang,get_module_info,1}}.


{function, module_info, 1, 15}.
  {label,14}.
    {line,[]}.
    {func_info,{atom,receive_test},{atom,module_info},1}.
  {label,15}.
    {move,{x,0},{x,1}}.
    {move,{atom,receive_test},{x,0}}.
    {line,[]}.
    {call_ext_only,2,{extfunc,erlang,get_module_info,2}}.
