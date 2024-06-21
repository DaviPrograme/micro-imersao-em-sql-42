SELECT AVG(salario) AS media_salarios
FROM (
    SELECT remuneracao as salario FROM guarulhos
    UNION ALL
    SELECT valorbruto as salario FROM sao_bernardo
    UNION ALL
    SELECT remuneração_bruta as salario FROM sao_paulo
) AS todas_tabelas;
