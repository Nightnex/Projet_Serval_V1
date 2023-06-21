<?php
    require_once 'baseClass.class.php';

    /*
     * Class firstPersonAction
     * Permet d'intéragir
     */
    class firstPersonAction extends baseClass{

        /*
         *@Param array $base
         *Vérifie si l'action est possible
         *Return true or false 
         */
        public function checkAction($base){

            $sql=$this->_dbh->prepare('SELECT * FROM map WHERE id = :mapId');
            $sql->bindParam(':mapId', $base->_mapId, PDO::PARAM_INT);
            $sql->execute();
            $checkActionResult = $sql->fetch(PDO::FETCH_ASSOC);

            // error_log("Check Action : " . print_r($checkActionResult['status_action'], 1));
            // error_log(print_r($_SESSION, 1));

            if($checkActionResult['status_action'] == 1){
                return true;
            } elseif(isset($_SESSION['cle_doree']) && $base->_mapId == 3){
                return true;
            }
            else{
                return false;
            }
        }

        /*
         *@Param array $base
         *Effectue l'action si elle est possible
         */
        public function doAction($base){
            
            $stmt=$this->_dbh->prepare('SELECT * FROM action INNER JOIN items ON action.item_id = items.id WHERE map_id = :_mapId');
            $stmt->bindParam(':_mapId', $base->_mapId, PDO::PARAM_INT);
            $stmt->execute();
            $doActionResult = $stmt->fetch(PDO::FETCH_ASSOC);

            // error_log("Do Action : " . print_r($doActionResult ,1));

            if(!empty($doActionResult)){

                if($doActionResult['action'] == 'take'){
                    $stmt2 = $this->_dbh->prepare('UPDATE action SET status = 1 WHERE map_id = :mapId');
                    $stmt2->bindParam(':mapId', $base->_mapId, PDO::PARAM_INT);
                    $stmt2->execute();
                    $_SESSION['cle_doree'] = $doActionResult['description'];
                    
                    // error_log("Inventaire : " . $_SESSION['cle_doree']);
                }

                else if($doActionResult == 'use'){
                    if(isset($_SESSION['cle_doree']) && $_SESSION['cle_doree'] === $doActionResult['description']){
                        $stmt3 = $base->_dbh->prepare('UPDATE action SET status = 1 WHERE map_id = :mapId');
                        $stmt3->bindParam(':mapId', $base->_mapId, PDO::PARAM_INT);
                        $stmt3->execute();
                    }
                }
            }
        }
    }
?>