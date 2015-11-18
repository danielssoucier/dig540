<?php
class Artist{
  private $id;
  private $name;
  private $origin;
  private $beginning_date;
  private $end_date;

  public function __construct($_name='', $_origin='', $_beginning_date='', $end_date=''){
    if(empty($_name)) return false;

    $this->name = $_name;
    $this->origin = $_origin;
    $this->beginning_date = $_beginning_date;
    $this->end_date = $_end_date;
  }

  public function create(){
    global $db;

    if($db){
      $db->beginTransaction();
      $q = $db->prepare('INSERT INTO `artist` (name, origin, beginning_date, end_date) VALUES (?, ?, ?, ?)');
      try{
        $q->execute(array($this->name, $this->origin, $this->beginning_date, $this->end_date));
      } catch(PDOException $e) {
        print_r($e);
        $db->rollback();
        return false;
      }
      $this->id = $db->lastInsertId();
      $db->commit();
      return true;
    }
    return false;
  }

  public static function read($id){
    global $db;

    if($db){
      $q = $db->prepare('SELECT * FROM `artist` WHERE id = ?');
      $q->execute(array($id));
      if($item = $q->fetch()){
        $artist = new Artist($item['name'], $item['origin'], $item['beginning_date'], $item['end_date']);
        $artist->setID($item['id']);
        return $item;
      }
    }
    return false;
  }

  public function update(){
      global $db;

    if ($db){
      $db->beginTransaction();
      $q = $db->prepare('UPDATE `artist` (name, origin, beginning_date, end_date) VALUES (?, ?, ?, ?)');
      try{
        $q->execute(array($this->name, $this->origin, $this->beginning_date, $this->end_date));
      } catch(PDOException $e) {
        print_r($e);
        $db->rollback();
        return false;
      }
      $this->id = $db->lastInsertId();
      $db->commit();
      return true;
    }
    return false;
    }

  }

  public function delete(){
      global$db;


    if ($db){
      $q = $db->prepare('DELETE 'artist' (name, origin, beginning_date, end_date) VALUES (?, ?, ?, ?)');
      return true;
    }
    return false;
    }
  }


  public static function artist_list(){
    global$db;
  if ($db){
    $q = $db->prepare("SELECT name FROM Artist");
    $q->execute();
    $result = $q->fetchAll(PDO::FETCH_COLUMN, 0);
    var_dump($result);


    return true;
    }
    return false;
  }
}

  public static function find($target){
    global$db;
    if ($db){
    $q = $db->prepare('SELECT * FROM Artist Where 'name'=?');
    $q - $db->prepare('SELECT * FROM Artist Where 'name'=:name')
    $q->execute();
    $result = $q->fetchAll(PDO::FETCH_COLUMN, 0);
    var_dump($result);
  }

  public function setID($newID){
    if(empty($newID)) return false;

    $this->id = $newID;
    return $this->id;
  }

  public function getID(){
    return $this->id;
  }

  public function setBeginningDate($newBeginningDate){
    if(empty($newBeginningDate)) return false;

    $this->beginning_date = $newBeginningDate;
    return $this->beginning_date;
  }

  public function getBeginningDate(){
    return $this->beginning_date;
  }

  public function setEndDate($EndDate){
    if(empty($EndDate)) return false;

    $this->end_date = $newEndDate;
    return $this->end_date;
  }

  public function getEndDate(){
    return $this->end_date;
  }


  public function setOrigin($newOrigin){
    if(empty($newOrigin)) return false;

    $this->origin = $newOrigin;
    return $this->origin;
  }

  public function getOrigin(){
    return $this->origin;
  }

  public function setName($newName){
    if(empty($newName)) return false;

    $this->name = $newName;
    return $this->name;
  }

  public function getName(){
    return $this->name;
  }
}
?>
