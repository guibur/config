if !exists(':Tabularize')
    finish " Give up here; the Tabular plugin musn't have been loaded
endif

AddTabularPattern comma /\v[^}],\zs/l1l0
