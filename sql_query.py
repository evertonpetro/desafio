movimento_select = ("""
    (select a.nome as nome_associado,
           a.sobrenome as sobrenome_associado,
           a.idade::text as idade_associado,
           m.vlr_transacao::text as vlr_transacao_movimento,
           m.des_transacao as des_transacao_movimento,
           to_char(m.data_movimento, 'yyyy-mm-dd HH12:MI:SS') as data_movimento,
           c.num_cartao::text as numero_cartao,
           c.nome_impresso as nome_impresso_cartao,
           c2.tipo as tipo_conta,
           to_char(c2.data_criacao, 'yyyy-mm-dd HH12:MI:SS') as data_criacao_conta
      from movimento m
     inner join cartao c 
        on c.id = m.id_cartao
     inner join conta c2
        on c2.id = c.id_conta 
     inner join associado a 
        on a.id  = c2.id_associado) as movimento_table
""")