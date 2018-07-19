<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

// Get All Clients
$app->get('/client', function(Request $request, Response $response) {
	$sql = "SELECT * FROM client";

	try {
		// Get DB Object
		$db = new db();
		// Connect
		$db = $db->connect();

		$stmt = $db->query($sql);
		$clients = $stmt->fetchAll(PDO::FETCH_OBJ);
		$db = null;
		echo json_encode($clients,JSON_UNESCAPED_UNICODE);
	} catch(PDOException $e) {
		echo $e->getMessage();
	}
});

// Get Single Client
$app->get('/client/{id}', function(Request $request, Response $response) {
	$id = $request->getAttribute('id');

	$sql = "SELECT * FROM client WHERE id = $id";

	try {
		// Get DB Object
		$db = new db();
		// Connect
		$db = $db->connect();

		$stmt = $db->query($sql);
		$client = $stmt->fetchAll(PDO::FETCH_OBJ);

		$db = null;
		echo json_encode($client,JSON_UNESCAPED_UNICODE);
	} catch(PDOException $e) {
		echo $e->getMessage();
	}
});

// Update Client
$app->post('/client/update', function(Request $request, Response $response) {
	$id = $request->getParam('id');
	$first_name = $request->getParam('first_name');
	$last_name = $request->getParam('last_name');

	$sql = "UPDATE client SET first_name = :first_name, last_name = :last_name WHERE id = :id";

	try {
		// Get DB Object
		$db = new db();
		// Connect
		$db = $db->connect();

		if (ifClientExis($db, $id)) {
			// Update client
			$stmt = $db->prepare($sql);

			$stmt->bindParam(':id', 		$id);
			$stmt->bindParam(':first_name', $first_name);
			$stmt->bindParam(':last_name', 	$last_name);

			$stmt->execute();

			echo '{"msg": "Client Updated", "status": "0"}';
		} else {
			echo '{"msg": "Update Failed", "status": "1"}';
		}

		$db = null;
	} catch(PDOException $e) {
		echo $e->getMessage();
	}
});

// Delete Client
$app->get('/client/delete/{id}', function(Request $request, Response $response) {
	$id = $request->getAttribute('id');

	$sql = "DELETE FROM client WHERE id = $id";

	try {
		// Get DB Object
		$db = new db();
		// Connect
		$db = $db->connect();

		if (ifClientExis($db, $id)) {
			$stmt = $db->query($sql);

			echo '{"msg": "Client Deleted", "status": "0"}';
		} else {
			echo '{"msg": "Not Deleted", "status": "1"}';
		}

		$db = null;
	} catch(PDOException $e) {
		echo $e->getMessage();
	}
});

// Login
$app->post('/login', function(Request $request, Response $response) {
	$user = $request->getParam('user');
	$password = $request->getParam('password');
	
	$sql = "SELECT * FROM client WHERE user = :user and password = :password";
	
	try {
		// Get DB Object
		$db = new db();
		// Connect
		$db = $db->connect();

		$stmt = $db->prepare($sql);

		$stmt->bindParam(':user', 		$user);
		$stmt->bindParam(':password', 	$password);

		$stmt->execute();

		$client = $stmt->fetchAll(PDO::FETCH_OBJ);
		$db = null;

		if ($client) {	
			echo '{"msg": "Login Successful", "status": "0", "data": '.json_encode($client).'}';
		} else {
			echo '{"msg": "Login Failed", "status": "1"}';
		}
	} catch(PDOException $e) {
		echo $e->getMessage();
	}
});

// Register
$app->post('/register', function(Request $request, Response $response) {
	$user = $request->getParam('user');
	$password = $request->getParam('password');
	
	$sql = "INSERT INTO client (user, password) VALUES (:user, :password)";
	
	try {
		// Get DB Object
		$db = new db();
		// Connect
		$db = $db->connect();


		// Validate Information
		if (validateUser($db, $user)) {
			echo '{"msg": "Invalid User", "status": "1"}';
		} else {
			// Add client
			$stmt = $db->prepare($sql);

			$stmt->bindParam(':user', 		$user);
			$stmt->bindParam(':password', 	$password);

			$stmt->execute();

			echo '{"msg": "Successful Registration", "status": "0"}';
		}

		$db = null;
	} catch(PDOException $e) {
		echo $e->getMessage();
	}
});

function validateUser($db, $user) {
	$v = "SELECT * FROM client";
	$vv = $db->query($v);

	foreach ($vv as $row) {
		if ($row['user'] == $user) {
			return true;
			break;
		}
	}
}

function ifClientExis($db, $id) {
	$v = "SELECT * FROM client";
	$vv = $db->query($v);

	foreach ($vv as $row) {
		if ($row['id'] == $id) {
			return true;
			break;
		}
	}
}

?>