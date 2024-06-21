SELECT cargo, AVG(salario_liquido) AS media_salario_liquido_por_cargo_prefeituras
FROM (
    SELECT cargo, liquido as salario_liquido FROM guarulhos
    UNION ALL
    SELECT cargo, valorliquido as salario_liquido FROM sao_bernardo
    UNION ALL
    SELECT cargo_base as cargo, (remuneração_bruta - demais_elementos_remuneração) as salario_liquido FROM sao_paulo
) AS todas_tabelas group by cargo order by cargo ;