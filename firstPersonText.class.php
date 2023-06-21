<?php
    require_once 'baseClass.class.php';

    /*
     * Class firstPersonText
     * Récupère et affiche le texte 
     */
    class firstPersonText extends baseClass{

      /*
       * @Param array $base 
       * Permet d'afficher le texte en fonction du map id
       * Return $res['text']
       */
      public function getText($base){

        $sql = $base->_dbh->prepare('SELECT * FROM text WHERE map_id = :_mapId AND status_action = :statusAction');
        $sql -> bindParam(':_mapId', $base->_mapId, PDO::PARAM_INT);
        $sql -> bindParam(':statusAction', $base->_statusAction, PDO::PARAM_INT);
        $sql -> execute();
        $res = $sql->fetch(PDO::FETCH_ASSOC);
        // error_log(print_r($res, 1));
        if(!empty($res)){
          return $res['text'] . " " . "( " . $res['id'] . " )";
        }
        else{
          return "Cherchons encore !";
        }
        
      }
    }
?>