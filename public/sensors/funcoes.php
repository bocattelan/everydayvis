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
   Nome da Fun��o: msgErro
   Prop�sito: Dar a mensagem de erro do sistema para o usu�rio, inserir
              na tabela de log e notificar para o administrador
   Programador: Werner P. Moraes         Data de Cria��o: 14/05/2003
   Par�metros: str Mensagem de erro
   Coment�rios Adicionais: Insere na tabela log_erro, manda email
                           * (n�o est� pronta)
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
   Nome da Fun��o: ut_connect
   Prop�sito: Conectar no banco de dados
   Programador: Werner P. Moraes         Data de Cria��o: 11/06/2003
   Retorno: int Conex�o
   Coment�rios Adicionais: Usa constantes configura��o do sistema
                           (Ultramar)
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
  function ut_connect(){
    $iBanco = pg_db_connect(strConexao);
    return $iBanco;
  }
}

/** - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Nome da Fun��o: retorna, retornac
   Prop�sito: Executar uma query (Select) em PostgreSQL e retornar
              grade de resultado
   Programador: Werner P. Moraes         Data de Cria��o: 02/05/2003
   Par�metros: str SQL da query,
               (Ponteiro) array Resultado (Grade de dados)
   Retorno: int N� de linhas da grade
   Coment�rios Adicionais: Usa constantes definidas acima;
                           2� Usa global Conex�o (iBanco)
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
   Nome da Fun��o: executa
   Prop�sito: Executar uma query (Insert ou Update) em PostgreSQL
   Programador: Werner P. Moraes         Data de Cria��o: 02/05/2003
   Par�metros: str SQL da query
   Retorno: bool Executou a query
   Coment�rios Adicionais: Usa constantes definidas acima
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
  function pg_executa($sSql){
    $iBanco = ut_connect();
    $iQuery = pg_db_query($iBanco,$sSql);
    pg_db_close($iBanco);
    return $iQuery;
  }
}




?>