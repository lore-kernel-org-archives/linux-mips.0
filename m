From: "Randy Sartin" <randys@ridgerun.com>
Subject: rs_ioctl() in sgiserial.c info/help needed
Date: Wed, 11 Oct 2000 13:28:05 -0600
Message-ID: <NEBBLGAKILMAGOFHJDNNGEJMCAAA.randys@ridgerun.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: linux-mips@oss.sgi.com
Message-ID: <20001011192805._avZdeJjLvOJ6B7gttZEh9keHapvcvKnrWt08PgWulE@z>

Background:
I am trying to get the Indy's serial port to drive a dongle and am having
some trouble getting the dongle to work. The problem seems to be in
rs_ioctl() in sgiserial.c - it doesn't handle the TIOCMSET command. The
TIOCMSET command allows control over the DTR and RTS lines.

The "standard" rs_ioctl() in serial.c does support TIOCMSET. It calls
set_modem_info() to control the UART (I think) to then control DTR and RTS.

So - my question is...
Can I control DTR and RTS on Indy or is this a software feature that hasn't
been implemented yet?

Thanks,
Randy Sartin
