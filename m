Message-ID: <002001c08257$7186d000$2a764581@rembrandt.csv.ica.uni-stuttgart.de>
From: "Thiemo Seufer" <seufer@csv.ica.uni-stuttgart.de>
Subject: Re: Current CVS (010116) Boots OK
Date: Fri, 19 Jan 2001 21:36:04 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: linux-mips@oss.sgi.com
Message-ID: <20010119203604.xMA4DHXdyV3FkwEus-qTD7RuzDQjmvIgqCLAgQ3bMzU@z>

Maciej W. Rozycki wrote:
[snip]
> It's possible.  I'm actually using `cu' and it works fine wrt wrapping
>but it requires hw flow control (it sets "-clocal" and "crtscts" 
>explicitly) unfortunately, which is why it cannot be used for the
>DECstation's REX console I/O (which uses DTR/DSR flow control due to
>serial interface limitations on certain DEC hardware).  I'm going to
>modify `cu' at one time but since I don't really work with REX that much
>I'm just using `cat' for this purpose for now.

You might try 'screen'. I don't know if it requires Hardware
flow control, but it works for me via

screen screen /dev/ttyS1


Thiemo
