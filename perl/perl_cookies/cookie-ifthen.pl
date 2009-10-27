#!/usr/bin/perl
use CGI qw(:standard :html3);

my @colors = qw/aqua black blue fuchsia gray green lime maroon navy olive
     purple red silver teal white yellow/;

my %preferences = cookie('preferences');

foreach ('text','background','name') {
    $preferences{$_} = param($_) || $preferences{$_};
}
$preferences{'background'} ||= 'white';
$preferences{'text'} ||= 'black';

my $the_cookie = cookie(-name=>'preferences',
                        -value=>\%preferences,
                        -path=>'/',
                        -expires=>'+2h');

print header(-cookie=>$the_cookie);

$title = $preferences{'name'} ? 
    "Welcome back, $preferences{name}!" : "Settings page";

print start_html(-title=>$title,
                 -bgcolor=>$preferences{'background'},
                 -text=>$preferences{'text'}
                );

print h1($title);

print hr,
    start_form,
    "Your first name: ",
    textfield(-name=>'name',
              -default=>$preferences{'name'},
              -size=>30),br,
    table(
          TR(
             td("Preferred"),
             td("Page color:"),
             td(popup_menu(-name=>'background',
                           -values=>\@colors,
                           -default=>$preferences{'background'})
                )
             ),
          TR(
             td(''),
             td("Text color:"),
             td(popup_menu(-name=>'text',
                           -values=>\@colors,
                           -default=>$preferences{'text'})
                )
             )
          ),
    submit(-label=>'Set preferences'),
    end_form,
    hr,
    end_html;
