<?php
    // Fonction autoload pour récupéré toutes les classes
    spl_autoload_register (function ($class) {
        include $class . '.class.php';
    });

    // Initialise la session
    session_start();

    $base = new baseClass;
    $fpv = new firstPersonView;
    $fpt= new firstPersonText;
    $fpa = new firstPersonAction;

    // Initialisation des coordonées par défaut
    if(empty($_POST)) {
        $base->init();
        // error_log("Default data : " . print_r($base, 1));
    }
    else {
        $base->setCurrentX($_POST["CurrentX"]);
        $base->setCurrentY($_POST["CurrentY"]);
        $base->setCurrentAngle($_POST["CurrentAngle"]);
        $base->setCurrentMapId($_POST["CurrentMapId"]);
        $base->setCurrentStatusAction($_POST["CurrentStatusAction"]);
        // error_log("Define data : " . print_r($base, 1));
    }

    if(isset($_POST["turnLeft"])) {
        $base->turnLeft();
        $base->setCurrentStatusAction(0);
    }

    if(isset($_POST["goForward"])) {
        $base->goForward();
    }

    if(isset($_POST["turnRight"])) {
        $base->turnRight();
        $base->setCurrentStatusAction(0);
    }

    if(isset($_POST["goLeft"])) {
        $base->goLeft();
    }

    if(isset($_POST["interact"])) {
        $fpa->doAction($base);
        $base->setCurrentStatusAction(1);
    }

    if(isset($_POST["goRight"])) {
        $base->goRight();
    }

    if(isset($_POST["goBack"])) {
        $base->goBack();
        $base->setCurrentStatusAction(0);
        
    }

?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./style.css">
        <title>Projet Serval</title>
    </head>
    <body>
        <section id="main">
            <img src="./images/<?php echo $fpv->getView($base) ?>" alt="" id="image_main">
        </section>
        <section id="second">
            <div id="gauche">
                <form action="index.php" method="post">
                    <div id="button-container">
                        <button name="turnLeft" class="buttons c1 r1">/</button>
                        <button name="goForward" class="buttons c2 r1"<?php if($base->checkForward() == TRUE){echo "enabled";} else {echo"disabled";} ?>>^</button>
                        <button name="turnRight" class="buttons c3 r1">\</button>
                        <button name="goLeft" class="buttons c1 r2"<?php if($base->checkLeft() == TRUE){echo "enabled";} else {echo"disabled";} ?>><</button>
                        <button name="interact" class="buttons c2 r2"<?php if($fpa->checkAction($base) == TRUE){echo "enabled";} else {echo"disabled";} ?>>x</button>
                        <button name="goRight" class="buttons c3 r2"<?php if($base->checkRight() == TRUE){echo "enabled";} else {echo"disabled";} ?>>></button>
                        <button name="goBack" class="buttons c2 r3"<?php if($base->checkBack() == TRUE){echo "enabled";} else {echo"disabled";} ?>>v</button>
                        <div>
                            <input type="hidden" name="CurrentX" value="<?php echo $base->getCurrentX() ?>"></input>
                            <input type="hidden" name="CurrentY" value="<?php echo $base->getCurrentY() ?>"></input>
                            <input type="hidden" name="CurrentAngle" value="<?php echo $base->getCurrentAngle() ?>"></input>
                            <input type="hidden" name="CurrentMapId" value="<?php echo $base->getCurrentMapId() ?>"></input>
                            <input type="hidden" name="CurrentStatusAction" value="<?php echo $base->getCurrentStatusAction() ?>"></input>
                        </div>
                    </div>
                </form>
                <img src="./assets/<?php echo $fpv->getCompass($base) ?>" alt="Compass" id="compas">
            </div>
            <div id="droite">
                <span id="text">
                    <?php echo $fpt->getText($base) ?>
                </span>
            </div>
        </section>
    </body>
</html>