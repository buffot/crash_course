{application,fib,
             [{applications,[kernel,stdlib,elixir,logger]},
              {description,"fib"},
              {modules,['Elixir.Fib','Elixir.Fib.Naive',
                        'Elixir.Fib.Optimized']},
              {registered,[]},
              {vsn,"0.1.0"},
              {extra_applications,[logger]}]}.
