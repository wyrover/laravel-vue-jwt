@extends('_base_layout')

@section('title') 
    Dashboard 
@stop

@section('content')
<div class="row">
    <h1>Dashboard</h1>
    <div class="well">
        <p>Welcome <strong></strong></p>
    </div>

    <div id="app">
    <greeter></greeter>
</div>

<script src="/js/main.js"></script>

</div>

@stop