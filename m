content-class: urn:content-classes:message
Subject: 64 bit operations w/32 bit kernel
Date: Mon, 29 Sep 2003 07:31:57 -1000
Message-ID: <DC1BF43A8FAE654DA6B3FB7836DD3A56DEB75C@iris.adtech-inc.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
From: "Finney, Steve" <Steve.Finney@SpirentCom.COM>
Return-Path: <Steve.Finney@SpirentCom.COM>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030929173157.l0tk7ieF6BACnxmUIWMw9tMCB7StvIpmOA_ajOktD0k@z>

What would be the downside to enabling 64 bit operations in user space on a 32 bit kernel (setting the PX bit in the status register?). The particular issue is that I want to access 64 bit-memory mapped registers, and I really need to do it as an atomic operation. I tried borrowing sibyte/64bit.h from the kernel, but I get an illegal instruction on the double ops.

Also, assuming this isn't a horrible idea, is there any obvious single place where "default" values in the CP0 status register get set?

Thanks,
sf
