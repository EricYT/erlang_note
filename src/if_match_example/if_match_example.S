
%% notice: Guard match is more effective than 'if'.


{module, if_match_example}.  %% version = 0

{exports, [{guard_match,1},{if_test,1},{module_info,0},{module_info,1}]}.

{attributes, []}.

{labels, 18}.


%% As the follow code,'if' will judge every guard and do not merge 
%% the like guards.
{function, if_test, 1, 2}.
  {label,1}.
    {line,[{location,"if_match_example.erl",14}]}.
    {func_info,{atom,if_match_example},{atom,if_test},1}.
  {label,2}.
    {test,is_eq_exact,{f,3},[{atom,guard_one},{x,0}]}.
    {move,{atom,guard_one},{x,0}}.
    return.
  {label,3}.
    {test,is_eq_exact,{f,4},[{atom,guard_two},{x,0}]}.
    {move,{atom,guard_two},{x,0}}.
    return.
  {label,4}.
    {test,is_eq_exact,{f,5},[{literal,"abc"},{x,0}]}.
    {move,{atom,guard_three},{x,0}}.
    return.
  {label,5}.
    {test,is_eq_exact,{f,6},[{literal,[1,2,3]},{x,0}]}.
    {move,{atom,guard_four},{x,0}}.
    return.
  {label,6}.
    {move,{atom,default},{x,0}}.
    return.


{function, guard_match, 1, 8}.
  {label,7}.
    {line,[{location,"if_match_example.erl",30}]}.
    {func_info,{atom,if_match_example},{atom,guard_match},1}.
  {label,8}.
    {test,is_nonempty_list,{f,11},[{x,0}]}.			%% the 'list' guards were merged for a same entry.
    {get_list,{x,0},{x,1},{x,2}}.
    {test,is_integer,{f,13},[{x,1}]}.
    {select_val,{x,1},{f,13},{list,[{integer,97},{f,9},{integer,1},{f,10}]}}.
  {label,9}.
    {test,is_eq_exact,{f,13},[{x,2},{literal,"bc"}]}.
    {move,{atom,guard_three},{x,0}}.
    return.
  {label,10}.
    {test,is_eq_exact,{f,13},[{x,2},{literal,[2,3]}]}.
    {move,{atom,guard_four},{x,0}}.
    return.
  {label,11}.
    {test,is_atom,{f,13},[{x,0}]}.
    {select_val,{x,0},
                {f,13},
                {list,[{atom,guard_two},{f,12},{atom,guard_one},{f,12}]}}.
  {label,12}.
    return.
  {label,13}.
    {move,{atom,default},{x,0}}.
    return.


{function, module_info, 0, 15}.
  {label,14}.
    {line,[]}.
    {func_info,{atom,if_match_example},{atom,module_info},0}.
  {label,15}.
    {move,{atom,if_match_example},{x,0}}.
    {line,[]}.
    {call_ext_only,1,{extfunc,erlang,get_module_info,1}}.


{function, module_info, 1, 17}.
  {label,16}.
    {line,[]}.
    {func_info,{atom,if_match_example},{atom,module_info},1}.
  {label,17}.
    {move,{x,0},{x,1}}.
    {move,{atom,if_match_example},{x,0}}.
    {line,[]}.
    {call_ext_only,2,{extfunc,erlang,get_module_info,2}}.
