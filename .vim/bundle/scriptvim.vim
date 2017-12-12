:function Meow()
:  echom "Even if you do add a scope to a function (we'll talk about that later) you may as well capitalize the first letter of function names anyway. Most   Vimscript coders seem to do it, so don't break the convention."
:endfunction

:function GetMeow()
:  return "Meow String!"
:endfunction

:function DisplayName(name)
:  echom "Hello!  My name is:"
:  echom a:name
:endfunction
