From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200204221446.QAA23835@copsun17.mips.com>
Subject: Problems with H.J's latest RPM 4.0.4 binary packages
Date: Mon, 22 Apr 2002 16:46:45 +0200 (MET DST)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: user alias <linux-mips@oss.sgi.com>
Message-ID: <20020422144645.T27Q_kp4hiRZCs1gAydia7OYg-et7q7ItUP-56p22Tc@z>

I have started to update our 7.1 RH/MIPS installation images with all the
latest packages from H.J's collection.

The latest RPM package gives an up-front error no matter what one does, but
the command seems to work:

[hartvige@copmalt13 /bin]$ rpm --version
error: Macro %__id_u has empty body
RPM version 4.0.4
[hartvige@copmalt13 /bin]$

Before I start digging any deeper, has anybody else seen this and found the
explanation?

(Note that I have not yet finished compiling the glibc RPM natively as
required - this is currently ongoing).

/Hartvig

-- 
 _    _   _____  ____     Hartvig Ekner        Mailto:hartvige@mips.com
 |\  /| | |____)(____                          Direct: +45 4486 5503
 | \/ | | |     _____)    MIPS Denmark         Switch: +45 4486 5555
T E C H N O L O G I E S   http://www.mips.com  Fax...: +45 4486 5556
