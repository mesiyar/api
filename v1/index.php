<?php
/**
 * Created by PhpStorm.
 * User: luo
 * Date: 17-6-27
 * Time: 下午5:03
 */

ini_set("display_errors", "On");
define('EDDIE', __DIR__.'/..');
define('APP', EDDIE.'/app');
define('CORE', EDDIE.'/core');
define('LOGS', EDDIE.'/logs/');
//引入自动加载类
require_once CORE.'/Core.php';
//注册自动加载
spl_autoload_register('Core::load');
$pdo = require_once CORE.'/Db.php';

$user = new \app\User($pdo);
$article = new \app\Article($pdo);

$restful = new \v1\Restful($user, $article);

var_dump($restful->run());
