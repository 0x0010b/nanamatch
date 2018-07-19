<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

// Get All Nanas
$app->get('/nana', function(Request $request, Response $response) {
	$sql = "SELECT * FROM nana";

	try {
		// Get DB Object
		$db = new db();
		// Connect
		$db = $db->connect();

		$stmt = $db->query($sql);
		$nana = $stmt->fetchAll(PDO::FETCH_ASSOC);
		$db = null;
		echo json_encode($nana,JSON_UNESCAPED_UNICODE);
	} catch(PDOException $e) {
		echo $e->getMessage();
	}
});

// Get Single Nana
$app->get('/nana/{id}', function(Request $request, Response $response) {
	$id = $request->getAttribute('id');

	$sql = "SELECT * FROM nana WHERE id = $id";

	try {
		// Get DB Object
		$db = new db();
		// Connect
		$db = $db->connect();

		$stmt = $db->query($sql);
		$nana = $stmt->fetchAll(PDO::FETCH_ASSOC);

		/* Add Extra Information
		$nana[0]["services"] = calculateServices($db, $id);
		$nana[0]["calification"] = calculateCalification($db, $id);
		$nana[0]["months"] = registeredTime($db, $nana[0]["register_date"]);
		$nana[0]["comments"] = comments($db, $id);*/


		$db = null;
		echo json_encode($nana,JSON_UNESCAPED_UNICODE);
	} catch(PDOException $e) {
		echo $e->getMessage();
	}
});

?>