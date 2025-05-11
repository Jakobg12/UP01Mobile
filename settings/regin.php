<?php
header("Content-Type: application/json; charset=UTF-8");

$mysqli = new mysqli('192.168.50.249', 'root', '', 'pr49', '3306');
$mysqli->query("SET NAMES UTF8");

if ($mysqli->connect_error) {
    die(json_encode(["status" => "error", "message" => "Ошибка подключения: " . $mysqli->connect_error]));
}

// Получение данных из POST-запроса
$login = isset($_POST['login']) ? $_POST['login'] : '';
$password = isset($_POST['password']) ? $_POST['password'] : '';
$email = isset($_POST['email']) ? $_POST['email'] : '';
$telephone = isset($_POST['telephone']) ? $_POST['telephone'] : '';

// Проверка на уникальность логина
$query_user = $mysqli->query("SELECT * FROM Users WHERE login = '$login';");

if ($query_user && $query_user->num_rows > 0) {
    echo json_encode(["status" => "error", "message" => "Пользователь с таким логином уже существует."]);
} else {
    // Создаём пользователя
    $query_insert = $mysqli->query("INSERT INTO Users (login, password, email, telephone) VALUES ('$login', '$password', '$email', '$telephone');");

    if ($query_insert) {
        echo json_encode(["status" => "success", "message" => "Регистрация успешна."]);
    } else {
        echo json_encode(["status" => "error", "message" => "Ошибка при регистрации: " . $mysqli->error]);
    }
}

$mysqli->close();
?>