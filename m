Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: RE: MIPS Malta board linux problem 
Date: Tue, 17 Aug 2004 18:19:11 -0700
Message-ID: <3CB54817FDF733459B230DD27C690CEC0E72F6@Exchange.MIPS.COM>
From: "Mitchell, Earl" <earlm@mips.com>
Return-Path: <earlm@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: usha davuluri <ranidavuluri@yahoo.com>, linux-mips@linux-mips.org
Message-ID: <20040818011911.3DGXVqZaY1kfNxzZ4bumO13X52zDjYCYnnnt3Q8_528@z>


I remember while back YAMON would get
"TFTP READ-REQ ERROR" when used with
the RH7.3 TFTP server. I believe this
was fixed in later revs. So if you are
using an old version of YAMON try a
more recent rev. 

-earlm

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org
> [mailto:linux-mips-bounce@linux-mips.org]On Behalf Of usha davuluri
> Sent: Tuesday, August 17, 2004 6:05 PM
> To: linux-mips@linux-mips.org
> Subject: MIPS Malta board linux problem 
> 
> 
> Hi,
>  I am trying to bring up the Malta board with the
> prebuils kernel. I am using TFTP server for that. I am
> pretty much sure that TFTP server is up on my host
> Redhat linux laptop. Some how I am not able to load
> the immage on to the board. Please any one can help me
> to solve this problem. 
> I tested the tftp with the $:xinetd -d command. The
> out put came well( TFTP is running). Following error
> messages I am getting when I try to load the linux
> kernel using tftp.
> 
> load
> tftp://192.168.0.115//vmlinux-2.4.3.malta.install.el-01.02.srec
> About to load
> tftp://192.168.0.115//vmlinux-2.4.3.malta.install.el-01.02.srec
> Press Ctrl-C to break
> Error : TFTP READ-REQ ERROR
> Diag  : Host returned: ErrorCode = 2, ErrorMsg =
> Access violation
> Hint  : Check TFTP-server: file-existence,
> directory/file-attributes
> Thank you,
> Usha.
> 
> 
> 		
> __________________________________
> Do you Yahoo!?
> Y! Messenger - Communicate in real time. Download now. 
> http://messenger.yahoo.com
> 
> 
