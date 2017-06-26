<?php
/**
 * Created by PhpStorm.
 * User: luo
 * Date: 17-6-26
 * Time: 下午5:35
 */
//显示错误提示
ini_set("display_errors", "On");
define('EDDIE', __DIR__);
define('APP', EDDIE.'/app');
define('CORE', EDDIE.'/core');
define('LOGS', EDDIE.'/logs/');
//引入自动加载类
require_once CORE.'/Core.php';

//注册自动加载
spl_autoload_register('Core::load');
$pdo = require_once CORE.'/Db.php';

\core\Log::log('test', 4);



