content-class: urn:content-classes:message
Subject: MIPS bootloaders
Date: Thu, 9 Oct 2003 11:34:49 -1000
Message-ID: <DC1BF43A8FAE654DA6B3FB7836DD3A56DEB770@iris.adtech-inc.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
From: "Finney, Steve" <Steve.Finney@SpirentCom.COM>
Return-Path: <Steve.Finney@SpirentCom.COM>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20031009213449.qUWbONUWx8ckgTsaYOjfshoUxKKEcj5SzlGODMO3rLQ@z>

> 
> In message <20031009110154.B17781@mvista.com> you wrote:
> >
> > Actually is YAMON code freely available?  Can someone from 
> MIPS confirm
> > that and perhaps point to the downloading place?  


Broadcom has a "CFE" bootloader for their chip, and the documentation implies that it was designed to be for general purpose use (e.g., arch/mips/board/... directory hierarchy); it's covered by what I'd call a BSD style license (but IANAL). I don't know if it is publically available, and its current state of support is largely tailored to the peripherals on their eval boards, but (from my limited experience) it looks like  a reasonable and pretty-well written bootloader. Typical size is 400K, but this could be decreased (or increased :-) ).

sf
