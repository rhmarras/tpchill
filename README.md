# tpchill
Chill, thinkpad! - This is a script I've created to be executed on Ubuntu linux (haven't tested elsewhere) to set the proper powersave or performance profiles on Lenovo Thinkpads so it runs cool. Yes. It works :)

Usage:

./tpchill.sh pf
   Will set the power profile to Performance (Intel Turbo enabled, whole range of frequencies using Performance governor)

./tpchill.sh ps
   Will set the power profile to Powersave (Intel Turbo disabled, whole range of frequencies using Powersave governor)

./tpchill.sh psx
   Will set the power profile to Powersave Extreme (Intel Turbo disabled, only the lowest frequency for the CPUs is used, Powersave governor selected)



Author:  Rodrigo Marras
email:   rodri@marras.com.ar

