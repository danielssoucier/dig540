<html>
  <head>
    <title>Diarists on Arnold's March</title>
  </head>
  <body>
    <form method="POST" action="">
      Enter the name of the diarist:
      <input type="text" name="diarist"></input>
      <input type="submit" name="submit" value="submit"></input>
    </form>

    <?php
    require_once('author.php');

    if(isset($_POST['diarist']) && $_POST['diarist'] != ''){
      $myDiary = new Diary();
      $myDiary->setDiarist($_POST['diarist']);
      echo "The name of the diarist that you entered is: ";
      $myDiary->getdiarist();
    } else {
      echo "Please enter the name of the diarist so I can tell you who it was";
    }
    ?>
  </body>

</html>
