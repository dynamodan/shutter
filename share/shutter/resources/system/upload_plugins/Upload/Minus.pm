#! /usr/bin/env perl
###################################################
#
#  Copyright (C) 2008-2011 Mario Kemper <mario.kemper@googlemail.com> and Shutter Team
#
#  This file is part of Shutter.
#
#  Shutter is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
#
#  Shutter is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with Shutter; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
###################################################

package Minus;

use lib $ENV{'SHUTTER_ROOT'}.'/share/shutter/resources/modules';

use utf8;
use strict;
use POSIX qw/setlocale/;
use Locale::gettext;
use Glib qw/TRUE FALSE/;
use Data::Dumper;

use Shutter::Upload::Shared;
our @ISA = qw(Shutter::Upload::Shared);

my $d = Locale::gettext->domain("shutter-plugins");
$d->dir( $ENV{'SHUTTER_INTL'} );

my %upload_plugin_info = 	(
    'module'		=> $d->get( "Minus"),
	'url'			=> $d->get( "http://minus.com/" ),
	'registration'  => $d->get( "http://minus.com/") ,
	'name'			=> $d->get( "Minus" ),
	'description'	=> $d->get( "Upload screenshots to Minus"),
	'supports_anonymous_upload'	 => TRUE,
	'supports_authorized_upload' => TRUE,	
);

binmode( STDOUT, ":utf8" );
if ( exists $upload_plugin_info{$ARGV[ 0 ]} ) {
	print $upload_plugin_info{$ARGV[ 0 ]};
	exit;
}

###################################################

sub new {
	my $class = shift;

	#call constructor of super class (host, debug_cparam, shutter_root, gettext_object, main_gtk_window, ua)
	my $self = $class->SUPER::new( shift, shift, shift, shift, shift, shift );

	bless $self, $class;
	return $self;
}

sub init {
	my $self = shift;

	#do custom stuff here	
	use JSON;
	use LWP::UserAgent;
	use HTTP::Request::Common;
	
	return TRUE;	
}

sub upload {
	my ( $self, $upload_filename, $username, $password ) = @_;

	#store as object vars
	$self->{_filename} = $upload_filename;
	$self->{_username} = $username;
	$self->{_password} = $password;

	utf8::encode $upload_filename;
	utf8::encode $password;
	utf8::encode $username;

	my $json_coder = JSON::XS->new;

	my $browser = LWP::UserAgent->new(
		'timeout'    => 20,
		'keep_alive' => 10,
		'env_proxy'  => 1,
	);

	if ( $username ne "" && $password ne "" ) {

		eval{

			#SignIn
			my $req_login = HTTP::Request->new(POST => "http://minus.com/api/SignIn");
			$req_login->content_type("application/x-www-form-urlencoded");
			$req_login->content("username=" . $self->{_username} . "&password1=" . $self->{_password});

			my $res_login = $browser->request($req_login); #login
			my $login_json = $json_coder->decode($res_login->content);
			$login_json->{'success'} += 0; #see http://www.perlmonks.org/?node_id=773713
			
			unless(defined $login_json->{'success'} && $login_json->{'success'} == 1){
				$self->{_links}{'status'} = 999;
				return;
			}

		};
		if($@){
			$self->{_links}{'status'} = $@;
			return %{ $self->{_links} };
		}
		if($self->{_links}{'status'} == 999){
			return %{ $self->{_links} };
		}
		
	}
	
	eval{
		
		#CreateGallery
		my $req_gallery = HTTP::Request->new(POST => "http://minus.com/api/CreateGallery");
		my $res_gallery = $browser->request($req_gallery);
		my $gallery_json = $json_coder->decode($res_gallery->content);
		
		#upload if everything is fine
		if(defined $gallery_json->{'editor_id'}){

			my $url = "http://min.us/api/UploadItem?". "editor_id=" . $gallery_json->{'editor_id'} . "&key=OK&filename=" . $self->{_filename};

			$HTTP::Request::Common::DYNAMIC_FILE_UPLOAD = 1;

			my $req_upitem = POST(
				$url,
				Content_Type => 'multipart/form-data',
				Content      => [ file => [$self->{_filename}] ],
			);

			my $res = $browser->request($req_upitem);
			#~ print Dumper $res->content;

			if ($res->status_line =~ m/^200/ ) {
				#construct link
				my $upload_json = $json_coder->decode($res->content);
				$self->{_links}->{'direct_link'} = "http://minus.com/l".$upload_json->{'id'};
				#debug
				if( $self->{_debug_cparam}) {
					foreach (keys %{$self->{_links}}){
						print $_.": ".$self->{_links}->{$_}, "\n";
					}
				}
				$self->{_links}{'status'} = 200;	
			} else { 
			   $self->{_links}{'status'} = $res->status_line;
			}

		#createGallery failed
		}else{
			$self->{_links}{'status'} = $@;
		}
		
	};
	if($@){
		$self->{_links}{'status'} = $@;
		#~ print "$@\n";
	}
	
	#and return links
	return %{ $self->{_links} };
}


