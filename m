Reply-To: <a.voropay@vmb-service.ru>
From: "Alexander Voropay" <a.voropay@vmb-service.ru>
Subject: RE: Howto run Linux on ACER PICA 61
Date: Tue, 20 Jul 2004 18:15:04 +0400
Message-ID: <0aa601c46e63$f3ddbef0$0200000a@ALEC>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20040622193839.GA7082@linux-mips.org>
Return-Path: <a.voropay@vmb-service.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Ralf Baechle' <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20040720141504.g9kMP5KpKDqiNXxpXqBgfWDu6R6kM6BzJJUcb3xNJtE@z>

Hi!

>Linux has code for this system but it's suffering from severe bitrot.
>I still have the documents here so I could help you a bit if you were
willing to
>resurrect the kernel - which should be relativly easy, also due to the
>system's similarity to another, somewhat better supported system,
>the Olivetti M700-10.

  I'm trying to cross-compile a kernel from the linux-mips CVS.

  Unfortunately, the build script does not provide a selection for the
SCSI driver for the ACER PICA  (/linux/drivers/scsi/NCR53C9x.h ??)
and SONIC DP83932 Ethernet controller.


--
-=AV=-
