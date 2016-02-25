<?php
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Funções de controle PostgreSQL
   Não alterar nenhuma das linhas a seguir
   db_connect - Abre uma conexão PostgreSQL
   db_query - Executa uma consulta (query)
   db_send_query - Executa uma consulta assíncrona (query)
   db_num_rows - Retorna o número de linhas
   db_fetch_array - Retorna uma linha (registro) como um array
   db_fetch_result - Retorna valores a partir de um recurso de resultado
   db_close - Fecha uma conexão PostgreSQL
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
if (!function_exists('pg_db_connect')){
  function pg_db_connect($sConn){
    $iBanco = @pg_Connect($sConn);
    return $iBanco;
  }
}

if (!function_exists('pg_db_query')){
  function pg_db_query($iConn,$sQry){
    $iQuery = @pg_query($iConn,$sQry);
    if (!$iQuery){
      $erro = pg_ErrorMessage($iConn) . "\n" . $sQry;
      msgErro($erro);
    }
    return $iQuery;
  }
}

if (!function_exists('pg_db_send_query')){
  function pg_db_send_query($iConn,$sQry){
    $iQuery = @pg_send_query($iConn,$sQry);
    if (!$iQuery){
      $erro = pg_ErrorMessage($iConn) . "\n" . $sQry;
      msgErro($erro);
    }
    return $iQuery;
  }
}

if (!function_exists('pg_db_num_rows')){
  function pg_db_num_rows($iQry){
    $iNR = @pg_num_rows($iQry);
    return $iNR;
  }
}

if (!function_exists('pg_db_fetch_array')){
  function pg_db_fetch_array($iQry,$iRow){
    $rRow = @pg_Fetch_Array($iQry,$iRow);
    return $rRow;
  }
}

if (!function_exists('pg_db_fetch_result')){
  function pg_db_fetch_result($iQry,$iRow,$mCampo){
    $mRes = @pg_fetch_result($iQry,$iRow,$mCampo);
    return $mRes;
  }
}

if (!function_exists('pg_db_close')){
  function pg_db_close($iBanco){
    $bFechou = @pg_Close($iBanco);
    return $bFechou;
  }
}
?>
