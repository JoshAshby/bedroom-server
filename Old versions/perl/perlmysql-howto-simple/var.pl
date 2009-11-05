#!/usr/bin/perl
print "Content-type: text/html \n\n";
$hello = "hello, World!";
@helloworld = ("Hello", ",", "World", "!");
print $hello;
print @helloworld;
$array_var = join(" ", @helloworld);
print $array_var
