<?php
namespace da0shi;

class Arr
{
    /**
     * Get value from array. Access nested array by dot syntax.
     * Arr::get($array, 'nested.key')
     *
     * @param array $arr: an array
     * @param mixed $key: key for the array
     * @param mixed $default: return value when array did not contains key
     * @return mixed
     */
    public static function get(array $arr, $key, $default = null)
    {
        if ($key === null) return $arr;

        $keys = explode('.', $key);
        if (count($keys) === 1) {
            if (! array_key_exists($key, $arr)) return $default;
            return $arr[$key];
        }

        $topkey = array_shift($keys);
        return static::get($arr[$topkey], implode('.', $keys), $default);
    }

    /**
     * Set value to array. Access nested array by dot syntax.
     * Arr::set($array, 'nested.key', $value)
     *
     * @param array $arr: an array
     * @param mixed $key: key for the array
     * @param mixed $value: value to set
     * @return mixed
     */
    public static function set (array &$arr, $key, $value = null)
    {
        if ($key === null) {
            $arr = $value;
            return;
        }
        $keys = explode('.', $key);

        while (count($keys) > 1) {
            $topkey = array_shift($keys);
            if (! isset($arr[$topkey]) or ! is_array($arr[$topkey])) {
                $arr[$topkey] = [];
            }
            $arr =& $arr[$topkey];
        }
        $arr[$keys[0]] = $value;
    }
}
