{
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      width = 400;
      height = 400;
    };
    style = ''
    window {
margin: 0px;
border: 2px solid #414868;
border-radius: 5px;
background-color: #24283b;
font-family: JetBrains Mono NL SemiBold;
font-size: 16px;
}

#input {
margin: 5px;
border: 1px solid #24283b;
color: #c0caf5;
background-color: #24283b;
}

#input image {
	color: #c0caf5;
}

#inner-box {
margin: 5px;
border: none;
background-color: #24283b;
}

#outer-box {
margin: 5px;
border: none;
background-color: #24283b;
}

#scroll {
margin: 0px;
border: none;
}

#text {
margin: 5px;
border: none;
color: #c0caf5;
} 

#entry:selected {
	background-color: #414868;
	font-weight: normal;
}

#text:selected {
	background-color: #414868;
	font-weight: normal;
}
    '';
  };
}