####The following code was downloaded from https://github.com/minus-development/MinusAPI/blob/master/perl/upload.pl


#~ sub GetItem {
#~ 
#~ $browser->request($req_login)->as_string; #login
#~ 
#~ chomp(my $id = $ARGV[1] );
#~ 
#~ my $req_getitem = HTTP::Request->new(GET=> "http://min.us/api/GetItems/m$id");	#adding an m here
#~ $req_getitem->content_type("application/x-www-form-urlencoded");
#~ 
#~ if ($browser->request($req_getitem)->is_success) {
#~ 
    #~ my $json = $browser->request($req_getitem)->content;
    #~ my $json_coder = JSON::XS->new->utf8;
    #~ my %json_perl = %{ $json_coder->decode($json) };
#~ 
    #~ foreach my $key ( sort keys %json_perl )  {
        #~ print "$key\n";
		#~ if (ref ($json_perl{$key}) eq "ARRAY" ) {
			#~ foreach ( @{ $json_perl{$key} } ) {		#dereferencing array
				#~ print $_ . "\n";
			#~ }
		#~ } else {
			#~ print $json_perl{$key}."\n";
		#~ }
#~ 
    #~ }
#~ 
#~ 
#~ } else {
#~ print "Request not successful\n";
#~ print $browser->request($req_getitem)->status_line, "\n";
#~ }
#~ 
#~ }
#~ 
#~ sub MyGalleries {
#~ 
#~ $browser->request($req_login)->as_string; #login
#~ 
#~ my $req_mygalleries = HTTP::Request->new(GET=> "http://min.us/api/MyGalleries.json");
#~ $req_mygalleries->content_type("text/html");
#~ 
#~ if ($browser->request($req_mygalleries)->is_success) {
#~ 
    #~ my $json = $browser->request($req_mygalleries)->content;
    #~ my $json_coder = JSON::XS->new->utf8->pretty->allow_nonref;
    #~ my %json_perl = %{ $json_coder->decode($json) };
#~ 
    #~ foreach my $key ( sort keys %json_perl )  {
        #~ print "$key\n\n";
#~ 
        #~ if (ref ($json_perl{$key}) eq "ARRAY" ) {
			#~ foreach ( @{ $json_perl{$key} } ) {		#dereferencing array of hashes
                #~ print "\n";
				#~ foreach ( %{ $_ } ) {				#dereferencing hashes
					#~ print $_ . "\n" ;
				#~ } 
            #~ }
		#~ } else {
            #~ print $json_perl{$key}."\n";
        #~ }
#~ 
    #~ }
#~ 
#~ 
#~ } else {
#~ print "Request not successful\n";
#~ print $browser->request($req_mygalleries)->status_line, "\n";
#~ }
#~ 
#~ }

1;
