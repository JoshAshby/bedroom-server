#!/usr/local/bin/perl
  
  # file: preferences.pl
  
  use CGI qw(:standard :html3);
  
  # Some constants to use in our form.
  my @colors = qw/aqua black blue fuchsia gray green lime maroon navy olive
     purple red silver teal white yellow/;
  my @sizes=("<default>",1..7);
  
  # recover the "preferences" cookie.
  my %preferences = cookie('preferences');
  
  # If the user wants to change the background color or her
  # name, they will appear among our CGI parameters.
  foreach ('text','background','name','size') {
      $preferences{$_} = param($_) || $preferences{$_};
  }
  
  # Set some defaults
  $preferences{'background'} ||= 'silver';
  $preferences{'text'} ||= 'black';
  
  # Refresh the cookie so that it doesn't expire.
  my $the_cookie = cookie(-name=>'preferences',
                          -value=>\%preferences,
                          -path=>'/',
                          -expires=>'+30d');
  print header(-cookie=>$the_cookie);
  
  # Adjust the title to incorporate the user's name, if provided.
  $title = $preferences{'name'} ? 
      "Welcome back, $preferences{name}!" : "Customizable Page";
  
  # Create the HTML page.  We use several of the HTML 3.2
  # extended tags to control the background color and the
  # font size.  It's safe to use these features because
  # cookies don't work anywhere else anyway.
  print start_html(-title=>$title,
                   -bgcolor=>$preferences{'background'},
                   -text=>$preferences{'text'}
                  );
  
  print basefont({-size=>$preferences{size}}) if $preferences{'size'} > 0;
  
  print h1($title);
  
  # Create the form
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
                  ),
               ),
            TR(
               td(''),
               td("Text color:"),
               td(popup_menu(-name=>'text',
                             -values=>\@colors,
                             -default=>$preferences{'text'})
                  )
               ),
            TR(
               td(''),
               td("Font size:"),
               td(popup_menu(-name=>'size',
                             -values=>\@sizes,
                             -default=>$preferences{'size'})
                  )
               )
            ),
      submit(-label=>'Set preferences'),
      end_form,
      hr,
      end_html;