<?php
session_start();

if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}
require_once "Php_connect.php";
$comment ="";
if($_SERVER["REQUEST_METHOD"] == "POST"){
 

    if(empty(trim($_POST["comment"]))){
        
    } else{
         
        $comment = trim($_POST["comment"]);
        echo $comment;
    }

    $sql = "INSERT INTO comments (comment) VALUES (?)";
         
        if($stmt = mysqli_prepare($link, $sql)){         
           mysqli_stmt_bind_param($stmt, "s", $param_username);
            
            $param_username = $comment;
            
            if(mysqli_stmt_execute($stmt)){
               echo "Запись добавлена";
            } else{
                echo "Oops! Something went wrong. Please try again later.";
            }

            mysqli_stmt_close($stmt);
        }
    mysqli_close($link);
    }
    
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Добро пожаловать</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body{ font: 14px sans-serif; text-align: center; }
    </style>
</head>
<body>
    <h1 class="my-5">Привет, <b><?php echo htmlspecialchars($_SESSION["username"]); ?></b>. Добро пожаловать на наш сайт.</h1>
    <p><form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post"><input type="text" name="comment" class="form-control  value="Введите текст комментария">
    <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Написать комментарий">
               
            </div> </p> </form>
    <p>
        
        <a href="logout.php" class="btn btn-danger ml-3">Выйти из аккауна</a>
    </p>
</body>
</html>