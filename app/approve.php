<?php
require_once('./common.php');
require_once('./functions.php');
$token = $_GET['token'];

if(isset($_GET['key'])) {
  $key = $_GET['key'];
}
else {
  $key = NULL;
}

$status = 0;
$token = mysqli_real_escape_string($db, $token);

if(getrole($key, $acls) == "admin") {
  $checktoken_query = mysqli_query($db,"SELECT obs_token FROM obs_list WHERE obs_token='".$token."' LIMIT 1");
  if(mysqli_num_rows($checktoken_query) == 1) {

    $query = mysqli_query($db, "UPDATE obs_list set obs_approved=1 WHERE obs_token='" . $token . "'");
    delete_token_cache($token);
  }
}
else {
    error_log("ADD_IMAGE : Token : ".$token." and/or key not valid.");
    $status = 1;

}

if($status != 0) {
    http_response_code(500);
}
echo json_encode(array('status'=>$status));

?>