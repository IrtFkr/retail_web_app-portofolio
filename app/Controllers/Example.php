<?php

namespace App\Controllers;

class Example extends BaseController
{
    public function index()
    {
        return view('example/list');
    }
    
    public function form()
    {
        return view('example/form');
    }
}
