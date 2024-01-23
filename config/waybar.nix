{pkgs, ...}:

{ 
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
	layer = "top";
	position = "top";
	height = 30;
	modules-left =  ["hyprland/workspaces"]; 
	modules-center = ["clock"];
	modules-right = ["temperature" "network" "battery"];
	"temperature"= {
	  critical-thresold = 80;
	  "thermal-zone"= 1;
	  "format"= "{temperatureC}°C ";
	};
	"network"= {
	  "interface"= "wlp0s20f3";
	  "format"= "{ifname}";
	  "format-wifi"= "{essid} ({signalStrength}%) ";
	  "format-ethernet"= "{ifname} ";
	  "format-disconnected"= "";
	  "tooltip-format"= "{ifname}";
	  "tooltip-format-wifi"= "{essid} ({signalStrength}%) ";
	  "tooltip-format-ethernet"= "{ifname} ";
	  "tooltip-format-disconnected"= "Disconnected";
	  "max-length"= 50;
	};
	"battery"= {
	  "format"= "{capacity}%  󰁾";
          "format-plugged"= "{capacity}% ";
	};
	"clock"= {
	  "format"= "{:%R    %d/%m }";
	};
      };
    };
    style =  
    ''
      * {
	  border: none;
	  border-radius: 0;
	  /*font-family: "Hack", "Noto Color Emoji", sans-serif;*/
	  font-size: 12px;
	  /*font-weight: bold;*/
	  min-height: 0;
      }
      
      window#waybar {
	  background: #000000;
	  /*border-bottom: 3px solid rgba(100, 114, 125, 0.5);*/
	  color: #e5e9f0;
      }
      
      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      #workspaces button {
	  padding: 0 5px;
	  background: transparent;
	  color: #ffffff;
	  border-bottom: 3px solid transparent;
      }
      
      #workspaces button.active {
	  background: #4c566a;
	  border-bottom: 3px solid #e5e9f0;
      }
      
      #workspaces button.urgent {
	  background-color: #bf616a;
      }
      
      #mode {
	  background: #64727D;
	  border-bottom: 3px solid #ffffff;
      }
      
      #clock, #battery, #cpu, #memory, #temperature, #backlight, #network, #pulseaudio, #custom-media, #tray, #mode, #idle_inhibitor {
	  padding: 0 10px;
	  margin: 0 5px;
      }
      
      #clock {
	  /*background-color: #64727D;*/
	  color: #e5e9f0;
	  font-weight: bold;
      }
      
      #battery {
	  /*background-color: #000000;*/
	  color: #e5e9f0;
      }
      
      #battery.charging {
	  /*background-color: #000000;*/
	  color: #e5e9f0;
      }
      
      @keyframes blink {
	  to {
	      /*background-color: #ffffff;*/
	      color: #000000;
	  }
      }
      
      #battery.critical:not(.charging) {
	  background: #f53c3c;
	  color: #ffffff;
	  animation-name: blink;
	  animation-duration: 0.5s;
	  animation-timing-function: linear;
	  animation-iteration-count: infinite;
	  animation-direction: alternate;
      }
      
      #cpu {
	  /*background: #2ecc71;*/
	  color: #e5e9f0;
      }
      
      #memory {
	  /*background: #9b59b6;*/
	  color: #e5e9f0;
      }
      
      #backlight {
	  /*background: #90b1b1;*/
	  color: #e5e9f0;
      }
      
      #network {
	  /*background: #2980b9;*/
	  color: #e5e9f0;
      }
      
      #network.disconnected {
	  /*background: #f53c3c;*/
	  color: #e5e9f0;
      }
      
      #pulseaudio {
	  /*background: #000000;*/
	  color: #e5e9f0;
      }
      
      #pulseaudio.muted {
	  /*background: #000000;*/
	  color: #e5e9f0;
      }
      
      #custom-media {
	  background: #66cc99;
	  color: #2a5c45;
      }
      
      .custom-spotify {
	  background: #66cc99;
      }
      
      .custom-vlc {
	  background: #ffa000;
      }
      
      #temperature {
      }
      
      #temperature.critical {
	  background: #eb4d4b;
      }
      
      #tray {
	  /*background-color: #2980b9;*/
	  color: #e5e9f0;
      }
      
      #idle_inhibitor {
	  background-color: #2d3436;
      }
      
      #idle_inhibitor.activated {
	  background-color: #ecf0f1;
	  color: #2d3436;
      }
    '';
};}
