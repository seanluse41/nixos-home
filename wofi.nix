{ config, pkgs, ... }:
{
  programs.wofi = {
    enable = true;
    settings = {
	show = "drun";
	width = "33%";
	height = "15%";
	columns = 1;
	always_parse_args = "true";
	show_all = "false";
	print_command = "true";
	layer = "top";
	insensitive = "true";
	prompt= "";
	hide_scroll = "true";
	location= "center";
	normal_window = "false";
	term = "kitty";
    };

    style = ''
	  window {
	margin: 0px;
	border-radius: 15px;
	background-color: #3B403A;
	font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
	font-size: 16px;
	color:#B775BF;
	}
#input {
margin: 5px;
border: 0px;
background-color:#3B403A;
border-radius: 15px;
box-shadow: inset 0 -3px transparent;
color:#B775BF;
}
#input image {
color: #F29F05;
}
#inner-box {
margin: 5px;
border: none;
}
#outer-box {
margin: 5px;
border: none;
}
#text {
margin: 5px;
border: 0px;
border-radius: 0px;
color: #B775BF;
box-shadow: inset 0 -3px transparent;
font-weight: normal;
}
#entry:selected {
	background-color: #454B40;
	border: none;
	border-radius: 15px;
	color:#EFECED;
	box-shadow: inset 0 -3px transparent;
	font-weight: normal;
}
#entry image {
color: #F29F05;
}

#selected image {
color: #F29F05;
}
	'';
  };
}
