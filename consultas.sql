-- consulta 1
select
a14.UF_SIGLA ,
     a11.CSM_COD
     ,a11.JSM_COD,
    a13.JSM_DESC  ,
    a13.RM_ORDEM  ,
    a13.RM_SIGLA  ,
    a11.CSM_COD  ,
    a13.CSM_SIGLA  ,
    a13.JSM_INFORMATIZADA_ST  ,
    a12.DTEM_ANO ,
    count(distinct a11.CIDADAO_RA)  WJXBFS1
from FATO_EVENTO_CIDADAO a11
    join DIM_TEMPO_NG a12
      on  (a11.DT_EVENTO = a12.DTEM_DATA)
    join DIM_JSM a13
      on  (a11.CSM_COD = a13.CSM_COD and 
    a11.JSM_COD = a13.JSM_COD)
    join DIM_MUNICIPIO a14
      on (a13.MUNICIPIO_COD = a14.MUNICIPIO_COD)
where (a12.DTEM_ANO >=  2011
 and a11.EVENTO_SERMIL_COD in (1))
group by a14.UF_SIGLA,
     a11.CSM_COD, a11.JSM_COD ,
    a13.JSM_DESC,
    a13.RM_ORDEM,
    a13.RM_SIGLA,
    a11.CSM_COD,
    a13.CSM_SIGLA,
    a13.JSM_INFORMATIZADA_ST,
    a12.DTEM_ANO

    order by rm_ordem, dtem_ano
;


-- consulta 2
select  a13.OM_CODOM  OM_CODOM,
    a13.OM_NOME  OM_NOME,
    a13.OM_RM_ORDEM  OM_RM_ORDEM,
    a13.RM_SIGLA  RM_SIGLA,
    a12.DTEM_ANO  DTEM_ANO,
    a11.EVENTO_SERMIL_COD  EVENTO_SERMIL_COD,
    a14.EVENTO_SERMIL_DESC  EVENTO_SERMIL_DESC,
    count(distinct a11.CIDADAO_RA)  WJXBFS1
from    FATO_EVENTO_CIDADAO a11
    join    DIM_TEMPO_NG    a12
      on    (a11.DT_EVENTO = a12.DTEM_DATA)
    join    DIM_GEOGRAFIA   a13
      on    (a11.GEOGRAFIA_COD_SEQ = a13.GEOGRAFIA_COD_SEQ)
    join    DIM_EVENTO_SERMIL   a14
      on    (a11.EVENTO_SERMIL_COD = a14.EVENTO_SERMIL_COD)
where   (a11.EVENTO_SERMIL_COD in (7, 9, 12)
 and a12.DTEM_ANO >=  2011)
group by    a13.OM_CODOM,
    a13.OM_NOME,
    a13.OM_RM_ORDEM,
    a13.RM_SIGLA,
    a12.DTEM_ANO,
    a11.EVENTO_SERMIL_COD,
    a14.EVENTO_SERMIL_DESC
;




-- consulta 3
select  a13.DESTINO_MOB_COD  DESTINO_MOB_COD,
    a17.DESTINO_MOB_DESC  DESTINO_MOB_DESC,
    a13.QM_CODIGO  QUALIF_COD,
    a14.OM_CODOM  OM_CODOM,
    a14.OM_NOME  OM_NOME,
    a13.CLASSE_RESERVA_COD  CLASSE_RESERVA_COD,
    a16.CLASSE_RESERVA_DESC  CLASSE_RESERVA_DESC,
    a12.DTEM_ANO  DTEM_ANO,
    a14.OM_RM_ORDEM  OM_RM_ORDEM,
    a14.RM_SIGLA  RM_SIGLA,
    a18.JSM_DESC,
    count(distinct a11.CIDADAO_RA)  WJXBFS1
from    FATO_EVENTO_CIDADAO a11
    join    DIM_TEMPO_NG    a12
      on    (a11.TEMPO_COD_SEQ = a12.TEMPO_COD_SEQ)
    join    DIM_CIDADAO a13
      on    (a11.CIDADAO_RA = a13.RA)
    join    DIM_GEOGRAFIA   a14
      on    (a11.GEOGRAFIA_COD_SEQ = a14.GEOGRAFIA_COD_SEQ)
    join    DIM_CLASSE_RESERVA  a16
      on    (a13.CLASSE_RESERVA_COD = a16.CLASSE_RESERVA_COD)
    join    DIM_DESTINO_MOBILIZACAO a17
      on    (a13.DESTINO_MOB_COD = a17.DESTINO_MOB_COD)
    join    DIM_JSM a18
      on a18.CSM_COD = a11.CSM_COD and a18.JSM_COD = a11.JSM_COD
where   (a12.DTEM_ANO >=  2011
and a13.QM_CODIGO in ('T22J', 'T23J', 'T24J', 'T25J', 'T26J', 'T27J', 'T28J', 'T29J', 'T30J', 'T31J', 'T32J', 'T33J', 'T34J', 'T35J', 'T36J', 'T37J', 'T38J', 'T39J', 'T40J', 'T41J', 'T42J', 'T43J', 'T44J', 'T45J', 'T46J', 'T47J', 'T48J', 'T49J', 'T50J', 'T51J', 'T52J', 'T53J', 'T54J', 'T55J', 'T56J', 'T57J', 'T58J', 'T59J', 'T60J', 'T61J', 'T62J', 'T63J', 'T64J', 'T65J', 'T66J', 'T67J', 'T68J', 'T69J', 'T70J', 'T71J', 'T72J', 'T73J', 'T74J', 'T75J', 'T76J', 'T77J', 'T78J', 'T79J')
)
group by    a13.DESTINO_MOB_COD,
    a17.DESTINO_MOB_DESC,
    a13.QM_CODIGO,
    a14.OM_CODOM,
    a14.OM_NOME,
    a13.CLASSE_RESERVA_COD,
    a16.CLASSE_RESERVA_DESC,
    a12.DTEM_ANO,
    a14.OM_RM_ORDEM,
    a14.RM_SIGLA,
    a18.JSM_DESC
;


-- consulta 4
select count(*) from FATO_EVENTO_CIDADAO;
