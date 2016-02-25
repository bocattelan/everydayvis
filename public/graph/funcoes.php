<?php
  require "conf.php";
  require "postgresql.php";


function redirect($url)
{
    if (!headers_sent())
    {    
        header('Location: '.$url);
        exit;
        }
    else
        {  
        echo '<script type="text/javascript">';
        echo 'window.location.href="'.$url.'";';
        echo '</script>';
        echo '<noscript>';
        echo '<meta http-equiv="refresh" content="0;url='.$url.'" />';
        echo '</noscript>'; exit;
    }
}

  
if (!function_exists('msgErro')){
/** - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Nome da Função: msgErro
   Propósito: Dar a mensagem de erro do sistema para o usuário, inserir
              na tabela de log e notificar para o administrador
   Programador: Werner P. Moraes         Data de Criação: 14/05/2003
   Parâmetros: str Mensagem de erro
   Comentários Adicionais: Insere na tabela log_erro, manda email
                           * (não está pronta)
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
  function msgErro($erro){
    global $usuario;
    echo "<PRE>Transport Ltda. - " . date("d/m/Y - H:i:s") . "<HR>";
    echo $php_errormsg."<HR>";
    echo $erro;
    echo "\n</PRE>";
    # exit();
    if (!$iBanco) $iBanco = pg_Connect(strConexao);
    $sSender = str_replace("'", "''", $_SERVER["REQUEST_URI"]);
    $sErro = str_replace("'", "''", $php_errormsg);
    $sError = str_replace("'", "''", $erro);
  }
}

if (!function_exists('ut_connect')){
/** - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Nome da Função: ut_connect
   Propósito: Conectar no banco de dados
   Programador: Werner P. Moraes         Data de Criação: 11/06/2003
   Retorno: int Conexão
   Comentários Adicionais: Usa constantes configuração do sistema
                           (Ultramar)
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
  function ut_connect(){
    $iBanco = pg_db_connect(strConexao);
    return $iBanco;
  }
}

/** - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Nome da Função: retorna, retornac
   Propósito: Executar uma query (Select) em PostgreSQL e retornar
              grade de resultado
   Programador: Werner P. Moraes         Data de Criação: 02/05/2003
   Parâmetros: str SQL da query,
               (Ponteiro) array Resultado (Grade de dados)
   Retorno: int Nº de linhas da grade
   Comentários Adicionais: Usa constantes definidas acima;
                           2ª Usa global Conexão (iBanco)
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
if (!function_exists('pg_retorna')){
  function pg_retorna($sSql, &$rResult){
    $iBanco = ut_connect();
    $iQuery = pg_db_query($iBanco, $sSql);
    $iNum = pg_db_num_rows($iQuery);
    $rResult = array();
    for ($i = 0; $i < $iNum; $i++){
      $rSub = pg_db_fetch_array($iQuery,$i);
      $rResult[$i] = $rSub; }
    pg_db_close($iBanco);
    return $iNum;
  }
}


if (!function_exists('pg_executa')){
/** - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Nome da Função: executa
   Propósito: Executar uma query (Insert ou Update) em PostgreSQL
   Programador: Werner P. Moraes         Data de Criação: 02/05/2003
   Parâmetros: str SQL da query
   Retorno: bool Executou a query
   Comentários Adicionais: Usa constantes definidas acima
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
  function pg_executa($sSql){
    $iBanco = ut_connect();
    $iQuery = pg_db_query($iBanco,$sSql);
    pg_db_close($iBanco);
    return $iQuery;
  }
}




?>