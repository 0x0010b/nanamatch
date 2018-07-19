<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

// Get Clients Services
$app->get('/service/{id}', function(Request $request, Response $response) {
	$id = $request->getAttribute('id');

	$sql = "SELECT * FROM service WHERE id_client = $id";

	try {
		// Get DB Object
		$db = new db();
		// Connect
		$db = $db->connect();

		$stmt = $db->query($sql);
		$services = $stmt->fetchAll(PDO::FETCH_OBJ);

		$db = null;
		echo json_encode($services,JSON_UNESCAPED_UNICODE);
	} catch(PDOException $e) {
		echo $e->getMessage();
	}
});

// New Service
$app->post('/service/new', function(Request $request, Response $response) {
	$id_client = $request->getParam('id_client');
	$id_nana = $request->getParam('id_nana');
	$calification = $request->getParam('calification');
	$date = date('Y-m-d');
	$service_num = rand(1111111111,9999999999);

	$sql = "INSERT INTO service (id_client, id_nana, calification, date, service_num) VALUES (:id_client, :id_nana, :calification, :date, :service_num)";

	// Get DB Object
	$db = new db();
	// Connect
	$db = $db->connect();

	$stmt = $db->prepare($sql);

	$stmt->bindParam(':id_client', 	$id_client);
	$stmt->bindParam(':id_nana', 		$id_nana);
	$stmt->bindParam(':calification', 	$calification);
	$stmt->bindParam(':date', 			$date);
	$stmt->bindParam(':service_num', 	$service_num);

	$stmt->execute();

	// Update Nana Attributes (Services, Calification and Registered Time)
	refreshNanaInformation($db, $id_nana);

	echo '[{"msg": "Created Service", "status": "0"}]';
	$db = null;
});

function refreshNanaInformation($db, $id) {
	$services = calculateServices($db, $id);
	$calification = calculateCalification($db, $id);
	$months = registeredTime($db, $id);

	$v = "UPDATE nana SET services = $services, calification = $calification, months = $months WHERE id = $id";
	$vv = $db->query($v);
}

function calculateServices($db, $id) {
	$v = "SELECT * FROM service WHERE id_nana = $id";
	$vv = $db->query($v);
	$r = 0;

	foreach ($vv as $row) {
		$r++;
	}

	return (int) $r;
}

function calculateCalification($db, $id) {
	$v = "SELECT * FROM service WHERE id_nana = $id";
	$vv = $db->query($v);
	$r = 0.0; $s = 0;

	foreach ($vv as $row) {
		$r += $row['calification'];
		$s++;
	}

	return (float) ($r/$s);
}

function registeredTime($db, $id) {
	date_default_timezone_set('America/Bogota');
	$v = "SELECT * FROM nana WHERE id = $id";
	$vv = $db->query($v);
	$vvv = $vv->fetchAll(PDO::FETCH_ASSOC);
	$register_date = $vvv[0]["register_date"];

	$date1 = new DateTime($register_date);
	$date2 = new DateTime(date('Y-m-d'));
	$diff = $date1->diff($date2);
	
	return (int) $diff->m;
}

?>