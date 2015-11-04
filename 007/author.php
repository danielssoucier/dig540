<?php
class Diary{
  private $archive;
  private $dates;

  public function setDiarist($diaristName){

    $this->diarist = $diaristName;
  }

  public function getDiarist(){
    echo $this->diarist;
  }
}
?>
