From: "Gill" <gill.robles@exterity.co.uk>
Subject: RE: Socket problem?
Date: Mon, 24 May 2004 09:25:43 +0100
Message-ID: <000501c44168$b4718800$2000a8c0@gillpc>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20040522160635.GV1912@lug-owl.de>
Return-Path: <gill.robles@exterity.co.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Jan-Benedict Glaw' <jbglaw@lug-owl.de>, linux-mips@linux-mips.org
Message-ID: <20040524082543.jnLF4PAeG3z4YngDzdK8CKftV_K8teXsEoSzDAYOhDo@z>

Hi -

To clarify, more specifically select() returns a positive value, and a
subsequent call to FD_ISSET() returns TRUE for one of the sockets the app is
listening on.  Then, app calls recvfrom() which returns (sometimes) -1.
Problem occurs sporadically...I'm seeing it every hundred or so packets at
the moment, but it varies.


Thanks,
Gill

-----Original Message-----
From: linux-mips-bounce@linux-mips.org
[mailto:linux-mips-bounce@linux-mips.org] On Behalf Of Jan-Benedict Glaw
Sent: 22 May 2004 17:07
To: linux-mips@linux-mips.org
Subject: Re: Socket problem?


On Sat, 2004-05-22 09:02:48 +0100, Gill <gill.robles@exterity.co.uk> wrote
in message <000001c43fd3$2c25a350$2000a8c0@gillpc>:
> Hi -
> 
> Has anyone come across a socket problem where the user app calls 
> select() on a set of sockets, which returns, indicating that data is 
> waiting...then subsequent recvfrom() call returns -1 indicating that 
> there's nothing there??

Read the select() manpage again. Upon successful return, it's guaranteed
that the very next read() on a file descriptor contained in the result set
won't block. Typically, it's the case after data arrived, but returning -1
*immediately* (with no blocking) is okay, too.

> I'm using linux v2.4.2, IPv4, and the ethernet driver is pcnet32.  
> We're receiving a UDP stream.

Quite aged version, though perfectly correct on select() behaviour.

> I'm trying to check for dropped packets.  /proc/net/snmp indicates a 
> number of UDP InErrors (~1 per second).  However, not yet sure whether 
> this is a consequence of the problem above, or cause of it.

Neither - nor. You've got a small thinko in your application. Albeit
that: update your kernel version... It most probably contains a number of
known root exploits.

MfG, JBG

-- 
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier Bürger" | im Internet! |   im Irak!
   ret = do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM |
TCPA));
