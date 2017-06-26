<?php
/**
 * Created by PhpStorm.
 * User: luo
 * Date: 17-6-26
 * Time: 下午10:10
 */

namespace core;

/**
 * 日志类
 * Class Log
 * @package core
 */
class Log
{
    /**
     * @param $msg
     * @param $code
     */
    public static function log($msg, $code) {
        $info = date('Y-m-d H:i:s ', time()).'错误信息:'.$msg .' 错误码: ' .$code."\n";
        $fileName = LOGS.date('Y-m-d', time()).'.log';
        if(is_file($fileName)) {
            $resource = fopen($fileName, 'a');
            fwrite($resource, $info);
            fclose($resource);
        } else {
            file_put_contents($fileName, $info);
        }
    }
}