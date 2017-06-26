<?php
/**
 * Created by PhpStorm.
 * User: luo
 * Date: 17-6-26
 * Time: 下午5:36
 */

class Core
{
    /**
     * @var array
     */
    public static $classMap = [];

    /**
     * @param $className
     * @return bool
     * @throws Exception
     */
    public static function load($className)
    {
        if(isset($classMap[$className])) {
            return true;
        } else {
            $class = str_replace('\\', '/', $className);

            $file = EDDIE.'/'.$class.'.php';
            if(is_file($file)) {
                include_once $file;
                self::$classMap[$className] = $class;
            } else {
                throw new Exception('找不到'.$class, 2);
                return false;
            }
        }
    }

}
