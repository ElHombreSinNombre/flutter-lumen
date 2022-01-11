<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->group(
    ['prefix' => 'users'],
    function () use ($router) {
        $router->get('/all',  [
            'as' => 'users.all', 'uses' => 'UserController@index'
        ]);

        $router->get('/edit/{id}', [
            'as' => 'users.edit', 'uses' => 'UserController@edit'
        ]);

        $router->get('/update/{id}', [
            'as' => 'users.update', 'uses' => 'UserController@update'
        ]);

        $router->get('/create', [
            'as' => 'users.create', 'uses' => 'UserController@create'
        ]);

        $router->get('/delete/{id}', [
            'as' => 'users.delete', 'uses' => 'UserController@delete'
        ]);
    }
);
