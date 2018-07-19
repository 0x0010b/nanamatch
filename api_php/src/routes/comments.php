<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

// Get Nanas Comments
$app->get('/comments/{id}', function(Request $request, Response $response) {
	$id = $request->getAttribute('id');

	$sql = "SELECT * FROM comments WHERE id_nana = $id";

	try {
		// Get DB Object
		$db = new db();
		// Connect
		$db = $db->connect();

		$stmt = $db->query($sql);
		$comments = $stmt->fetchAll(PDO::FETCH_OBJ);

		$db = null;
		echo json_encode($comments,JSON_UNESCAPED_UNICODE);
	} catch(PDOException $e) {
		echo $e->getMessage();
	}
});

// Write New Comment
$app->post('/comments/new', function(Request $request, Response $response) {
	$id_client = $request->getParam('id_client');
	$id_nana = $request->getParam('id_nana');
	$date = $request->getParam('date');
	$comment = $request->getParam('comment');

	$sql = "INSERT INTO comments (id_client, id_nana, date, comment) VALUES (:id_client, :id_nana, :date, :comment)";
	$data = ["msg" => "", "status" => ""];

	try {
		// Get DB Object
		$db = new db();
		// Connect
		$db = $db->connect();

		$stmt = $db->prepare($sql);

		$stmt->bindParam(':id_client', 	$id_client);
		$stmt->bindParam(':id_nana', 	$id_nana);
		$stmt->bindParam(':date', 		$date);
		$stmt->bindParam(':comment', 	$comment);

		$stmt->execute();

		$data["msg"] = "Comment Sent";
		$data["status"] = "0";

		$db = null;
		echo json_encode($data,JSON_UNESCAPED_UNICODE);
	} catch(PDOException $e) {
		echo $e->getMessage();
	}
});

?>