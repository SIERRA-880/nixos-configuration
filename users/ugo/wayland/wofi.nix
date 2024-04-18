{config, ...}:

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
border: 2px solid #${config.colorScheme.palette.base00};
border-radius: 5px;
background-color: #${config.colorScheme.palette.base01};
font-family: JetBrains Mono NL SemiBold;
font-size: 16px;
}

#input {
margin: 5px;
border: 1px solid #${config.colorScheme.palette.base00};
color: #${config.colorScheme.palette.base06};
background-color: #${config.colorScheme.palette.base01};
}

#input image {
color: #${config.colorScheme.palette.base06};
}

#inner-box {
margin: 5px;
border: none;
background-color: #${config.colorScheme.palette.base01};
}

#outer-box {
margin: 5px;
border: none;
background-color: #${config.colorScheme.palette.base01};
}

#scroll {
margin: 0px;
border: none;
}

#text {
margin: 5px;
border: none;
color: #${config.colorScheme.palette.base06};
} 

#entry:selected {
	background-color: #${config.colorScheme.palette.base06};
	font-weight: normal;
}

#text:selected {
	color: #${config.colorScheme.palette.base01};
	font-weight: normal;
}
    '';
  };
}
